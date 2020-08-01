load'cubie.ijs'

NB. corner orientation table
COT=: 3#.CPc(({~{.)(3|+)(1{]))"1 2/~(,(3|3-+/))"1]3 #.inv i.3^7
NB. edge orientation table
EOT=: 2#.EPc(({~{.)(2|+)(1{]))"1 2/~(,(2|2-+/))"1]2 #.inv i.2^11
NB. corner permutation table
NB. cpt=: A."1({."2 CPc){"2 1/(i.8)A.~i.!8
NB. flip udslice to raw flip udslice
RFU=: _4(256#.|.)\a.i.fread'RawFlipSlice'
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
NB. udslice move table
UDMT=: 3 : 0 NB.RFU&fudc1"2 EPc ecp"2/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
 R=. 0$0
 for_i. RFU do.
  c=. udc1 inv i%2048
  c=. c,:eoc inv 2048|i
  for_m. EPc do.
   R=. R,RFU fudc1 c ecp m
  end.R
 end.
)