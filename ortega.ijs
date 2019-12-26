NB. rubik's cube solver
NB. ortega/jelinek method: http://rubikscube.info/ortega.php
load'./rubik.ijs'
NB. stage 1: corner positions
st1=: 3 : 0
 m=. ,.i.6
 while. 1 do.
  if. +./i=. 47 45 42 40&(5 *./@:= gface)"1 z=. y (ALL dper)"1 m do. break. end.
  m=. (#~_2&(~:/@:{.)"1),/m&,."0 i.6
 end.z{~i i. 1
)
NB. stage 2: corner orientation
COM=: ;:'ruRUFuf fRFURur ruRuruuR RUrURuur rurrFrruR RFUfur rruuRuurr' NB. corner orientation movements
COP=: |:5 7 8 26,0 7 16 26,5 18 26 34,0 16 24 32,8 16 18 26,5 7 32 34,:16 18 32 34 NB. corner orientation patterns
st2=: 3 : 0
 m=. (0*./ .=COP&gface)"1 z=. sper&'u'^:0 1 2 3 y
 y=. z{~j=. 1 i.~ +./"1 m
 y=. y sper COM{::~1 i.~ j{m
)
NB. stage 3: corner permutation
CPM=: ;:'rrffrr rUfuuFuR RuRbbrUr rruffuurrurr ffUrURuffuruR rUrffRurffrr'
CPP=: 0,1,16,17,15,31
UDS=: 8 10,16 18,24 26,32 34,13 15,21 23,29 31,:37 39 NB. up and down line
st3=: 3 : 0
 i=. UDS&(2#.=/"1@:gface)"1 sper&'u'^:0 1 2 3 y
 j=. 1 i.~ CPP e.~ i=. UDS&(2#.=/"1@:gface)"1 z=. sper&'u'^:0 1 2 3 y
 (j{z) sper CPM{::~CPP i. j{i
)
NB. sper&'d'^:(2~:21&gface)^:_ sper&'u'^:(2~:16&gface)^:_ 
NB. stage 4: 3 top edges
TEM=: ;:'beeBlEL - feFleeL reREleeL elEL '

NB. NB. stage 3: rest of the corners
NB. MCI=: 8 10,16 18,24 26,32 34,13 15,21 23,29 31,:37 39 NB. middle corners indices
NB. MCP=: (3 4 5 6 7;4 5 6 7;3 7;3;7)({L:0)MCI NB. middle corners patterns
NB. mmp=: 1:i.~MCP&(*./@:(=/"1)@:face@:{S:0) NB. match middle pattern
NB. MCM=: ;:'rUrffRurffrr ffUrURuffuruR rruffuurrurr RuRbbrUr rUfuuFuR rrffrr' NB. middle corners movements
NB. stage3=: 3 : 0
NB.  M=. <./I=. mmp"1 y=. ,/sper&'u'^:0 1 2 3"1 sper&'d'^:0 1 2 3 y
NB.  (y{~I i. M) sper M{::MCM
NB. )
NB. NB. stage 4: e slice
NB. ESI=: 12 19 20 27 28 35 36 11 9 14 17 22 25 30 33 38 41 46
NB. TEI=: 3 6 4 1
NB. ESM=: ;:'uuRuDf ubUdL uBUdr lUdF LuDb UfUdR uFuDL uurUdB'
NB. stage4=: 3 : 0
NB.  y=. y sper 'u'#~1 i.~ 0<face TEI{y
NB.  y sper ESM{::~1 i.~ 0=face ESI{y
NB. )