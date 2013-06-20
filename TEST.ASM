ideal

p386

model use32 flat

includelib "win32.lib"
extrn MessageBoxA:near
extrn __imp_MessageBoxA:dword

codeseg

start:
push 0 ; OK button
push offset title1
push offset string1
push 0
call MessageBoxA

push 0 ; OK button
push offset title1
push offset string2
push 0
call large [large __imp_MessageBoxA]

ret

dataseg

string1: db 'hello world, through redirection',13,10,0
title1: db 'Hello',0
string2: db 'hello world, called through import table',13,10,0

end start
