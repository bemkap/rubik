load'stats'

cpc=: (!i.8)+/@:*(}:+/@:>{:)\ NB. corner permutation coordinate
coc=: 3#.}: NB. corner orientation coordinate

epc=: (!i.12)+/@:*(}:+/@:>{:)\ NB. edge permutation coordinate
eoc=: (2#.}:) :. ((,(2|2-+/))@:((11#2)&#:)) NB. edge orientation coordinate

B=: <"1(i.4)nCr/i.12
udc1j=: [:+/@;B{~&.>(i.13)}.@:(<;._2)~(8&<:,1:) NB. udslice coordinate phase 1
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
fudc1=: 4 : 0
 c=. udc1 inv udc1 y
 c=. c,:eoc inv eoc y
 for_k. i.16 do.
  d=. (k{ESYM) ecp c ecp ESYM{~k{ISYM
  n=. 2048#.(udc1{.d),eoc{:d
 end.

 NB. c=. (udc1 inv@:udc1@:{.,:{:)y
 NB. i=. (_1&~:i.1:)d=. x{~(2048#.udc1@:{.,eoc@:{:)"2 c&apesym"0 i.16
 NB. i(+4&SHL)i{d
)
udc2=: 0: