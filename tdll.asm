; tdll.asm
;
; assemble with
; nasm -fobj tdll.asm
;
; link with
; alink -oPE -dll tdll win32.lib
; (win32.lib is available from my web page)
	
global start
global title1
	
export start
export title1

;these names are defined in win32.lib as the names of
;a stub proc, and the IAT entry name for MessageBoxA
extern MessageBoxA
extern __imp_MessageBoxA

segment code public use32 class=CODE

;DLL entry point - do nothing, but flag success
;This is a STDCALL entrypoint, so remove 3 params from stack on return
..start:	
dllstart:
 mov eax,1
 ret 12

;exported procedure
start:
push dword 0 ; OK button
push dword title1
push dword string1
push dword 0
call MessageBoxA	;call stub routine in win32.lib

push dword 0 ; OK button
push dword title1
push dword string2
push dword 0
call [__imp_MessageBoxA]	;call routine via IAT

ret

segment data public use32 class=DATA

string1: db 'hello world, through redirection',13,10,0
;exported data
title1: db 'Hello',0
string2: db 'hello world, called through import table',13,10,0
