AXIS=: ;:'u r f d l b us rs fs'
CORNER=: ;:'URF UFL ULB UBR DFR DLF DBL DRB'
EDGE=: ;:'UR UF UL UB DR DF DL DB FR FL BL BR'
FACELET=: ,AXIS,&.>/;/a.{~49+i.9
MOVE=: ;:'Ux1 Ux2 Ux3 Rx1 Rx2 Rx3 Fx1 Fx2 Fx3 Dx1 Dx2 Dx3 Lx1 Lx2 Lx3 Bx1 Bx2 Bx3 Usx1 Usx2 Usx3 Rsx1 Rsx2 Rsx3 Fsx1 Fsx2 Fsx3'
nCr=: ((-%&(*/)>:@:])i.)~"0

SHL=: 33 b.

NB. creation helpers
Ic=: 0,:~i.8 NB. identity corners
Ie=: 0,:~i.12 NB. identity edges
ote=: ((i.12),:(,(2|2-+/)))"1 NB. orientation to edge coord
otc=: ((i.8),:(,(3|3-+/)))"1 NB. orientation to corner coord
otm=: (i.6)&,:"1 NB. orientation to center coord
pte=: ,:&0"1 NB. permutation to edge coord
ptc=: ,:&0"1 NB. permutation to corner coord
ptm=: ,:&0"1 NB. permutation to center coord