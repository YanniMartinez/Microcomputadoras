INCLUDE <P16F877A.INC>
	ORG 0
	GOTO INICIO
	
	ORG 5

INICIO: BCF STATUS, RP1; Nos ubicamos en el banco de memoria 1 0 
		BSF STATUS, RP0
		MOVLW 0X20 	; Se carga 0x20 --> W
		MOVWF FSR 	; Pasamos el valor de 0X20 --> FSR [Apuntador]
LOOP:	MOVLW 0X5F	; Se carga 0x5f --> W
		MOVWF INDF	; Se transfiere el valor de W al apuntador FSR=0X20
		INCF INDF 	; Se incrementa el registro al que apunte FSR 
				  	; Esto es *FSR --> 0X5F+1 = 0X60

		INCF FSR	; Se incrementa el valor del apuntador FSR
		BTFSS FSR,6 ; Y éste proceso se repite hasta llegar a la dirección de memoria 0X40 
		GOTO LOOP   ; Se repite la colocación de 0x5f en memoria
		GOTO $      ; al terminar el P.C se mantiene estático
		END
