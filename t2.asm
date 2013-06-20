; t2.asm
; assemble with:
; nasm -fobj t2.asm
;
; link with
; alink -oPE t2
;
; run with
; t2
;
; expected output is four message boxes. First two say "Hello" in title
; last two say "Bye" in title
	
import start tdll.dll
import title1 tdll.dll
	
extern start
extern title1

segment code public use32 class=CODE

..start:	
exestart:
 call [start]		;display two message boxes
			;need to call [start], since start gives address
			;of Import Address Table entry, a pointer to routine

 mov ebx,[title1]	;get address of title1 from IAT
 mov [ebx],byte 'B'
 mov [ebx+1],byte 'y'
 mov [ebx+2],byte 'e'
 mov [ebx+3],byte 0

 call [start]

ret
