;Materia: Lenguajes de Interfaz
;Alumno: Vega Hernandez Angel Daniel
;Horario: 9 Am - 10 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 2.
;Descripción: muestra cómo funciona el stack y las direcciones de retorno leyendo directamente la cima de la pila

INCLUDE Irvine32.inc

.data
	;aqui no hay variables, todo se hace con el stack

.code
main PROC 
	;leo lo q hay en la cima del stack con esp
	mov eax,[esp]
	;writehex  imprime el valor de eax en hexadecimal
	call WriteHEx
	;salto de linea para  q se vea ordenado
	call Crlf
	;llamo al procedimiento procuno, aqui se mete la direccion de retorno  al stack
	call procUno	
	;termina el program
	exit
main ENDP
	
procUno PROC
	;lees la cima del stack q ahora tiene la direccion de retorno de procuno
	mov eax, [esp]
	;imprimo la direccion en hexa
	call WriteHex
	call Crlf
	;al llamar a procdos se empuja  otra direccion de retorno al stack
	call procDos
	
	;ret saca la direccion del stack y regresa a main
	ret
procUno ENDP

procDos PROC
	;otra vez leo la cima del stack, ahora es la direccion de retorno de procdos
	mov eax, [esp]
	;la muestro en pantalla en hexadecimal
	call WriteHex
	call Crlf
	;regresa a procuno sacando la direccion del  stack
	ret
procDos ENDP

END main
