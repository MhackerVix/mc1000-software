0  REM ************************
1  REM **      - CCESOFT -   **
2  REM ** FELIPE ABRAMVEZT   **
3  REM ** VERSAO 1.1   05/85 **
4  REM ************************
5  REM **    GRAFIMANIA      **
6  REM ************************
9  HGR 
10 F = 0:G = 0
20  PLOT 127,95 TO 1,F
30 F = F + 10
40  IF F < 191 GOTO 20
50  PLOT 127,95 TO G,191
60 G = G + 10
70  IF G < 255 GOTO 50
80 F = 191
90  PLOT 127,95 TO 255,F
100 F = F - 10
110  IF F > 0 THEN  GOTO 90
130 G = 255
140  PLOT 127,95 TO G,1
150 G = G - 10
155  IF G > 0 THEN  GOTO 140
156  REM ........APAGA LINHAS DANDO A PERSPECTIVA..............
160 F = 0:G = 0
170  UNPLOT 127,95 TO 1,F
180 F = F + 10
190  IF F < 191 GOTO 170
200 F = 191
210  UNPLOT 127,95 TO 255,F
220 F = F - 10
230  IF F > 0 GOTO 210
231  REM 
232  REM ..........PLOTAGEM EM BAIXA RESOLUCAO..........
240  GR ~20
250 L = 0:A = 1:B = 2:C = 3
251  REM .......DEFINICAO DA VARIAVEL DE COR................
260 F = 0:A = A + 1: IF A > 3 THEN A = 1
270  COLOR  = A: PLOT 63,31 TO 1,F
280 F = F + 3: IF F < 63 THEN  GOTO 270
290 F = 1
300  COLOR  = A: PLOT 63,31 TO F,63
310 F = F + 5: IF F < 127 THEN  GOTO 300
320 F = 63
330  PLOT 63,31 TO 126,F
340 F = F - 3: IF F > 0 THEN  GOTO 330
350 F = 126
360  PLOT 63,31 TO F,1
370 F = F - 5: IF F > 1 THEN  GOTO 360
380 L = L + 1: IF L < 4 THEN  GOTO 260
381  REM .......VOLTA AO INICIO DO PROGRAMA.......
390  GOTO 5
