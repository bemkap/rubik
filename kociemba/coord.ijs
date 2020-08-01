load'stats'

NB. corner permutation coordinate
cpc=: (!i.8)+/@:*(}:+/@:>{:)\
NB. corner orientation coordinate
coc=: 3#.}:
NB. edge permutation coordinate
epc=: (!i.12)+/@:*(}:+/@:>{:)\
NB. edge orientation coordinate
eoc=: (2#.}:) :. ((,(2|2-+/))@:((11#2)&#:))
NB. flip udslice to raw flip udslice array
RFU=: _4(256#.|.)\a.i.fread'RawFlipSlice'
NB. udslice coordinate(phase 1)
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
NB. udslice sotred coordinate(phase 2)
udc2j=: 3 : '24#.(udc1 y),*`+/(#~1 2 3)(,@:,.);<@:(+/\.)@:({:<}:)\8-~(#~8&<:)y'
udc2i=: 3 : 0
 x=. 24|y
 
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