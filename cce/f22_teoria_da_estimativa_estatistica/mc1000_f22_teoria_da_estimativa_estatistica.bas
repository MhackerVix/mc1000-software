1  REM >`C2 ~01>~E92!~01>~032"~01:~1B~01~FE~03`@>~F42!~01>~012D~03`I
2  CALL 986
3  POKE 836,0
5  REM  ***********************
6  REM  * TEORIA ESTIM. ESTAT.*
7  REM  ***********************
10  HOME 
20  PRINT  TAB( 110)"C C E"; TAB( 169)"S O F T W A R E"
30  PRINT : PRINT "             TEORIA"
40  PRINT : PRINT "               DA"
45  PRINT : PRINT "      ESTIMATIVA ESTATISTICA"
50  FOR Z = 1 TO 1500: NEXT 
60  FOR ~20I = 1~20 TO ~207
70  READ C(I),F(I)
80  NEXT I
90  GOSUB 1400: PRINT : PRINT 
100  INPUT "NUMERO DE AMOSTRAS(>1)";N$:N =  VAL (N$): IF  INT (N) <  = 1 THEN 100
103  PRINT 
105  INPUT "MEDIA DA AMOSTRA";X$:X =  VAL (X$): IF X < 0 OR X = 0 AND X$ <  > "0" THEN 105
107  PRINT 
110  INPUT "VARIANCIA DA AMOSTRA";S2$:S2 =  VAL (S2$): IF S2 < 0 OR S2 = 0 AND S2$ <  > "0" THEN 110
120 S1 = S2 * N / (N - 1)
130  HOME : PRINT "VARIANCA DO UNIVERSO =";S2
150 S =  SQR (S1):S3 = S /  SQR (N)
200  PRINT "INTERVALOS DE CONFIABILIDADE": PRINT "ESTIMADOS PARA MEDIA"
300  PRINT "-------------------------------"
310  PRINT "CONF     +/-    MAXIMO   MINIMO"
320  PRINT "-------------------------------": PRINT 
330  FOR ~20I = 1~20 TO ~207
334 F0 =  INT ((F(I) * S3) * 10000) / 10000
335 F1 =  INT ((X + F(I) * S3) * 1000) / 1000:F2 =  INT ((X - F(I) * S3) * 1000) / 1000
340 C$ =  STR$ (C(I)):F0$ =  STR$ (F0):F1$ =  STR$ (F1):F2$ =  STR$ (F2): PRINT C$"%" TAB( 13 -  LEN (F0$))F0$ TAB( 22 -  LEN (F1$))F1$ TAB( 31 -  LEN (F2$))F2$
350  NEXT ~20I
360  PRINT : PRINT "TECLE <RETURN> PARA CONTINUAR";: INPUT Z$;
370  HOME : PRINT "INTERVALOS DE CONFIABILIDADE": PRINT "ESTIMADOS PARA DESVIO PADRAO"
375  PRINT "-------------------------------"
380  PRINT "CONF     +/-    MAXIMO   MINIMO"
390  PRINT "-------------------------------"
400  FOR ~20I = 1~20 TO ~207
410 J = F(I) * S /  SQR (2 * N)
415 F0 =  INT (J * 10000) / 10000:F1 =  INT ((S + J) * 1000) / 1000:F2 =  INT ((S - J) * 1000) / 1000
420 C$ =  STR$ (C(I)):F0$ =  STR$ (F0):F1$ =  STR$ (F1):F2$ =  STR$ (F2): PRINT C$"%" TAB( 13 -  LEN (F0$))F0$ TAB( 22 -  LEN (F1$))F1$ TAB( 31 -  LEN (F2$))F2$
430  NEXT ~20I~20~20
440  PRINT : PRINT "TECLE <RETURN> PARA CONTINUAR";: INPUT Z$;
445  GOSUB 1400: PRINT : PRINT 
450  PRINT "    DESEJA CALCULAR O NUMERO DE": PRINT "AMOSTRAS A SEREM COLETADAS PARA": PRINT "REDUZIR O ERRO DE SUA ESTIMATI-": PRINT "VA PARA UMA QUANTIDADE MAXIMA?"
460  PRINT : PRINT ,"        (S/N)";: INPUT B$
500  IF ~20B$ = "N"~20 THEN ~20785
510  IF ~20B$ <  > "S"~20 THEN ~20445
520  GOSUB 1400: PRINT : PRINT 
530  PRINT "<1>...50%": PRINT "<2>...60%": PRINT "<3>...70%": PRINT "<4>...80%": PRINT "<5>...90%": PRINT "<6>...95%": PRINT "<7>...99%"
535  PRINT 
540  INPUT "OPCAO ";JJ$:J =  VAL (JJ$)
550  IF ~20J < 1~20 OR ~20J > 7~20 GOTO ~20520
555  GOSUB 1400: PRINT : PRINT 
560  PRINT "NIVEL DE CONFIABILIDADE DE";C(J);"%"
565  PRINT 
570  PRINT "QUAL O ERRO MAXIMO DESEJADO": PRINT "DA ESTIMATIVA";: INPUT ~20M$:M =  VAL (M$): IF M < .000001 THEN 570
580  PRINT : PRINT "DIGITE <M> PARA TESTAR MEDIA         E <S> PARA DESVIO PADRAO"
583  PRINT 
585  PRINT ,;: INPUT "    OPCAO";C$
590  IF ~20C$ = "S"~20 THEN ~20680
600  IF ~20C$ = "M"~20 THEN ~20610
605  GOTO 585
610 N3 =  INT ((S * F(J) / M) ^ 2) + 1
620  GOTO 685
680 N3 =  INT ((F(J) * S / M) ^ 2) + 1
685  GOSUB 1400: PRINT 
690  PRINT "PARA O NIVEL DE CONFIAB.DE";C(J);"%"
695  PRINT 
700  PRINT "SERA NECESSARIO COLETAR"N3
710  PRINT "AMOSTRAS P/O ERRO DE ESTIMATIVA"
730  IF ~20C$ = "S"~20 THEN ~20760
740  PRINT "NA MEDIA";: GOTO ~20770
760  PRINT "NO DESVIO PADRAO";
770  PRINT " NAO EXCEDER";M
780  PRINT : PRINT "TECLE <RETURN> PARA CONTINUAR";: INPUT Z$;
785  GOSUB 1400: PRINT : PRINT 
800  PRINT "<1>...MESMAS AMOSTRAS": PRINT "<2>...NOVAS AMOSTRAS": PRINT "<3>...FIM"
805  PRINT : PRINT ,"    OPCA0 ?";
810  POKE 284,0
811 A =  PEEK (284)
815  IF A = 49 THEN 445
820  IF A = 50 THEN 90
830  IF A = 51 THEN 1500
840  GOTO 811
850  GOTO ~201400
1300  DATA  50,0.6744902454373
1310  DATA  60,0.8416214285714
1320  DATA  70,1.0364335334476
1330  DATA  80,1.2815515669516
1340  DATA  90,1.6448536821705
1350  DATA  95,1.9599641025641
1360  DATA  99,2.575827586207
1400  HOME : INVERSE : PRINT "    ESTIMATIVA ESTATISTICA     ": NORMAL : RETURN 
1500  CALL 49251
