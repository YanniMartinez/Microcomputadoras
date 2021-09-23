PROCESSOR 16f877 			;version del procesador
INCLUDE <P16f877.inc> 		;libreria del procesador

K  equ  H'26'				;registro donde se guardara K
L  equ  H'27'				;registro donde se guardara L

		ORG 0				;vector reset (lugar de origen)
		GOTO INICIO			;inicio del programa
	
		ORG 5				;posicion donde se iniciara el programa
INICIO:
	BTFSS K,3	
	GOTO SUM
	GOTO SIG

SIG:
	BTFSS K,0
	GOTO SUM
	GOTO SIG1

SIG1:
	MOVLW 0X10
	MOVWF K
	GOTO INICIO

SUM:
	MOVLW 0X01
	ADDWF K,W
	MOVWF K
	GOTO INICIO
		
;	BTFSS K,5	
;	GOTO FIN
;	GOTO INICIO


;FIN: MOVLW 0X20
;	MOVWF K
;	GOTO INICIO


	GOTO INICIO				;redirige al inicio del programa
END	