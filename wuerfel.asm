CSEG AT 0H
LJMP Anfang

org 0003h
call interrupt
ret

org 0bh
reti

Anfang:
mov tmod, #00000010b 
mov tl0, #0c0h ; working #0C0h 
mov th0, #0c0h ; working #0C0h 
setb tr0
MOV R0, #22H
MOV P1, #0h
MOV p2, #1h
mov a, #1h
call idle
call sechs
mov ie, #10000011b ; interupts freischalten
jmp infinity







call idle
MOV A, #1H
jmp eins

rotieren:
RL A
mov P2, A
ret

idle:
DJNZ R0, idle
ret

eins:
	mov r2, #1h
	mov p1, #0h;a
	call rotieren;b
	call rotieren;c
	call rotieren;d
	mov p1, #18h
	call rotieren;e
	mov p1, #0h
	call rotieren;f
	call rotieren;g
	call rotieren;h
	call rotieren;
	ret

zwei:
	mov r2, #2h
	mov p1, #6h
	call rotieren
	mov p1, #0h
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	call rotieren
	mov p1, #060h
	call rotieren
	mov p1, #0h
	call rotieren
	ret

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
	mov p1, #60h
	call rotieren
	mov p1, #0h
	call rotieren
	ret
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
	ret
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
	ret
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
	call rotieren
	ret


interrupt:
	mov r4, a
	mov a, tl0
	mov b, #06h
	div ab
	mov r3, b
	mov a, r4
	cjne r3, #0h, case1
	call eins
	reti

case1:
	cjne r3, #1h, case2
	call zwei
	reti

case2:
	cjne r3, #2h, case3
	call drei
	reti

case3:
	cjne r3, #3h, case4
	call vier
	reti

case4:
	cjne r3, #4h, case5
	call fuenf
	reti

case5:
	call sechs
	reti


infinity:
jnc infinity
end
