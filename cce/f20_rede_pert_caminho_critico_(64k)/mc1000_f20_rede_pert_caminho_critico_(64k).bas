1  REM >`C2 ~01>~E92!~01>~032"~01:~1B~01~FE~03`@>~F42!~01>~012D~03`I
2  CALL 986
3  POKE 836,0
5  REM  *CCE SOFTWARE*
10  REM  *DATA:04/07/85*
15  REM  *LINGUAGEM BASIC MC-1000*
20  REM  *PROGRAMACAO PERT*
22  HOME : PRINT : PRINT : PRINT : PRINT  TAB( 8);"CCE   SOFTWARE": PRINT : PRINT : PRINT : PRINT : PRINT  TAB( 10);"REDE  PERT": FOR W = 0 TO 1500: NEXT W
25  CLEAR 2300: GOSUB 1555: GOTO 1425
30  REM  CONVERSAO DO NUMERO DE DIAS EM FORMA DE DATA (DDMMAA)
35 D3 = A1:YN =  INT (ND / A2):DN = ND - (YN * A2) -  INT ((YN + A3) / A4): IF DN > 0 GOTO 45
40 YN = YN - A7:DN = DN + A2: IF  INT (YN / A4) = YN / A4 THEN DN = DN + A7
45 D1 = 0: IF  INT (YN / A4) = YN / A4 THEN D1 = A7
50 D2 =  VAL ( MID$ (D3$,D3,A3)): IF D2 > A5 THEN D2 = D2 + D1
55  IF DN <  = D2 THEN D3 = D3 - A3: GOTO 50
60 L =  LEN ( STR$ (DN - D2)) - 1
65 V1 = DN - D2:V1$ =  MID$ ( STR$ (V1),2,4):V2$ = V1$ + "/":V3$ =  RIGHT$ (V2$,L + 1):V5$ =  RIGHT$ (V3$,A3 + 1): IF  LEN (V5$) <  > 3 THEN V5$ = "0" + V5$
70 L =  LEN ( STR$ ((D3 + A8) / A3)) - 1
75 W9 = (D3 + A8) / A3:G1$ =  MID$ ( STR$ (W9),2,4):G2$ = G1$ + "/"
80 G$ =  RIGHT$ (G2$,L + 1):G8$ =  RIGHT$ (G$,A3): IF  LEN (G8$) < 3 THEN G8$ = "0" + G8$
85 AB = YN + A6:AB$ =  MID$ ( STR$ (AB),2,6):AE$ =  RIGHT$ (AB$,A8 + 1):L1$ = V5$ + G8$:L2$ = L1$ + AE$: RETURN 
90  PRINT LN$: PRINT : GOTO 1425
95  REM  CONSTRUCAO DA REDE 
100  PRINT "        CONSTRUCAO DA REDE"~20
105  PRINT : PRINT 
110  PRINT : PRINT "NUMERO TOTAL DE NOS,": INPUT "(INCLUINDO OS FICTICIOS)";A$
115 TE =  VAL (A$): IF TE < 3 OR TE > 70 GOTO 105
120  PRINT : PRINT "NUMERO TOTAL DE ATIVIDADES,"
125  INPUT "(INCLUINDO AS FICTICIAS)";A$
130 TA =  VAL (A$): IF TA < 1 OR TA > 86 GOTO 125
135  PRINT : INPUT "NUMERO DO EVENTO INICIAL";A$
140 SB =  VAL (A$) - 1: IF SB < 0 GOTO 135
145  HOME : PRINT "   INTRODUCAO DAS ATIVIDADES"
150  GOSUB 1620
155  FOR J = 1 TO TA
160  IF J = 1 GOTO 175
165  HOME : PRINT "  ULTIMA ATIVIDADE INTRODUZIDA  "
170  PRINT AC$(J - 1);: PRINT  TAB( 23)C + SB"-"R + SB~20
175  PRINT : INPUT "ATIVIDADE";AC$(J): IF  LEN (AC$(J)) < 21 THEN ST = 21 -  LEN (AC$(J)):AC$(J) = AC$(J) +  LEFT$ (ST$,ST)
180  PRINT : INPUT "N. DO EVENTO QUE A PRECEDE";A$
185  LET C =  VAL (A$) - SB
190  IF C <  >  INT (C) OR C < 1 OR C > TE - 1 THEN  PRINT "NUMERO INVALIDO": GOTO 180
195  PRINT : INPUT "N. DO EVENTO QUE A SUCEDE";A$:R =  VAL (A$) - SB
200  IF R <  >  INT (R) OR R < 2 OR R > TE OR R = C THEN  PRINT "COMBINACAO INVALIDA": GOTO 180
205 PT(R,C) = 1:AD(J,1) = C * 1000 + R: NEXT J~20~20
210  REM  CHECA E ORDENA AS ATIVIDADES
215  HOME : PRINT "CHECAR":Y = 0: FOR C = 1 TO TE - 1:X = 0: FOR R = 2 TO TE: IF PT(R,C) = 1 THEN X = 1
220  NEXT R: IF X = 0 THEN Y = 1: PRINT : PRINT "NENHUMA ATIVIDADE INICIANDO O   EVENTO"C + SB
225  NEXT C: IF Y = 1 THEN  PRINT "O PROGRAMA SERA REINICIADO": GOSUB 1535: RUN 25
230  REM  SORT POR NUMERO DE ATIVIDADE 
235  PRINT "ORDENAR": FOR J = 1 TO TA - 1: FOR K = J + 1 TO TA
240  IF AD(J,1) <  = AD(K,1) GOTO 255
245 A = AD(J,1):AD(J,1) = AD(K,1):AD(K,1) = A
250 A$ = AC$(J):AC$(J) = AC$(K):AC$(K) = A$
255  NEXT K: NEXT J: GOSUB 265: GOTO 325
260  REM  OBTEM A DATA INICIAL E CONVERTE EM NUMERO DE DIAS
265  HOME : PRINT "           DATA INICIAL": PRINT 
270  PRINT "ENTRE COM A DATA INICIAL DO PRO-JETO , NO FORMATO (DDMMAA)."
275  PRINT : PRINT "DIGITE '^' SE ESTA DATA NAO FOR DESEJADA."
280 SD = 0: PRINT : INPUT "DATA INICIAL";SD$: IF SD$ = "^" THEN SD = 1: GOTO 315
285 D =  VAL ( LEFT$ (SD$,2)):M =  VAL ( MID$ (SD$,3,2)):Y =  VAL ( RIGHT$ (SD$,2))
290  IF M < 1 OR M > 12 OR Y < 72 OR Y > 99 OR D < 1 OR D > 31 THEN  PRINT "DATA INVALIDA": GOTO 280
295 Y = Y + 1900: IF  INT (Y / 4) = Y / 4 THEN D1$ = D2$
300 Y = Y - 1900: IF D >  VAL ( MID$ (D1$,M * 2 - 1,2)) THEN  PRINT "DATA INVALIDA": GOTO 280
305 TD = D + (Y - 72) * 365 +  INT ((Y - 69) / 4) +  VAL ( MID$ (D3$,3 * M - 2,3))
310  IF M > 2 AND (1900 + Y) / 4 =  INT ((1900 + Y) / 4) THEN TD = TD + 1
315  RETURN 
320  REM  DURACAO DE RECURSOS PARA CADA ATIVIDADE 
325  FOR J = 1 TO TA: HOME : PRINT "DURACAO DA ATIVIDADE E RECURSOS": PRINT 
330  PRINT "DURACAO DA ATIVIDADE": PRINT 
335 F =  INT (AD(J,1) / 1000):T = AD(J,1) - F * 1000 + SB:F = F + SB
340  PRINT AC$(J);": ";F;"-";T
345  PRINT : INPUT "NUMERO DE DIAS";A$:A =  VAL (A$): IF A < 0 GOTO 345
350 AD(J,3) = A: PRINT : INPUT "UNIDADES DE RECURSOS ALOCADAS";A$
355 A =  VAL (A$): IF A < 0 GOTO 355
360 AD(J,10) = A: NEXT J: PRINT : PRINT : INPUT "NOME DA REDE";NW$
365  REM  DATA CEDO DO EVENTO
370  HOME : PRINT "CALCULANDO AS DATAS CEDO"
375  FOR J = 1 TO TE: FOR K = 1 TO 3:ET(J,K) = 0: NEXT K: NEXT J:ET(1,1) = 1: FOR R = 2 TO TE: FOR C = 1 TO TE - 1
380  IF PT(R,C) = 0 GOTO 400
385 AN = C * 1000 + R: FOR J = 1 TO TA: IF AD(J,1) <  > AN GOTO 395
390  IF AD(J,3) + ET(C,1) > ET(R,1) THEN ET(R,1) = AD(J,3) + ET(C,1)
395  NEXT J
400  NEXT C: NEXT R
405  REM  DATA DO EVENTO
410  PRINT "CALCULANDO AS DATAS TARDE"
415 ET(TE,2) = ET(TE,1): FOR R = TE TO 2 STEP  - 1: FOR C = TE - 1 TO 1 STEP  - 1
420  IF PT(R,C) = 0 GOTO 445
425 AN = C * 1000 + R: FOR J = 1 TO TA: IF AD(J,1) <  > AN THEN  GOTO 440
430  IF ET(C,2) = 0 THEN ET(C,2) = ET(R,2) - AD(J,3): GOTO 440~20
435  IF ET(R,2) - AD(J,3) < ET(C,2) THEN ET(C,2) = ET(R,2) - AD(J,3)
440  NEXT J
445  NEXT C: NEXT R
450  REM  FOLGAS DAS ATIVIDADES
455  FOR J = 1 TO TE:ET(J,3) = ET(J,2) - ET(J,1): NEXT J
460  REM  CAMINHO CRITICO
465  FOR J = 1 TO TA:AD(J,2) = 0:F =  INT (AD(J,1) / 1000):T = AD(J,1) - F * 1000
470  IF ET(F,3) = 0 AND ET(T,3) = 0 AND ET(T,1) - ET(F,1) = AD(J,3) THEN AD(J,2) = 1
475  NEXT J
480  REM  PDI PDT UDI UDT FL FT PARA CADA ATIVIDADE
485  HOME : PRINT "CALCULANDO DATAS DAS ATIVIDADES"
490  FOR J = 1 TO TA:F =  INT (AD(J,1) / 1000):T = AD(J,1) - F * 1000
495 AD(J,4) = ET(F,1):AD(J,5) = AD(J,4) + AD(J,3) - 1
500 AD(J,7) = ET(T,2) - 1:AD(J,6) = AD(J,7) - AD(J,3) + 1
505 AD(J,8) = AD(J,7) - AD(J,5):AD(J,9) = ET(T,1) - AD(J,5) - 1
510  IF AD(J,3) = 0 THEN AD(J,5) = AD(J,4):AD(J,7) = AD(J,6)
515  NEXT J: GOTO 1425
520  REM  SUBROTINA PARA CORRECAO DA REDE
525  HOME : PRINT "CORRECAO DE DADOS:"
530  PRINT : PRINT : PRINT "1-CORRECA0 DE UMA ATIVIDADE"
535  PRINT "2-CORRECAO DA DATA INICIAL"
540  PRINT : PRINT : INPUT "OPCAO";A$:A =  VAL (A$): IF A < 1 OR A > 2 GOTO 540
545  IF A = 1 GOTO 555
550  GOSUB 265: GOTO 370
555  HOME : PRINT "CORRECAO DAS ATIVIDADES"
560  PRINT : PRINT "ENTRE COM O NUMERO DA ATIVIDADE"
565  PRINT : PRINT "DIGITE '^' PARA RETORNAR PARA O MENU":Z = 0
570  PRINT : INPUT "ATIVIDADE";A$:L =  LEN (A$)
575  IF A$ = "^" GOTO 370
580  PRINT : FOR J = 1 TO L: IF  MID$ (A$,J,1) <  > "-" GOTO 590
585 C = ( VAL ( LEFT$ (A$,J - 1)) - SB) * 1000:R =  VAL ( RIGHT$ (A$,L - J)) - SB:K = C + R:J = L:Z = 1
590  NEXT J: IF Z = 0 GOTO 605
595 Z = 0: FOR J = 1 TO TA: IF K = AD(J,1) THEN Z = 1:K = J:J = TA
600  NEXT J
605  IF Z = 0 THEN  PRINT "NAO EXISTE ESTE NUMERO": FOR J = 1 TO 2000: NEXT J: GOTO 555
610  PRINT : PRINT "A DURACAO ATUAL E"AD(K,3)
615  PRINT : INPUT "A NOVA DURACAO E ";A$:A =  VAL (A$): IF A < 0 GOTO 615
620 AD(K,3) = A: PRINT : PRINT "O RECURSO ATUAL E"AD(K,10)
625  PRINT : INPUT "O NOVO RECURSO E";A$:A =  VAL (A$): IF A < 0 GOTO 625
630 AD(K,10) = A: GOTO 555
635  REM  SELECAO DA TABELA DE EVENTOS
640  HOME : PRINT "TABELA DE EVENTOS"
645  PRINT "EM ORDEM ASCENDENTE"
650  PRINT : PRINT : PRINT "1-EVENTOS"
655  PRINT "2-DATA CEDO"
660  PRINT "3-DATA TARDE"
665  PRINT "4-TEMPO DE DURACAO"
670  PRINT : PRINT : INPUT "OPCAO";A$:S =  VAL (A$): IF S < 1 OR S > 4 GOTO 670
675  FOR J = 1 TO TE:SR(J) = J: NEXT J: IF S = 1 GOTO 705
680  PRINT "EVENTOS SELECIONADOS":S = S - 1: FOR J = 1 TO TE - 1: FOR K = J + 1 TO TE
685  IF ET(SR(J),S) <  = ET(SR(K),S) GOTO 695
690 A = SR(J):SR(J) = SR(K):SR(K) = A
695  NEXT K: NEXT J
700  REM  EXIBICAO DA TABELA DE EVENTOS 
705  PRINT "TABELA DE EVENTOS"
710  PR# 1
715  PRINT : PRINT : PRINT  TAB( 6)"TABELA DE EVENTOS    * "NW$" *": PRINT : PRINT 
720 Z = 0: FOR J = 1 TO TE
725  IF Z = 0 THEN  PRINT  TAB( 6)"EVENTOS      DC     DT   FOLGA": PRINT  TAB( 5)NL1$:Z = 1
730 K = SR(J): PRINT  TAB( 6)K + SB TAB( 18);: IF N = 1 THEN  GOSUB 740: GOTO 740
735  PRINT ET(K,1) TAB( 25)ET(K,2) TAB( 32)ET(K,3)
740  NEXT : PRINT  TAB( 5)NL1$: PRINT : PR# 0: GOTO 1425
745  REM  ORDENACAO DA TABELA DE ATIVIDADE
750  HOME : PRINT "TABELA DE ATIVIDADES": PRINT 
755  PRINT : PRINT "EM ORDEM ASCENDENTE": PRINT 
760  PRINT "1-ATIVIDADE"
765  PRINT "2-DURACAO"
770  PRINT "3-PRIMEIRA DATA DE INICIO"
775  PRINT "4-PRIMEIRA DATA DE TERMINO"
780  PRINT "5-ULTIMA DATA DE INICIO"
785  PRINT "6-ULTIMA DATA DE TERMINO"
790  PRINT "7-FOLGA LIVRE"
795  PRINT "8-FOLGA TOTAL"
800  PRINT : INPUT "OPCAO";A$:S =  VAL (A$): IF S < 1 OR S > 9 GOTO 800
805 S = S + 1: IF S = 2 THEN S = 1
810  PRINT : PRINT "ATIVIDADES SELECIONADAS": FOR J = 1 TO TA:SR(J) = J: NEXT J: IF S = 1 GOTO 840
815  FOR J = 1 TO TA - 1: FOR K = J + 1 TO TA
820  IF AD(SR(J),S) <  = AD(SR(K),S) GOTO 830
825 A = SR(J):SR(J) = SR(K):SR(K) = A
830  NEXT K: NEXT J
835  REM  EXIBICAO DA TABELA DE ATIVIDADES POR NUMERO DE DIAS
840  HOME : PRINT "TABELA DE ATIVIDADES": GOSUB 1640: IF N = 1 GOTO 895
845 Z = 0: FOR J = 1 TO TA:P = SR(J):F =  INT (AD(P,1) / 1000):T = AD(P,1) - F * 1000 + SB
850 F = F + SB:I$ =  MID$ ( STR$ (F),2,9):I1$ =  MID$ ( STR$ (T),2,9):B$ = I$ + "-" + I1$
860  PR# 1: IF Z = 0 THEN  PRINT : PRINT : PRINT  TAB( 6)"TABELA DE ATIVIDADES - EM TERMOS DE DIAS    * "NW$" *": PRINT : PRINT  TAB( 5)LN$
865  IF Z = 0 THEN  PRINT  TAB( 6)"ATIVIDADE                                    DUR    PDI    PDT    UDI    UDT     FL     FT    REC": PRINT  TAB( 5)LN$
870  IF AD(P,2) = 1 THEN  PRINT  TAB( 5)B$"*";: PRINT  TAB( 13)AC$(P);: GOTO 880
875  PRINT  TAB( 5)B$ TAB( 13)AC$(P);
880 Z = 64: PRINT  TAB( 46)
885  FOR K = 3 TO 10:D$(K) =  MID$ ( STR$ (AD(P,K)),2,9):Z1 = 6 -  LEN (D$(K)) + 1: PRINT  SPC( Z1) STR$ (AD(P,K));
890  NEXT K: PRINT : NEXT J: PRINT  TAB( 5)LN$: PR# 0: GOTO 1425
895  PR# 1:Z = 0: FOR J = 1 TO TA:P = SR(J):F =  INT (AD(P,1) / 1000):T = AD(P,1) - F * 1000 + SB
900 F = F + SB:G$ =  MID$ ( STR$ (F),2,9):G1$ =  MID$ ( STR$ (T),2,9):A$ = G$ + "-" + G1$
910  IF Z = 0 THEN  PRINT : PRINT : PRINT  TAB( 6)"TABELA DE ATIVIDADES - EM TERMOS DE DATAS    * "NW$" *": PRINT : PRINT  TAB( 5)LN$
915  IF Z = 0 THEN  PRINT  TAB( 6)"ATIVIDADE                                           DUR     PDI        PDT        UDI        UDT": PRINT  TAB( 5)LN$
920  IF AD(P,2) = 1 THEN  PRINT  TAB( 5)A$"*";: PRINT  TAB( 13)AC$(P);: GOTO 930
925  PRINT  TAB( 5)A$ TAB( 13)AC$(P);
930  GOSUB 285
935 Z = 12: PRINT  TAB( 56);:L5$ =  MID$ ( STR$ (AD(P,3)),2,9):L6 =  LEN (L5$):L7 = 3 - L6 + 1: PRINT  SPC( L7) MID$ ( STR$ (AD(P,3)),2,9);
940  FOR K = 4 TO 7:ND = AD(P,K) + TD - 1: GOSUB 35:L1 = 10 -  LEN (L2$) + 1: PRINT  SPC( L1)L2$;
945  NEXT K: PRINT : NEXT J: PRINT  TAB( 5)LN$
950  PR# 0: GOTO 1425
955  REM  EXIBICAO DAS ATIVIDADES CRITICAS
960  PRINT : PRINT  TAB( 10)"ATIVIDADES CRITICAS"~20
965 Z = 0: FOR J = 1 TO TA
970  PR# 1
975  IF Z = 0 THEN  PRINT : PRINT : PRINT  TAB( 6)"ATIVIDADES CRITICAS    * "NW$" *": PRINT : PRINT  TAB( 5)LN$
980  IF Z = 0 THEN  PRINT  TAB( 6)"ATIVIDADE                                         DUR   DATA DE INICIO    DIAS CORRIDOS": PRINT  TAB( 5)LN$
985 Z = 1
990  IF AD(J,2) = 0 GOTO 1015
995 F =  INT (AD(J,1) / 1000):T = AD(J,1) - F * 1000 + SB:F = F + SB
1000 J$ =  MID$ ( STR$ (F),2,9):K$ =  MID$ ( STR$ (T),2,9):A$ = J$ + "-" + K$
1005  PRINT  TAB( 5)A$ TAB( 13)AC$(J) TAB( 51);:L8$ =  MID$ ( STR$ (AD(J,3)),2,9):L9 =  LEN (L8$):LO = 6 - L9 + 1: PRINT  SPC( LO) MID$ ( STR$ (AD(J,3)),2,9);
1010 ND = AD(J,6) + TD - 1: GOSUB 35:M1 = 15 -  LEN (L2$) + 1: PRINT  SPC( M1)L2$;:V$ =  MID$ ( STR$ (AD(J,6)),2,9):T =  LEN (V$):T1 = 10 - T + 1: PRINT  SPC( T1) MID$ ( STR$ (AD(J,6)),2,9)
1015  NEXT J: PRINT  TAB( 5)LN$: PR# 0: GOTO 1425
1020  REM  GRAFICO DE GANTT
1025  HOME : PRINT "PROCESSANDO": GOSUB 1900
1030  FOR J1 = 1 TO AD(TA,7) STEP 60:J3 = J1 + 59
1035 Z = 0: FOR J = 1 TO TA:F =  INT (AD(J,1) / 1000):T = AD(J,1) - F * 1000 + SB
1040 F = F + SB:J$ =  MID$ ( STR$ (F),2,9):K$ =  MID$ ( STR$ (T),2,9):B$ = J$ + "-" + K$
1050  PR# 1: IF Z = 1 GOTO 1095
1055  PRINT : PRINT : PRINT  TAB( 6)"GRAFICO DE GANTT    * "NW$" *": PRINT : PRINT  TAB( 5)"=========="LN$
1060  PRINT  TAB( 6)"ATIVIDADE" TAB( 61)J1" "J1 + 4;: FOR J2 = 9 TO 59 STEP 5
1065 J9 = J2 + J1:P$ =  MID$ ( STR$ (J9),2,9):B1 =  LEN (P$):B2 = 3 - B1: PRINT  SPC( B2)J9;: NEXT J2: PRINT 
1070  GOSUB 285: GOSUB 1670
1075  PRINT 
1080  PRINT  TAB( 59);"   +";: FOR J2 = 4 TO 59 STEP 5
1085  PRINT "---+-";: NEXT J2: PRINT :Z = 1
1090  PRINT  TAB( 62);: FOR IJ1 = J1 TO J3: PRINT VE$(IJ1);: NEXT IJ1: PRINT 
1095  IF AD(J,2) = 1 THEN  PRINT  TAB( 5)B$"*";: PRINT  TAB( 13)AC$(J);: GOTO 1105
1100  PRINT  TAB( 5)B$ TAB( 13)AC$(J);
1105  IF (AD(J,4) < J1 AND ~20AD(J,5) < J1) OR (AD(J,4) > J3~20 AND ~20AD(J,5) > J3) GOTO 1175
1110 A$ = ">": IF AD(J,2) = 1 THEN A$ = "*"
1115 W1 =  LEN (AC$(J)):W = 49 - W1
1120  PRINT  SPC( W);
1125  FOR K = J1 TO J3: IF K < AD(J,4) OR K > AD(J,5) THEN 1135
1130  GOTO 1150
1135  IF VE$(K) <  > " " AND VE$(K) <  > "F" THEN  PRINT " ";: GOTO 1145
1140  PRINT " ";
1145  NEXT K
1150  FOR K = J1 TO J3: IF K >  = AD(J,4) AND K <  = AD(J,5) AND AD(J,3) <  > 0 THEN 1160
1155  GOTO 1170
1160  IF VE$(K) <  > " " AND VE$(K) <  > "F" THEN  PRINT A$;: GOTO 1170
1165  PRINT " ";
1170  NEXT K
1175  PRINT : NEXT J: PRINT  TAB( 5)"=========="LN$: PR# 0: NEXT J1
1180  PR# 1: PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT  TAB( 44)"FERIADOS NO PERIODO": PRINT : PRINT  TAB( 44)"===================": PRINT 
1185  FOR INA = 1 TO O1: IF GND(INA) <  = 2 OR GND(INA) > J3 THEN 1195
1190 MD$ =  MID$ ( STR$ (GND(INA)),2,9): PRINT  TAB( 46) SPC( 3 -  LEN (MD$));GND(INA);:ND = GND(INA) + TD - 1: GOSUB 35: PRINT "-"L2$"-";: GOSUB 1690: PRINT N$
1195  NEXT INA: PRINT  TAB( 44)"===================": PR# 0: GOTO 1425
1200  REM  EXIBICAO DO GRAFICO DE RECURSOS UTILIZADOS
1210 J2 = AD(TA,5): FOR J = 1 TO J2 STEP 30: PR# 1: PRINT : PRINT : PRINT  TAB( 6)"RECURSOS UTILIZADOS    * "NW$" *": PRINT : PRINT  TAB( 5)LN$
1220  PRINT  TAB( 6)RS$: PRINT  TAB( 5)LN$: PRINT  TAB( 14)"1   5    10   15   20   25   30   35   40"
1225  PRINT : PRINT  TAB( 6)"DIAS"
1230 J3 = J + 29: FOR J1 = J TO J3: IF J1 > J2 THEN J1 = J3: GOTO 1255
1235 X = 0: PRINT 
1240  FOR K = 1 TO TA: IF J1 >  = AD(K,4) AND J1 <  = AD(K,5) THEN X = X + AD(K,10)
1245  NEXT K: PRINT  TAB( 9)J1;: IF J1 < 10 THEN  PRINT " ";
1246  IF J1 < 100 THEN  PRINT " ";
1248  FOR K = 40 TO 1 STEP  - 1: IF K <  = X THEN  PRINT "*";
1250  NEXT K
1255  NEXT J1: PRINT : PRINT  TAB( 5)LN$: PR# 0: NEXT J: GOTO 1425
1260  REM  CHAMA REDE DA FITA 
1265  IF TA <  > 0 THEN 1515
1270  GOSUB 2020: PRINT "POSICIONE A FITA, APERTE A TECLA<RETURN> DO  MC-1000  E  ENTAO ATECLA <PLAY> DO GRAVADOR": INPUT A$
1274  DIM ST(6)
1275  LOAD * ST
1280 TA = ST(0):TE = ST(1):SB = ST(2):SD = ST(3):TD = ST(4): GOSUB 1620
1285  LOAD * SK
1287  LOAD * ET
1288  LOAD * AD
1289  LOAD * PT
1290  GOSUB 2020: PRINT " DESLIGUE O GRAVADOR E AGUARDE OPROCESSAMENTO"
1295  FOR J = 1 TO TA: FOR K = 0 TO 6
1300 AC$(J) = AC$(J) +  CHR$ ( INT (SK(J,K) * 1E - 4)) +  CHR$ ( INT (SK(J,K) * 1E - 2) - ( INT (SK(J,K) * 1E - 4) * 1E + 2)) +  CHR$ (SK(J,K) - ( INT (SK(J,K) * 1E - 2) * 1E + 2))~20
1305  NEXT K: NEXT J
1310 SD$ =  CHR$ ( INT (ST(5) * 1E - 4)) +  CHR$ ( INT (ST(5) * 1E - 2) - ( INT (ST(5) * 1E - 4) * 1E + 2)) +  CHR$ (ST(5) - ( INT (ST(5) * 1E - 2) * 1E + 2))
1315 SD$ = SD$ +  CHR$ ( INT (ST(6) * 1E - 4)) +  CHR$ ( INT (ST(6) * 1E - 2) - ( INT (ST(6) * 1E - 4) * 1E + 2)) +  CHR$ (ST(6) - ( INT (ST(6) * 1E - 2) * 1E + 2))
1317  PRINT : INPUT "NOME DA REDE";NW$
1320  GOTO 1425
1330  REM  GUARDA REDE
1335  IF TA = 0 THEN 1520
1340  GOSUB 2015: PRINT "AGUARDE O PROCESSAMENTO"
1350  FOR J = 1 TO TA
1355 Q = 1: FOR K = 0 TO 6
1360 SK(J,K) =  ASC ( MID$ (AC$(J),Q,1)) * 1E + 4 +  ASC ( MID$ (AC$(J),Q + 1,1)) * 1E + 2 +  ASC ( MID$ (AC$(J),Q + 2,1))
1365 Q = Q + 3: NEXT K: NEXT J
1370 ST(0) = TA:ST(1) = TE:ST(2) = SB:ST(3) = SD:ST(4) = TD:ST(5) =  ASC ( MID$ (SD$,1,1)) * 1E + 4 +  ASC ( MID$ (SD$,2,1)) * 1E + 2 +  ASC ( MID$ (SD$,3,1)):ST(6) =  ASC ( MID$ (SD$,4,1)) * 1E + 4 +  ASC ( MID$ (SD$,5,1)) * 1E + 2 +  ASC ( MID$ (SD$,6,1))
1375  GOSUB 2015: PRINT "     POSICIONE A FITA, APERTE ASTECLAS <REC><PLAY> DO GRAVADOR EENTAO TECLE <RETURN> NO MC-1000": INPUT A$
1380  SAVE * ST
1385  FOR J = 1 TO 20: NEXT J
1387  SAVE * SK
1389  SAVE * ET
1390  SAVE * AD
1391  SAVE * PT
1392  GOTO 1425
1395  REM  SAIDA DO PROGRAMA
1400  PRINT : INPUT "TEM CERTEZA (S/N)";A$
1405  IF A$ = "S" THEN  CALL 49251
1410  IF A$ = "N" GOTO 1425
1415  GOTO 1405
1420  REM  MENU
1425  HOME : INVERSE : PRINT "        * REDE PERT *          ": NORMAL : PRINT 
1430  PRINT "CONSTRUCAO DE UMA REDE........0"
1435  PRINT "CORRECAO DE DADOS.............1"
1440  PRINT "MOSTRA TABELA DE EVENTOS......2"
1445  PRINT "MOSTRA RECURSOS UTILIZADOS....3"
1450  PRINT "MOSTRA GRAFICO DE GANTT.......4"
1455  PRINT "MOSTRA TABELA DE ATIVIDADES...5"
1460  PRINT "MOSTRA ATIVIDADES CRITICAS....6"
1465  PRINT "CHAMA REDE DA FITA............7"
1470  PRINT "GUARDA REDE NA FITA...........8"
1475  PRINT "SAIDA DO PROGRAMA.............9"
1480  PRINT "ANULA REDE DA MEMORIA.........A"
1485  PRINT : PRINT  TAB( 21)" ";: INPUT "OPCAO ";A$: HOME 
1490  IF A$ = "A" THEN  RUN 25
1495 A =  VAL (A$): IF A < 0 OR A > 9 GOTO 1425
1500  IF (A = 0 OR A = 7) AND NW = 1 GOTO 1515
1505  IF ((A > 0 AND A < 7) OR A = 8) AND NW = 0 GOTO 1520
1510 NW = 1: GOTO 1525
1515  PRINT "A REDE JA ESTA NA MEMORIA": GOSUB 1535: GOTO 1425
1520  PRINT "A REDE NAO ESTA NA MEMORIA": GOSUB 1535: GOTO 1425
1525  ON A + 1 GOTO 100,525,640,1210,1025,750,960,1265,1335,1400
1530  REM  PAUSA
1535  INPUT "TECLE <RETURN> P/CONTINUAR";A$: RETURN 
1550  REM  INICIALIZAR
1555 LN$ = "=====================================================================================================================":RS$ = "RECURSOS"
1560 NL1$ = "==================================="
1565 D1$ = "312831303130313130313031"
1570 D2$ = "312931303130313130313031"
1575 D3$ = "000031059090120151181212243273304334":TF$ = "=":FF$ = "+"
1580 J = 0:K = 0:D1 = 0:D2 = 0:D3 = 0:YN = 0:ND = 0:DN = 0:TD = 0
1585 A1 = 34:A2 = 365:A3 = 3:A4 = 4:A5 = 31:A6 = 72:A7 = 1:A8 = 2
1590 C = 0:R = 0:X = 0:A = 0:D = 0:M = 0:Y = 0:SD = 0:F = 0:T = 0:S = 0:P = 0:AN = 0
1595 SB = 0:TA = 0:TE = 0:LN = 0:NW = 0:N = 0
1597 ST$ = "                     "
1600 A$ = " ":B$ = " ":D$ = " ":SD$ = " ":D$ = " ":CR$ =  CHR$ (13): RETURN 
1605  REM  LINHA DE CORRESPONDENCIA DA TELA
1610  PR# 1:LN = 1:Z = 0: RETURN 
1615  REM  DIMENSIONAMENTO DAS MATRIZES
1620  DIM AC$(TA),PT(TE,TE),AD(TA,10),ET(TE,3),VE$(240),GND(240)
1625 Z = TE: IF TA > TE THEN Z = TA
1630  DIM SR(Z): DIM SK(TA,6): RETURN 
1635  REM  ESCOLHA DO FORMATO EM DATA OU DIAS
1640  IF SD = 1 THEN N = 2: GOTO 1660
1645  PRINT "TABELAS EM TERMOS DE :": PRINT : PRINT : PRINT "1-DATAS": PRINT "2-DIAS": PRINT 
1655  PRINT : PRINT : INPUT "OPCAO";A$:N =  VAL (A$): IF N < 1 OR N > 2 GOTO 1655
1660  RETURN 
1665  REM  IMPRESSAO DAS DATAS
1670 ND = J1 + TD - 1: GOSUB 35: PRINT  TAB( 60);L2$;:DA =  LEN (L2$):DA1 = 5 - DA + 5: PRINT  SPC( DA1);
1675  FOR J6 = 9 TO 59 STEP 10:J7 = J6 + J1:ND = J7 + TD - 1: GOSUB 35: PRINT L2$;:DA =  LEN (L2$):DA1 = 5 - DA + 5: PRINT  SPC( DA1);: NEXT J6
1680  RETURN 
1685  REM  CALCULO DO DIA DA SEMANA
1690 Y =  VAL ( RIGHT$ (L2$,2)):M =  VAL ( MID$ (L2$,4,2)):D =  VAL ( LEFT$ (L2$,2))
1695 ME = M:AN1 = Y:DI = D
1700  IF ME > 2 THEN 1715
1705 ME = ME + 12
1710 AN1 = AN1 - 1
1715 AN1 = AN1 + 1900
1720 NS = DI + 2 * ME +  INT (.6 * (ME + 1)) + AN1 +  INT (AN1 / 4) -  INT (AN1 / 100) +  INT (AN1 / 400) + 2
1725 NS =  INT ((NS / 7 -  INT (NS / 7)) * 7 + .5)
1730  IF (NS) > 0 THEN 1740
1735 N$ = " ": GOTO 1795
1740  IF NS > 1 THEN 1750
1745 N$ = " ": GOTO 1795
1750  IF NS > 2 THEN 1760
1755 N$ = "S": GOTO 1795
1760  IF NS > 3 THEN 1770
1765 N$ = "T": GOTO 1795
1770  IF NS > 4 THEN 1780
1775 N$ = "Q": GOTO 1795
1780  IF NS > 5 THEN 1790
1785 N$ = "Q": GOTO 1795
1790 N$ = "S": GOTO 1795
1795  RETURN 
1800  REM  CALCULO DOS FERIADOS 
1805  GOSUB 285
1810 FERIADO$ = "070985121085021185151185251285010186250186110286120286280386210486010586290586070986121086021186151186251286"
1815 DMA$ = SD$
1820 FERIADO$ = FERIADO$ + DMA$
1825 O =  LEN (FERIADO$):O1 = O / 6
1830 M5 = 1
1835  FOR M3 = 1 TO O - 5 STEP 6
1840 M1 = M3 + 2:M2 = M3 + 4
1845 LDIA =  VAL ( MID$ (FERIADO$,M3,2))
1850 LMES =  VAL ( MID$ (FERIADO$,M1,2))
1855 LANO =  VAL ( MID$ (FERIADO$,M2,2))
1860 LTD2 = LDIA + (LANO - 72) * 365 +  INT ((LANO - 69) / 4) +  VAL ( MID$ (D3$,3 * LMES - 2,3))
1865  IF LMES > 2 AND (1900 + LANO) / 4 =  INT ((1900 + LANO) / 4) THEN LTD2 = LTD2 + 1
1870 AB9 = LTD2 - TD + 1: IF AB9 < 0 THEN 1880
1875 GND(M5) = AB9:M5 = M5 + 1
1880  NEXT M3
1885  RETURN 
1890  REM  MONTAGEM DO VETOR CALENDARIO
1900  GOSUB 285: FOR N1 = 1 TO 240:ND = N1 + TD - 1
1905  GOSUB 35
1910  GOSUB 1690
1915 VE$(N1) = N$
1920  NEXT N1
1925  GOSUB 1805
1930  FOR MN1 = 1 TO 240:AB1 = GND(MN1)
1935  IF AB1 <  = 2 OR AB1 > 240 THEN 1945
1940 FO$ = "F":VE$(AB1) = FO$
1945  NEXT MN1
1950  FOR J = 1 TO TA~20
1955  FOR K = 1 TO 240: IF K < AD(J,4) THEN 1965
1960  GOTO 1980
1965  IF VE$(K) <  > " " AND VE$(K) <  > "F" THEN 2000
1970 AD(J,5) = AD(J,5) + 1:AD(J,4) = AD(J,4) + 1:AD(J,6) = AD(J,6) + 1:AD(J,7) = AD(J,7) + 1
1975  GOTO 2000
1980  IF K >  = AD(J,4) AND K <  = AD(J,5) THEN 1990
1985  GOTO 2000
1990  IF VE$(K) <  > " " AND VE$(K) <  > "F" THEN  GOTO 2000
1995 AD(J,5) = AD(J,5) + 1:AD(J,7) = AD(J,7) + 1
2000  NEXT K
2005  NEXT J
2010  RETURN 
2015  HOME : PRINT "          GUARDA REDE": PRINT : PRINT : RETURN 
2020  HOME : PRINT "           CHAMA REDE": PRINT : PRINT : RETURN 