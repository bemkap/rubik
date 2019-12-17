NB. rubik's cube solver
NB. thistlethwaite method
require'./rubik.ijs'
NB. sets
G0=: ALL
G1=: L,R,(U{U),(D{D),F,:B
G2=: L,R,(U{U),(D{D),(F{F),:B{B
G3=: (L{L),(R{R),(U{U),(D{D),(F{F),:B{B
NB. edge detection
stor=: f,b,u,d,l,r NB. stickers order
orie=: stor</"1@:i.EDGE&gface NB. orientation
NB. edge orientation
EMT=:   ,:;:'L ffL fL Ruu Bl l ll rruu'
EMT=: EMT,;:'f F ff rrF ddff llfll llUll rF'
EMT=: EMT,;:'ffrff r Frf R bRB bbR ddrr rr'
EMT=: EMT,;:'llBll rrbrr ddbb b bb B lBL Rbr'
mte=: 1 0 i.~&> 4({.;}.)orie NB. movement table entry
mov=: sper(EMT{::~<@:mte)
PTA=: 3 3$0 0 0 1 _1 0 4 2 0 NB. power table
SEL=: 0,1 0 _1,:4 3 2 1 0
pow=: (](SEL{~0.5 1<@:*,)&(4<.+/)4&{.)@:-.@:orie
eor=: ('u' sper~ mov^:pow)^:(1-*./@:orie)^:_
NB. corner orientation
par1=: (11 12 13 21 22 23 31 32 33 41 42 43 51 52&i.L:0@:{.,}.)"1@:(".L:0)
CTMT=: par1 ','splitstring"1'm'fread'./s2table' NB. corners twist movement table
ctmi=: MOVS i. ;@:{&(;:'l ll L f ff F r rr R b bb B uu dd') NB. corners twist movement indices
NB. twst=: (l,r) (e.~i.1:)"1 CORN&gface
twst=: (l,r) <./@:i.~"1 CORN&gface
coro=: 3 : 0
 NB. m=. ,.i.6
 NB. while. 1 do.
 NB.  i=. y (*./@:(LRSL e.&:(/:~"1) UDSL&{)@:(G1 dper))"1 m NB. all LR-slice in UD-slice
 NB.  j=. y (*./@:(LRSL e.&:(/:~"1)(0 2 8 11{EDGE)&{)@:(G1 dper))"1 m NB. all LR-slice in U-face
 NB.  if. i+.&(+./)j do. break. end.
 NB.  m=. ([:,/,"1 0/&(i.6))m
 NB. end.
 NB. y=. y (G1 dper) m{~1 i.~ i+.j
 j=. 1 i.~ (#CTMT)>i=. (>1{"1 CTMT) i. twst S:0 (<y){~&.>r=. ,(TIRE ap AT){&.>/(TIRO ap AR)
 p=. >j{r
 m=. ctmi 0{::CTMT{~j{i
 y=. (ALL dper)&m&.({&p) y
 NB. j=. 1 i.~(#CTMT)>1i=. (1 {::"1 CTMT)i.twst S:0(ROT alr Crt)<y NB. look up in CTMT table
 NB. y (S dper inv) (j{INV)(mrt rot)~ctmi 0{::CTMT{~j{i NB. apply movement to restore twists
)
NB. NB. corner orbit
NB. COMT=: ".L:0'|'&splitstring"1'm'fread'./s3table' NB. corners orbit movement table
NB. comi=: (MOVS&i.L:0;:'l ll L ff r rr R bb uu dd');@:{~<: NB. corner orbits movement indices
NB. TIRO=: ROT#~cube-:"1/&(twst S:0)(ROT alr Crt)<cube
NB. NB. OPAT=: /:~L:0,(TIRO alr crt)"0 <:L:0 {."1 COMT
NB. OPAT=: <:L:0 {."1 COMT
NB. MOVI=: comi L:0 {:"1 COMT

NB. ECMT=: 'm'fread'./s4table'
NB. par2=: C.&(i.8)S:1@:(<:@:".L:0)@:(';'&splitstring L:0)@:(','&splitstring)
NB. COAC=: (ROT alr crt)"0;/{"1&par2/ 2{.ECMT NB. corner orbits and cosets
NB. EDAM=: _70(".L:0)\','&splitstring"1]2}.ECMT NB. edge and movements
NB. orbi=: (4#0 1)I.@:~:4<:CORN&pati NB. bad orbits
NB. EDOR=: 0 10 2 11 9 4 5 7 1 6 8 3{EDGE NB. method edge order
NB. cig3=: (4#0 1)-:4&<: NB. in g3?
NB. orbo=: 3 : 0
NB.  j=. 1 i.~ (#COMT)>i=. ({."1 COMT)i.,/:~L:0(ROT alr crt)<orbi y

 NB. y=. y (S dper) MOVI{::~OPAT i. <orbi y
 NB. E=. EDAM{~1 i.~ +./"1 cig3&>COAC{&.><CORN pati y
 NB. y (S dper inv) comi 1{::E{~({."1 E)i.<10#./:~>:(EDOR{~i.4) pati y
 NB. P=. /:~L:0,(ROT alr ert)"0]10&#.inv L:0 {."1 E
 NB. M=. ,(ROT alr mrt)"0 comi L:0 {:"1 E
 NB. y
 
NB. NB.  r=. TIRO{~(((a:,0 4;0 1 6 7){::~-:@:#)(i.~(/:~"1))(crt rot)"1 0&TIRO)<:orbi y
NB. NB.  E=. EDAM{~1 i.~ COAC cig3"1@:{ C.(crt rot)&r L:0 C.CORN pati y
NB. NB.  k=. E get <10#./:~>:r(ert rot)~(EDOR{~0 1 2 3(ert rot)r)i.~&:(/:~"1)EDOR{y
NB. NB.  y sper inv MOVS{~(rnv r)(mrt rot)~MOVS i. comi 1{::k{E
NB. )
NB. NB. edge permutation
NB. LETA =: 'b'fread'./s5table'
NB. pars1=: 3 : '(i.4)C.~(4|_1+10&#.inv) each boxopen ".}.}: ('')('';'';'') stringreplace y'
NB. EPTA =: ((".L:0@:{.),pars1 L:0@:}.)"1 ','&splitstring S:0 LETA
NB. PS   =: ((4#0 4 8)(+;)}.)"1 EPTA
NB. MMM  =: (;:'ll ff rr bb uu dd');@:{~<:
NB. edpe=: 3 : 0
NB.  i=. 1 i.~ 64>j=. cube i.~"1 2 k=. (y sper inv"1 MOVS{~MOVS(mrt alr)@:i.MMM)S:0 {."1 EPTA
NB.  (i{j){i{k
NB. )

t=: cube sper inv 'flRddbbuffddlRfrrfbbrBrrbrbLuuRuuddrrddLfflddLllrrbbrrffrrdduubbuurruurruu'
z=: t sper 'flRddbbuffddlRf'