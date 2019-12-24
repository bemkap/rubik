NB. rubik's cube solver
NB. thistlethwaite method
load'./rubik.ijs'
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
twst=: (l,r) <./@:i.~"1 CORN&gface
coro=: 3 : 0
 m=. ,.i.6
 while. 1 do.
  i=. y (*./@:(LRSL e.&:(/:~"1) UDSL&{)@:(G1 dper))"1 m NB. all LR-slice in UD-slice
  j=. y (*./@:(LRSL e.&:(/:~"1)(0 2 8 11{EDGE)&{)@:(G1 dper))"1 m NB. all LR-slice in U-face
  if. i+.&(+./)j do. break. end.
  m=. ([:,/,"1 0/&(i.6))m
 end.
 y=. y (G1 dper) m{~1 i.~ i+.j
 p=. >r{~j=. 1 i.~ (#CTMT)>i=. (>1{"1 CTMT) i. twst S:0 (<y){~&.>r=. ,(TIRE ap REF){&.>/TIRO ap ROT
 m=. ctmi 0{::CTMT{~j{i
 y=. (ALL dper inv)&m&.(p&{)y
)
NB. corners orbit
COMT=: ".L:0'|'&splitstring"1'm'fread'./s3table' NB. corners orbit movement table
comi=: (MOVS&i.L:0;:'l ll L ff r rr R bb uu dd');@:{~<: NB. corner orbits movement indices
OPAT=: <:L:0 {."1 COMT
MOVI=: comi L:0 {:"1 COMT
ECMT=: 'm'fread'./s4table'
par2=: C.&(i.8)S:1@:(<:@:".L:0)@:(';'&splitstring L:0)@:(','&splitstring)
COAC=: {"1&par2/ 2{.ECMT NB. corner orbits and cosets
EDAM=: _70(".L:0)\','&splitstring"1]2}.ECMT NB. edge and movements
orbi=: (4#0 1)I.@:~:4<:CORN&pati NB. bad orbits
EDOR=: 0 10 2 11 9 4 5 7 1 6 8 3{EDGE NB. method edge order
cig3=: (4#0 1)-:4&<: NB. in g3?
orbo=: 3 : 0
 j=. 1 i.~ (#OPAT)>i=. OPAT i. (<y)orbi@:{~&.>,(TIRE ap REF){&.>/TIRO ap ROT
 y=. y(ALL dper)(MOVI{::~j{i){>j{,(TIRE ap REFM){&.>/TIRO ap ROTM
 E=. EDAM{~i{~j=. ((#COAC)&>i.1:)i=. i.&1"1 |:COAC cig3@:{"1/ pati&y"2 (<CORN){~&>RI ap ROTC
 k=. <10#./:~({&y >:@:i. 4&{.)(<EDOR){~&>(j{RI) ap ROTE
 y(ALL dper inv)(comi 1{::E{~({."1 E)i.k){(<i.24){~&>(j{RI) ap ROTM
)
NB. edge permutation
pars1=: 3 : '(i.4)C.~(4|_1+10&#.inv) each boxopen ".}.}: ('')('';'';'') stringreplace y'
EPTA =: ((".L:0@:{.),pars1 L:0@:}.)"1 ','&splitstring S:0 'b'fread'./s5table'
epmi =: (MOVS&i.L:0;:'ll ff rr bb uu dd');@:{~<:
edpe =: 3 : 'j{~i=. cube i.~ j=. y(ALL dper inv)"1,/(epmi L:0 {."1 EPTA){&>/RI ap ROTM'

t=: cube sper inv 'flRddbbuffddlRfrrfbbrBrrbrbLuuRuuddrrddLfflddLllrrbbrrffrrdduubbuurruurruu'