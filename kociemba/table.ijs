load'cubie.ijs coord.ijs'
CPc3=: ,/ccp"2/\3#,:CPc
EPc3=: ,/ecp"2/\3#,:EPc
MPc3=: ,/mcp"2/\3#,:MPc
twrite=: fwrite~a.{~(4#256),@:#:,
NB. TwistMoveTable
TMT=: (3#.{:)"2 ccp&CPc3"2 otc 3 #.inv i.3^7
NB. NB. FlipMoveTable
FMT=: (2#.{:)"2 ecp&EPc3"2 ote 2 #.inv i.2^11
NB. NB. NB. FlipUDSliceMoveTable
FUDMT=: (3 : 0)''
 if. _1=f=. fread'flipUDslice.move' do.  
  RFU&fudc1"2 EPc ecp/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
 else.
  64430 27$_4(256#.|.)\a.i.f
 end.
)
NB. UDSliceSortedMoveTable
UDSMT=: udc2"1({."2 EPc3){"1~/~udc2 inv"0 i.11880
NB. NB. CornPermMoveTable
CPMT=: (3 : 0)''
 if. _1=f=. fread'CornPerm.move' do.
  ({."2 CPc3)(_1 x: A.@:{)"1~/~(i.8)A.~i.!8
 else.
  40320 27$_4(256#.])\a.i.f
 end.
)
NB. GetCorn8PermTable
x1=: 3 : '(1=*/4{.1(4{.y)}8$0){_1,*`+/1 2 3(,@:,.)}.(}:+/@:>{:)\4{.y'
x2=: [:]`_1:@.(12&=)4 5 i.~ (10#.inv 45 46 47 54 56 57 64 65 67 74 75 76)&{
GC8PT=: ((_1+./@:=]){288,~12&#.)@:(x1,x2)"1 cpc inv"0 i.!8
NB. Edge8PermMoveTable
E8PMT=: epc2"1@:(((0 3&{(0 3)}{~"1){."2 EPc3)&{)@:(epc2 inv)"0 i.!8
NB. CentOriMoveTable
COMT=: moc@:{:"2 mcp&MPc3"2 otm moc inv"0 i.4^6
NB. CentOriRFLBMod2MoveTable
COR2MT=: mor2c@:{:"2 mcp&MPc3"2 otm mor2c inv"0 i.16
NB. RFLBCentOriParityTable
CROPT=: (0~:4|5 4 2 1+/@:{moc inv)"0 i.4^6
NB. UDSliceParityTable
UDPT=: 2|+/"1(}:+/@:<{:)\"1(_4{.udc2 inv)"0 i.24
NB. UDSliceMoveTable
UDMT=: udc1@:{."2 ecp&EPc3"2 pte udc1 inv"0 i.495