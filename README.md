## Purpose
A pre-relaxed ```opc.gro``` containing 216 water molecules is provided.

## For lazy people
```bash
cp opc.gro /usr/local/gromacs/share/gromacs/top/amber19sb.ff/
```

## Relaxation procedures
1. Adjust coordinate from tip4p.gro (from Gromacs 2026.1 installation) into OPC coordinates, according to opc.itp, with all OW coordinates unchanged.
2. Convert to pdb to removed all velocity record of the original tip4p.
3. Convert back to gro
4. Energy minimization
5. NVT
6. NPT
7. Finally, ```npt_300K.gro``` has identical content as ```opc.gro```

## Email
```
hoernesta@gmail.com
```
