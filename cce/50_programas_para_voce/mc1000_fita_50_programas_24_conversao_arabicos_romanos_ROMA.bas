0  REM ************************
1  REM *     - CCESOFT -      *
2  REM *OTTO LONGO SERNATINGER*
3  REM *  VERSAO 1.1   05/85  *
4  REM ************************
5  REM *     CONVERSAO DE     *
6  REM * ARABICOS PARA ROMANOS*
7  REM ************************
25  HOME 
26  PRINT  TAB( 11)"- CCESOFT -": PRINT 
30  PRINT  TAB( 10)"ESTE PROGRAMA"
31  PRINT  TAB( 6)"TRANSFORMA ALGARISMOS"
32  PRINT  TAB( 7)"ARABICOS EM ROMANOS"
33  PRINT  TAB( 8)"(DE 1 ATE' 3999)"
40 X$ = "IVXCDMXLCIVX": GOTO 600
50  PRINT : INPUT "NUMERO ARABICO ";N$
60 N =  VAL (N$):L =  LEN (N$): IF N < 1 OR N > 3999 THEN  RUN 
65  IF L < 4 THEN  FOR I = 1 TO 4 - L:N$ = "0" + N$: NEXT I
70  FOR I = 1 TO 4:N(I) =  VAL ( MID$ (N$,I,1)): NEXT I
80  PRINT : PRINT "NUMERO ROMANO -> ";
99  FOR I = 1 TO 4: RESTORE : FOR J = 1 TO N(I) + 1: READ A$: NEXT J: IF A$ = "0" THEN 500: DATA 0,1,11,111,12,2,21,211,2111,13
120  IF I = 1 AND N(I) < 4 THEN  FOR X = 1 TO N(I): PRINT "M";: NEXT X: GOTO 500
130  FOR X = 1 TO  LEN (A$): PRINT  MID$ (X$,3 * (I - 1) +  VAL ( MID$ (A$,X,1)),1);: NEXT X
200  IF I = 1 AND N(I) > 3 THEN L =  LEN (A$): FOR X = 1 TO L: PRINT "-";: NEXT 
500  NEXT 
600  PRINT : PRINT : FOR I = 1 TO 32: PRINT "-";: NEXT : GOTO 50