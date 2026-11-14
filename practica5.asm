;Materia: Lenguajes de Interfaz
;Alumno: Vega Hernandez Angel Daniel
;Horario: 9 Am - 10 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 5.
;Descripción: Demuestra el uso de macros para encapsular y reutilizar bloques de código repetitivos

INCLUDE Irvine32.inc

;macro pa mostrar un mensaje  en pantalla
;recibe el parametro texto q es el nombre de la variable
MostrarMensaje MACRO texto
	;pongo la direccion del texto en edx
	mov edx, OFFSET texto
	;writestring imprime lo q este en edx
	call WriteString
	;salto de linea
	call Crlf
ENDM

;macro pa multiplicar dos numeros y mostrar el resultado
;recibe dos parametros num1 y num2
Multi MACRO num1, num2
	;meto el primer numero en eax
	mov eax, num1
	;imul multiplica eax por el segundo numero y el resultado se queda en eax
	imul eax, num2
	;writeint imprime el valor de eax como entero con signo
	call WriteInt
	;salto de linea
	call Crlf
ENDM

.data
	;mensaje de bienvenida q se muestra al inicio
	mensajeBienvenida BYTE "Bienvenido al sistema", 0
	;mensaje de despedida
	mensajeFin BYTE "Nos vemos!", 0
.code
main PROC 
	;llamada a la macro para mostrar el mensaje de bienvenida
	MostrarMensaje mensajeBienvenida
	;llamada a la macro pa mostrar el mensaje de despedida
	MostrarMensaje mensajeFin

	;llamada a la macro pa multiplicar 4 por 5, el resultado sale en pantalla
	Multi 4, 5

main ENDP
END main
