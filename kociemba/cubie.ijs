load'defs.ijs'

CPc=: |:"2]_2((CORNER i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UBR 0 URF 0 UFL 0 ULB 0 DFR 0 DLF 0 DBL 0 DRB 0
 DFR 2 UFL 0 ULB 0 URF 1 DRB 1 DLF 0 DBL 0 UBR 2
 UFL 1 DLF 2 ULB 0 UBR 0 URF 2 DFR 1 DBL 0 DRB 0
 URF 0 UFL 0 ULB 0 UBR 0 DLF 0 DBL 0 DRB 0 DFR 0
 URF 0 ULB 1 DBL 2 UBR 0 DFR 0 UFL 2 DLF 1 DRB 0
 URF 0 UFL 0 UBR 1 DRB 2 DFR 0 DLF 0 ULB 2 DBL 1
)
EPc=: |:"2]_2((EDGE i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UB 0 UR 0 UF 0 UL 0 DR 0 DF 0 DL 0 DB 0 FR 0 FL 0 BL 0 BR 0
 FR 0 UF 0 UL 0 UB 0 BR 0 DF 0 DL 0 DB 0 DR 0 FL 0 BL 0 UR 0
 UR 0 FL 1 UL 0 UB 0 DR 0 FR 1 DL 0 DB 0 UF 1 DF 1 BL 0 BR 0
 UR 0 UF 0 UL 0 UB 0 DF 0 DL 0 DB 0 DR 0 FR 0 FL 0 BL 0 BR 0
 UR 0 UF 0 BL 0 UB 0 DR 0 DF 0 FL 0 DB 0 FR 0 UL 0 DL 0 BR 0
 UR 0 UF 0 UL 0 BR 1 DR 0 DF 0 DL 0 BL 1 FR 0 FL 0 UB 1 DB 1
)

NB. corner coordinate product
ccp=: ({~"1{.)({.@:[,:(3|+)&(1&{))]
NB. edge coordinate product
ecp=: ({~"1{.)({.@:[,:(2|+)&(1&{))]