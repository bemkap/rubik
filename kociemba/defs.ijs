AXIS=: ;:'u r f d l b us rs fs'
CORNER=: 'URF';'UFL';'ULB';'UBR';'DFR';'DLF';'DBL';'DRB'
EDGE=: 'UR';'UF';'UL';'UB';'DR';'DF';'DL';'DB';'FR';'FL';'BL';'BR'
FACELET=: ,AXIS,&.>/;/a.{~49+i.9
nCr=: ((-%&(*/)>:@:])i.)~"0

SHL=: 33 b.

NB. creation helpers
Ic=: 0,:~i.8 NB. identity corners
Ie=: 0,:~i.12 NB. identity edges
ote=: ((i.12),:(,(2|2-+/)))"1 NB. orientation to edge coord
pte=: ,:&0"1 NB. permutation to edge coord
otc=: ((i.8),:(,(3|3-+/)))"1 NB. orientation to corner coord
ptc=: ,:&0"1 NB. permutation to corner coord