; SW0 -> delay de 250ms
; SW1 -> delay 1000ms

; Só roda quando SWx estiver pressionado

    org 0000h      

main:
	JNB P2.0, sw0
;	JNB P2.1, sw1
	JMP main

delay250:
    MOV R1, #100    

inicio250:
    MOV R0, #250    
    DJNZ R0, $     
    DJNZ R1, inicio250 
    RET


delay1000:
    MOV R1, #1000    

inicio1000:
    MOV R0, #250    
    DJNZ R0, $     
    DJNZ R1, inicio1000 
    RET
       

sw0:
	MOV P1, #11000000b ;0
	ACALL delay250
	MOV P1, #11111001b ;1
	ACALL delay250
	MOV P1, #10100100b	;2
	ACALL delay250
	MOV P1, #10100100b	;3
	ACALL delay250
	MOV P1, #10100100b	;4
	ACALL delay250
	MOV P1, #10100100b	;5
	ACALL delay250
	MOV P1, #10100100b	;6
	ACALL delay250
	MOV P1, #10100100b	;7
	ACALL delay250
	MOV P1, #10100100b	;8
	ACALL delay250
	MOV P1, #10100100b	;9
	ACALL delay250
	JMP main
	 