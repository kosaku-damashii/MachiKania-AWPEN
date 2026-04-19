USEGRAPHIC 5
A=ANALOG(0):A=ANALOG(1)
WHILE 1
 R=6
 V=0:W=SYSTEM(22)/2
 G=0:H=SYSTEM(23)/2 
 WHILE ANALOG(1) > 1000
  WAIT 1
 WEND
 GCLS
 WHILE R > 1
  FOR Y=0 to 1
   FOR X=0 to 1
    BOXFILL V+W*X,G+H*Y,V+W*(X+1),G+H*(Y+1),7
    WAIT 2
    A=ANALOG(0)
    IF A > 200 THEN
     R=R-1
     IF R==1 THEN
      BOXFILL V+W*X,G+H*Y,V+W*(X+1),G+H*(Y+1),5
     ELSE
      BOXFILL V+W*X,G+H*Y,V+W*(X+1),G+H*(Y+1),0
     ENDIF
     V=V+W*X:W=W/2
     G=G+H*Y:H=H/2
     X=1:Y=1
     BREAK
    ELSE
     BOXFILL V+W*X,G+H*Y,V+W*(X+1),G+H*(Y+1),0
    ENDIF
   NEXT
  NEXT
 WEND
 WHILE ANALOG(1) < 200
  WAIT 1
 WEND
 WAIT 100
WEND
END