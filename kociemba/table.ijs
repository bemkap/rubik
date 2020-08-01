load'cubie.ijs'

NB. corner orientation table
COT=: 3#.CPc(({~{.)(3|+)(1{]))"1 2/~(,(3|3-+/))"1]3 #.inv i.3^7
NB. edge orientation table
EOT=: 2#.EPc(({~{.)(2|+)(1{]))"1 2/~(,(2|2-+/))"1]2 #.inv i.2^11
NB. corner permutation table
NB. cpt=: A."1({."2 CPc){"2 1/(i.8)A.~i.!8
NB. udslice move table
UDMT=: RFU&fudc1"2 EPc ecp"2/~2048(udc1 inv@:(<.@%~),:eoc inv@:|)"0 RFU
NB.  R=. 0$0
NB.  for_i. RFU do.
NB.   c=. udc1 inv i<.@%2048
NB.   c=. c,:eoc inv 2048|i
NB.   for_m. EPc do.
NB.    R=. R,RFU fudc1 c ecp m
NB.   end.R
NB.  end.
NB. )