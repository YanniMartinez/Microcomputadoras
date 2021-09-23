INCLUDE <P16F877A.INC>
TMP EQU 0X3A

	ORG 0
	GOTO INICIO
	ORG 5

INICIO: 
		MOVLW 0X20  ; Se carga 0x20 --> W, 
		MOVWF FSR 	; Pasamos el valor de 0X20 --> FSR [Apuntador]
		CLRF TMP	; Limpiamos el registro que usaremos para realizar el swap

GOTO ORDENAMIENTO

ORDENAMIENTO: ; En esencia es Bubble Sort de bajo nivel
		MOVFW INDF	; Analizamos el valor actual

		INCF FSR	;Nos movemos al siguiente valor			
		SUBWF INDF,W ; W = FSR - FSR+1		
		BTFSS STATUS, C 	; Si C no se activa, significa que el número del registro
			CALL SwapRegistros; FSR < FSR+1, intercambiamos lugares
		MOVF FSR, W; Revisamos si ya terminamos de revisar los registros
		XORLW 0X2F ; Cuando lleguemos a la dirección 0X3F se activará la bandera Z
		BTFSC STATUS, Z; 
			GOTO $; En caso de que sí, terminamos
		GOTO ORDENAMIENTO;FSR<0X3F

SwapRegistros:
	MOVF W, INDF; Almacenamos temporalmente el registro actual
	MOVWF TMP	; Lo almacenamos en RAM
	DECF FSR	; Nos movemos al registro anterior
	MOVF W, INDF ; Almacenamos el primer registro a intercambiar
	INCF FSR	;Nos movemos al registro actual
	MOVWF INDF  ; Lo sustituimos por el primero
	DECF FSR	;Nos regresamos al primer registro
	MOVF TMP, W; Cargamos el registro que guardamos
	MOVWF INDF 	; Intercambiamos ambos registros
	
	MOVLW 0X20	;Reiniciamos el proceso
	MOVWF FSR
	RETURN
END