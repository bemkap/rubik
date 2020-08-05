NB. load'cubie.ijs coord.ijs'

NB. NB. NB. TwistMoveTable
NB. TMT=: 3#.CPc(({~{.)(3|+)(1{]))"1 2/~(,(3|3-+/))"1]3 #.inv i.3^7
NB. NB. NB. FlipMoveTable
NB. FMT=: 2#.EPc(({~{.)(2|+)(1{]))"1 2/~(,(2|2-+/))"1]2 #.inv i.2^11
NB. NB. NB. FlipUDSliceMoveTable
NB. FUDMT=: (3 : 0)''
NB.  if. _1=f=. fread'flipUDSlice.move' do.
NB.   RFU&fudc1"2 EPc ecp"2/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
NB.  else.
NB.   64430 27$_4(256#.|.)\a.i.f
NB.  end.
NB. )
NB. NB. NB. UDSliceSortedMoveTable
NB. UDSMT=: udc2"1({."2 EPc){"1~/~udc2 inv"0 i.11880
NB. NB. NB. CornPermMoveTable
NB. CPMT=: _1 x: A."1({."2 CPc){"1~/~(i.8)A.~i.!8
NB. NB. GetCorn8PermTable
NB. x1=: 3 : '(1=*/4{.1(4{.y)}8$0){_1,*`+/1 2 3(,@:,.)}.(}:+/@:>{:)\4{.y'
NB. x2=: [:]`_1:@.(12&=)4 5 i.~ (10#.inv 45 46 47 54 56 57 64 65 67 74 75 76)&{
NB. GC8PT=: ((_1+./@:=]){288,~12&#.)@:(x1,x2)"1 cpc inv"0 i.!8
NB. NB. Edge8PermMoveTable
NB. E8PMT=: epc2"1@:(((0 3&{(0 3)}{~"1){."2 EPc)&{)@:(epc2 inv)"0 i.!8
NB. NB. CentOriMoveTable
NB. COMT=:


NB. udc2@:{."2 (ESYM{~16{.ISYM)ecp~"2(16{.ESYM)ecp"2/(udc2 inv,:0:)"0 i.24