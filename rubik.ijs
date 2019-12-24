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
X   =: (1 17 41 38;6 22 46 33)C.L {inv R
Y   =: (11 19 27 35;12 20 28 36)C.D {inv U
Z   =: (4 30 43 9;3 25 44 14)C.F {inv B
RI  =: ,&.>/S:1 {(<a:,0;0 0;0 0 0;1;1 1 1),(<a:,2;2 2;2 2 2)
ROT =: X,Y,:Z
ROTC=: C.<:&.>(1 5 2 6;8 4 7 3),(1 5 4 8;6 2 7 3),:5 4 7 2;1 8 3 6
ROTE=: C.<:&.>(1 6 2 5;9 10 11 12;7 4 8 3),(5 7 6 8;2 10 4 11;1 9 3 12),:6 9 7 10;2 1 3 4;5 12 8 11
ROTM=: (i.24)C.~,.;/MOVS i. 'ubdf','lbrf',:'uldr'
TIRO=: RI#~+:/1 2 (2|+/@:=)S:0"0 1 RI NB. twist invariant rotation
NB. reflections
LR  =: C.10 24;12 27;15 29;9 25;14 30;8 26;11 28;13 31;0 2;3 4;5 7;16 18;19 20;21 23;40 42;43 44;45 47;32 34;35 36;37 39
UD  =: C.0 45;1 46;2 47;3 43;4 44;5 40;6 41;7 42;8 13;9 14;10 15;16 21;17 22;18 23;24 29;25 30;26 31;32 37;33 38;34 39
FB  =: C.16 34;17 33;18 32;19 36;20 35;21 39;22 38;23 37;0 5;1 6;2 7;24 26;27 28;29 31; 8 10;11 12;13 15;40 45;41 46;42 47
TI  =: ,L:0 a:,2;1;1 2;0;0 2;0 1;0 1 2
REF =: LR,UD,:FB
REFM=: (i.24)C.~_2 <\"1 MOVS i. 'fFbBuUdDlRrL','fFbBuDdUlLrR',:'fBbFuUdDlLrR'
TIRE=: a:,<,0 NB. twist invariant reflection
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