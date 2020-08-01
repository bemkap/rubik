Axis=: 'urfdlb'
CORNER=: 'URF';'UFL';'ULB';'UBR';'DFR';'DLF';'DBL';'DRB'
EDGE=: 'UR';'UF';'UL';'UB';'DR';'DF';'DL';'DB';'FR';'FL';'BL';'BR'
FACELET=: _2<\,,./Axis&,."0 a.{~49+i.9
nCr=: ((-%&(*/)>:@:])i.)~"0
Ic=: 0,:~i.8
Ie=: 0,:~i.12

SHL=: 33 b.