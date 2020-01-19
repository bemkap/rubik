load'~temp/rubik/rubik.ijs stats'
Ex=: cube sper inv 'flRddbbuffddlRfrrfbbrBrrbrbLuuRuuddrrddLfflddLllrrbbrrffrrdduubbuurruurruu'
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
T2=: ".S:0 'b'fread'T2'
M2=: ;:'l ll L f ff F r rr R b bb B uu dd'
SYM2=: >,/(RI ap ROT){&.>/TI ap REF
ph2b=: 3 : 0
 j=. i.&1 (#T2)>i=. (1 {::"1 T2) i. twst"1 S=. SYM2{y
 (j{SYM2){inv(j{S)sper inv;M2{~0{::T2{~j{i
)
ph2=: ph2b@:ph2a
NB. phase 3: corner orbit
oooc=: (4#0 1)~:4<:CORN([i.{)]
SYM3=: >TIRO ap ROT
EDGE1=: 0 10 2 11 9 4 5 7 1 6 8 3{EDGE NB. method edge coordinates
T3a=: ".S:0 'b'fread'T3a'
M3=: a:,;:'l ll L ff r rr R bb uu dd'
ph3a=: 3 : 0
 j=. i.&1 (#T3a)>i=. (>{."1 T3a) i. oooc"1 S=. SYM3{y
 (j{SYM3){inv(j{S)sper;M3{~1{::T3a{~j{i
)
T3b=: {"1/>(i.8)C.~L:1 <:L:0 ".S:0]2{.F=. 'b'fread'T3b'
T3c=: _70]\".S:0]2}.F
ph3b=: 3 : 0
 j=. i.&1 +./"1 i=. ((4#0 1)-:4&<:)"1(T3b{CORN&([i.{))"1 S=. SYM3{y
 D=. T3c{~i.&1 j{i
 >:/:~FBSL i.~ EDGE{j{S
 NB. k=. ({."1 D) i. <>:10#./:~FBSL i.~ EDGE{j{S
)


test=: ((12#1)-:orie),((8#0)-:twst),(LRSL pate LRSL),((8#0)-:oooc)
