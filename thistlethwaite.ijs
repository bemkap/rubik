NB. rubik's cube solver
NB. thistlethwaite method
require'viewmat'
NB. cube representation and helper verbs
cube=: i.48
face=: <.@%&8
ap=: [:~.[:,/{"1/
'u l f r b d'=: i.6
gface=: face@:{
pate=: 4 : '*./cube e.&(/:~"1@:(x&gface)) y'
pati=: 4 : 'cube i.&(/:~"1@:(x&gface)) y'
none=: 0&(*./@=)
NB. graphical view of the cube
COLORS=: 0 0 0,255 128 0,0 0 255,255 0 0,255 255 0,255 255 255,:0 255 0
HUE0=: 0 1 2 3 4 5 6{COLORS NB. mine
HUE1=: 0 4 2 3 6 1 5{COLORS NB. standard
HUE2=: 0 1 6 5 2 4 3{COLORS NB. simulator
display=: 3 : 0
 HUE0 display y
 :
 c=. 3 3$"1>:(5|."1(i.6),.4&(|."1))face 6 8$y
 c=. ,/(_3 0 _3(|."1)"0 2])1 1 0 0 0 1(,./;.1)c
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
NB. movement helpers
dper=: ({~S({/@:{)~|.@:,) :. ({~S({/@:{)~12|6+,) NB. permute by index
rper=: dper ?@:($&12) NB. random permutation
sper=: (dper 'lrfbudLRFBUD'&i.) :. (dper inv 'lrfbudLRFBUD'&i.) NB. permute by string

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
orbi=: cube&(((4#0 1)~:4<:i.)&(CORN&{))
comi=: (;:'l ll L ff r rr R bb uu dd');@:{~<:
COMT=: ".L:0'|'&splitstring"1'm'fread'./s3table' NB. corners orbit movement table
ALPH=: <:L:0 a:;(1 4;6 8);(2 4;5 8);(<1 2);(<1 4);<(<2 4)
BETA=: <:L:0 a:;(1 8;2 7);<<1 5
RABC=: (i.8)C.~S:1,,&>/L:2{ALPH,&<BETA
ECMT=: 'm'fread'./s4table'
pars=: C.&(i.8)S:1@:(<:@:".L:0)@:(';'&splitstring&.>)@:(','&splitstring)
COAC=: {"1&pars/ 2{.ECMT NB. corner orbits and cosets
EDAM=: _70(".L:0)\ ','&splitstring"1]2}.ECMT NB. edge and movements
oig3=: (4#0 1)-:4&<: NB. orbits in g3
orbo=: (3 : 0)@:,:
 while. (#y)=i=. 1 i.~ (#COMT)>j=. (({."1 COMT)i.<)@:>:@:I.@:orbi"1 y do. y=. G2 ap y end.
 y=. ,:(i{y) sper comi 1{::COMT{~i{j
 while. (#y)=i=. 1 i.~ (+./)@:(COAC oig3"1@:{ cube&(i.&(CORN&{)))"1 y do. y=. G3 ap y end.
 E=. EDAM{~1 i.~ (COAC oig3"1@:{ cube&(i.&(CORN&{)))i{y
)


NB. cube3=: coro cube2=: eor cube1=: cube rper 300
NB. test=: cube sper inv 'dbfuRLdllffddfllrrFRbrrBRBllbbuuluuffllffLbblbbLrruurrddffuubbddffbbllbbllbb'
test=: cube sper inv 'flRddbbuffddlRfrrfbbrBrrbrbLuuRuuddrrddLfflddLllrrbbrrffrrdduubbuurruurruu'