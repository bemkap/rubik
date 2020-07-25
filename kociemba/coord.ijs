load'cubie.ijs'

ccubcor=: ((!i. 8)+/@:*(}:+/@:>{:)\@:{.),3#.}:@:{:
ecubcor=: ((!i.12)+/@:*(}:+/@:>{:)\@:{.),2#.}:@:{:

r=: 4 : 0
 a=. x<.@%~{.y
 ((}.y),a),~({.y)-a*x
)

corcubp=. 4 : '|.(i.x)C.~(;/_1-a)+&.>-@:i.&.>;/(i.x)>:@-a=. }:|.>r&.>/;/(!i.x),y'
corcubo=. 4 : '(,(x|x-+/))x #.inv y'

ccorcub=: (8 corcubp 0&{),(3 corcubo 1&{)
ecorcub=: (12 corcubp 0&{),(2 corcubo 1&{),:(2 corcubo 2&{)
