load'cubie.ijs coord.ijs'

NB. TwistMoveTable
TMT=: 3#.CPc(({~{.)(3|+)(1{]))"1 2/~(,(3|3-+/))"1]3 #.inv i.3^7
NB. FlipMoveTable
FMT=: 2#.EPc(({~{.)(2|+)(1{]))"1 2/~(,(2|2-+/))"1]2 #.inv i.2^11
NB. FlipUDSliceMoveTable
FUDMT=: (3 : 0)''
 if. _1=f=. fread'flipUDSlice.move' do.
  RFU&fudc1"2 EPc ecp"2/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
 else.
  64430 27$_4(256#.|.)\a.i.f
 end.
)
NB. UDSliceSortedMoveTable
UDSMT=: udc2"1({."2 EPc){"1~/~udc2 inv"0 i.11880
NB. CornPermMoveTable
CPMT=: _1 x: A."1({."2 CPc){"1~/~(i.8)A.~i.!8
NB. GetCorn8PermTable
GC8PT=: 

NB. udc2@:{."2 (ESYM{~16{.ISYM)ecp~"2(16{.ESYM)ecp"2/(udc2 inv,:0:)"0 i.24