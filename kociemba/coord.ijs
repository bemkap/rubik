load'defs.ijs'
NB. CentOriRFLBMod2Coord
mor2c=: (2#.2|5 4 2 1&{) :. ((6$0)(5 4 2 1)}~(4#2)&#:)
NB. CentOriCoord
moc=: 4&#. :. ((6#4)&#:)
NB. CornOriCoord
coc=: (3#.}:) :. ((,3|3-+/)@:((7#3)&#:))
NB. EdgeOriCoord
eoc=: (2#.}:) :. ((,2|2-+/)@:((11#2)&#:))
NB. phase 1 UDSliceCoord
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
NB. UDSliceSortedCoord
P=: 0 6 2 12 8 14 1 7 4 18 10 20 3 13 5 19 16 22 9 15 11 21 17 23
udc2j=: 24#.udc1,P{~A.@:((#~8&<:)-8:)
udc2i=: (8 9 10 11 A.~ P i. 24&|)[`(8 9 10 11 i.~])`]}udc1 inv@:(24<.@%~])
udc2=: udc2j :. udc2i
NB. UDSliceSortedSymCoord

NB. FlipUDSliceCoord
fudc1=: 4 : 0
 c=. udc1 inv udc1 {.y
 c=. c,:eoc inv eoc {:y
 for_k. i.16 do.
  d=. (k{ESYM) ecp c ecp ESYM{~k{ISYM
  e=. fudrcc n=. 2048#.(udc1{.d),eoc{:d
  if. e~:_1 do. k+4 SHL e return. end.
 end.
)
NB. CentPermCoord

NB. CornPermCoord
cpcj=: (!i.8)+/@:*(}:+/@:>{:)\
cpci=: 3 : 0
 a=. }.>(((|,<.@:%~){.),}.@:])&.>/(!i.8);/@:,y
 |.(i.8)C.~((_1-a)([-i.@>:@-)&.>&(;/)(->:i.8))
)
cpc=: cpcj :. cpci
NB. Phase1EdgePermCoord
epc1j=: (!i.12)+/@:*(}:+/@:>{:)\
epc1i=: 3 : 0
 a=. }.>(((|,<.@:%~){.),}.@:])&.>/(!i.12);/@:,y
 |.(i.12)C.~((_1-a)([-i.@>:@-)&.>&(;/)(->:i.12))
)
epc1=: epcj :. epci
NB. Phase2EdgePermCoord
epc2=: cpcj@:(8&{.) :. (9 10 11 12,~cpci)
NB. FlipUDSliceRawCoordClassIndex
fudrcc=: 3 : 0
 if. y<{:RFU do.
  i=. (<.@-:@+/(,~{.)`(,{:)@.(y>RFU{~[)])^:_]0 64430
  (i,_1){~1 i.~ y=i{RFU
 else. _1 end.
)
NB. UDSliceSortedRawCoordClassIndex

NB. TetraCoord

NB. FlipUDSliceToRawFlipUDSliceTable
RFU=: _4(256#.|.)\a.i.fread'RawFlipSlice'
NB. SymUDSliceSortedToUDSliceSortedTable

NB. CreateSymCornPosToCornPosTable