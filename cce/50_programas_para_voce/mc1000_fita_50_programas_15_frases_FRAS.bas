0  REM ************************
1  REM *     - CCESOFT -      *
2  REM *OTTO LONGO SERNATINGER*
3  REM *  VERSAO 1.1   05/85  *
4  REM ************************
5  REM *        FRASES        *
6  REM ************************
10  HOME 
15  PRINT  TAB( 11)"- CCESOFT -": PRINT 
20  PRINT  TAB( 7)"ESTE PROGRAMA ''CRIA''
30  PRINT  TAB( 6)"FRASES A PARTIR DE DOIS
40  PRINT  TAB( 8)"BANCOS DE PALAVRAS
50  POKE 284,0
51  PRINT : PRINT  TAB( 5)"QUALQUER LETRA CONTINUA ";
52  IF  PEEK (284) < 48 THEN 52
60  HOME 
450  REM    ESCOLHA DA PRIMEIRA                  PALAVRA         
500 A =  RND (8) * 29 + 1
510  FOR I = 1 TO A
520  READ A$
530  NEXT I
535  REM    ESCOLHA DA SEGUNDA                   PALAVRA         
540  RESTORE 2000
600 A =  RND (8) * 59 + 1
610  FOR I = 1 TO A
620  READ B$
630  NEXT I
635  REM    ESCOLHA DA TERCEIRA                  PALAVRA         
640  RESTORE  2000
700 A =  RND (8) * 59 + 1
710  FOR I = 1 TO A
720  READ C$
730  NEXT I
735  REM     VERIFICA SE AS               PALAVRAS SAO IGUAIS    
740  IF C$ = B$ THEN 640
900 P$ = A$ + " " + B$ + " " + C$
903  REM   VERIFICA SE A FRASE            CABE NUMA UNICA LINHA  
905  IF  LEN (P$) > 32 THEN  PRINT A$ + " " + B$: PRINT C$: GOTO 910
906  PRINT P$
908  REM   VOLTA                  
910  PRINT : RESTORE : FOR A = 1 TO 1000: NEXT A: GOTO 500
950  REM 
960  REM  BANCOS DE PALAVRAS
970  REM 
1000  DATA AGRUPAMENTO,FOTOSSINTETIZADOR,AMBIENTE,PROCESSO,CURRICULUM,ALGORITMO,RESULTADO,RECURSO,ESTATUTO,APRENDIZADO,COMPORTAMENTO,RELATORIO,IMPACTO,DESENVOLVIMENTO
1100  DATA CONGRESSO,IMPETO,CONSORCIO,RESULTADO,ARQUIVO,MODELO,COMPUTADOR,GRAVADOR,TELEMETRO,CONTRAPINO,PARAFUSO,ALICATE,ASTROLABIO,GERADOR,COMANDO,PINCEL
2000  DATA HUMANISTICO,SEQUENCIAL,CLASSIFICAVEL,SUBSTANTIVO,NOMINAL,INTEGRADO,CRIATIVO,MOTIVACIONAL,VERTICAL,PSICOLOGICO,AUTORITARIO,OBJETIVO,EXTRA-ASSOCIATIVO,NUCLEAR,CONSULTIVO,NORMATIVO
2100  DATA COGNITIVO,PROJETIVO,ANALITICO,PROGRAMAVEL,COMPOSTO,MECANICO,INTROSPECTIVO,SUBJETIVO,ARCAICO,AUTOMATICO,CICLOTRONICO,BIVALVE,ELETRONICO,ESTRATIFICADO
3000  DATA BASICO,COMPORTAMENTISTA,ORIENTADOR,FLEXIVEL,DIFERENCIADO,DESCOBERTO,MENSURAVEL,HOMOGENEO,HETEROGENEO,MODULAR,PEDAGOGICO,APROPRIADO,INTRINSECO,EXTRINSECO,ILIMITADO,PRIORITARIO,PENTAFASICO,INFORMATIVO
3100  DATA IMPLEMENTAVEL,POTENCIAL,ESPACIAL,LUNAR,PLANETARIO,ESTELAR,ALADO,SUBMARINO,IRREVOGAVEL,CONCOMITANTE,ATUAL,ANTIQUADO