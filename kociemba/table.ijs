load'cubie.ijs coord.ijs'
NB. NB. TwistMoveTable
TMT=: (3#.{:)"2 ccp&CPc"2 otc 3 #.inv i.3^7
NB. FlipMoveTable
FMT=: (2#.{:)"2 ecp&EPc"2 ote 2 #.inv i.2^11
NB. NB. FlipUDSliceMoveTable
FUDMT=: (3 : 0)''
 if. _1=f=. fread'flipUDslice.move' do.
  RFU&fudc1"2 EPc ecp"2/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
 else.
  64430 27$_4(256#.|.)\a.i.f
 end.
)
NB. NB. UDSliceSortedMoveTable
UDSMT=: udc2"1({."2 EPc){"1~/~udc2 inv"0 i.11880
NB. NB. CornPermMoveTable
CPMT=: _1 x: A."1({."2 CPc){"1~/~(i.8)A.~i.!8
NB. NB. GetCorn8PermTable
NB. x1=: 3 : '(1=*/4{.1(4{.y)}8$0){_1,*`+/1 2 3(,@:,.)}.(}:+/@:>{:)\4{.y'
NB. x2=: [:]`_1:@.(12&=)4 5 i.~ (10#.inv 45 46 47 54 56 57 64 65 67 74 75 76)&{
NB. GC8PT=: ((_1+./@:=]){288,~12&#.)@:(x1,x2)"1 cpc inv"0 i.!8
NB. NB. Edge8PermMoveTable
NB. E8PMT=: epc2"1@:(((0 3&{(0 3)}{~"1){."2 EPc)&{)@:(epc2 inv)"0 i.!8
NB. NB. CentOriMoveTable
NB. COMT=: moc@:{:"2 MPc mcp"2~/~ (0,:~moc inv)"0 i.4^6
NB. NB. CentOriRFLBMod2MoveTable
NB. COR2MT=: mor2c@:{:"2 MPc mcp"2~/~ ((i.6),:mor2c inv)"0 i.16
NB. NB. RFLBCentOriParityTable
NB. CROPT=: (0~:4|5 4 2 1+/@:{moc inv)"0 i.4^6
NB. NB. UDSliceParityTable
NB. UDPT=: 2|+/"1(}:+/@:<{:)\"1(_4{.udc2 inv)"0 i.24
NB. NB. UDSliceMoveTable
NB. UDMT=: udc1@:{."2 EPc ecp"2~/~ (0,:~udc1 inv)"0 i.495