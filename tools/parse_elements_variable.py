from pathlib import Path
import struct
b=Path('output/elements.data').read_bytes(); p=8; ss=[]
while p<len(b):
 if p+4>len(b): print('tail',len(b)-p);break
 cnt=struct.unpack_from('<I',b,p)[0]; desc=p+4; metaend=desc+cnt*6
 if metaend+4>len(b): print('badmeta',len(ss),p,cnt);break
 total=struct.unpack_from('<I',b,metaend)[0]; blob=metaend+4; end=blob+total
 if end>len(b): print('badblob',len(ss),p,cnt,total,end);break
 entries=[]; off=blob
 for i in range(cnt):
  rid,sz=struct.unpack_from('<IH',b,desc+i*6);entries.append((rid,sz,off));off+=sz
 if off!=end: print('mismatch',len(ss),off,end,'delta',end-off)
 ss.append((p,cnt,total,entries));p=end
print('sections',len(ss),'end',p,'total',len(b))
for target in [60249,56104,77455]:
 fs=[]
 for si,(_,cnt,total,es) in enumerate(ss):
  for i,(rid,sz,o) in enumerate(es):
   if rid==target:fs.append((si,i,sz,o,b[o:o+sz]))
 print('TARGET',target,'found',len(fs))
 for si,i,sz,o,r in fs:
  # record itself begins after id not duplicated; scan utf16
  strings=[]
  for st in range(0,sz-3):
   if st%2:continue
   s=''
   for q in range(st,min(sz,st+160),2):
    c=struct.unpack_from('<H',r,q)[0]
    if c==0 or c<32:break
    if not (32<=c<127 or 0x3400<=c<=0x9fff):break
    s+=chr(c)
   if len(s)>=2 and all(s not in z[1] for z in strings):strings.append((st,s))
  print(' section',si,'index',i,'size',sz,'offset',o,'hex',r.hex())
  print(' strings',[(a,s.encode('unicode_escape').decode()) for a,s in strings])
print('section summary')
for i,(p,c,t,e) in enumerate(ss):print(i,p,c,t)

