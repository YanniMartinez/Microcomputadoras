PROCESSOR 16f877 			;version del procesador
INCLUDE <P16f877.inc> 		;libreria del procesador

K  equ  H'26'				;registro donde se guardara K
L  equ  H'27'				;registro donde se guardara L

		ORG 0				;vector reset (lugar de origen)
		GOTO INICIO			;inicio del programa
	
		ORG 5				;posicion donde se iniciara el programa
INICIO:
	MOVLW 0X01				;se guarda en w el valor 0x01
	ADDWF K,W				;sumamos el valor de w a k
	MOVWF K					;copia el valor de w a f
	BTFSS K,3				;verifica el bit 3 de k
	GOTO INICIO				;retorna a inicio si el bit3 es 1
	GOTO SIG				;va a SIG


SIG:
	BTFSS K,0				;verifica el bit 0 de k
	GOTO INICIO				;En caso que el bit 0 de k sea 1 regresa a inicio
	GOTO SIG1				;Continua a SIG1
	


SIG1:
	BTFSC K,4				;verifica el valor del bit 4 de k es 0
	GOTO SIG2				;En caso que el bit 4 de k sea 0 continua a sig2 
	MOVLW 0X10				;Movemos a w el valor de 0x10
	MOVWF K					;movemos k a f
	GOTO INICIO				;regresamos a INICIO

SIG2: 
	MOVLW 0X20				;se mueve a w 0x20
	MOVWF K					;movemos k a f
	GOTO SIG3				;continuamos a sig3

SIG3:
	MOVLW 0X00				;movemos a w 0x00
	MOVWF K					;movemos k a f
	GOTO INICIO				;vamos a inicio

	GOTO INICIO				;redirige al inicio del programa
END