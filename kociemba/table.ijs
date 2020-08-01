load'cubie.ijs coord.ijs'

NB. TwistMoveTable
TMT=: 3#.CPc(({~{.)(3|+)(1{]))"1 2/~(,(3|3-+/))"1]3 #.inv i.3^7
NB. FlipMoveTable
FMT=: 2#.EPc(({~{.)(2|+)(1{]))"1 2/~(,(2|2-+/))"1]2 #.inv i.2^11
NB. FlipUDSliceMoveTable
FUDMT=: 64430 27$_4(256#.|.)\a.i.fread'flipUDSlice.move'
NB. FUDMT=: RFU&fudc1"2 EPc ecp"2/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
NB. UDSliceSortedMoveTable
UDSMT=: 0:
NB. CornPermMoveTable
CPMT=: A."1({."2 CPc){"2 1/(i.8)A.~i.!8