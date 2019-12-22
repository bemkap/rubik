NB. rubik's cube solver
NB. ortega/jelinek method: http://rubikscube.info/ortega.php
load'./rubik.ijs'
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