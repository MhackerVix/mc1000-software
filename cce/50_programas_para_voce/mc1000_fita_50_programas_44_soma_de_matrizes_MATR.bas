0  REM ************************
1  REM *     - CCESOFT -      *
2  REM *OTTO LONGO SERNATINGER*
3  REM *  VERSAO 1.1   05/85  *
4  REM ************************
5  REM *   SOMA DE MATRIZES   *
6  REM ************************
45  HOME 
46  PRINT  TAB( 11)"- CCESOFT -": PRINT 
50  PRINT  TAB( 10)"ESTE PROGRAMA
51  PRINT  TAB( 8)"SOMA DUAS MATRIZES
52  PRINT  TAB( 9)"(DE MESMA ORDEM)"
53  PRINT : PRINT 
100  INPUT "ORDEM DAS MATRIZES (I,J) ";I,J
110  PRINT : PRINT "ENTRE COM OS VALORES"
120  PRINT "DA MATRIZ A": PRINT 
130  FOR A = 1 TO I
140  FOR B = 1 TO J
150  PRINT "A (";A;",";B;") ";
160  INPUT A(A,B)
170  NEXT B: PRINT : NEXT A
180  HOME 
190  PRINT "ENTRE COM OS VALORES"
200  PRINT "DA MATRIZ B": PRINT 
210  FOR A = 1 TO I
220  FOR B = 1 TO J
230  PRINT "B (";A;",";B;") ";
240  INPUT B(A,B)
250  NEXT B: PRINT : NEXT A
260  HOME : PRINT  TAB( 10)"AGUARDE"
270  FOR A = 1 TO I
280  FOR B = 1 TO J
290 C(A,B) = A(A,B) + B(A,B)
300  NEXT B: NEXT A
310  HOME 
320  FOR A = 1 TO I
330  FOR B = 1 TO J
335 C = C + 1
340  PRINT "C (";A;",";B;") =";C(A,B)
345  IF C < 14 THEN 350
346  POKE 284,13
347  PRINT : PRINT "QUALQUER LETRA CONTINUA";
348  IF  PEEK (284) < 65 THEN 348
349  POKE 284,13: HOME :C = 0
350  NEXT B: PRINT :C = C + 1: NEXT A
