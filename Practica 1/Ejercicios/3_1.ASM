PROCESSOR 16f877 			;version del procesador
INCLUDE <P16f877.inc> 		;libreria del procesador

J  equ  H'26'				;registro donde se guardara J
K  equ  H'27'				;registro donde se guardara K
R1 equ  H'28'				;registro donde se guardara R1
C1 equ  H'29'				;registro donde se guardara C1

		ORG 0				;vector reset (lugar de origen)
		GOTO INICIO			;inicio del programa
	
		ORG 5				;posicion donde se iniciara el programa
;INICIO: 
REGRESA:MOVF J,W 			;se mueve J a W
		ADDWF K,0			; se suma K con 0 y se guarda en W
		MOVWF R1			;mueve lo que hay en W a M
		BTFSS STATUS, C1	;corrobora el valor de la bandera de acarreo e
							; indica la instruccion que debe seguir
		GOTO CERO			;redirige al conjunto de instrucciones cero
		GOTO UNO			;redirige al conjunto de instrucciones uno
		
CERO:   MOVLW 0				;carga el valor de 0 al registro W
		MOVWF C1			;mueve lo que hay en W a C1
		GOTO REGRESA		;redirige a regresa
		
UNO:    MOVLW 1				;carga el valor de 1 al registro W
		MOVWF C1			;mueve lo que hay en W a C1
		GOTO REGRESA		;redirige a regresa
		
;	GOTO INICIO				;redirige al inicio del programa
END							;fin del programa
		