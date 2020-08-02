# Z80-and-CP-M
Various small Z80 and CP/M related projects. Some of these assemble under the Z80ASM assembler from SLR. I have also been experimenting with creating .COM files using the Microsoft BASCOM compiler.

NOTE: I primarly use Z80 assembly language and also use the /Z flag on the BASCOM code (as is mentioned in the comments of those files). If you want to use the BASCOM examples on the 8080/8085 (or an emulator/clone like the Arduino-based Altair 8800 with the Z80 enabled), things should work but you do not want to use the /Z option when invoking BASCOM.

## CPUTYPE.Z80
This program assembles and runs under CP/M and will tell you the type of processor (8080, Z80, or Z180) you are running. This was originally in a batch of CP/M examples with very little explaination of the logic. I created most of the detailed commentary (130 lines vs 55 lines) for my own edification.

## ECHO.BAS
This was one of my first "proof-of-concept" programs to demonstrate passing arguments from the CP/M command line to a BASIC program compiled using BASCOM.

## UNIX2CPM.BAS
Not pretty, but pretty useful... This is a more meaningful demonstration of passing command line arguments and is useful when using RunCPM on a Linux box. This replaces LFs with CR/LFs similar to Linux's unix2dos command, but runs under CP/M. Linking shows a size of 1,490 bytes and STAT shows 13 records (1,664 byes). This is similar in size to other utilities doing the same thing and actually significanly smaller than some version written in C.

While the code isn't elegant, the flow it has is similar to how I would write a prototype prior to coding in assembly language.

## XMODEM
Source, executable, and base config file for Eberhard's fantastic XMODEM V2.7 program. Lots of older versions are floating around and I was tired of trying to track down the right version each time I was setting up a new computer or environment.

## And the fine print...
The copyright for most of the various files are held by others and subject to various terms and conditions. I have tried to recognize those involved and have left any notices or attribution in place with the files used.

These are intended for personal use only. Any material will be removed at the request of the copyright holder or those holding other rights to it.

To the extent applicable, any original work herein is:

Copyright 2020 by James McClanahan and made available under the terms of The MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
