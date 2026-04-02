## Purpose
A pre-relaxed ```opc.gro``` containing 216 water molecules is provided.

## For lazy people
```bash
cp opc.gro /usr/local/gromacs/share/gromacs/top/amber19sb.ff/
```

## Relaxation procedures
1. Adjust coordinate from ```tip4p.gro``` (from Gromacs 2026.1 installation) into OPC coordinates, according to ```opc.itp```, with all OW coordinates unchanged.
2. Convert to pdb to removed all velocity record of the original ```tip4p.gro```.
3. Convert back to gro
4. Energy minimization
5. NVT
6. NPT for 1 ns
7. Finally, ```npt_300K.gro``` is identical to ```opc.gro```

Box margin = 0 nm
<p>
  <img src="margin_0/em_potential.png" width="32%" />
  &nbsp;
  <img src="margin_0/npt_pressure.png" width="32%" />
  &nbsp;
  <img src="margin_0/npt_temperature.png" width="32%" />
</p>

Box margin = 0.15 nm
<p>
  <img src="margin_0.15/em_potential.png" width="32%" />
  &nbsp;
  <img src="margin_0.15/npt_pressure.png" width="32%" />
  &nbsp;
  <img src="margin_0.15/npt_temperature.png" width="32%" />
</p>

## Email
```
hoernesta@gmail.com
```
