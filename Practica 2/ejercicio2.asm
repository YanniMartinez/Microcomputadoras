INCLUDE <P16F877A.INC>
MINIMO EQU 0X40
	ORG 0
	GOTO INICIO
	ORG 5
INICIO: 
		MOVLW 0X20  ; Se carga 0x20 --> W, 
		MOVWF FSR 	; Pasamos el valor de 0X20 --> FSR [Apuntador]
 		MOVF W, INDF ; Empezamos transfiriendo el primer valor
	

		MOVWF MINIMO; Suponiendo #0 es Min
GOTO RECORRIDO

RECORRIDO:
		INCF FSR			; Nos colocamos en la siguiente direcci�n
		MOVFW MINIMO
		SUBWF INDF, W		; Obtenemos la diferencia del registro actual 
							; menos el registro m�nimo conocido			
		BTFSS STATUS, C 	; Si C no se activa, significa que el n�mero del registro
			CALL SwapMinimo ; actual, es menor que aquel almacenado en M�NIMO
		MOVF FSR, W; Revisamos si ya terminamos de revisar los registros
		XORLW 0X3F ; Cuando lleguemos a la direcci�n 0X3F se activar� la bandera Z
		BTFSC STATUS, Z; 
			GOTO $; En caso de que s�, terminamos
		GOTO RECORRIDO;FSR<0X3F

SwapMinimo:
	MOVF W, INDF
	MOVWF MINIMO
	RETURN
END