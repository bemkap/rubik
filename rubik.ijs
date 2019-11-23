NB. rubik's cube solver
NB. ortega/jelinek method: http://rubikscube.info/ortega.php
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
NB. stage 1: top corners
NB. ECI=: 0 8 34,2 26 32,5 10 16,7 18 24,13 39 45,15 21 40,23 29 42,:31 37 47 NB. every corner indices
BCI=: 15 21 40,23 29 42,31 37 47,:13 39 45 NB. bottom corners indices
TCI=: 5 7 2 0 NB. top face corner indices
USC=: 8 10 16 18 24 26 32 34 NB. up slice corners on cube
BTM=: 4 3$;:'DFdf dlDL lDLFddf DRdr dfDF RdrfddF dBDb drDR rDRBddb dbDB DLdl LdlbddB' NB. bottom to top movements
TTM=: ;:'bDB Fdf lDL Rdr fDF Bdb rDR Ldl' NB. top to top movements
stage1=: 3 : 0
 while. 3<f=.1 i.~ 0 +./@:="1 face BCI{y do.
  I=. 1 i.~ 0=face USC{y
  if. 7<I do. y return. else. y=. y sper I{::TTM end.
 end.
 t=. 1 i.~ 0<face TCI{y
 y=. y sper 'd'#~4|t-f
 o=. 0 I.@:= t{face BCI{y
 y sper o{::t{BTM
)
NB. stage 2: bottom corners
BCP=:13 31 40 42;13 23 40 47;13 21 42;15 23 47;13 21 23 31;37 39 40 42;21 23 37 39 NB. bottom corners patters
BCM=: ;:'ldLDFDf fLFDLdl ldLdlddL LDlDLddL ldllFlldL LFDfdl llddLddll' NB. bottom corners movements
mbp=: 1:i.~BCP&((5*./@:=face@:{)S:0) NB. match bottom pattern
stage2=: sper(BCM{::~({~(i.&1))@:(7>mbp"1)@:(sper&'d'^:0 1 2 3))
NB. stage 3: rest of the corners
MCI=: 8 10,16 18,24 26,32 34,13 15,21 23,29 31,:37 39 NB. middle corners indices
MCP=: (3 4 5 6 7;4 5 6 7;3 7;3;7)({L:0)MCI NB. middle corners patterns
mmp=: 1:i.~MCP&(*./@:(=/"1)@:face@:{S:0) NB. match middle pattern
MCM=: ;:'rUrffRurffrr ffUrURuffuruR rruffuurrurr RuRbbrUr rUfuuFuR rrffrr' NB. middle corners movements
stage3=: 3 : 0
 M=. <./I=. mmp"1 y=. ,/sper&'u'^:0 1 2 3"1 sper&'d'^:0 1 2 3 y
 (y{~I i. M) sper M{::MCM
)
NB. stage 4: e slice
ESI=: 12 19 20 27 28 35 36 11 9 14 17 22 25 30 33 38 41 46
TEI=: 3 6 4 1
ESM=: ;:'uuRuDf ubUdL uBUdr lUdF LuDb UfUdR uFuDL uurUdB'
stage4=: 3 : 0
 y=. y sper 'u'#~1 i.~ 0<face TEI{y
 y sper ESM{::~1 i.~ 0=face ESI{y
)