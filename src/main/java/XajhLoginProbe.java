import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.security.*;
import java.util.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/** Single-attempt login/world observer with offline capture replay; no movement or attack. */
public final class XajhLoginProbe {
    static final int LIMIT = 1024 * 1024;
    static final Charset GBK = Charset.forName("GBK");

    static final class SkillCatalog {
        final Map<Integer,String> names=new HashMap<Integer,String>();
        static int readLeInt(RandomAccessFile f) throws IOException {
            int a=f.read(),b=f.read(),c=f.read(),d=f.read();
            if((a|b|c|d)<0) throw new EOFException("Truncated skills.data");
            return a|(b<<8)|(c<<16)|(d<<24);
        }
        static SkillCatalog load(String path) throws IOException {
            RandomAccessFile f=new RandomAccessFile(path,"r");SkillCatalog result=new SkillCatalog();
            int[] sizes={424,84,1588,188,160,132,200,236,1144,280,832};
            try {
                if(readLeInt(f)!=25) throw new IOException("Unsupported skills.data version (expected 25)");
                readLeInt(f); // build timestamp
                for(int section=0;section<sizes.length;section++) {
                    int size=readLeInt(f),count=readLeInt(f);
                    if(size!=sizes[section] || count<0 || count>1000000) throw new IOException("Invalid skills.data section "+section+" size/count");
                    long start=f.getFilePointer(),end=start+(long)size*count;
                    if(end<start || end>f.length()) throw new IOException("Truncated skills.data section "+section);
                    if(section==0) {
                        byte[] rec=new byte[size];
                        for(int n=0;n<count;n++) {
                            f.readFully(rec);int id=(rec[0]&255)|((rec[1]&255)<<8)|((rec[2]&255)<<16)|((rec[3]&255)<<24);
                            int chars=0;while(chars<32 && (rec[4+chars*2]!=0 || rec[5+chars*2]!=0)) chars++;
                            if(id>0 && !result.names.containsKey(Integer.valueOf(id))) result.names.put(Integer.valueOf(id),new String(rec,4,chars*2,"UTF-16LE"));
                        }
                    } else f.seek(end);
                }
                if(f.getFilePointer()!=f.length()) throw new IOException("Trailing bytes in skills.data");
            } finally {f.close();}
            System.out.println("SKILL_DATA_LOADED definitions="+result.names.size()+" format_version=25 sections=11");
            return result;
        }
    }
    static final class SkillHit {
        int count,firstCommand,firstOffset;
        SkillHit(int command,int offset) {count=1;firstCommand=command;firstOffset=offset;}
    }
    static SkillCatalog skillCatalog;
    static final class Frame {
        final int type; final byte[] body;
        Frame(int type, byte[] body) { this.type = type; this.body = body; }
    }
    static final class Challenge {
        byte[] nonce, edition; int version, algo, status;
    }
    static final class Role {
        long id;byte[] name;int gender,profession,level,status,zone,equipmentCount,sellStatus;
    }
    static final class RolePage {
        int result,userid;long nextid,localsid;Role role;
    }
    static RolePage rolePage(byte[] body) throws IOException {
        ByteArrayInputStream b=new ByteArrayInputStream(body);DataInputStream d=new DataInputStream(b);
        RolePage p=new RolePage();p.result=d.readInt();p.nextid=d.readLong();
        p.userid=d.readInt();p.localsid=d.readInt()&0xffffffffL;
        Role r=new Role();p.role=r;r.id=d.readLong();r.name=octets(b);
        if((r.name.length&1)!=0) throw new IOException("Odd-length UCS2 role name");
        r.gender=d.readUnsignedByte();
        for(int n=0;n<10;n++) d.readUnsignedByte(); // origin through sharp
        octets(b); // appearance
        r.profession=d.readUnsignedByte();r.level=d.readInt();
        octets(b);octets(b); // custom_status, charactermode
        long count=compact(b);if(count>4096) throw new IOException("Equipment vector exceeds limit");
        r.equipmentCount=(int)count;
        for(int n=0;n<r.equipmentCount;n++) {
            d.readInt();d.readShort();d.readShort();d.readShort();octets(b);
            d.readInt();d.readInt();d.readLong();
        }
        r.status=d.readByte();d.readInt();d.readInt();d.readInt(); // creation/deletion/last login
        r.zone=d.readUnsignedShort();r.sellStatus=d.readByte();d.readInt();end(b);return p;
    }
    static String escapedName(byte[] bytes) throws IOException {
        String s=new String(bytes,"UTF-16LE");StringBuilder out=new StringBuilder();
        for(int n=0;n<s.length();n++) {
            char c=s.charAt(n);
            if(c>=32 && c<127 && c!='\\' && c!='"') out.append(c);
            else out.append(String.format("\\u%04x",(int)c));
        }
        return out.toString();
    }
    static void sendSecure(OutputStream out,RC4 cipher,int type,byte[] body) throws IOException {
        byte[] wire=cipher.apply(pack(type,body));try {out.write(wire);out.flush();}
        finally {Arrays.fill(wire,(byte)0);}
    }
    static void requestRoles(OutputStream out,RC4 cipher,int uid,long next) throws IOException {
        ByteArrayOutputStream b=new ByteArrayOutputStream();DataOutputStream d=new DataOutputStream(b);
        d.writeInt(uid);d.writeInt(0);d.writeInt((int)next);
        sendSecure(out,cipher,82,b.toByteArray());
        System.out.println("ROLE_LIST_SENT userid="+uid+" nextid_i32="+(int)next);
    }
    static Set<Long> listRoles(InputStream in,OutputStream out,RC4 cipher,int uid) throws IOException {
        requestRoles(out,cipher,uid,-1);
        Set<Long> cursors=new HashSet<Long>(),ids=new HashSet<Long>();int pages=0;
        for(int packets=0;packets<256;packets++) {
            Frame f=frame(in);System.out.println("ROLE_LIST_REPLY type="+f.type+" length="+f.body.length);
            if(f.type==5) {reportError(f);return ids;}
            if(f.type!=83) {System.out.println("ROLE_LIST_OTHER payload_hex="+hex(f.body));continue;}
            RolePage p;
            try {p=rolePage(f.body);}
            catch(IOException e) {System.out.println("ROLE_LIST_PARSE_FAILED payload_hex="+hex(f.body));throw e;}
            if(p.userid!=uid) throw new IOException("RoleList reply userid mismatch");
            pages++;System.out.println("ROLE_LIST_PAGE result="+p.result+" nextid_i64="+p.nextid+" userid="+p.userid);
            Role r=p.role;
            if(r.id>0 && ids.add(Long.valueOf(r.id))) {
                System.out.println("ROLE id="+r.id+" name_escaped=\""+escapedName(r.name)+"\" name_utf16le_hex="+hex(r.name)+" level="+r.level+" profession="+r.profession+" gender="+r.gender+" status="+r.status+" zoneid="+r.zone+" equipment_count="+r.equipmentCount+" sell_status="+r.sellStatus);
            }
            if(p.nextid<=0) {
                System.out.println("ROLE_LIST_COMPLETE count="+ids.size()+" pages="+pages+" terminal_result="+p.result);
                return ids;
            }
            if(pages>=64 || !cursors.add(Long.valueOf(p.nextid))) throw new IOException("Repeated or excessive RoleList pagination; stopped");
            requestRoles(out,cipher,uid,p.nextid);
        }
        throw new IOException("RoleList packet limit reached");
    }
    static final class Selection {
        int result,userid,world,scene,authLength;float x,y,z;
    }
    static Selection selection(byte[] body) throws IOException {
        ByteArrayInputStream b=new ByteArrayInputStream(body);DataInputStream d=new DataInputStream(b);
        Selection s=new Selection();s.result=d.readInt();s.userid=d.readInt();
        s.world=d.readInt();s.scene=d.readUnsignedShort();s.x=d.readFloat();s.y=d.readFloat();s.z=d.readFloat();
        s.authLength=octets(b).length;end(b);return s;
    }

    // Capture-derived layouts for version 386. Unknown variants are rejected.
    static final class Entity {
        long id; float x,y,z; int updates,sequence;
    }
    static final class Npc {
        long id,flags,template; int typeRaw,sequence;float x,y,z;
    }
    static final class LittleReader {
        final byte[] bytes;int pos;
        LittleReader(byte[] b,int offset) {bytes=b;pos=offset;}
        int take(int n) throws IOException {
            if(n<0 || n>bytes.length-pos) throw new IOException("Truncated NPC data at offset="+pos+" need="+n);
            int old=pos;pos+=n;return old;
        }
        int u8() throws IOException {return bytes[take(1)]&255;}
        int u16() throws IOException {return le16(bytes,take(2));}
        long u32() throws IOException {int o=take(4);return (bytes[o]&255L)|((bytes[o+1]&255L)<<8)|((bytes[o+2]&255L)<<16)|((bytes[o+3]&255L)<<24);}
        long i64() throws IOException {return le64(bytes,take(8));}
        float f32() throws IOException {return lef(bytes,take(4));}
        void blob8() throws IOException {take(u8());}
    }
    // Client dispatch 0xDB4A41 -> 0xDBA800 -> 0x619790 -> 0xCD62A0.
    // NPC records: 0xCD4CA0 / 0xCD4870; optional fields: 0xCD3CA0.
    static List<Npc> npcList(byte[] raw) throws IOException {
        LittleReader r=new LittleReader(raw,2);int count=r.u16();
        if(count>4096) throw new IOException("NPC list exceeds observation limit");
        List<Npc> list=new ArrayList<Npc>();Set<Long> ids=new HashSet<Long>();
        for(int n=0;n<count;n++) {
            Npc npc=new Npc();npc.flags=r.i64();
            // Explicitly limit layouts; never infer a record boundary from a guessed size.
            if((npc.flags & ~0x4000000216dL)!=0) throw new IOException("Unsupported NPC flags="+Long.toHexString(npc.flags)+" record="+n);
            npc.id=r.i64();npc.typeRaw=r.u8();npc.template=r.u32();
            npc.x=r.f32();npc.y=r.f32();npc.z=r.f32();
            r.take(32); // remaining fixed fields, through client struct offset 0x40
            long lo=npc.flags&0xffffffffL,hi=npc.flags>>>32;
            if((lo&1)!=0) {r.take(13);r.take(r.u8()*9);}
            if((lo&4)!=0) r.take(16);
            if((lo&8)!=0) r.take(4);
            if((lo&0x20)!=0) r.take(4);
            if((lo&0x40)!=0) r.take(6);
            if((lo&0x100)!=0) r.take(4);
            if((hi&0x400)!=0) {r.take(5);r.blob8();r.take(8);r.blob8();r.take(5);}
            if((lo&0x2000)!=0) {r.take(4);r.blob8();r.take(4);r.blob8();}
            if(!ids.add(npc.id)) throw new IOException("Duplicate NPC ID in list");
            list.add(npc);
        }
        if(r.pos!=raw.length) throw new IOException("Trailing NPC bytes="+(raw.length-r.pos));
        return list;
    }
    static final class WorldState {
        final long expectedRole;
        boolean selfSeen,sceneSeen,targetEchoMatched; long selfId,requestedTarget; int scene,level,profession,packets,recognized;
        float x,y,z; final Map<Long,Entity> moving=new LinkedHashMap<Long,Entity>();
        final Map<Long,Npc> npcs=new LinkedHashMap<Long,Npc>();int npcPages;
        final Map<Integer,Integer> commands=new TreeMap<Integer,Integer>();
        final Map<Integer,SkillHit> skillHits=new TreeMap<Integer,SkillHit>();
        WorldState(long role) {expectedRole=role;}
        void accept(byte[] raw) throws IOException {
            if(raw.length<2) throw new IOException("Game data shorter than command header");
            int cmd=le16(raw,0);packets++;
            Integer count=commands.get(cmd);commands.put(cmd,count==null?1:count+1);
            correlateSkills(raw,cmd);
            if(cmd==5) {
                requireLength(raw,79,cmd);
                long id=le64(raw,2);float a=lef(raw,25),b=lef(raw,29),c=lef(raw,33);
                if(expectedRole!=0 && id!=expectedRole) throw new IOException("Self role ID mismatch");
                if(selfSeen && id!=selfId) throw new IOException("Conflicting self role ID");
                selfId=id;level=raw[10]&255;profession=raw[11]&255;x=a;y=b;z=c;selfSeen=true;recognized++;
                System.out.println("WORLD_SELF roleid="+id+" level_candidate="+level+" profession_candidate="+profession+" x="+x+" y="+y+" z="+z+" source_cmd=5");
            } else if(cmd==2) {
                requireLength(raw,83,cmd);
                int tag=le16(raw,2);float a=lef(raw,4),b=lef(raw,8),c=lef(raw,12);
                scene=tag;sceneSeen=true;recognized++;
                System.out.println("WORLD_SCENE scene_candidate="+scene+" x="+a+" y="+b+" z="+c+" source_cmd=2");
            } else if(cmd==204) {
                requireLength(raw,18,cmd);
                long source=le64(raw,2),destination=le64(raw,10);
                boolean matches=source==expectedRole && requestedTarget>0 && destination==requestedTarget;
                if(source==expectedRole && requestedTarget>0) targetEchoMatched=matches;
                recognized++;
                System.out.println("TARGET_STATE source_roleid="+source+" targetid="+destination+" matches_requested="+matches+" source_cmd=204");
            } else if(cmd==13) {
                List<Npc> list=npcList(raw);
                Set<Long> total=new HashSet<Long>(npcs.keySet());for(Npc npc:list) total.add(npc.id);
                if(total.size()>4096) throw new IOException("NPC observation limit exceeded");
                for(Npc npc:list) {npc.sequence=packets;npcs.put(npc.id,npc);}
                npcPages++;recognized++;
                System.out.println("NPC_LIST_DECODED count="+list.size()+" bytes="+raw.length+" consumed_all=true");
            } else if(cmd==26) {
                requireLength(raw,30,cmd);
                long id=le64(raw,2);float a=lef(raw,10),b=lef(raw,14),c=lef(raw,18);
                Entity e=moving.get(id);
                if(e==null) {if(moving.size()>=4096) throw new IOException("Entity observation limit exceeded");e=new Entity();e.id=id;moving.put(id,e);}
                e.x=a;e.y=b;e.z=c;e.updates++;e.sequence=packets;recognized++;
                // These are reported movement coordinates; interpolation and object class are unknown.
            }
        }
        void correlateSkills(byte[] raw,int command) {
            if(skillCatalog==null) return;
            // Packed world commands are not guaranteed to align fields, so inspect every byte offset.
            for(int o=2;o+4<=raw.length;o++) {
                int id=(raw[o]&255)|((raw[o+1]&255)<<8)|((raw[o+2]&255)<<16)|((raw[o+3]&255)<<24);
                if(id<100 || !skillCatalog.names.containsKey(Integer.valueOf(id))) continue;
                SkillHit h=skillHits.get(Integer.valueOf(id));
                if(h==null) skillHits.put(Integer.valueOf(id),new SkillHit(command,o)); else h.count++;
            }
        }
        double distance(Entity e) {double a=e.x-x,b=e.y-y,c=e.z-z;return Math.sqrt(a*a+b*b+c*c);}
        void summary() {
            System.out.println("WORLD_SUMMARY packets="+packets+" distinct_commands="+commands.size()+" recognized_packets="+recognized+" self_verified="+selfSeen+" scene_observed="+sceneSeen+" moving_objects="+moving.size());
            List<Entity> list=new ArrayList<Entity>(moving.values());
            if(selfSeen) Collections.sort(list,new Comparator<Entity>() {public int compare(Entity a,Entity b) {return Double.compare(distance(a),distance(b));}});
            for(Entity e:list) System.out.println("MOVING_OBJECT id="+e.id+" id_hex="+String.format("%016x",e.id)+" observed_x="+e.x+" observed_y="+e.y+" observed_z="+e.z+" distance3d="+(selfSeen?String.format(Locale.US,"%.3f",distance(e)):"unknown")+" updates="+e.updates+" classification="+(npcs.containsKey(e.id)?"npc":"unknown")+" attackable=unknown");
            int matched=0;
            List<Entity> npcPositions=new ArrayList<Entity>();
            for(Npc npc:npcs.values()) {
                Entity e=moving.get(npc.id);
                if(e!=null) matched++;
                if(e!=null && e.sequence>npc.sequence) npcPositions.add(e);
                else {e=new Entity();e.id=npc.id;e.x=npc.x;e.y=npc.y;e.z=npc.z;npcPositions.add(e);}
            }
            if(selfSeen) Collections.sort(npcPositions,new Comparator<Entity>() {public int compare(Entity a,Entity b) {return Double.compare(distance(a),distance(b));}});
            System.out.println("NPC_SUMMARY observed_npcs="+npcs.size()+" list_packets="+npcPages+" moving_matched="+matched);
            for(Entity e:npcPositions) {
                Npc npc=npcs.get(e.id);
                System.out.println("NPC_OBSERVED id="+e.id+" id_hex="+String.format("%016x",e.id)+" template_id="+npc.template+" type_raw="+npc.typeRaw+" flags_hex="+Long.toHexString(npc.flags)+" observed_x="+e.x+" observed_y="+e.y+" observed_z="+e.z+" distance3d="+(selfSeen?String.format(Locale.US,"%.3f",distance(e)):"unknown")+" position_source="+(e.updates>0?"movement_report":"npc_list")+" classification=npc monster=unknown attackable=unknown");
            }
            System.out.println("TARGET_SUMMARY requested="+requestedTarget+" server_echo_matched="+targetEchoMatched+" combat_success=unverified");
            System.out.println("SKILL_CANDIDATE_SUMMARY definitions_loaded="+(skillCatalog==null?0:skillCatalog.names.size())+" distinct_matches="+skillHits.size());
            for(Map.Entry<Integer,SkillHit> entry:skillHits.entrySet()) {
                SkillHit h=entry.getValue();String name=skillCatalog.names.get(entry.getKey());
                System.out.println("SKILL_CANDIDATE id="+entry.getKey()+" name_escaped=\""+escapeText(name)+"\" occurrences="+h.count+" first_command="+h.firstCommand+" first_offset="+h.firstOffset+" status=payload_correlation_only");
            }
            System.out.println("WORLD_COMMAND_COUNTS "+commands);
            System.out.println("STOP: observation complete; NPC list decoded where supported; hostility and attack protocol not verified; no movement or attack sent");
        }
    }
    static String escapeText(String s) {
        StringBuilder out=new StringBuilder();for(int i=0;i<s.length();i++) {char c=s.charAt(i);
            if(c>=32 && c<127 && c!='\\' && c!='"') out.append(c); else out.append(String.format("\\u%04x",(int)c));
        }return out.toString();
    }
    static void requireLength(byte[] b,int n,int cmd) throws IOException {
        if(b.length!=n) throw new IOException("Unsupported command layout: cmd="+cmd+" length="+b.length+" expected="+n);
    }
    static int le16(byte[] b,int o) {return (b[o]&255)|((b[o+1]&255)<<8);}
    static long le64(byte[] b,int o) {long n=0;for(int i=7;i>=0;i--) n=(n<<8)|(b[o+i]&255L);return n;}
    static float lef(byte[] b,int o) throws IOException {
        int v=0;for(int i=3;i>=0;i--) v=(v<<8)|(b[o+i]&255);
        float f=Float.intBitsToFloat(v);if(Float.isNaN(f)||Float.isInfinite(f)) throw new IOException("Non-finite world coordinate");return f;
    }
    static void replayWorld(String path,long role) throws IOException {
        WorldState world=new WorldState(role);
        BufferedReader in=new BufferedReader(new InputStreamReader(new FileInputStream(path),"US-ASCII"));
        java.util.regex.Pattern pattern=java.util.regex.Pattern.compile("GAME_DATA length=(\\d+) header_le16=(\\d+) payload_hex=([0-9a-fA-F]+)");
        int lineNumber=0;boolean ready=false;int skipped=0;
        try {
            String line;
            while((line=in.readLine())!=null) {
                lineNumber++;
                if(line.startsWith("TARGET_SELECT_SENT ")) {
                    java.util.regex.Matcher target=java.util.regex.Pattern.compile("TARGET_SELECT_SENT targetid=(\\d+) command=10 confirmation=unverified").matcher(line);
                    if(!target.matches()) throw new IOException("Invalid target marker at line "+lineNumber);
                    world.requestedTarget=Long.parseLong(target.group(1));world.targetEchoMatched=false;continue;
                }
                if(line.startsWith("FINISH_LOADING_SENT ")) {ready=true;continue;}
                if(!line.startsWith("GAME_DATA ")) continue;
                java.util.regex.Matcher m=pattern.matcher(line);
                if(!m.matches()) throw new IOException("Incomplete capture at line "+lineNumber+"; full payload_hex required");
                int size=Integer.parseInt(m.group(1));if(size>LIMIT) throw new IOException("Capture packet exceeds limit");
                byte[] raw=unhex(m.group(3));
                if(raw.length!=size || raw.length<2 || le16(raw,0)!=Integer.parseInt(m.group(2))) throw new IOException("Capture metadata mismatch at line "+lineNumber);
                if(ready) world.accept(raw);else skipped++;
            }
        } finally {in.close();}
        if(!ready) throw new IOException("Capture missing FINISH_LOADING_SENT marker");
        if(world.packets==0) throw new IOException("Capture contains no post-loading game packets");
        System.out.println("REPLAY_COMPLETE skipped_before_loading="+skipped);world.summary();
    }

    static boolean gameData(Frame f,PrintWriter capture,WorldState world) throws IOException {
        if(f.type!=34) return false;
        ByteArrayInputStream b=new ByteArrayInputStream(f.body);byte[] raw=octets(b);end(b);
        int cmd=raw.length>=2 ? (raw[0]&255)|((raw[1]&255)<<8) : -1;
        System.out.println("GAME_DATA length="+raw.length+" header_le16="+cmd+" prefix_hex="+hex(Arrays.copyOf(raw,Math.min(128,raw.length))));
        if(capture!=null) {capture.println("GAME_DATA length="+raw.length+" header_le16="+cmd+" payload_hex="+hex(raw));capture.flush();if(capture.checkError()) throw new IOException("Failed writing world capture");}
        if(world!=null) world.accept(raw);
        return true;
    }
    static void selectAndObserve(InputStream in,OutputStream out,RC4 cipher,Socket sock,int uid,long role,int seconds,boolean enter,long target,PrintWriter capture) throws IOException {
        ByteArrayOutputStream b=new ByteArrayOutputStream();DataOutputStream d=new DataOutputStream(b);
        d.writeLong(role);d.writeLong(0);d.writeByte(0);
        sendSecure(out,cipher,70,b.toByteArray());
        System.out.println("SELECT_ROLE_SENT roleid="+role+" trustor_roleid=0 login_mask=0");
        boolean selected=false,targetSent=false;int gamePackets=0;long deadline=0;
        WorldState world=new WorldState(role);
        for(int n=0;n<256;n++) {
            if(selected) {
                long remaining=deadline-System.currentTimeMillis();
                if(remaining<=0) break;
                sock.setSoTimeout((int)Math.max(1,remaining));
            }
            Frame f;
            try {f=frame(in);}
            catch(SocketTimeoutException e) {
                if(!selected) throw e;
                System.out.println("OBSERVATION_TIMEOUT after_select=true");break;
            }
            catch(EOFException e) {
                if(!selected) throw e;
                System.out.println("OBSERVATION_PEER_CLOSED after_select=true");break;
            }
            System.out.println("SELECT_PHASE_REPLY type="+f.type+" length="+f.body.length);
            if(f.type==5) {reportError(f);return;}
            if(f.type==71) {
                if(selected) throw new IOException("Duplicate SelectRole reply");
                Selection s;
                try {s=selection(f.body);}
                catch(IOException e) {System.out.println("SELECT_ROLE_PARSE_FAILED payload_hex="+hex(f.body));throw e;}
                System.out.println("SELECT_ROLE_RESULT result="+s.result+" userid="+s.userid);
                if(s.userid!=uid) throw new IOException("SelectRole reply userid mismatch");
                if(s.result!=0) throw new IOException("SelectRole rejected result="+s.result);
                selected=true;deadline=System.currentTimeMillis()+seconds*1000L;
                System.out.println("SELECT_ROLE_OK roleid="+role+" world_tid="+s.world+" scene_tag="+s.scene+" x="+s.x+" y="+s.y+" z="+s.z+" auth_length="+s.authLength);
                if(enter) {
                    ByteArrayOutputStream ready=new ByteArrayOutputStream();DataOutputStream rd=new DataOutputStream(ready);
                    rd.writeLong(role);rd.writeByte(0);
                    sendSecure(out,cipher,72,ready.toByteArray());
                    System.out.println("FINISH_LOADING_SENT type=72 roleid="+role+" islogin=0");
                    if(capture!=null) capture.println("FINISH_LOADING_SENT roleid="+role+" islogin=0");
                }
                continue;
            }
            if(gameData(f,capture,selected && enter ? world : null)) {
                if(selected) gamePackets++;
                if(target>0 && !targetSent && world.selfSeen && world.npcs.containsKey(target)) {
                    byte[] command=new byte[10];command[0]=10;
                    for(int k=0;k<8;k++) command[2+k]=(byte)(target>>>(8*k));
                    ByteArrayOutputStream envelope=new ByteArrayOutputStream();putOctets(envelope,command);
                    sendSecure(out,cipher,34,envelope.toByteArray());targetSent=true;world.requestedTarget=target;world.targetEchoMatched=false;
                    String note="TARGET_SELECT_SENT targetid="+target+" command=10 confirmation=unverified";
                    System.out.println(note);if(capture!=null) {capture.println(note);capture.flush();}
                }
                continue;
            }
            System.out.println("SELECT_PHASE_OTHER payload_hex="+hex(Arrays.copyOf(f.body,Math.min(128,f.body.length))));
        }
        if(!selected) throw new IOException("No SelectRole reply within packet limit");
        System.out.println("SELECT_OBSERVATION_COMPLETE roleid="+role+" game_packets_after_select="+gamePackets);
        world.summary();
        if(target>0 && !targetSent) throw new IOException("Target not observed in supported NPC list with verified self; no target selection sent");
    }
    static int byteRead(InputStream in) throws IOException {
        int b = in.read();
        if (b < 0) throw new EOFException("Peer closed connection while reading packet");
        return b;
    }
    static long compact(InputStream in) throws IOException {
        int b = byteRead(in);
        if (b < 0x80) return b;
        if (b < 0xc0) return ((b & 0x3f) << 8) | byteRead(in);
        if (b < 0xe0) return ((long)(b & 0x1f) << 24) | ((long)byteRead(in) << 16) | (byteRead(in) << 8) | byteRead(in);
        if (b == 0xe0) return new DataInputStream(in).readInt() & 0xffffffffL;
        throw new IOException("Invalid CompactUINT prefix");
    }
    static void putCompact(OutputStream out, long n) throws IOException {
        if (n < 0 || n > 0xffffffffL) throw new IOException("CompactUINT out of range");
        DataOutputStream d = new DataOutputStream(out);
        if (n < 0x80) d.writeByte((int)n);
        else if (n < 0x4000) d.writeShort((int)n | 0x8000);
        else if (n < 0x20000000L) d.writeInt((int)n | 0xc0000000);
        else { d.writeByte(0xe0); d.writeInt((int)n); }
    }
    static byte[] octets(InputStream in) throws IOException {
        long n = compact(in);
        if (n > LIMIT) throw new IOException("Octets exceeds size limit");
        byte[] b = new byte[(int)n]; new DataInputStream(in).readFully(b); return b;
    }
    static void putOctets(OutputStream out, byte[] b) throws IOException {
        putCompact(out, b.length); out.write(b);
    }
    static Frame frame(InputStream in) throws IOException {
        long type = compact(in); byte[] body = octets(in);
        if (type > Integer.MAX_VALUE) throw new IOException("Protocol type out of range");
        return new Frame((int)type, body);
    }
    static byte[] pack(int type, byte[] body) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        putCompact(out, type); putOctets(out, body); return out.toByteArray();
    }
    static void end(InputStream in) throws IOException {
        if (in.read() != -1) throw new IOException("Unexpected trailing packet fields");
    }
    static Challenge challenge(Frame f) throws IOException {
        if (f.type != 1) throw new IOException("Expected Challenge type 1, got " + f.type);
        ByteArrayInputStream in = new ByteArrayInputStream(f.body);
        DataInputStream d = new DataInputStream(in);
        Challenge c = new Challenge(); c.nonce = octets(in); c.version = d.readInt();
        c.edition = octets(in); c.algo = byteRead(in); c.status = d.readInt(); end(in);
        if (c.nonce.length == 0) throw new IOException("Empty Challenge nonce");
        return c;
    }
    static byte[] digest(byte[] account, byte[] password, byte[] nonce) throws GeneralSecurityException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(account); byte[] key = md.digest(password);
        try {
            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(new SecretKeySpec(key, "HmacMD5")); return mac.doFinal(nonce);
        } finally { Arrays.fill(key, (byte)0); }
    }
    static byte[] passwordKey(byte[] account, byte[] password) throws GeneralSecurityException {
        MessageDigest md=MessageDigest.getInstance("MD5");md.update(account);return md.digest(password);
    }
    static byte[] hmac(byte[] key, byte[] nonce) throws GeneralSecurityException {
        Mac mac=Mac.getInstance("HmacMD5");mac.init(new SecretKeySpec(key,"HmacMD5"));return mac.doFinal(nonce);
    }
    static final class RC4 {
        final int[] s=new int[256];int i,j;
        RC4(byte[] key) {
            if(key.length==0) throw new IllegalArgumentException("Empty RC4 key");
            for(int n=0;n<256;n++) s[n]=n;
            int k=0;
            for(int n=0;n<256;n++) {k=(k+s[n]+(key[n%key.length]&255))&255;int t=s[n];s[n]=s[k];s[k]=t;}
        }
        int apply(int b) {
            i=(i+1)&255;j=(j+s[i])&255;int t=s[i];s[i]=s[j];s[j]=t;
            return b^s[(s[i]+s[j])&255];
        }
        byte[] apply(byte[] b) {byte[] out=new byte[b.length];for(int n=0;n<b.length;n++) out[n]=(byte)apply(b[n]&255);return out;}
    }
    /** GNET 8 KiB MPPC stream, reconstructed from client 0x00DB26F0. */
    static final class SecureInput extends InputStream {
        final InputStream raw;final RC4 cipher;final byte[] history=new byte[8192];
        int pos,bits,bitCount;byte[] pending=new byte[0];int pendingPos;
        long wireBytes,plainBytes;
        SecureInput(InputStream raw,byte[] key) {this.raw=raw;cipher=new RC4(key);}
        int bit() throws IOException {
            if(bitCount==0) {
                int b=raw.read();if(b<0) throw new EOFException("Encrypted stream closed");
                bits=cipher.apply(b);bitCount=8;wireBytes++;
            }
            return (bits >>> --bitCount)&1;
        }
        int take(int n) throws IOException {int v=0;for(int k=0;k<n;k++) v=(v<<1)|bit();return v;}
        void literal(int b) throws IOException {
            if(pos==history.length) throw new IOException("MPPC history full without reset marker");
            history[pos++]=(byte)b;pending=new byte[]{(byte)b};pendingPos=0;
        }
        void token() throws IOException {
            if(bit()==0) {literal(take(7));return;}
            if(bit()==0) {literal(128|take(7));return;}
            int offset;
            if(bit()==0) offset=320+take(13);
            else if(bit()==0) offset=64+take(8);
            else offset=take(6);
            if(offset==0) {bitCount=0;if(pos==8192) pos=0;return;}
            int length;
            if(bit()==0) length=3;
            else {
                int n=1;
                while(bit()!=0) {n++;if(n>11) throw new IOException("Invalid MPPC match-length prefix");}
                int width=n+1;length=(1<<width)|take(width);
            }
            if(offset>pos || pos+length>8192) throw new IOException("Invalid MPPC back-reference offset="+offset+" pos="+pos+" length="+length);
            pending=new byte[length];pendingPos=0;
            for(int n=0;n<length;n++) {byte b=history[pos-offset];history[pos++]=b;pending[n]=b;}
        }
        public int read() throws IOException {
            while(pendingPos==pending.length) {pending=new byte[0];pendingPos=0;token();}
            plainBytes++;return pending[pendingPos++]&255;
        }
        public int read(byte[] b,int off,int len) throws IOException {
            if(b==null) throw new NullPointerException();
            if(off<0 || len<0 || off>b.length-len) throw new IndexOutOfBoundsException();
            if(len==0) return 0;
            b[off]=(byte)read();int n=1;
            while(n<len && pendingPos<pending.length) b[off+n++]=pending[pendingPos++];
            plainBytes+=n-1;return n;
        }
    }
    static byte[] response(byte[] account, byte[] digest) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        putOctets(out, account);
        new DataOutputStream(out).writeInt(0); // userid unknown until normal account authentication
        out.write(0); // algo=0: normal password path
        putOctets(out, digest);
        putOctets(out, new byte[0]); // optional MAC identifier not yet reproduced
        return pack(3, out.toByteArray());
    }
    static Map<String,String> accountConfig(String file) throws IOException {
        Map<String,String> values = new HashMap<String,String>();
        BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(file), GBK));
        try {
            String section = "", line;
            while ((line = r.readLine()) != null) {
                line = line.trim();
                if (line.startsWith(";") || line.startsWith("#") || line.length() == 0) continue;
                if (line.startsWith("[") && line.endsWith("]")) section = line.substring(1, line.length()-1);
                else if (section.equals("Account")) {
                    int pos = line.indexOf('=');
                    if (pos >= 0) values.put(line.substring(0,pos).trim(), line.substring(pos+1).trim());
                }
            }
        } finally { r.close(); }
        return values;
    }
    static String hex(byte[] b) {
        StringBuilder out = new StringBuilder();
        for (int i=0; i<b.length; i++) out.append(String.format("%02x", b[i] & 255));
        return out.toString();
    }
    static byte[] unhex(String s) {
        s = s.replaceAll("\\s", "");
        if ((s.length() & 1) != 0) throw new IllegalArgumentException("Odd hex length");
        byte[] out = new byte[s.length()/2];
        for(int i=0;i<out.length;i++) out[i]=(byte)Integer.parseInt(s.substring(i*2,i*2+2),16);
        return out;
    }
    static void check(boolean yes) { if (!yes) throw new AssertionError("Self-test failed"); }
    static void selfTest() throws Exception {
        long[] nums = {0,127,128,16383,16384,0x1fffffffL,0x20000000L,0xffffffffL};
        for(int i=0;i<nums.length;i++) {
            ByteArrayOutputStream o=new ByteArrayOutputStream();putCompact(o,nums[i]);
            ByteArrayInputStream in=new ByteArrayInputStream(o.toByteArray());check(compact(in)==nums[i]);end(in);
        }
        // RFC 2202 test case 1, independent of game login assumptions.
        byte[] k=new byte[16];Arrays.fill(k,(byte)0x0b);
        Mac m=Mac.getInstance("HmacMD5");m.init(new SecretKeySpec(k,"HmacMD5"));
        check(hex(m.doFinal("Hi There".getBytes("US-ASCII"))).equals("9294727a3638bb1c13f48ef8158bfc9d"));
        byte[] capture=unhex("012210000000000b259dff96687d31d71007e20000018207646638653831340000000000");
        Challenge c=challenge(frame(new ByteArrayInputStream(capture)));
        check(c.version==386 && c.algo==0 && c.status==0 && c.nonce.length==16);
        check(new String(c.edition,"US-ASCII").equals("df8e814"));
        check(hex(new RC4("Key".getBytes("US-ASCII")).apply("Plaintext".getBytes("US-ASCII"))).equals("bbf316e8d940af0ad3"));
        byte[] compressed=unhex("41f05e00"),testKey="test-key".getBytes("US-ASCII");
        SecureInput stream=new SecureInput(new ByteArrayInputStream(new RC4(testKey).apply(compressed)),testKey);
        for(int j=0;j<4;j++) check(stream.read()=='A'); // Literal followed by overlapping offset=1 length=3.
        for(int i=0;i<capture.length;i++) {
            boolean failed=false;
            try { challenge(frame(new ByteArrayInputStream(Arrays.copyOf(capture,i)))); }
            catch(IOException expected) { failed=true; }
            check(failed);
        }
        WorldState targetTest=new WorldState(28778);targetTest.requestedTarget=72057594037932528L;
        byte[] echo=unhex("cc006a70000000000000f011000000000001");targetTest.accept(echo);check(targetTest.targetEchoMatched);
        targetTest.requestedTarget++;targetTest.accept(echo);check(!targetTest.targetEchoMatched);
        boolean shortEcho=false;try {targetTest.accept(Arrays.copyOf(echo,17));} catch(IOException expected) {shortEcho=true;}check(shortEcho);
        SkillCatalog oldCatalog=skillCatalog;SkillCatalog fixture=new SkillCatalog();fixture.names.put(Integer.valueOf(1234),"fixture");skillCatalog=fixture;
        WorldState skillTest=new WorldState(0);skillTest.accept(unhex("6300ff00d2040000"));check(skillTest.skillHits.containsKey(Integer.valueOf(1234)));skillCatalog=oldCatalog;
        System.out.println("PASS: compact integers, RFC HMAC-MD5, RC4 vector, MPPC overlapping match, real Challenge fixture, all truncated capture lengths, target echo correlation, skill payload correlation");
    }
    public static void main(String[] args) {
        try { run(args); }
        catch(Exception e) {
            System.err.println("ERROR: " + e.getClass().getSimpleName() + ": " + e.getMessage());
            System.exit(e instanceof ServerRejectedException ? 2 : 1);
        }
    }
    static void run(String[] args) throws Exception {
        System.out.println("BUILD stage10-skill-correlation");
        Map<String,String> opt = new HashMap<String,String>();
        Set<String> allowed = new HashSet<String>(Arrays.asList("--host","--port","--config","--account","--timeout","--role-id","--observe-seconds","--world-log","--replay-world-log","--target-id","--skills-data"));
        boolean probeOnly=false,stopAtKey=false,stopAfterOnline=false,enterWorld=false;
        for(int i=0;i<args.length;i++) {
            if(args[i].equals("--self-test")) { selfTest();return; }
            if(args[i].equals("--probe-only")) { probeOnly=true;continue; }
            if(args[i].equals("--stop-at-keyexchange")) { stopAtKey=true;continue; }
            if(args[i].equals("--stop-after-online")) { stopAfterOnline=true;continue; }
            if(args[i].equals("--enter-world")) { enterWorld=true;continue; }
            if(!allowed.contains(args[i]) || i+1==args.length) throw new IllegalArgumentException("Unknown/missing option: "+args[i]);
            opt.put(args[i],args[++i]);
        }
        if(opt.containsKey("--skills-data")) skillCatalog=SkillCatalog.load(opt.get("--skills-data"));
        if(opt.containsKey("--replay-world-log")) {
            if(enterWorld || opt.containsKey("--world-log") || opt.containsKey("--target-id")) throw new IllegalArgumentException("Replay cannot enter world or write a world capture");
            long replayRole=Long.parseLong(opt.containsKey("--role-id")?opt.get("--role-id"):"0");
            if(replayRole<=0) throw new IllegalArgumentException("Replay requires a positive --role-id for identity verification");
            replayWorld(opt.get("--replay-world-log"),replayRole);return;
        }
        if(!opt.containsKey("--host")) throw new IllegalArgumentException("Network mode requires --host");
        if(!probeOnly && !opt.containsKey("--account")) throw new IllegalArgumentException("Authenticated mode requires --account");
        String host=opt.get("--host");
        int port=Integer.parseInt(opt.containsKey("--port")?opt.get("--port"):"9223");
        int timeout=Integer.parseInt(opt.containsKey("--timeout")?opt.get("--timeout"):"30")*1000;
        String account=opt.containsKey("--account")?opt.get("--account"):"probe";
        long role=opt.containsKey("--role-id")?Long.parseLong(opt.get("--role-id")):0;
        long target=opt.containsKey("--target-id")?Long.parseLong(opt.get("--target-id")):0;
        if(opt.containsKey("--target-id") && (target<=0 || !enterWorld || role<=0 || probeOnly || stopAtKey || stopAfterOnline)) throw new IllegalArgumentException("--target-id requires a positive ID, --role-id and --enter-world; incompatible with early-stop modes");
        int observe=Integer.parseInt(opt.containsKey("--observe-seconds")?opt.get("--observe-seconds"):"10");
        if(role<0 || observe<1 || observe>60) throw new IllegalArgumentException("role-id must be positive; observe-seconds must be 1..60");
        if(enterWorld && role==0) throw new IllegalArgumentException("--enter-world requires --role-id");
        byte[] password=null,secret=null;
        if(!probeOnly) {
            String file=opt.containsKey("--config")?opt.get("--config"):"robot.conf";
            Map<String,String> cfg=accountConfig(file);
            if(!cfg.containsKey("prefix") || !cfg.containsKey("start") || !cfg.containsKey("password"))
                throw new IOException("Missing prefix/start/password in [Account] of "+file);
            if(!account.equals(cfg.get("prefix")+cfg.get("start")))
                throw new IOException("Account does not match prefix+start; use --account explicitly");
            password=cfg.get("password").getBytes(GBK);cfg.clear();
        }
        Socket sock=new Socket();
        try {
            sock.connect(new InetSocketAddress(host,port),timeout);sock.setSoTimeout(timeout);
            InputStream in=sock.getInputStream(); OutputStream out=sock.getOutputStream();
            System.out.println("CONNECTED "+host+":"+port);
            Challenge c=challenge(frame(in));
            System.out.println("CHALLENGE version="+(c.version & 0xffffffffL)+" edition_hex="+hex(c.edition)+" algo="+c.algo+" status="+(c.status & 0xffffffffL)+" nonce_length="+c.nonce.length);
            if(probeOnly) { System.out.println("PROBE_ONLY: no application data sent"); return; }
            if(c.version!=386 || c.algo!=0) throw new IOException("Only verified version 386 / algo 0 is supported; nothing sent");
            byte[] reply=digest(account.getBytes(GBK),password,c.nonce);
            secret=passwordKey(account.getBytes(GBK),password);
            Arrays.fill(password,(byte)0);
            byte[] wire=response(account.getBytes(GBK),reply);
            try { out.write(wire);out.flush(); }
            finally { Arrays.fill(wire,(byte)0);Arrays.fill(reply,(byte)0); }
            System.out.println("RESPONSE_SENT account="+account+" userid=0 algo=0 macaddr_length=0 attempts=1");
            Frame next=frame(in);
            System.out.println("SERVER_REPLY type="+next.type+" length="+next.body.length);
            if(next.type==2) {
                ByteArrayInputStream b=new ByteArrayInputStream(next.body);byte[] nonce=octets(b);end(b);
                System.out.println("KEYEXCHANGE_RECEIVED nonce_length="+nonce.length);
                if(stopAtKey) {System.out.println("STOP: requested stop before key exchange");return;}
                if(nonce.length!=16) throw new IOException("Unexpected KeyExchange nonce length; no reply sent");
                byte[] clientNonce=new byte[16];new SecureRandom().nextBytes(clientNonce);
                byte[] txKey=hmac(secret,nonce),rxKey=hmac(secret,clientNonce);
                RC4 tx=new RC4(txKey);SecureInput secure=new SecureInput(in,rxKey);
                ByteArrayOutputStream kbody=new ByteArrayOutputStream();putOctets(kbody,clientNonce);
                byte[] kframe=tx.apply(pack(2,kbody.toByteArray()));out.write(kframe);out.flush();
                Arrays.fill(kframe,(byte)0);Arrays.fill(txKey,(byte)0);Arrays.fill(rxKey,(byte)0);
                Arrays.fill(secret,(byte)0);
                System.out.println("KEYEXCHANGE_SENT encrypted=RC4 nonce_length=16 receive=RC4+MPPC");
                for(int n=0;n<8;n++) {
                    Frame encrypted;
                    try {encrypted=frame(secure);}
                    catch(IOException e) {
                        System.out.println("SECURE_READ wire_bytes="+secure.wireBytes+" decoded_bytes="+secure.plainBytes);
                        throw e;
                    }
                    System.out.println("SECURE_REPLY type="+encrypted.type+" length="+encrypted.body.length);
                    if(encrypted.type==4) {
                        if(encrypted.body.length<8) throw new IOException("Truncated OnlineAnnounce");
                        DataInputStream a=new DataInputStream(new ByteArrayInputStream(encrypted.body));
                        int uid=a.readInt(),zone=a.readInt();
                        System.out.println("ONLINE_ANNOUNCE userid="+uid+" zoneid="+zone);
                        if(stopAfterOnline) {System.out.println("STOP: requested stop after online announcement");return;}
                        Set<Long> roles=listRoles(secure,out,tx,uid);
                        if(role>0) {
                            if(!roles.contains(Long.valueOf(role))) throw new IOException("Requested role not found in this account; no selection sent");
                            PrintWriter capture=null;
                            try {
                                if(opt.containsKey("--world-log")) {
                                    capture=new PrintWriter(new OutputStreamWriter(new FileOutputStream(opt.get("--world-log")),"US-ASCII"));
                                    capture.println("BUILD stage10-skill-correlation roleid="+role);
                                    System.out.println("WORLD_LOG path="+opt.get("--world-log"));
                                }
                                selectAndObserve(secure,out,tx,sock,uid,role,observe,enterWorld,target,capture);
                            } finally {if(capture!=null) capture.close();}
                        } else System.out.println("STOP: role listing complete; no selection requested");
                        return;
                    }
                    if(encrypted.type==5) {reportError(encrypted);return;}
                    System.out.println("SECURE_PACKET payload_hex="+hex(encrypted.body));
                }
                throw new IOException("No OnlineAnnounce after 8 encrypted packets; stopped");
            } else if(next.type==5) {
                reportError(next);
            } else {
                System.out.println("UNEXPECTED_PACKET payload_hex="+hex(next.body));
                System.out.println("STOP: no further packets sent");System.exit(3);
            }
        } finally {
            if(password!=null) Arrays.fill(password,(byte)0);
            if(secret!=null) Arrays.fill(secret,(byte)0);
            sock.close();
        }
    }
    static void reportError(Frame f) throws IOException {
        ByteArrayInputStream b=new ByteArrayInputStream(f.body);int code=new DataInputStream(b).readInt();byte[] info=octets(b);end(b);
        System.out.println("SERVER_ERROR code="+code+" info_hex="+hex(info));
        System.out.println("SERVER_ERROR info_gbk="+new String(info,GBK));
        throw new ServerRejectedException(code);
    }
    static final class ServerRejectedException extends IOException {
        ServerRejectedException(int code) {super("Server rejected authentication: "+code);}
    }
}
