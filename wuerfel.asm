CSEG AT 0H
ZUF8R equ 20h
LJMP Anfang

org 0003h
call interrupt
reti

org 0bh
reti

Anfang:
MOV R0, #22H;idle Time
MOV P1, #0h
MOV p2, #1h
mov a, #1h
call idle

mov ie, #10000011b ; interupts freischalten
jmp infinity

rotieren:
RL A
mov P2, A
ret

idle:
DJNZ R0, idle
ret

eins:
	mov r2, #0h
	mov p1, #0h;
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
	ret

zwei:
	mov r2, #1h
	mov p1, #3h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	mov p1, #0C0h
	call rotieren
	mov p1, #0h
	call rotieren
	ret

drei:
	mov r2, #2h
	mov p1, #3h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #18h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #0C0h
	call rotieren
	mov p1, #0h
	call rotieren
	ret
vier:
	mov r2, #3h
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	ret
fuenf:
	mov r2, #4h
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #18h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	ret
sechs:
	mov r2, #5h
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	mov p1, #0C3h
	call rotieren
	mov p1, #0h
	call rotieren
	ret


interrupt:
	jnb P3.0, ende
	mov r4, a
	
	call ZUFALL
	mov b, #6h
	div ab
	mov r3, b

	mov a, r4
	mov p1, #0h
	mov p2, a
	cjne r3, #0h, case1
	call eins
	ret

ZUFALL:	mov	A, ZUF8R   ; initialisiere A mit ZUF8R
	jnz	ZUB
	cpl	A
	mov	ZUF8R, A
ZUB:	anl	a, #10111000b
	mov	C, P
	mov	A, ZUF8R
	rlc	A
	mov	ZUF8R, A
	ret


case1:
	cjne r3, #1h, case2
	call zwei
	ret

case2:
	cjne r3, #2h, case3
	call drei
	ret

case3:
	cjne r3, #3h, case4
	call vier
	ret

case4:
	cjne r3, #4h, case5
	call fuenf
	ret

case5:
	call sechs
	ret

ende:
	mov r0, #012h
	call idle
	mov r4, a
	mov a, r2
	mov r3, a
	mov a, r4
	cjne r3, #0h, case1
	call eins
	ret

infinity:
jmp infinity

end
