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
TIRO=: RI#~+:/1 2 (2|+/@:=)S:0"0 1 RI
TIRE=: a:,<,0
coro=: 3 : 0
 m=. ,.i.6
 while. 1 do.
  i=. y (*./@:(LRSL e.&:(/:~"1) UDSL&{)@:(G1 dper))"1 m NB. all LR-slice in UD-slice
  j=. y (*./@:(LRSL e.&:(/:~"1)(0 2 8 11{EDGE)&{)@:(G1 dper))"1 m NB. all LR-slice in U-face
  if. i+.&(+./)j do. break. end.
  m=. ([:,/,"1 0/&(i.6))m
 end.
 y=. y (G1 dper) m{~1 i.~ i+.j
 p=. >r{~j=. 1 i.~ (#CTMT)>i=. (>1{"1 CTMT) i. twst S:0 (<y){~&.>r=. ,(TIRE ap REF){&.>/(TIRO ap ROT)
 m=. ctmi 0{::CTMT{~j{i
 y=. (ALL dper inv)&m&.(p&{) y
)
NB. NB. corner orbit
COMT=: ".L:0'|'&splitstring"1'm'fread'./s3table' NB. corners orbit movement table
comi=: (MOVS&i.L:0;:'l ll L ff r rr R bb uu dd');@:{~<: NB. corner orbits movement indices
OPAT=: <:L:0 {."1 COMT
MOVI=: comi L:0 {:"1 COMT
ROTC=: 4 5 7 6 1 0 2 3,4 6 5 7 3 1 2 0,:7 4 5 6 3 0 1 2
ROTE=: 5 4 7 6 0 1 2 3 9 10 11 8,8 9 10 11 5 6 7 4 3 2 1 0,:3 0 1 2 11 8 9 10 6 5 4 7
ROTM=: (i.24)C.~"1 0;/MOVS i. 'ufbd','lfrb',:'urdl'
ECMT=: 'm'fread'./s4table'
par2=: C.&(i.8)S:1@:(<:@:".L:0)@:(';'&splitstring L:0)@:(','&splitstring)
COAC=: {"1&par2/ 2{.ECMT NB. corner orbits and cosets
EDAM=: _70(".L:0)\','&splitstring"1]2}.ECMT NB. edge and movements
orbi=: (4#0 1)I.@:~:4<:CORN&pati NB. bad orbits
EDOR=: 0 10 2 11 9 4 5 7 1 6 8 3{EDGE NB. method edge order
cig3=: (4#0 1)-:4&<: NB. in g3?
orbo=: 3 : 0
 NB. j=. 1 i.~ (#OPAT)>i=. OPAT i. (<y)orbi@:{&.>,(TIRE ap REF){&.>/(TIRO ap ROT)
 NB. y=. y (ALL dper) MOVI{::~j{i
 E=. EDAM{~i{~j=. ((#COAC)&>i.1:)i=. i.&1"1 |:COAC cig3@:{"1/ pati&y"2 (<CORN){~&>(<,0) ap ROTC
 NB. j=. 1 i.~ (#E)>i=. ({."1 E)i.;/10#.>:/:~@:(4{.[i.&:(/:~"1){)&y"2 (<EDOR){~&>TIRO ap ROTE
 NB. y=. y((ALL{~>(j{TIRO) ap ROTM) dper inv)1{::E{~j{i
)
NB. edge permutation
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
z=: t sper 'flRddbbuffddlRfrrfbbrBrrbrbLuu'