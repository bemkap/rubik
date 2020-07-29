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

udc2=: 0:

NB. r=: 4 : 'a,~(}.y),~({.y)-x*a=. x<.@%~{.y'
NB. ccubiep=: 4 : '|.(i.x)C.~(;/_1-a)+&.>-@:i.&.>;/(i.x)>:@-a=. }:|.>r&.>/;/(!i.x),y'
NB. ccubieo=: 4 : '(,(x|x-+/))x #.inv y'
NB. ccubie=: _8{.&>(8 ccubiep 0&{);(3 ccubieo 1&{)
NB. ecubie=: _12{.&>(12 ccubiep 0&{);(2 ccubieo 1&{);(2 ccubieo 2&{)
