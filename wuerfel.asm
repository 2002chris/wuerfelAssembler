CSEG AT 0H
LJMP Anfang
ORG 100H

Anfang:

MOV R0, #8H
MOV P1, #1H
MOV A, #1H
jmp durchlaufen

durchlaufen:
mov P2, A
RL A

DJNZ R0, durchlaufen
jmp anfang