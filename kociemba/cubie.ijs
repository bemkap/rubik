load'defs.ijs'

CPc=: |:"2]_2((CORNER i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UBR 0 URF 0 UFL 0 ULB 0 DFR 0 DLF 0 DBL 0 DRB 0
 DFR 2 UFL 0 ULB 0 URF 1 DRB 1 DLF 0 DBL 0 UBR 2
 UFL 1 DLF 2 ULB 0 UBR 0 URF 2 DFR 1 DBL 0 DRB 0
 URF 0 UFL 0 ULB 0 UBR 0 DLF 0 DBL 0 DRB 0 DFR 0
 URF 0 ULB 1 DBL 2 UBR 0 DFR 0 UFL 2 DLF 1 DRB 0
 URF 0 UFL 0 UBR 1 DRB 2 DFR 0 DLF 0 ULB 2 DBL 1
 UBR 0 URF 0 UFL 0 ULB 0 DRB 0 DFR 0 DLF 0 DBL 0
 DFR 2 DLF 1 UFL 2 URF 1 DRB 1 DBL 2 ULB 1 UBR 2
 UFL 1 DLF 2 DBL 1 ULB 2 URF 2 DFR 1 DRB 2 UBR 1
)
EPc=: |:"2]_2((EDGE i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UB 0 UR 0 UF 0 UL 0 DR 0 DF 0 DL 0 DB 0 FR 0 FL 0 BL 0 BR 0
 FR 0 UF 0 UL 0 UB 0 BR 0 DF 0 DL 0 DB 0 DR 0 FL 0 BL 0 UR 0
 UR 0 FL 1 UL 0 UB 0 DR 0 FR 1 DL 0 DB 0 UF 1 DF 1 BL 0 BR 0
 UR 0 UF 0 UL 0 UB 0 DF 0 DL 0 DB 0 DR 0 FR 0 FL 0 BL 0 BR 0
 UR 0 UF 0 BL 0 UB 0 DR 0 DF 0 FL 0 DB 0 FR 0 UL 0 DL 0 BR 0
 UR 0 UF 0 UL 0 BR 1 DR 0 DF 0 DL 0 BL 1 FR 0 FL 0 UB 1 DB 1
 UB 0 UR 0 UF 0 UL 0 DB 0 DR 0 DF 0 DL 0 FR 0 FL 0 BL 0 BR 0 
 FR 0 UF 0 FL 0 UB 0 BR 0 DF 0 BL 0 DB 0 DR 0 DL 0 UL 0 UR 0 
 UR 0 FL 1 UL 0 BL 1 DR 0 FR 1 DL 0 BR 1 UF 1 DF 1 DB 1 UB 1
)
NB. MPc=: |:"2]_2((AXIS i. {.) ((".&>)@:{:))\"1;:&>cutLF(0 : 0)
NB.  u 1 r 0 f 0 d 0 l 0 b 0
NB.  u 0 r 1 f 0 d 0 l 0 b 0
NB.  u 0 r 0 f 1 d 0 l 0 b 0
NB.  u 0 r 0 f 0 d 1 l 0 b 0
NB.  u 0 r 0 f 0 d 0 l 1 b 0
NB.  u 0 r 0 f 0 d 0 l 0 b 1
NB.  u 1 r 0 f 0 d 3 l 0 b 0
NB.  u 0 r 1 f 0 d 0 l 3 b 0
NB.  u 0 r 0 f 1 d 0 l 0 b 3
NB. )

NB. corner coordinate product
ccp=: (({~"1{.)({.@:[,:(3|+)&(1&{))])"2
NB. edge coordinate product
ecp=: (({~"1{.)({.@:[,:(2|+)&(1&{))])"2
NB. center coordinate product
mcp=: (({~"1{.)({.@:[,:(4|+)&(1&{))])"2