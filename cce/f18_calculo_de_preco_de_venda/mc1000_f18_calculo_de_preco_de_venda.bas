1  REM >`C2 ~01>~E92!~01>~032"~01:~1B~01~FE~03`@>~F42!~01>~012D~03`I
2  CALL 986
3  POKE 836,0
8  HOME : PRINT  TAB( 142)"C C E"; TAB( 201)"S O F T W A R E"
10  PRINT  TAB( 100)"CALCULO DE PRECO DE VENDA": FOR X = 1 TO 1500: NEXT X
15  CLEAR 3100
20  DIM N(6)
25 MI = 1000000
30 W$ = "               "
40  GOTO 420
100  IF N(0) <  > 0 THEN 1110
110  INVERSE : PRINT "        * CRIA LISTA *          ";: NORMAL 
120  PRINT : INPUT "QUANTOS ITENS ";N$
130 N(0) =  VAL (N$): IF N(0) < 1 OR N(0) > 200 THEN 120
140  GOSUB 1170
150  PRINT "OBS:MAXIMO 15 LETRAS P/DESCRICAO";
160  GOSUB 1170
170  DIM A$(N(0)): DIM B(N(0),5)
180  FOR X = 1 TO N(0)
190  PRINT "          ITEM ";X
200  INPUT "DESCRICAO      ";A$(X):V =  LEN (A$(X)):W = 15 - V:A$(X) =  LEFT$ (A$(X),15)
205  IF W < 0 THEN 220
210 A$(X) = A$(X) +  LEFT$ (W$,W)
220  INPUT "PRECO EM CRUZEIROS ";C$:C =  VAL (C$)
230  IF C = 0 AND C$ <  > "0" THEN 220
240 B(X,0) = C
250  GOSUB 1170
260  NEXT X
270  GOTO 420
300  INVERSE : PRINT "   * DEFINE INDICE DE LUCRO *   ";: NORMAL 
310  PRINT : PRINT "EXEMPLO: PARA 25% DIGITE 25"
320  PRINT : PRINT : PRINT "VALOR ATUAL =";N(3);"%"
330  PRINT : PRINT : INPUT "QUAL A PORCENTAGEM DE LUCRO";Z$
335  IF Z$ = "^" THEN 420
340 N(3) =  VAL (Z$): IF N(3) = 0 AND Z$ <  > "0" THEN 330
420  HOME : INVERSE : PRINT "  * CALCULO DE PRECO DE VENDA * ";: NORMAL 
430  PRINT "VALOR DA ORTN   =CR$";N(1)
435  PRINT "VALOR DO DOLAR  =CR$";N(2)
440  PRINT "INDICE DE LUCRO = ";N(3);"%"
450  PRINT "   ** ARQUIVO COM";N(0);"ITENS **"
455  PRINT "  MUDA DATA................<0>"
460  PRINT "  CRIA LISTA...............<1>"
470  PRINT "  CARREGA LISTA............<2>"
480  PRINT "  GRAVA LISTA..............<3>"
485  PRINT "  ALTERA LISTA.............<4>"
490  PRINT "  DEFINE INDICE DE LUCRO...<5>"
500  PRINT "  MUDA VALOR DA ORTN.......<6>"
510  PRINT "  MUDA VALOR DO DOLAR......<7>"
520  PRINT "  APRESENTA RESULTADOS.....<8>"
530  PRINT "  FIM......................<9>"
540  PRINT "  DATA ="N(4)"/"N(5)"/"N(6);: INPUT "OPCAO";P$:P =  ABS ( VAL ( LEFT$ (P$,1)))
550  HOME 
560  ON P GOTO 100,1500,1700,2000,300,650,600,700,1000
570  IF P$ = "0" THEN 1020
580  GOTO 420
600  INVERSE : PRINT "     * MUDA VALOR DO DOLAR *    ": NORMAL 
605  PRINT : PRINT : PRINT "VALOR ATUAL =CR$";N(2)
610  PRINT : PRINT : INPUT "QUAL O VALOR DO DOLAR";DR$
615  IF DR$ = "^" THEN 420
620 N(2) =  VAL (DR$): IF N(2) = 0 THEN 610
630  GOTO 420
650  INVERSE : PRINT "     * MUDA VALOR DA ORTN *     ": NORMAL 
655  PRINT : PRINT : PRINT "VALOR ATUAL =CR$";N(1)
660  PRINT : PRINT : INPUT "QUAL O VALOR DA ORTN";J$
665  IF J$ = "^" THEN 420
670 N(1) =  VAL (J$): IF N(1) = 0 THEN 660
680  GOTO 420
700  IF N(0) = 0 THEN 1270
710  IF N(1) = 0 OR N(2) = 0 THEN 1260
720 T = 0:W = 1 + N(3) / 100
730  FOR X = 1 TO N(0)
740  GOTO 760
750  GOSUB 1200
760 T = T + B(X,0): PRINT : PRINT "    ITEM"X" = "A$(X)
770 C = B(X,0):V$ = "PRECO DE CUSTO": GOSUB 850
780 C =  INT (B(X,0) * W + .5):V$ = "PRECO DE VENDA": GOSUB 850
790  INPUT "TECLE <RETURN> PARA CONTINUAR";U$
800  NEXT X
810 C = T:V$ = "PRECO TOTAL *CUSTO*": GOSUB 1170: PRINT : PRINT : PRINT : GOSUB 850
820 C =  INT (T * W + .5):V$ = "PRECO TOTAL *VENDA*": GOSUB 850
822  PRINT : PRINT "        DATA ="N(4)"/"N(5)"/"N(6)
830  INPUT "TECLE <RETURN> PARA CONTINUAR";U$
840  GOTO 420
850 C =  INT (C * 100) / 100:D1 =  INT (C / N(2) * 100) / 100:J1 =  INT (C / N(1) * 100) / 100
860  PRINT : PRINT "        "V$;
870 C$ =  STR$ (C): IF C =  > MI THEN C$ =  STR$ (C / MI)
880 J$ =  STR$ (J1): IF J1 =  > MI THEN J$ =  STR$ (J1 / MI)
890 DR$ =  STR$ (D1): IF D1 =  > MI THEN DR$ =  STR$ (D1 / MI)
900 V = 10 -  LEN (C$):V1 = 10 -  LEN (J$):V2 = 10 -  LEN (DR$)
910  PRINT : PRINT  TAB( V)C$;: IF C =  > MI THEN  GOSUB 950
915  PRINT " CRUZEIROS"
920  PRINT  TAB( V1)J$;: IF J1 =  > MI THEN  GOSUB 950
925  PRINT " ORTNS"
930  PRINT  TAB( V2)DR$;: IF D1 =  > MI THEN  GOSUB 950
935  PRINT " DOLARES"
940  RETURN 
950  PRINT " MILHOES DE";: RETURN 
970  GOSUB 1170
980  GOSUB 1220
990  GOTO 420
1000  IF G = 0 AND N(0) <  > 0 THEN 1280
1010  GOTO 1310
1020  HOME : INVERSE : PRINT "         * MUDA DATA *          ": NORMAL : PRINT : PRINT 
1030  PRINT "DATA ATUAL ="N(4)"/"N(5)"/"N(6): PRINT 
1040  INPUT "QUAL O DIA (DD)";U$:U =  VAL (U$): IF U$ = "^" THEN 1055
1045  IF U < 1 OR U > 31 THEN 1040
1050 N(4) = U
1055  INPUT "QUAL O MES (MM)";U$:U =  VAL (U$): IF U$ = "^" THEN 1070
1060  IF U < 1 OR U > 12 THEN 1055
1065 N(5) = U
1070  INPUT "QUAL O ANO (AA)";U$:U =  VAL (U$): IF U$ = "^" THEN 1090
1075  IF U = 0 THEN 1070
1080 N(6) =  VAL (U$)
1090  GOTO 420
1110  HOME : PRINT : PRINT : PRINT "  JA EXISTE UMA LISTA NA MEMORIA"
1120  PRINT : PRINT : INPUT "QUER APAGA-LA (S/N)";U$
1130  IF U$ = "S" THEN  RUN 15
1140  GOTO 420
1150  FOR X = 1 TO 1500: NEXT X: GOTO 420
1170  PRINT "--------------------------------";
1180  RETURN 
1200  HOME : INVERSE : PRINT " * APRESENTACAO DOS RESULTADOS *";: NORMAL : RETURN 
1260  HOME : PRINT : PRINT : PRINT "  ATUALIZE OS VALORES DO DOLAR EDA ORTN": GOTO 1150
1270  HOME : PRINT : PRINT : PRINT "  NAO HA NENHUM ITEM NA MEMORIA": GOTO 1150
1280  HOME : PRINT : PRINT : PRINT "A LISTA NAO FOI GRAVADA"
1290  PRINT : INPUT "QUER GRAVA-LA (S/N)";U$
1300  IF U$ = "S" THEN 1700
1310  CALL 49251
1500  IF N(0) <  > 0 THEN 1110
1510  GOSUB 1680
1540  PRINT : PRINT "POSICIONE A FITA, APERTE A TECLA<RETURN> DO  MC-1000  E ENTAO  ATECLA<PLAY> DO GRAVADOR"
1550  INPUT U$
1560  LOAD * N
1570  DIM ~20B(N(0),5): DIM A$(N(0))
1580  LOAD * B
1590  GOSUB 1680
1600  PRINT : PRINT : PRINT " DESLIGUE O GRAVADOR E AGUARDE OPROCESSAMENTO"
1610  FOR X = 1 TO N(0)
1630  FOR K = 1 TO 5
1640 A$(X) = A$(X) +  CHR$ ( INT (B(X,K) * 1E - 4)) +  CHR$ ( INT (B(X,K) * 1E - 2) - ( INT (B(X,K) * 1E - 4) * 1E + 2)) +  CHR$ (B(X,K) - ( INT (B(X,K) * 1E - 2) * 1E + 2))
1650  NEXT K
1660  NEXT X
1665 G = 1
1670  GOTO 420
1680  HOME : INVERSE : PRINT "       * CARREGA LISTA *        ";: NORMAL 
1690  RETURN 
1700  IF N(0) = 0 THEN 1270
1705  IF G = 1 THEN 1920
1710  GOSUB 1900
1720  PRINT : PRINT : PRINT "AGUARDE O PROCESSAMENTO"
1725  IF G = 2 THEN 1740
1740  FOR X = 1 TO N(0)
1760 Q = 1: FOR K = 1 TO 5
1780 B(X,K) =  ASC ( MID$ (A$(X),Q,1)) * 1E + 4 +  ASC ( MID$ (A$(X),Q + 1,1)) * 1E + 2 +  ASC ( MID$ (A$(X),Q + 2,1))
1790 Q = Q + 3: NEXT K
1800  NEXT X
1810  GOSUB 1900
1840  PRINT : PRINT : PRINT "     POSICIONE A FITA, APERTE ASTECLAS <REC><PLAY> DO GRAVADOR EENTAO TECLE <RETURN> NO MC-1000"
1850  INPUT U$
1860  SAVE * N
1870  FOR X = 1 TO 20: NEXT 
1875  SAVE * B
1880 G = 1
1890  GOTO 420
1900  HOME : INVERSE : PRINT "        * GRAVA LISTA *         ";: NORMAL 
1910  RETURN 
1920  GOSUB 1900
1930  PRINT : PRINT : PRINT "ESTA LISTA JA FOI GRAVADA"
1940  PRINT : PRINT : INPUT "QUER GRAVA-LA NOVAMENTE (S/N)";U$
1950  IF U$ = "S" THEN 1810
1960  GOTO 420
2000  IF N(0) = 0 THEN 1270
2010  HOME : INVERSE : PRINT "        * ALTERA LISTA *        ";: NORMAL 
2020  PRINT : INPUT "NUMERO DO ITEM";U$
2025  IF U$ = "^" THEN 420
2030 X =  VAL (U$): IF X < 1 OR X > N(0) THEN 2010
2040  PRINT : PRINT "DESCRICAO = ";A$(X)
2050  PRINT "VALOR EM CRUZEIROS ="B(X,0)
2060  GOSUB 1170
2070  PRINT : INPUT "DESCRICAO ";A$:V =  LEN (A$):W = 15 - V: IF A$ = "^" THEN 2010
2080  IF V > 15 THEN A$(X) =  LEFT$ (A$,15): GOTO 2100
2085  IF W <  = 0 THEN 2100
2090 A$(X) =  LEFT$ (A$,15) +  LEFT$ (W$,W)
2100 G = 2
2110  INPUT "VALOR EM CRUZEIROS ";C$:C =  VAL (C$)
2120  IF C$ = "^" THEN 2010
2130  IF C = 0 AND C$ <  > "0" THEN 2110
2140 B(X,0) = C
2150 G = 2
2160  GOTO 2010
