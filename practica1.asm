;Materia: Lenguajes de Interfaz
;Alumno: Vega Hernandez Angel Daniel
;Horario: 9 Am - 10 Am
;Docente: Dr. José Luis Medina Jiménez
;Práctica: PRACTICA 1.
;Descripción: Muestra el uso de procedimientos (CALL/RET) para modularizar código

INCLUDE Irvine32.inc

.data
	;aqui van los mensajes q se van a mostrar en pantalla
	mensajeInicio BYTE "inicio de programa",0
	mensajeProcedimiento BYTE "Estoy dentro del procedimiento",0
	mensajeFin BYTE "Fin del programa",0

.code
main PROC
	;pongo la direccion del mensaje de inicio en edx
	mov edx, OFFSET mensajeInicio
	;writestring imprime lo q este en edx
	call WriteString
	;crlf es para q baje de linea
	call Crlf

	;primera llamda al procedimiento
	call mensajeAviso

	;guardo el 10 en eax solo para ver q el programa sigue despues del call
	mov eax, 10

	;segunda llamada al mismo  procedimiento, asi se reutiliza el codigo
	call mensajeAviso
	;ahora guardo el 20 en eax
	mov eax, 20

	;carga y muestra el mensaje final
	mov edx, OFFSET mensajeFin
	call WriteString
	call Crlf

	;termina el programa
	exit

	main ENDP

;aqui empieza el procedimiento q se  llama desde el main
mensajeAviso PROC
	;cargo el mensaje del procedimiento en edx
	mov edx, OFFSET mensajeProcedimiento
	;lo imprimo en pantalla
	call WriteString
	;salto de linea
	call Crlf
	;ret regresa al main, saca la direccion de retorno del stack y la manda al  eip
	ret
	mensajeAviso ENDP

	END main
