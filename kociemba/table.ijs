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
rfu=: (3 : 0)''
 RFU=. oc=. 126720$0
 cidx=. 0
 for_i. i.495 do.
  c=. udc1^:_1 i
  for_j. i.256 do.
   bo=. 256#.i,j
   for_k. i.8 do.
    if. 0=(bo{oc)(17 b.)2^k do.
     c=. eoc^:_1 k+j^3
     RFU=. RFU(cidx})k+bo^3
     cidx=. >:cidx
     for_sym. i.16 do.
      p=. ((ESYM{~sym{ISYM) ecp c) ecp sym{ISYM
      n=. +/2048 1*(udc1,eoc)p
     end.
    end.
   end.
  end.
 end.      
)