load'cubie.ijs coord.ijs' NB. table.ijs'
NB. CornPermPh2PruningTable
CPP2PT=: (3 : 0)''
 pct=. 0(0)}40320$255
 depth=. 0
 done=. 1
 while. done~:40320 do.
  for_i. I.pct=depth do.
   j=. (#~255={&pct)CPMT{~<"1 i,.MOVE i. ;:'Ux1 Ux3 Dx1 Dx3 Usx1 Usx3'
   pct=. pct(j)}~>:depth
   done=. done+#j
  end.
  if. depth>0 do.
   for_i. I.pct=<:depth do.
    j=. (#~255={&pct)CPMT{~<"1 i,.MOVE i. ;:'Rx2 Fx2 Lx2 Bx2 Rsx2 Fsx2'
    pct=. pct(j)}~>:depth
    done=. done+#j
   end.
  end.
  depth=. >:depth
 end.pct
)