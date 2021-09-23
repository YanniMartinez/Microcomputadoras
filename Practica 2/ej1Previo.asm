    processor 16f877a
    include <p16f877a.inc>

        org 0
        goto inicio

        org 5
inicio: movlw 0x20      ;w <-- 0x20
        movwf FSR       ;Inicializa el puntero 
next:   clrf INDF       ;Borra el contenido de lo que apunta FSR,(INDF) =0
        incf FSR,f      ;Incrementa el apuntador, FSR=FSR+1
        btfss FSR,4     ;Ya hemos terminado?
        goto next       ;No, ve a borrar la siguiente localidad
        goto inicio     ;Sí, ve a la etiqueta "inicio"
        end