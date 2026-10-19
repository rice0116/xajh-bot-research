from pathlib import Path
import sys
sys.path.insert(0, str(Path('.analysis_deps').resolve()))
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
import struct
p=Path('xajh.exe'); b=p.read_bytes()
peoff=struct.unpack_from('<I',b,0x3c)[0]; n=struct.unpack_from('<H',b,peoff+6)[0]; opt=peoff+24; optsz=struct.unpack_from('<H',b,peoff+20)[0]; sec=opt+optsz
sections=[]
for i in range(n):
 o=sec+i*40; name=b[o:o+8].split(b'\0')[0].decode(errors='replace'); vs,va,rs,rp=struct.unpack_from('<IIII',b,o+8); sections.append((name,va,vs,rs,rp))
def raw(va):
 rva=va-0x400000
 for n,sva,vs,rs,rp in sections:
  if sva<=rva<sva+max(vs,rs): return rp+(rva-sva)
 raise ValueError(hex(va))
md=Cs(CS_ARCH_X86,CS_MODE_32)
for va,size in [(0xc80970,0x200),(0xcb1e80,0x180),(0xcb1f90,0x180),(0xc87480,0x180),(0xc876d0,0x180)]:
 print('\nFUNC',hex(va))
 bb=b[raw(va):raw(va)+size]
 for ins in md.disasm(bb,va):
  print(f'{ins.address:08x}: {ins.mnemonic:7} {ins.op_str}')
  if ins.mnemonic=='ret': break

