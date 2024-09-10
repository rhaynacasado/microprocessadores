org 0000h

main:

transfdados:
	MOV A, #12h
	MOV A, #0h
	MOV R2, #34h
	MOV B, #56h
	MOV 0x40, P1	;Conferir
	MOV 0x0B, 0x40
	MOV 0x50, 0x0B	;Conferir
	MOV R1, 0x50b	;Conferir
	MOV A, @R1
	MOV DPTR, #0x9A5B