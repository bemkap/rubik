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
CPP=: 0 1 16 17 15 31
UDS=: 8 10,16 18,24 26,32 34,13 15,21 23,29 31,:37 39 NB. up and down line
st3=: 3 : 0
 i=. UDS&(2#.=/"1@:gface)"1 z=. ,/sper&'d'^:0 1 2 3"1 sper&'u'^:0 1 2 3 y
 y=. z{~j=. 1 i.~ 6>CPP i. i 
 y=. y sper CPM{::~j NB.CPP i. j{i
 sper&'d'^:(1~:13&gface)^:_ sper&'u'^:(1~:8&gface)^:_ y
)
NB. stage 4: 3 top edges
TEM=: ;:'UleLulEL - uleLUlEL uuleLuulEL leLEfflELff llellEfflELff LelEfflELff fflELff FelELf elEL felELF ffelELff RlELr lEL uureRuu rrlELrr BleeLb leeL bleeLB bbleeLbb '
FLAT=: ,1 9 17 25 33 41+/0 2 5 3
COMP=: ,FLAT ([-.~"0 1(1 i."1~ e."0 1/){])EDGE
st4 =: 4 : 0
 for_i. >:i.3 do.
  c=. i i.~ y gface~ COMP {~ g=. x I.@:= FLAT gface y
  y=. 'u' sper~ y sper TEM{::~c{g
 end.
)