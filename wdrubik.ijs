load'~temp/rubik/rubik.ijs gl2'
coinsert'jgl2'
NB. ALGORITHMS=: 'b'fread'~temp/rubik/cmll' NB. cmll
ALGORITHMS=: ;/'umUM'{~?30 30$4 NB. eolr
AFTER=: K=: 0$BEFORE=: ({~?~@:#)ALGORITHMS
HUE=: 0 255 0,255 128 0,255 255 0,255 0 0,255 255 255,:0 0 255
win_run=: 3 : 0
 wd'pc win closeok;pn "lubikio";'
 wd'minwh 240 145;cc grph isigraph;'
 wd'minwh 240  30;cc movs static;cn "";'
 wd'pshow;'
)
scale=: 25
START=: 115
FC0=: ,"2  START                +"1 scale*,/(1.4 0.7 0,.0 0.7 1.4)+"1/(0 1 2,.0)+"1/0 0.7 1.7 1,.1 0.3 0.3 1
FC1=: ,"2 (START+scale*_3   2.4)+"1 scale*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
FC2=: ,"2 (START+scale* 0   2.4)+"1 scale*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
FC3=: ,"2 (START+scale* 3   1.7)+"1 scale*,/(0 0.7 1.4,.0 _0.7 _1.4)+"1/(0,.0 1 2)+"1/0 0.7 0.7 0,.0.7 0 1 1.7
FC4=: ,"2 (START+scale* 5.1 0.3)+"1 scale*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
FC5=: ,"2 (START+scale* 0   5.4)+"1 scale*(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
Q=: +.r.1r8p1+2r8p1*i.8
P=: ((%:2)*>./Q)*"1+.r.1r4p1+2r4p1*i.4
FC0=: <.START+180*,"2]2(,&0)\(,{.)Q
FC1=: <.START+100*,"2]2(,&0)\(,{.)0 8 1 2 9 3 4 10 5 6 11 7{Q,P
FC2=: <.START+ 80*,"2]2(,&0)\(,{.)0 8 1 2 9 3 4 10 5 6 11 7{Q,P
FC3=: <.START+ 60*,"2]2(,&0)\(,{.)0 8 1 2 9 3 4 10 5 6 11 7{Q,P
FC4=: <.START+ 40*,"2]2(,&0)\(,{.)Q
NB. FC4=: <.250+ 25*_1.5+,"2(|."1>,{;~i.3)+"1/0 1 1 0,.0 0 1 1
CPC=: FC0,FC1,FC2,FC3,FC4
win_grph_paint=: 3 : 0
 per=. 33 34 36 39 38 37 35 32 2 28 26 31 47 46 45 13 11 8 0 1 4 25 _ 30 44 _ 43 14 _ 9 4 _ 7 24 27 29 42 41 40 15 12 10 5 6 16 17 18 19 20 21 22 23
 per=. 33 34 36 39 38 37 35 32 2 28 26 31 47 46 45 13 11 8 0 1 4 25 0 30 44 0 43 14 0 9 4 0 7 24 27 29 42 41 40 15 12 10 5 6 16 17 18 19 20 21 22 23
 cub=. face per{cube NB.(cube sper inv>{.BEFORE) sper AFTER
 glclip 0 0 232 232
 glfill 255 255 255 196
 try.
  for_i. i.#CPC do.
   glrgb HUE{~i{cub
   glbrush''
   glpolygon i{CPC
  end.
  glbrushnull''
  glrect 1 1 230 230
 catch. return. end.
)
win_grph_char=: 3 : 0
 if. 239 160 131-:a.i.sysdata do. AFTER=: }.AFTER
 elseif. sysdata-:,'n' do. smoutput AFTER=: K=: 0$BEFORE=: 1|.BEFORE
 elseif. 1 do.
  K=: _2{.K,sysdata
  Ix=. K i.~ _2]\'97137139842479311793862628468264'
  if. Ix<16 do. K=: 0$AFTER=: AFTER,Ix{'udlrbfUDLRBFMEme' end.
 end.
 wd'set movs text ',AFTER
 glpaint''
)
NB. win_grph_mbldown=: 3 : 0
NB.  P=. 2{.".sysdata
NB.  i.&1 P eq@:((-"1(*@:cp"1)2-~/\(,{.)@:])4 2&$)"1 CPC
NB. )
win_run''