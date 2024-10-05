; Só roda quando SWx estiver pressionado

    org 0000h      

main:
	JNB P2.0, contagem	; utilizando a P2.0 como SWO e pulando para a label respectiva quando ativada
	JNB P2.1, contagem	; utilizando a P2.1 como SW1 e pulando para a label respectiva quando ativada
	JMP desligar		; pula para a label que desliga o display


;*******sub-rotina de delay*********

delay:						; salta para a rotina de delay com tempo respectivo a cada switch
	JNB P2.0, delayA250		
	JNB P2.1, delayA1000
	RET						; se nao tiverem switches atividados, retorna para desligar o display
	
delayA250: 			; rotina para delay de 250 milisegundos
	MOV R2, #5		; Utilizando mais um registrador
delayB250:		 
    MOV R1, #100    
delayC250:
    MOV R0, #250   
    DJNZ R0, $    
    DJNZ R1, delayC250
	DJNZ R2, delayB250
	RET

delayA1000: 		; rotina para delay de 1000 milisegundos
	MOV R2, #20
delayB1000:		
    MOV R1, #100    
delayC1000:
    MOV R0, #250   
    DJNZ R0, $    
    DJNZ R1, delayC1000
	DJNZ R2, delayB1000
	RET

;*******ativando display de 7 segmentos*********

contagem:
	MOV P1, #11000000b  ; atribui 0 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #11111001b  ; atribui 1 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10100100b	; atribui 2 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10110000b	; atribui 3 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10011001b	; atribui 4 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10010010b	; atribui 5 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10000010b	; atribui 6 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #11111000b	; atribui 7 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10000000b	; atribui 8 para o display
	ACALL delay			; chama sub-rotina de delay
	MOV P1, #10011000b	; atribui 9 para o display
	ACALL delay			; chama sub-rotina de delay
	JMP main			; retorna para main

desligar:
	MOV P1, #11111111b  ; desligado
	JMP main			; retorna para main
