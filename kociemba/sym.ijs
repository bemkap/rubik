load'defs.ijs cubie.ijs'

CSP=: |:"2]_2((CORNER i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 URF 1 DFR 2 DLF 1 UFL 2 UBR 2 DRB 1 DBL 2 ULB 1 
 DLF 0 DFR 0 DRB 0 DBL 0 UFL 0 URF 0 UBR 0 ULB 0 
 UBR 0 URF 0 UFL 0 ULB 0 DRB 0 DFR 0 DLF 0 DBL 0 
 UFL 3 URF 3 UBR 3 ULB 3 DLF 3 DFR 3 DRB 3 DBL 3
)
ESP=: |:"2]_2((EDGE i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 UF 1 FR 0 DF 1 FL 0 UB 1 BR 0 DB 1 BL 0 UR 1 DR 1 DL 1 UL 1
 DL 0 DF 0 DR 0 DB 0 UL 0 UF 0 UR 0 UB 0 FL 0 FR 0 BR 0 BL 0
 UB 0 UR 0 UF 0 UL 0 DB 0 DR 0 DF 0 DL 0 BR 1 FR 1 FL 1 BL 1
 UL 0 UF 0 UR 0 UB 0 DL 0 DF 0 DR 0 DB 0 FL 0 FR 0 BR 0 BL 0
)
MSP=: |:"2]_2((EDGE i. {.),((".&>)@:{:))\"1;:&>cutLF(0 : 0)
 f 1 u 2 r 1 b 1 d 0 l 3
 d 2 l 2 f 2 u 2 r 2 b 2
 u 1 b 0 r 0 d 3 f 0 l 0
 u 4 l 4 f 4 d 4 r 4 b 4
)

NB. corner symmetries and inverses
CSYM=: Ic,ccp/&>}.(#&CSP)&.>,{<@:i."0]3 2 4 2
NB. edge symmetries
ESYM=: Ie,ecp/&>}.(#&ESP)&.>,{<@:i."0]3 2 4 2
NB. inverse index
ISYM=: i.&1"1 (0 1 2-:3{.{.@:ccp)"2/~CSYM
NB. apply corner symmetry
apcsym=: ({:@:] ccp [ ccp {.@:])(,:&({&CSYM){&ISYM)
NB. apply edge symmetry
apesym=: ({:@:] ecp [ ecp {.@:])(,:&({&ESYM){&ISYM)