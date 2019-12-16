NB. cube representation and helper verbs
cube =: i.48
face =: <.@%&8
ap   =: [:~.[:,/{"1/
'u l f r b d'=: i.6
MOVS =: 'lrfbudLRFBUD'
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
S=: (,cube{inv~])L,R,F,B,U,:D
NB. movement helpers
dper=: 1 : '({~m({/@:{)~|.@:,) :. ({~m({/@:{)~12|6+,)' NB. permute by index
rper=: (S dper) ?@:($&12) NB. random permutation
sper=: ((S dper)MOVS&i.) :. ((S dper)inv MOVS&i.) NB. permute by string
NB. indices
EDGE=: 3 9,17 6,4 25,33 1,19 12,20 27,22 41,35 28,38 46,36 11,43 14,:44 30
CORN=: 8 34 0,15 21 40,31 37 47,24 18 7,10 5 16,13 45 39,29 42 23,:26 2 32
LRSL=: 1  6  3 8{EDGE
UDSL=: 4  5  7 9{EDGE
FBSL=: 0 10 11 2{EDGE