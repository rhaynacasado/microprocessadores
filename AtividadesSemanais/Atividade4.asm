org 0000h

main:
	JMP inst_logic_bool

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
	
inst_logic_bool:
	MOV A, #11001100b
	MOV B, #10101010b
	ANL A, B