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
T1=: ".fread'T1'
ph1=: sper inv T1{::~P i. orie
NB. phase 2: corner orientation
G1=: (U{U),(D{D),L,R,F,:B
twst=: CORN&(1 3 <./@i.~"1 gface)
pate=: 2 : 'x*./@:(e.~&:(/:~"1))y&{'
appl=: [:,/{"1/
ph2a=: 3 : 0
 z=. ~.(cube,G1) appl^:5 ,:y
 z{~i.&1 ((LRSL pate UDSL)"1,((4{.EDGE) pate UDSL)"1)z
)
T2=: ".&>'b'fread'T2'
M2=: ;:'l ll L f ff F r rr R b bb B uu dd'
SYM2=: >,/(RI ap ROT){&.>/TI ap REF
ph2b=: 3 : 0
 j=. i.&1 (#T2)>i=. (1 {::"1 T2) i. twst"1 S=. SYM2{y
 (j{SYM2){inv(j{S)sper inv;M2{~0{::T2{~j{i
)
ph2=: ph2b@:ph2a
NB. phase 3: corner orbit
oooc=: (4#0 1)~:4<:CORN&([i.{)
EDGE3=: 0 10 2 11 9 4 5 7 1 6 8 3{EDGE NB. phase 3 edge order
T3a=: ".&>'b'fread'T3a' NB. initial movement table
M3=: a:,;:'l ll L ff r rr R bb uu dd'
ph3a=: 3 : 0
 r=. i.&1 (#T3a)>c=. (>{."1 T3a)i.(>TIRO ap ROTC){oooc y
 i=. (i.24){inv~>(r{TIRO) ap ROTM
 y sper {&i&.(MOVS&i.);M3{~1{::T3a{~r{c
)
T3b=: {"1/>(i.8)C.~L:1 <:L:0 ".&>2{.F=. 'b'fread'T3b' NB. cosets table
T3c=: _70]\".&>2}.F NB. FBSL position table
T3d=: ".&>'b'fread'T3d' NB. corners of G3 table
ph3b=: 3 : 0
 c=. >,a C.&.>/ b C.&.> <i.8
 'r d'=. 8 18#:i.&1 e.&T3d ,/c{"_ 1(>TIRO ap ROTC){CORN([i.{)y

 NB. 'r d'=. 8 13#:i.&1 e.&T3d,/T3b{"_ 1(>TIRO ap ROTC){CORN([i.{)y
 NB. k=. <10#.>:/:~({&y i. 0 1 2 3&{)EDGE3{~>(r{TIRO) ap ROTE
 NB. i=. (i.24){inv~>(r{TIRO) ap ROTM
 NB. y sper inv {&i&.(MOVS&i.);M3{~1{::k((i.~{."1){])d{T3c
)
ph3=: ph3b@:ph3a
NB. phase 4: edges
G3=: {~"1 G0
EDGE4=: (<2 3)C.EDGE3 NB. phase 4 edge order
ph4=: 3 : 0
 y=. G3 appl^:((i.8)-.@:e.CORN([i.{)"_ 1])^:_ ,:y
 y=. y{~(i.8)i.~CORN&([i.{)"1 y
)

test=: ((12#1)-:orie),((8#0)-:twst),(LRSL pate LRSL),((8#0)-:oooc),(cube&-:)