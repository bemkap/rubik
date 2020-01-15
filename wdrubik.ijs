load'~temp/rubik/rubik.ijs gl2'
coinsert'jgl2'
NB. ALGORITHMS=: 'b'fread'~temp/rubik/cmll' NB. cmll
NB. ALGORITHMS=: ;/'umUM'{~?30 30$4 NB. eolr
ALGORITHMS=: ;/({~5 40?@:$#)'lrfbudLRFBUD'
B=: K=: 0$A=: ({~?~@:#)ALGORITHMS
HUE=: 0 255 0,255 128 0,255 255 0,255 0 0,255 255 255,:0 0 255
win_run=: 3 : 0
wd'pc win closeok;pn "lubikio";'
wd'minwh 240 145;cc grph isigraph;'
wd'minwh 240  30;cc movs static;cn "";'
wd'pshow;'
)
FC0=: ,"2] 75  5+"1]15*(,/0 1 2,.~"0 1|.3]\i.5)+"1/1 2 1 0,.0 0 1 1
FC1=: ,"2] 30 50+"1]15*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
FC2=: ,"2] 75 50+"1]15*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
FC3=: ,"2]120  5+"1]15*(,/0 1 2 ,."1|."1]3]\i.5)+"1/0 1 1 0,.1 0 1 2
FC4=: ,"2]165  5+"1]15*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
FC5=: ,"2] 75 95+"1]15*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
CPC=: FC0,FC1,FC2,FC3,FC4,FC5
win_grph_paint=: 3 : 0
 try.
  glfill 255 255 255 196
  c=. ,4&({.,(i.6),}.)&.|:face 6 8$(cube sper inv>{.A) sper B
  for_i. i.#CPC do.
   glrgb HUE{~i{c
   glbrush 1
   glpolygon i{CPC
  end.
 catch. return. end.
)
win_grph_char=: 3 : 0
 if. 239 160 131-:a.i.sysdata do. B=: }:B 
 elseif. sysdata-:,'n' do. smoutput B=: K=: 0$A=: 1|.A
 elseif. 1 do.
  K=: _2{.K,sysdata
  I=. K i.~ _2]\'97137139842479311793862628468264'
  if. I<16 do. K=: 0$B=: B,I{'udlrbfUDLRBFMEme' end.
 end.
 wd'set movs text ',B
 glpaint''
)
win_run''