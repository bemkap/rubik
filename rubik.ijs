NB. cube representation and helper verbs
require'viewmat'
cube =: i.48
face =: <.@%&8
'u l f r b d'=: i.6
MOVS =: 'lrfbudxyzmesLRFBUDXYZMES'
gface=: face@:{
pate =: 4 : '*./cube e.&(/:~"1@:(x&gface)) y'
pati =: 4 : 'cube i.&(/:~"1@:(x&gface)) y'
NB. graphical view of the cube
COLORS =: 0 0 0,255 128 0,0 0 255,255 0 0,255 255 0,255 255 255,:0 255 0
HUE1   =: 0 4 2 3 6 1 5{COLORS NB. standard
HUE2   =: 0 1 6 5 2 4 3{COLORS NB. simulator
display=: 3 : 0
 HUE1 display y
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
NB. rotations
X =: (1 17 41 38;6 22 46 33)C.L {inv R
Y =: (11 19 27 35;12 20 28 36)C.D {inv U
Z =: (4 30 43 9;3 25 44 14)C.F {inv B
RI=: ,&.>/S:1 {(<a:,0;0 0;0 0 0;1;1 1 1),(<a:,2;2 2;2 2 2)
AR=: X,Y,:Z
NB. reflections
LR=: cube C.~ ;/<:11 25,13 28,16 30,10 26,15 31,9 27,12 29,:14 32
UD=: cube C.~ ;/<:1 46,2 47,3 48,4 44,5 45,6 41,7 42,:8 43
FB=: cube C.~ ;/<:17 35,18 34,19 33,20 37,21 36,22 40,23 39,:24 38
TI=: ,L:0 a:,2;1;1 2;0;0 2;0 1;0 1 2
AT=: LR,UD,:FB
NB.
ap=: {/@:{L:0
NB. movement helpers
ALL =: (,cube{inv~])L,R,F,B,U,D,X,Y,Z,LR,UD,:FB
dper=: 1 : '({~m({/@:{)~|.@:,) :. ({~m({/@:{)~24|12+,)' NB. permute by index
rper=: (ALL dper) ?@:($&12) NB. random permutation
sper=: ((ALL dper)MOVS&i.) :. ((ALL dper)inv MOVS&i.) NB. permute by string
NB. indices
EDGE=: 3 9,17 6,4 25,33 1,19 12,20 27,22 41,35 28,38 46,36 11,43 14,:44 30
CORN=: 8 34 0,15 21 40,31 37 47,24 18 7,10 5 16,13 45 39,29 42 23,:26 2 32
LRSL=: 1  6  3 8{EDGE
UDSL=: 4  5  7 9{EDGE
FBSL=: 0 10 11 2{EDGE