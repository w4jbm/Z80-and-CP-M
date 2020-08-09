# Hints for MBASIC under CP/M

## Delect Key Behavior
By default, the delete key in MBASIC 5.21 behaves in a way that dates back to the days of having a teletype machine as the input device. If you start to type something like:

```MISTEAK```

and hit the delete key three time to correct thing, you'll end up with a line that looks something like this:

```MISTEAK\KAE\AKE```

The garbage in the middle is basically the systems ways to telling you that you've deleted K then A and finally E before you type in the correction. (I have actually used a teletype to remotely enter commands way back. The "echo" telling you the character has made the round trip and the documented "delete" made a lot of sense with the technology of the time. It's just a nusance for most hobbyists five decades later...)

I did find some instructions on "patching" MBASIC 5.21 to make the DELETE key behave like the BACKSPACE key. The steps to install the patch and save a patched copy of MBASIC are below:

```
A>DDT MBASIC.COM
DDT VERS 1.4
NEXT  PC
6000 0100
-L4B41
  4B41  LDA  0792
  4B44  ORA  A
  4B45  MVI  A,5C
  4B47  STA  0792
  4B4A  JNZ  4B55
  4B4D  DCR  B
  4B4E  JZ   4B27
  4B51  CALL 40D6
  4B54  INR  B
  4B55  DCR  B
  4B56  DCX  H
-A4B41
4B41  MVI A,08
4B43  JMP 4BBC
4B46  .
-L4B41
  4B41  MVI  A,08
  4B43  JMP  4BBC
  4B46  MOV  E,H
  4B47  STA  0792
  4B4A  JNZ  4B55
  4B4D  DCR  B
  4B4E  JZ   4B27
  4B51  CALL 40D6
  4B54  INR  B
  4B55  DCR  B
  4B56  DCX  H
-G0
A>SAVE 96 MBASIC.COM
A>MBASIC
BASIC-80 Rev. 5.21
```
