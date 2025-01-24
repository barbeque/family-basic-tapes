0 SPRITE ON
1 DEF SPRITE 0,(0,1,0,1,0)=CHR$(165)+CHR$(164)+CHR$(167)+CHR$(166)
2 DEF SPRITE 1,(0,1,0,0,0)=CHR$(152)+CHR$(153)+CHR$(154)+CHR$(155)
3 CLS:D=0:SC=0:GOSUB4000
8 CGSET 1,2
10 X=100:Y=100
30 S=STICK(0)
31 SPRITE 0,X,Y
33 IF (S AND 8)<>0 THEN Y=Y-3 'UP
34 IF (S AND 4)<>0 THEN Y=Y+3 'DOWN
35 IF (S AND 2)<>0 THEN X=X-3 'LEFT
36 IF (S AND 1)<>0 THEN X=X+3 'RIGHT
100 S=STRIG(0)
101 IF (S AND 8)<>0THEN GOSUB1500
102 IF (S AND 8)=0THEND=0
200 IF X<0 THEN X=0
201 IF X>240 THEN X=240
202 IF Y<0 THEN Y=0
203 IF Y>200 THEN Y=200
300 REM ** BULLET A.I. **
301 IF XPOS(0)>240 THEN ERA 0
302 IF MOVE(0)= 0 THEN 400
303 BX=XPOS(0):BY=YPOS(0)
304 EZ=EY+(EO*2)-2
305 IF BX>EX AND BX<EX+16 AND BY>EZ AND BY<EZ+16 THEN GOSUB 3500
400 REM ** ENEMY A.I. **
401 IF EX<1 THEN GOSUB2000
402 EC=EC+1
403 EX=EX-ES           
404 IF EF>10 THEN RESTORE : EF=0
405 IF EC>4 THEN EC=0:EF=EF +1:READ EO
406 SPRITE 1,EX,EY+(EO*2)
500 REM ** EXPLODE ANIM **
501 IF XO=0 THEN 600
510 XC=XC+1
511 IF XC>2 THEN XF=XF+1:XC=0
512 IF XF=2 THEN 520
513 IF XC<>2 THEN 600
514 DEF SPRITE 2,(0,1,0,0,0)=XB$
515 SPRITE 2,XX,XY
517 GOTO 600 ' KEEP LOOP
520 SPRITE 2:XO=0
600 EZ=EY+(EO*2)
601 IF (X+8)>EX AND (X+8)<EX+16 AND (Y+8)>EZ AND (Y+8)<EZ+16 THEN GOSUB 7777
1000 GOTO30
1500 IF D=1THEN RETURN
1502 D=1
1510 DEF MOVE(0)=SPRITE(12,3,2,128,0,0)
1515 POSITION0,X+4,Y+4
1520 MOVE 0
1600 RETURN
2000 REM ** SPAWN ENEMY **
2005 EX=240:ES=RND(3)+2
2006 EF=0:EC=0:RESTORE
2007 EY=RND(180)+10
2099 RETURN
3500 REM ** ENEMY HIT **
3502 SC=SC+10
3503 IF SC>HS THEN HS=SC
3504 ERA 0
3505 XX=EX:XY=EY+(EO*2)
3506 GOSUB 3900
3507 GOSUB 2000
3599 RETURN
3900 REM EXPLODE
3901 XO=1 'EXPLODE ON
3902 XF=0 : XC=0 'TIMERS
3903 DEF SPRITE(2),(0,1,0,0,0)=XA$
3904 SPRITE 2,XX,XY
3999 RETURN
4000 REM INIT
4001 EX=0:EY=0:EC=0:EF=0:EO=0
4011 XA$=CHR$(176)+CHR$(177)+CHR$(178)+CHR$(179)
4012 XB$=CHR$(180)+CHR$(181)+CHR$(182)+CHR$(183)
4013 XX=0:XY=0:XF=0:XC=0:XO=0
4020 FORX=0TO15:LOCATE RND(27),RND(23):PRINTCHR$(206):NEXT
4444 DATA 1,2,3,4,5,6,6,5,4,3,2
4999 RETURN
7777 PRINT"GAME OVER,SCORE",SC:END
