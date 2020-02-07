load'~temp/rubik/rubik.ijs gl2'
coinsert'jgl2'
BEFORE=: <AFTER=: K=: ''
HUE=: 0 255 0,255 128 0,255 255 0,255 0 0,255 255 255,:0 0 255
P0=: +.r.1r8p1+1r4p1*i.8
P1=: ((%:2)*>./P0)*"1+.r.1r4p1+2r4p1*i.4
CPC=:     ;/<.115+180*,"2]2(,&0)\(,{.)P0
CPC=: CPC,;/<.115+100*,"2]2(,&0)\P2=: (,{.)25426873 A. P0,P1
CPC=: CPC,;/<.115+ 80*,"2]2(,&0)\P2
CPC=: CPC,;/<.115+ 60*,"2]2(,&0)\P2
CPC=: CPC,P2(115+40<.@:*{~,@:,0:)L:0]0 1 2;2 3;3 4 5;5 6;6 7 8;8 9;9 10 11;11 12
WIN=: 0 : 0
 pc win closeok;pn "lubikio";
 bin v; minwh 200 40;cc movs static sunken;cn "";
 bin h; minwh 240 240;cc grph isigraph; cc gen button; bin z;
 bin h;
 cc cmll checkbox;cc eolr40 checkbox;cc eolr11u checkbox;
 cc eolr11df checkbox;cc eolr11db checkbox;
)
glpolygon1=: 4 : 'glcmds 5 2032,x,3 2004 0,(2+#y),2029,y' NB. set color and draw polygon
win_grph_paint=: 3 : 0
 per=. 37 38 39 36 34 33 32 35 31 47 46 45 13 11 8 0 1 2 26 28 30 44 _1 43 14 _2 9 3 _3 4 25 _4 29 42 41 40 15 12 10 5 6 7 24 27 23 22 21 19 16 17 18 20
 col=. HUE{~per{3 0 1 5,~face AFTER sper~ I sper inv>{.BEFORE
 glclip 0 0 232 232
 glfill 255 255 255 196
 try.
  col (glpolygon1 >)"1 0 CPC
  glbrushnull''
  glrect 1 1 230 230
 catch. return. end.
)
win_grph_char=: 3 : 0
 if.     239 160 131-:a.i.sysdata do. K=: ''[AFTER=: }:AFTER
 elseif. 239 160 133-:a.i.sysdata do. AFTER=: K=: ''[BEFORE=: 1|.BEFORE
 elseif. 1 do.
  K=: _2{.K,sysdata
  Ix=. K i.~ _2]\'97137139842482647931179386262846'
  if. Ix<16 do. K=: 0$AFTER=: AFTER,Ix{'udlrbfmeUDLRBFME' end.
 end.
 wd'set movs text ',60{.,_30(,&LF)\AFTER
 glpaint''
)
cat=: 'cmll';'eolr40';'eolr11u';'eolr11df';'eolr11db'
win_gen_button=: 3 : 0
 glpaint BEFORE=: ({~?~@:#)>,&.>/('b'fread'~temp/rubik/'&,)L:0 cat#~'1'=cmll,eolr40,eolr11u,eolr11df,eolr11db
)
wd WIN,';pshow'