NB. rubik's cube solver
NB. thistlethwaite method
require'viewmat'
NB. cube representation and helper verbs
cube=: i.48
face=: <.@%&8
'u l f r b d'=: i.6
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
M=: (,cube{inv~])L,R,F,B,U,:D
NB. movement helpers
dper=: ({~M({/@:{)~|.@:,) :. ({~M({/@:{)~12|6+,) NB. permutate by index
rper=: dper ?@:($&12) NB. random permutation
sper=: (dper 'lrfbudLRFBUD'&i.) :. (dper inv 'lrfbudLRFBUD'&i.) NB. permutate by string
NB. edge detection
EDGE=: 3 9,17 6,4 25,33 1,19 12,20 27,22 41,35 28,38 46,36 11,43 14,:44 30
stor=: f,b,u,d,l,r NB. stickers order
orie=: stor</"1@:i.EDGE&(face@:{) NB. orientation
NB. edge orientation
EMT=: 4 8$;:'L ffL fL Ruu Bl l ll rruu f F ff rrF ddff llfll llUll rF ffrff r Frf R bRB bbR ddrr rr llBll rrbrr ddbb b bb B lBL Rbr'
mte=: 1 0 i.~&> 4({.;}.)orie NB. movement table entry
mov=: sper(EMT{::~<@:mte)
PTA=: 3 3$0 0 0 1 _1 0 4 2 0 NB. power table
sel=: 0,1 0 _1,:4 3 2 1 0
pow=: (](sel{~0.5 1<@:*,)&(4<.+/)4&{.)@:-.@:orie
eor=: ('u' sper~ mov^:pow)^:(1-*./@:orie)^:_
NB. corner orientation
itom=: (;:'l ll L f ff F r rr R b bb B uu dd');@:{~11 12 13 21 22 23 31 32 33 41 42 43 51 52&i. NB. index to movement
COMT=: ".each','splitstring"1'm'fread'./s2table' NB. corners movements table
COMT=: itom L:0 (<a:;0){COMT
CORN=: 8 34 0,15 21 40,31 37 47,24 18 7,10 5 16,13 45 39,29 42 23,:26 2 32
twst=: 1 3 (e.~i.1:)"1 face@:(CORN&{)
coro=: 3 : 0
 y=. ,:y
 while. -.*./0=twst {.y do.
  P=. ,/COMT(sper inv)&>~/<"1 y
  y=. P #~(=>./)(0+/@:=twst)"1 P
 end.{.y
)
NB. corner orbit
orbi=: cube&((4#0 1)~:4<:i.&(face@:(CORN&{))) NB. out of orbit corners
xx=: {~5 6 7 4 1 2 3 0
yy=: {~4 6 5 7 3 1 2 0
zz=: {~5 4 6 7 0 1 3 2
EDMT=: ".each'|'&splitstring"1'm'fread'./s3table'
EVRO=: (],{~)&.>/@:(zz;yy;xx;,:)@:<:S:0 {."1 EDMT NB. every rotation
MOVS=: ;:'- l ll L ff r rr R bb uu dd'
orbo=: 3 : 'y sper MOVS;@:{~1{::EDMT{~(1:i.~8&>)EVRO(i.~S:0~)I.@:orbi y'
ALPH=: a:;(0 3;5 7);(1 3;4 7);(<0 1);(<0 3);<<1 3
BETA=: a:;(0 7;1 6);<<0 4
PERM=: ,,&>/L:2 {ALPH,&<BETA
gcos=: 3 : '((4#0 1)=4<:(face CORN{cube)&i.)"2 face (CORN{y) C.~S:0 PERM' NB. which coset lies on
