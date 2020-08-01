100 REM Replace LF with CR/LF (UNIX2CPM.BAS)
110 REM
120 REM This program is designed to be compiled using BASCOM
130 REM and assumes the command line arguments passed at $80
140 REM are present. A subroutine that can be invoked if the
150 REM buffer is empty is included for testing.
160 REM
170 REM Other actions include stripping the high bit off of
180 REM any input.
190 REM
200 REM by Jim McClanahan W4JBM (July 2020)
210 REM
220 REM Commands to save and build:
230 REM in MBASIC...
240 REM   SAVE "UNIX2CPM.BAS",A
250 REM   SYSTEM
260 REM from CP/M prompt...
270 REM   BASCOM =UNIX2CPM/N/E/Z
280 REM   L80 UNIX2CPM,UNIX2CPM/N/E
290 REM
300 REM FI$ is Input, FO$ is Output, and FB$ is Backup
310 REM
320 L%=PEEK(128)
330 REM IF L%=0 THEN GOTO 970 : REM For testing, other REMark out
340 IF L%<2 THEN GOTO 800 : REM Print Help
350 P%=0 : REM Flag for if we hit period in name
360 FOR I%=2 TO L%
370 C%=PEEK(128+I%)
380 FI$=FI$+CHR$(C%)
390 IF C%=46 THEN P%=1
400 IF P% THEN GOTO 430
410 FO$=FO$+CHR$(C%)
420 FB$=FB$+CHR$(C%)
430 NEXT I%
440 FO$=FO$+".$$$"
450 FB$=FB$+".BAK"
460 REM
470 REM No error checking yet because we will overwrite the
480 REM temporary file, even if it already exists.
490 REM
500 OPEN "O",1,FO$
510 REM
520 REM We turn on error checking before opening input file
530 REM because if it doesn't exist we will issue a "file
540 REM not found" error.
550 REM
560 ON ERROR GOTO 890
570 OPEN "I",2,FI$
580 IF EOF(2) THEN 950 : REM Warn file was empty when opened
590 IF EOF(2) THEN 700 : REM We have hit EOF
600 A$=INPUT$(1,#2)
610 A1%=ASC(A$)
620 IF A1%=10 THEN PRINT #1,"" : REM Ignore CRs and output CR LF on LF
630 IF A1%>31 THEN 680 : REM good characters
640 IF A1%=9 THEN 680 : REM allow tabs
650 IF A1%=12 THEN 680 : REM allow form feeds
660 REM IF A%1=27 THEN 590 : REM allow escape code
670 GOTO 590
680 PRINT #1,CHR$(A1%);
690 GOTO 590
700 PRINT #1,CHR$(26); : REM End of file
710 CLOSE #1
720 CLOSE #2
730 ON ERROR GOTO 750 : REM Old backup file may or may not exist
740 KILL FB$
750 RESUME 760
760 ON ERROR GOTO 0 : REM Should be safe to rename files
770 NAME FI$ AS FB$
780 NAME FO$ AS FI$
790 END
800 REM
810 REM Print Help
820 REM
830 PRINT "UNIX2CPM V1.0 by Jim McClanahan W4JBM"
840 PRINT "Usage: UNIX2CPM filename.ext
850 CLOSE:END
860 REM
870 REM Print file not found error message
880 REM
890 PRINT "File ";FI$;" Not Found"
900 END
910 REM
920 REM Print input file empty warning
930 REM (maybe because name was mistyped)
940 REM
950 PRINT "File ";FI$;" Empty"
960 CLOSE:END
970 REM
980 REM Force fill of data buffer for testing...
990 REM
1000 REM T$=" TEXT.TXT"
1010 REM POKE 128,LEN(T$)
1020 REM FOR I%=1 TO LEN(T$)
1030 REM POKE 128+I%,ASC(MID$(T$,I%,1))
1040 REM NEXT I%
1050 REM PRINT "Filename forced... Poke 128,0 for another try."
1060 REM GOTO 320 : REM Jump back with buffer filled...
