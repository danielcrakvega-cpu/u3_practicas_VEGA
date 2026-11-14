;Materia: Lenguajes de Interfaz
;Alumno: Vega Hernandez Angel Daniel
;Horario: 9 Am - 10 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 4.
;Descripción: Muestra el uso de la pila para pasar parámetros a una función, 
;y el uso de la instrucción imul para multiplicar dos valores.

INCLUDE Irvine32.inc

.data
	;aqui no hay variables, los valores se pasan por la pila
	
.code
main PROC 
	 ;guardo un 10 en ebx, luego se va a usar dentro del procedimiento
	 mov ebx, 10
	 ;el primer valor a multiplicar y guardarlo en la pila
	 push 1
	 ;el segundo valor a multiplicar y guardarlo  en la pila
	 push 2

	 ;salto al procedimiento sumarpila, aqui se mete la direccion de retorno al stack
	 call sumarPila

	 ;nop no hace nada, solo es pa poner un breakpoint y ver como quedo todo
	 nop
	 ;termina el programa
	 exit

main ENDP

;aqui empieza el procedimiento q recibe los parametros por la pila
sumarPila PROC 
	;guarda el valor de ebp en la pila pa no perderlo
	push ebp
	;ebp ahora apunta a la cima del stack, asi se accede a los parametros
	mov ebp, esp

	;guardo ebx en la pila xq lo voy a usar y no quiero perder el 10 q tenia
	push ebx

	;ebp+8 es el segundo valor q se metio (el 2), ebp+4 es la direccion de retorno
	mov eax, [ebp+8]
	;ebp+12 es el primer valor q se metio (el 1)
	mov ebx, [ebp+12]

	;imul multiplica eax por ebx y el resultado se queda en eax
	imul eax, ebx
	
	;saco ebx de la pila pa regresarle su valor original
	pop ebx
	;restauro el ebp original
	pop ebp

	;ret 8 regresa al main y limpia los 8 bytes  de parametros q estaban en la pila
	ret 8

sumarPila ENDP

END main
