load'defs.ijs'

Pf=: F i. ;:&>cutLF(0 : 0)
 u3 u6 u9 u2 u5 u8 u1 u4 u7 f1 f2 f3 r4 r5 r6 r7 r8 r9 l1 l2 l3 f4 f5 f6 f7 f8 f9 d1 d2 d3 d4 d5 d6 d7 d8 d9 b1 b2 b3 l4 l5 l6 l7 l8 l9 r1 r2 r3 b4 b5 b6 b7 b8 b9
 u1 u2 b7 u4 u5 b4 u7 u8 b1 r3 r6 r9 r2 r5 r8 r1 r4 r7 f1 f2 u3 f4 f5 u6 f7 f8 u9 d1 d2 f3 d4 d5 f6 d7 d8 f9 l1 l2 l3 l4 l5 l6 l7 l8 l9 d9 b2 b3 d6 b5 b6 d3 b8 b9
 u1 u2 u3 u4 u5 u6 r1 r4 r7 d3 r2 r3 d2 r5 r6 d1 r8 r9 f3 f6 f9 f2 f5 f8 f1 f4 f7 l3 l6 l9 d4 d5 d6 d7 d8 d9 l1 l2 u9 l4 l5 u8 l7 l8 u7 b1 b2 b3 b4 b5 b6 b7 b8 b9
 u1 u2 u3 u4 u5 u6 u7 u8 u9 r1 r2 r3 r4 r5 r6 b7 b8 b9 f1 f2 f3 f4 f5 f6 r7 r8 r9 d3 d6 d9 d2 d5 d8 d1 d4 d7 l1 l2 l3 l4 l5 l6 f7 f8 f9 b1 b2 b3 b4 b5 b6 l7 l8 l9
 f1 u2 u3 f4 u5 u6 f7 u8 u9 r1 r2 r3 r4 r5 r6 r7 r8 r9 d1 f2 f3 d4 f5 f6 d7 f8 f9 b9 d2 d3 b6 d5 d6 b3 d8 d9 l3 l6 l9 l2 l5 l8 l1 l4 l7 b1 b2 u7 b4 b5 u4 b7 b8 u1
 l7 l4 l1 u4 u5 u6 u7 u8 u9 r1 r2 u1 r4 r5 u2 r7 r8 u3 f1 f2 f3 f4 f5 f6 f7 f8 f9 d1 d2 d3 d4 d5 d6 r9 r6 r3 d7 l2 l3 d8 l5 l6 d9 l8 l9 b3 b6 b9 b2 b5 b8 b1 b4 b7
)
Mf=: (Pf{~Axis i.[){inv]