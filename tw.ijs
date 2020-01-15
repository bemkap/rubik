load'~temp/rubik/rubik.ijs stats'
NB. phase 1: edge orientation
G0=: U,D,L,R,F,:B
stor=: f,b,u,d,l,r
orie=: stor </@:|:@:i. EDGE&gface
P=: >,&.>/0 2 4 6 8 10 12<@:((12$0) 1:`]`[}"_ 1 comb)"0]12
move1=: (#:0 0 0 0 3840 43)~:363284072 1138449 11299680 167190 43908480 527&A.
gen1=: 4 : 0
 lst=. (2047#a:),<'I'
 while. 0<+/a:=lst do.
  fst=. {.y
  rst=. move1 fst
  tal=. a:=lst{~P i. rst
  rst=. tal#rst
  mov=. tal#'lrfbud'
  for_i. i.#rst do. lst=. (<(lst{::~P i. fst),i{mov)(P i. i{rst)}lst end.
  y=. rst(,~}.)y
 end.x fwrite~''''([,],[)''';'''joinstring}.L:0 lst
)
T=: ".fread'T1'
ph1=: sper inv T{::~P i. orie
NB. phase 2: corner orientation
twst=: CORN&(1 3 <./@i.~"1 gface)
G1=: (U{U),(D{D),L,R,F,:B
pate=: 2 : 'x*./@:(e.~&:(/:~"1))y&{'
pati=: 2 : 'x(i. &:(/:~"1))y&{'
aply=: [:,/{"1/
ph2a=: 3 : 0
 for_p. >:i.4 do.
  z=. G1 appl^:p ,:y
  if. (6^p)>i=. i.&1 (LRSL pate UDSL)"1 z do. y (G1 dper) |.(p#6)#:i return. end.
 end.
 for_p. >:i.4 do.
  z=. G1 appl ,:y
  if. (6^p)>i=. i.&1 ((4{.EDGE) pate UDSL)"1 z do. y (G1 dper) |.(p#6)#:i return. end.
 end.
)
move2=: 3|((8#3)#:0 0 1650 1550 0 0)+28368 712 3770 36541 15981 722&A.