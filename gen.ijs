load'~temp/rubik/rubik.ijs'
NB. generating verbs
NB. 1f-1b. ul-ur on up face
ulur=: 0 2{EDGE
uf1=: (1 1 1 0-:0 5 e.~ 1 3 4 6&gface)"1
db1=: (1 0-:0 5 e.~ 41 46&gface)"1
uulur=: (4*./"1@:>(ulur i.~&:(/:~"1) EDGE&{))"1
NB. (#~ [:(uf1*.db1*.uulur)"1 I&sper inv"1) 'mMuU'{~?10000 30$4
NB. 1f-1b. ul or ur on df
dfulur=: (6 e."1 (ulur i.~&:(/:~"1) EDGE&{))"1
NB. (#~ [:(uf1*.db1*.dfulur)"1 I&sper inv"1) 'mMuU'{~?10000 30$4
NB. 1f-1b. ul or ur on db
dbulur=: (8 e."1 (ulur i.~&:(/:~"1) EDGE&{))"1
NB. (#~ [:(uf1*.db1*.dbulur)"1 I&sper inv"1) 'mMuU'{~?10000 30$4