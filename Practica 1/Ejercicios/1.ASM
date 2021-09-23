PROCESSOR 16f877			;version del procesador 
INCLUDE <P16f877.inc> 		;libreria del procesador

K  equ  H'26'				; Registro donde se guardara K
L  equ  H'27'				; Registro donde se guardara L

		ORG 0				;vector reset (lugar de origen)
		GOTO INICIO			;inicia el codigo del programa
	
		ORG 5				; Indica la posicion donde comenzara
INICIO: MOVLW H'05'			; Carga el valor de H'05' al registro W
		ADDWF K,0			;Sumar el contenido del registro que apunta K a W
		MOVWF L				;Mover el contenido al que apunta M en W
		GOTO INICIO			;Reinicia el proceso
		END					;Fin del programa