CSEG AT 0H
LJMP Anfang
ORG 100H

Anfang:

MOV R0, #22H
MOV P1, #0h
MOV p2, #1h
call idle
MOV A, #1H
jmp eins

rotieren:
mov P2, A
RL A
ret

idle:
DJNZ R0, idle
ret


eins:
	mov r2, #1h
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	mov p1, #18h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	jmp zwei

zwei:
	mov r2, #2h
	mov p1, #6h
	call rotieren
	mov p1, #0h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	mov p1, #060h
	call rotieren
	mov p1, #0h
	call rotieren
	jmp drei

drei:
	mov r2, #3h
	mov p1, #6h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #18h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #060h
	call rotieren
	mov p1, #0h
	call rotieren
	jmp vier
vier:
	mov r2, #4h
	mov p1, #66h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	mov p1, #66h
	call rotieren
	mov p1, #0h
	call rotieren
	jmp fuenf
fuenf:
	mov r2, #5h
	mov p1, #66h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #18h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #66h
	call rotieren
	mov p1, #0h
	call rotieren
	jmp sechs
sechs:
	mov r2, #6h
	mov p1, #66h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #66h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #66h
	call rotieren
	mov p1, #0h
	jmp eins