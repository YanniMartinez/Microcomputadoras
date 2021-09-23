PROCESSOR 16f877 			;version del procesador
INCLUDE <P16f877.inc> 		;libreria del procesador


L  equ  H'27'				;registro donde se guardara T

		ORG 0				;vector reset (lugar de origen)
		GOTO INICIO			;inicio del programa
	
		ORG 5				;posicion donde se iniciara el programa
INICIO:
	MOVLW 0X01				;asigna el valor de 1 a W
	MOVWF L					;pasa el valor de W a L

SIG:						;inicio de etiqueta
	RLF L,1					;incremento en 1 a L
	BTFSS L,7				;comprueba que el 7 bit sea 1, osea que el numero sea 80
	GOTO SIG				;redirige a la etiqueta SIG
	GOTO INICIO				;redirie a la etiqueta INICIO

	GOTO INICIO				;redirige al inicio del programa
END							;fin del programa
		