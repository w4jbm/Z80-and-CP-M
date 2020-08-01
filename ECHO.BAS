100 REM Echo Command Line Argument (ECHO.BAS)
110 REM
120 REM A demonstration of how to pull command line arguments
130 REM into BASIC. Note, that this only works with compiled BASCOM
140 REM programs. MBASIC sets the CCP arguments field to zeros.
150 REM
160 REM by Jim McClanahan W4JBM (July 2020)
170 REM
180 REM The first chrarcharacter is usually a space and can
190 REM be ignored.
200 REM
210 REM CCP converts all alpha characters to upper case.
220 REM
230 REM Commands to save and build:
240 REM in MBASIC...
250 REM   SAVE "ECHO.BAS",A
260 REM   SYSTEM
270 REM from CP/M prompt...
280 REM   BASCOM =ECHO/N/Z
290 REM   L80 ECHO,ECHO/N/E
300 REM
310 L%=PEEK(128)
320 IF L%=0 THEN 390
330 FOR M%=129 TO 128+L%
340 C%=PEEK(M%)
350 IF M%=129 AND C%=32 THEN GOTO 370
360 PRINT CHR$(C%);
370 NEXT M%
380 PRINT
390 END
