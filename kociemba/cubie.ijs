Axis=: 'urfdlb'
CORNER=: 'URF';'UFL';'ULB';'UBR';'DFR';'DLF';'DBL';'DRB'
EDGE=: 'UR';'UF';'UL';'UB';'DR';'DF';'DL';'DB';'FR';'FL';'BL';'BR'

CPc=: |:"2]_2((CORNER i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UBR 0 URF 0 UFL 0 ULB 0 DFR 0 DLF 0 DBL 0 DRB 0
 DFR 2 UFL 0 ULB 0 URF 1 DRB 1 DLF 0 DBL 0 UBR 2
 UFL 1 DLF 2 ULB 0 UBR 0 URF 2 DFR 1 DBL 0 DRB 0
 URF 0 UFL 0 ULB 0 UBR 0 DLF 0 DBL 0 DRB 0 DFR 0
 URF 0 ULB 1 DBL 2 UBR 0 DFR 0 UFL 2 DLF 1 DRB 0
 URF 0 UFL 0 UBR 1 DRB 2 DFR 0 DLF 0 ULB 2 DBL 1
)
EPc=: |:"2]_2((EDGE i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UB 0 1 UR 0 1 UF 0 1 UL 0 1 DR 0 0 DF 0 0 DL 0 0 DB 0 0 FR 0 0 FL 0 0 BL 0 0 BR 0 0
 FR 0 1 UF 0 0 UL 0 0 UB 0 0 BR 0 1 DF 0 0 DL 0 0 DB 0 0 DR 0 1 FL 0 0 BL 0 0 UR 0 1
 UR 0 0 FL 1 1 UL 0 0 UB 0 0 DR 0 0 FR 1 1 DL 0 0 DB 0 0 UF 1 1 DF 1 1 BL 0 0 BR 0 0
 UR 0 0 UF 0 0 UL 0 0 UB 0 0 DF 0 1 DL 0 1 DB 0 1 DR 0 1 FR 0 0 FL 0 0 BL 0 0 BR 0 0
 UR 0 0 UF 0 0 BL 0 1 UB 0 0 DR 0 0 DF 0 0 FL 0 1 DB 0 0 FR 0 0 UL 0 1 DL 0 1 BR 0 0
 UR 0 0 UF 0 0 UL 0 0 BR 1 1 DR 0 0 DF 0 0 DL 0 0 BL 1 1 FR 0 0 FL 0 0 UB 1 1 DB 1 1
)

CMc=: 4 : 0
 'c o'=. CPc{~Axis i.x
 c{"1({.,:o(3|+){:)y
)

EMc=: 4 : 0
 'e o oa'=. EPc{~Axis i.x
 e{"1({.,(o,:oa)(2|+)}.)y
)