from pathlib import Path
import struct

def sections(path,start=8):
 b=Path(path).read_bytes(); p=start; out=[]
 while p+8<=len(b):
  sz,cnt=struct.unpack_from('<II',b,p)
  end=p+8+sz*cnt
  if sz==0 or cnt>10000000 or end>len(b):
   print('FAIL',path,'at',p,'sz',sz,'cnt',cnt,'end',end,'remaining',len(b)-p); break
  out.append((p,sz,cnt,p+8,end)); p=end
 print(path,'sections',len(out),'parsed',p,'total',len(b),'tail',len(b)-p)
 return b,out
for fn in ['output/elements.data','output/skills.data']:
 b,ss=sections(fn)
 for i,(p,sz,cnt,st,en) in enumerate(ss):
  print(i,p,sz,cnt)
 print()
 if 'elements' in fn:
  for target in [60249,56104,77455]:
   found=[]
   for si,(p,sz,cnt,st,en) in enumerate(ss):
    for j in range(cnt):
     if struct.unpack_from('<I',b,st+j*sz)[0]==target: found.append((si,j,st+j*sz,sz))
   print('TARGET',target,found)
   for si,j,o,sz in found:
    rec=b[o:o+sz]
    # strings: scan aligned UTF16LE runs containing CJK/ascii
    strs=[]
    for off in range(4,min(sz,400),2):
     s=''
     for k in range(off,min(sz,off+160),2):
      c=struct.unpack_from('<H',rec,k)[0]
      if c==0:break
      if c<32:break
      s+=chr(c)
     if len(s)>=2 and (not strs or s not in strs[-1][1]): strs.append((off,s))
    print(' rec',si,j,'size',sz,'hex',rec[:min(sz,256)].hex())
    print(' strings',[(x,s.encode('unicode_escape').decode()) for x,s in strs[:12]])
