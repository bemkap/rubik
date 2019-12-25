NB. rubik's cube solver
NB. ortega/jelinek method: http://rubikscube.info/ortega.php
load'./rubik.ijs'
NB. stage 1: top corners
BOT=: |:5 1 6 2{CORN NB. bottom corners
TOP=: |:0 4 3 7{CORN NB. top corners
BTM=: 4 4$;:'b UF uuR Rur ll F UR Ruur uuL ff R bUB bb Rff rr ubUB'
st1=: 3 : 0
 for_i. i.4 do.
  if. 4=j=. 1 i.~ 0+./ .=TOP gface y do. break. end.
  y=. y sper {&BTM&.< j,i
 end.
)
NB. stage 2: bottom corners


NB. BCP=:13 31 40 42;13 23 40 47;13 21 42;15 23 47;13 21 23 31;37 39 40 42;21 23 37 39 NB. bottom corners patters
NB. BCM=: ;:'ldLDFDf fLFDLdl ldLdlddL LDlDLddL ldllFlldL LFDfdl llddLddll' NB. bottom corners movements
NB. mbp=: 1:i.~BCP&((5*./@:=face@:{)S:0) NB. match bottom pattern
NB. stage2=: sper(BCM{::~({~(i.&1))@:(7>mbp"1)@:(sper&'d'^:0 1 2 3))
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