; Atividade 1

org 0000h

main:
	JMP transf_dados

transf_dados:
	MOV A, #12h
	MOV A, #0h
	MOV R2, #34h
	MOV B, #56
	MOV 0x40, P1
	MOV 0x0B, 0x40	;Movendo diretamente com o endereço (0x0B) é mais exige mais ciclos de máquina, mas como são poucas operações não faz muita diferença
	MOV 0x50, 0x0B
	MOV R1, #00110010b
	MOV A, @R1
	MOV DPTR, #0x9A5B
	JMP encerramento

inst_aritm:
	MOV ACC, #2
	MOV B, #3
	MOV R4, #7
	ADD A, R4
	DEC ACC
	DEC ACC
	DEC ACC
	DEC B
	SUBB A, B
	MUL AB
	INC B
	INC B
	DIV AB
	MOV 0x70, A
	MOV 0x71, B
	JMP encerramento
	
inst_logic_bool:
	MOV A, #11001100b
	MOV B, #10101010b
	ANL A, B
	RR A
	RR A
	CPL A
	RL A
	RL A
	ORL A, B
	XRL A, B
	SWAP A
	JMP encerramento

inst_desvio:
	CLR A
	MOV R0, #10h
	JZ bloco2
	JNZ bloco3
	NOP

bloco2:
	MOV A, R0
	JMP bloco3 ; Conferir

bloco3:
	DJNZ R0, bloco3
	JMP inst_desvio

encerramento:
	JMP $
	END





; ---------------------
; Atividade 2

ORG 0000h
JMP main

main:
	; ORG 33h ; resolver
	MOV R0, #20h
	MOV R1, #0h

loop:
	MOV A, @R0
	SUBB A, #45h
	JNC terceira
	INC R1

terceira:
	INC R0
	CJNE R0, #24h, loop
	NOP
	JMP $