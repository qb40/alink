;Sample COFF object file
;assemble with
;NASM -fwin32 tcoff.asm
;link with
;ALINK -oPE tcoff win32.lib -entry main

[extern MessageBoxA]
[extern __imp_MessageBoxA]

[segment .text]
[global main]

main:
push dword 0 ; OK button
push dword title1
push dword string1
push dword 0
call MessageBoxA

push dword 0 ; OK button
push dword title1
push dword string2
push dword 0
call [__imp_MessageBoxA]

ret

[segment .data]

string1: db 'hello world, through redirection',13,10,0
title1: db 'Hello',0
string2: db 'hello world, called through import table',13,10,0

