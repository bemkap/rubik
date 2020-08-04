load'defs.ijs'
NB. corner permutation coord
cpcj=: (!i.8)+/@:*(}:+/@:>{:)\
cpci=: 3 : 0
 a=. }.>(((|,<.@:%~){.),}.@:])&.>/(!i.8);/@:,y
 |.(i.8)C.~((_1-a)([-i.@>:@-)&.>&(;/)(->:i.8))
)
cpc=: cpcj :. cpci
NB. corner twist coord
coc=: (3#.}:) :. ((,3|3-+/)@:((7#3)&#:))
NB. edge permutation coord
epcj=: (!i.12)+/@:*(}:+/@:>{:)\
epci=: 3 : 0
 a=. }.>(((|,<.@:%~){.),}.@:])&.>/(!i.12);/@:,y
 |.(i.12)C.~((_1-a)([-i.@>:@-)&.>&(;/)(->:i.12))
)
epc=: epcj :. epci
NB. edge flip coord
eoc=: (2#.}:) :. ((,2|2-+/)@:((11#2)&#:))
NB. flip udslice to raw flip udslice array
RFU=: _4(256#.|.)\a.i.fread'RawFlipSlice'
NB. udslice coord(phase 1)
B=: <"1(i.4)nCr/i.12
udc1j=: [:+/@;B{~&.>(i.13)}.@:(<;._2)~(8&<:,1:)
udc1i=: 3 : 0
 b=. >B
 r=. 0$0
 while. #b do.
  if. y<{:{:b do. r=. r,1:b=. }:b
  else. r=. r,0:y=. y-{:{:b end.
  b=. }:"1 b
 end.(i.12)C.~(#~~:/&>)(8+i._4)<"1@:,.~12->:I.r
)
udc1=: udc1j :. udc1i
NB. flip udslice raw coord class
fudrcc=: 3 : 0
 if. y<{:RFU do.
  i=. (<.@-:@+/(,~{.)`(,{:)@.(y>RFU{~[)])^:_]0 64430
  (i,_1){~1 i.~ y=i{RFU
 else. _1 end.
)
NB. flip udslice coord
fudc1=: 4 : 0
 c=. udc1 inv udc1 {.y
 c=. c,:eoc inv eoc {:y
 for_k. i.16 do.
  d=. (k{ESYM) ecp c ecp ESYM{~k{ISYM
  e=. fudrcc n=. 2048#.(udc1{.d),eoc{:d
  if. e~:_1 do. k+4 SHL e return. end.
 end.
)
NB. udslice sotred coord(phase 2)
P=: 0 6 2 12 8 14 1 7 4 18 10 20 3 13 5 19 16 22 9 15 11 21 17 23
udc2j=: 24#.udc1,P{~A.@:((#~8&<:)-8:)
udc2i=: (8 9 10 11 A.~ P i. 24&|)[`(8 9 10 11 i.~])`]}udc1 inv@:(24<.@%~])
udc2=: udc2j :. udc2i

NB. rfu=: (3 : 0)''
NB.  RFU=. 0$oc=. 126720$0
NB.  for_i. i.495 do.
NB.   c=. udc1 inv i
NB.   for_j. i.256 do.
NB.    bo=. 256#.i,j
NB.    for_k. i.8 do.
NB.     if. 0=(bo{oc) AND k SHL 1 do.
NB.      p=. c,:eoc inv k+3 SHL j
NB.      RFU=. RFU,k+3 SHL bo
NB.      n=. (2048#.udc1@:{.,eoc@:{:)"2 p&apesym"0 i.16
NB.      oc=. ((oc{~_3 SHL n) OR (n AND 7) SHL 1)(_3 SHL n)}oc
NB.     end.
NB.    end.
NB.   end.
NB.  end.RFU
NB. )