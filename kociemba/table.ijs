load'cubie.ijs'

NB. corner orientation table
cot=: 3#.CPc({.@:]{(+0&{))"1 2/~(,(3|3-+/))"1@:(3#.inv])i.3^7
NB. edge orientation table
eot=: 2#.EPc({.@:]{(+1&{))"1 2/~(,(2|2-+/))"1@:(2#.inv])i.2^11
NB. edge orientation a? table
eoat=: 2#.EPc({.@:]{(+2&{))"1 2/~(,(2|2-+/))"1@:(2#.inv])i.2^11
NB. corner permutation table
NB. cpt=: A."1({."2 CPc){"2 1/(i.8)A.~i.!8
NB. flip udslice to raw flip udslice
SHL=: 33 b.
rfu=: (3 : 0)''
 oc=. 126720$0
 RFU=. 64430$0
 cidx=. _1
 for_i. i.495 do.
  c=. udc1 inv i
  for_j. i.256 do.
   bo=. 256#.i,j
   for_k. (#~0=(bo{oc) AND SHL&1)i.8 do.
    p=. c,:eoc inv k+3 SHL j
    RFU=. RFU(cidx=. >:cidx)}~k+3 SHL bo
    n=. (2048#.udc1@:{.,eoc@:{:)"2(([ ecp"2 p ecp"2 ])&({&ESYM){&ISYM)i.16
    oc=. ((_3 SHL n) OR (n AND 7) SHL 1)(_3 SHL n)}oc
   end.
  end.
 end.
)