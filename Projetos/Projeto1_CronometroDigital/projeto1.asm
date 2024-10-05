; SW0 -> delay de 250ms
; SW1 -> delay 1000ms

; Só roda quando SWx estiver pressionado

    org 0000h      

main:
	JNB P2.0, SW0	; Utilizando a P2.0 como SWO e pulando para a label respectiva quando ativada
;	JNB P2.1, SW1	; Utilizando a P2.1 como SW1 e pulando para a label respectiva quando ativada
	JMP main

delay250:			; Rotina para delay de 250 milisegundos
    MOV R1, #100    

inicio250:
    MOV R0, #250    
    DJNZ R0, $     
    DJNZ R1, inicio250 
    RET


delay1000:			; Rotina para delay de 1000 milisegundos (1s)
    MOV R1, #1000    

inicio1000:
    MOV R0, #250    
    DJNZ R0, $     
    DJNZ R1, inicio1000 
    RET


SW0:
	MOV P1, #11000000b  ;0
	ACALL delay250
	MOV P1, #11111001b  ;1
	ACALL delay250
	MOV P1, #10100100b	;2
	ACALL delay250
	MOV P1, #10110000b	;3
	ACALL delay250
	MOV P1, #10011001b	;4
	ACALL delay250
	MOV P1, #10010010b	;5
	ACALL delay250
	MOV P1, #10000010b	;6
	ACALL delay250
	MOV P1, #11111000b	;7
	ACALL delay250
	MOV P1, #10000000b	;8
	ACALL delay250
	MOV P1, #10011000b	;9
	ACALL delay250
	JMP main
	 