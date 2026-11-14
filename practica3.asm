;Materia: Lenguajes de Interfaz
;Alumno: Vega Hernandez Angel Daniel
;Horario: 9 Am - 10 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 3.
;Descripción: Solicita una cadena de texto al usuario y valida si está vacía o no utilizando procedimientos

INCLUDE Irvine32.inc

.data
    ;aqui reservo 50 bytes en cero pa guardar lo q escriba el usuario
    cadena BYTE 50 DUP(0)          
    ;mensaje q le pide la cadena al usuario
    msgPedir BYTE "Ingresa una cadena (o presiona Enter para dejarla vacia): ", 0
    ;mensaje para cuando no escribio nada
    msgVacia BYTE "La cadena ESTA vacia.", 0
    ;mensaje para cuando si escribio algo
    msgNoVacia BYTE "La cadena NO esta vacia.", 0

.code
main PROC
    ;pongo la direccion del mensaje en edx
    mov  edx, OFFSET msgPedir
    ;lo imprimo en pantalla
    call WriteString

    ;en edx va la direccion de la variable donde se guarda lo q escriba
    mov  edx, OFFSET cadena
    ;en ecx va el tamaño maximo q se puede leer
    mov  ecx, SIZEOF cadena
    ;readstring lee lo q escribe el usuario y lo guarda en la variable cadena
    call ReadString

    ;2. ahora hay q ver si esta vacia checando el primer byte
    ;comparo el primer byte con 0, si es 0 es q no escribio nada
    cmp  BYTE PTR [cadena], 0
    ;si es igual a 0 brinca a la etiqueta esvacia
    je   EsVacia

;aqui entra si la cadena no esta vacia
NoEsVacia:
    ;cargo el mensaje de no vacia
    mov  edx, OFFSET msgNoVacia
    ;lo muestro en pantalla
    call WriteString
    ;salto de linea
    call Crlf
    ;brinco al final pa q no entre a esvacia tambien
    jmp  Fin

;aqui entra si la cadena esta vacia
EsVacia:
    ;cargo el mensaje de vacia
    mov  edx, OFFSET msgVacia
    ;lo imprimo
    call WriteString
    ;salto de linea
    call Crlf

;aqui termina el programa
Fin:
    exit
main ENDP
END main
