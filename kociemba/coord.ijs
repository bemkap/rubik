load'cubie.ijs'

ccubcor=: ((!i. 8)+/@:*(}:+/@:>{:)\@:{.),3#.}:@:{:
ecubcor=: ((!i.12)+/@:*(}:+/@:>{:)\@:{.),2#.}:@:{:

ccorcubp=: 3 : '}:|.>r&.>/(;/!i. 8),<{.y'
ccorcubo=: (,(3|3-+/))@:{:

ecorcubp=: 3 : '}:|.>r&.>/(;/!i.12),<{.y'
ecorcubo=: (,(2|2-+/))@:{:

ccorcub=: ccorcubp,:ccorcubo
ecorcub=: ecorcubp,:ecorcubo

f=: 3 : 0
 i=. i.8
 for_j. |.y do.
 

r=: 4 : 0
 a=. x<.@%~{.y
 ((}.y),a),~({.y)-a*x
)