NB. rubik's cube solver
NB. thistlethwaite method
require'viewmat'
NB. cube representation and helper verbs
cube =: i.48
face =: <.@%&8
ap   =: [:~.[:,/{"1/
'u l f r b d'=: i.6
MOVS =: 'lrfbudLRFBUD'
gface=: face@:{
pate =: 4 : '*./cube e.&(/:~"1@:(x&gface)) y'
pati =: 4 : 'cube i.&(/:~"1@:(x&gface)) y'
get  =: {."1@:[i.]
NB. graphical view of the cube
COLORS =: 0 0 0,255 128 0,0 0 255,255 0 0,255 255 0,255 255 255,:0 255 0
HUE0   =: 0 1 2 3 4 5 6{COLORS NB. mine
HUE1   =: 0 4 2 3 6 1 5{COLORS NB. standard
HUE2   =: 0 1 6 5 2 4 3{COLORS NB. simulator
display=: 3 : 0
 HUE0 display y
 :
 c=. >:4(3 3${.,_1:,}.)"1 face 6 8$y
 c=. ,/_4,./\(12 3 3$0)1 4 5 6 7 9}~c
 x viewmat c
)
NB. movements permutations
R=: cube C.inv~ 24 26 31 29;25 28 30 27;2 37 42 18;4 35 44 20;7 32 47 23
L=: cube C.inv~ 8 10 15 13;9 12 14 11;0 16 40 39;3 19 43 36;5 21 45 34
U=: cube C.inv~ 0 2 7 5;1 4 6 3;8 32 24 16;9 33 25 17;10 34 26 18
D=: cube C.inv~ 40 42 47 45;41 44 46 43;13 21 29 37;14 22 30 38;15 23 31 39
F=: cube C.inv~ 16 18 23 21;17 20 22 19;5 24 42 15;6 27 41 12;7 29 40 10
B=: cube C.inv~ 32 34 39 37;33 36 38 35;2 8 45 31;1 11 46 28;0 13 47 26
S=: (,cube{inv~])L,R,F,B,U,:D
NB. rotations
crt=: 4 5 7 6 1 0 2 3,4 6 5 7 3 1 2 0,:5 6 7 4 1 2 3 0
mrt=: 0 1 5 4 2 3 6 7 11 10 8 9,2 3 1 0 4 5 8 9 7 6 10 11,:5 4 2 3 0 1 11 10 8 9 6 7
ert=: 5 4 6 7 0 1 3 2 9 10 11 8,8 9 11 10 5 6 7 4 2 3 1 0,:1 3 0 2 10 9 8 11 5 6 7 4
INV=: 0 3 2 1 12 15 14 13 8 11 10 9 4 7 6 5 48 51 50 49 60 63 62 61 56 59 58 57 52 55 54 53 32 35 34 33 44 47 46 45 40 43 42 41 36 39 38 37 16 19 18 17 28 31 30 29 24 27 26 25 20 23 22 21 NB. inverser indices
rot=: 1 : '{{/@:(x#~4 4 4&#:)'
alr=: 1 : '(x rot)"1 0&(i.64)' NB. all rotations
NB. movement helpers
dper=: ({~S({/@:{)~|.@:,) :. ({~S({/@:{)~12|6+,) NB. permute by index
rper=: dper ?@:($&12) NB. random permutation
sper=: (dper MOVS&i.) :. (dper inv MOVS&i.) NB. permute by string

NB. sets
G1=: L,R,(U{U),(D{D),F,:B
G2=: L,R,(U{U),(D{D),(F{F),:B{B
G3=: (L{L),(R{R),(U{U),(D{D),(F{F),:B{B
NB. indices
EDGE=: 3 9,17 6,4 25,33 1,19 12,20 27,22 41,35 28,38 46,36 11,43 14,:44 30
CORN=: 8 34 0,15 21 40,31 37 47,24 18 7,10 5 16,13 45 39,29 42 23,:26 2 32
LRSL=: 1  6  3 8{EDGE
UDSL=: 4  5  7 9{EDGE
FBSL=: 0 10 11 2{EDGE
NB. edge detection
stor=: f,b,u,d,l,r NB. stickers order
orie=: stor</"1@:i.EDGE&gface NB. orientation
NB. edge orientation
EMT=: 4 8$;:'L ffL fL Ruu Bl l ll rruu f F ff rrF ddff llfll llUll rF ffrff r Frf R bRB bbR ddrr rr llBll rrbrr ddbb b bb B lBL Rbr'
mte=: 1 0 i.~&> 4({.;}.)orie NB. movement table entry
mov=: sper(EMT{::~<@:mte)
PTA=: 3 3$0 0 0 1 _1 0 4 2 0 NB. power table
SEL=: 0,1 0 _1,:4 3 2 1 0
pow=: (](SEL{~0.5 1<@:*,)&(4<.+/)4&{.)@:-.@:orie
eor=: ('u' sper~ mov^:pow)^:(1-*./@:orie)^:_
NB. corner orientation
ctmi=: (;:'l ll L f ff F r rr R b bb B uu dd');@:{~11 12 13 21 22 23 31 32 33 41 42 43 51 52&i. NB. corners twist movement indices
CTMT=: ".L:0','splitstring"1'm'fread'./s2table' NB. corners twist movements table
twst=: 1 3 (e.~i.1:)"1 CORN&gface
coro=: (3 : 0)@:,:
 while. *./i=. ((LRSL gface cube)([:+./-.@:e.&:(/:~"1))UDSL&gface)"1 y do. y=. G1 ap y end.
 y=. ,:y{~i i. 0
 P=. >1{"1 CTMT
 while. (#y)=i=. 1 i.~ (#P)>j=. P i. twst"1 y do. y=. G3 ap y end.
 (i{y) sper inv ctmi 0{::CTMT{~i{j
)
NB. corner orbit
orbi=: (4#0 1)>:@:I.@:~:4<:CORN&pati
comi=: (;:'l ll L ff r rr R bb uu dd');@:{~<:
COMT=: ".L:0'|'&splitstring"1'm'fread'./s3table' NB. corners orbit movement table
ECMT=: 'm'fread'./s4table'
pars=: C.&(i.8)S:1@:(<:@:".L:0)@:(';'&splitstring&.>)@:(','&splitstring)
COAC=: {"1&pars/ 2{.ECMT NB. corner orbits and cosets
EDAM=: _70(".L:0)\','&splitstring"1]2}.ECMT NB. edge and movements
EDOR=: 0 10 2 11 9 4 5 7 1 6 8 3{EDGE
perm=: (,"2 COAC{CORN)&((,CORN)}"1)
cig3=: (4#0 1)-:4&<:
orbo=: 3 : 0
 NB. i=. 1 i.~ (#COMT)>j=. (COMT get <)"1 (crt alr)&.:<: orbi y
 NB. y=. y sper MOVS{~(i{INV)(mrt rot)~MOVS i. comi 1{::COMT{~i{j
 E=. EDAM{~1 i.~ COAC cig3"1@:{ C.(crt rot)&i L:0 C.CORN pati y
 NB. k=. E get <10#./:~>:i(ert rot)~(EDOR{~0 1 2 3(ert rot)i)i.~&:(/:~"1)EDOR{y
 NB. y sper inv MOVS{~(i{INV)(mrt rot)~MOVS i. comi 1{::k{E
)

test=: cube sper inv 'flRddbbuffddlRfrrfbbrBrrbrbLuuRuuddrrddLfflddLllrrbbrrffrrdduubbuurruurruu'
cube1=: coro eor test
y=: test sper 'flRddbbuffddlRfrrfbbrBrrbrbLuu'