Proceso Gestor_Contraseñas_Seguras
	
	// Variables de declaración
	Definir nombreUsuario, contraseñaActual Como Cadena
	Definir totalUsuarios, opcion, i Como Entero
	Definir tecla Como Cadena
	
	// Arreglos para almacenar usuarios y contraseñas (máximo 100)
	Dimension usuarios[100]
	Dimension contraseñas[100]
	totalUsuarios <- 0
	
	Repetir
		Limpiar Pantalla
		Escribir "============================================"
		Escribir "        GESTOR DE CONTRASEÑAS SEGURAS       "
		Escribir "============================================"
		Escribir "1. Registrar usuario"
		Escribir "2. Mostrar usuarios"
		Escribir "3. Verificar contraseñas"
		Escribir "4. Salir"
		Escribir "Seleccione una opción: "
		Leer opcion
		
		Segun opcion Hacer
			1:
				totalUsuarios <- RegistrarUsuario(usuarios, contraseñas, totalUsuarios)
			2:
				MostrarUsuarios(usuarios, contraseñas, totalUsuarios)
			3:
				VerificarTodasLasContraseñas(usuarios, contraseñas, totalUsuarios)
			4:
				Escribir "Saliendo del sistema..."
			De Otro Modo:
				Escribir "Opción inválida. Intente de nuevo."
		FinSegun
		
		Si opcion <> 4 Entonces
			Escribir ""
			Escribir "Presione ENTER para continuar..."
			// Usamos Leer tecla para esperar la pulsación
			Leer tecla
		FinSi
		
	Hasta Que opcion = 4
	
	
FinProceso

// FUNCIÓN: Registra un nuevo usuario y su contraseña
Funcion nuevoTotal <- RegistrarUsuario(usuarios Por Referencia, contraseñas Por Referencia, totalUsuarios)
	
	Definir nombreUsuario, contraseñaActual Como Cadena
	nuevoTotal <- totalUsuarios
	
	Si nuevoTotal < 100 Entonces
		nuevoTotal <- nuevoTotal + 1
		Escribir "Ingrese el nombre del usuario:"
		Leer nombreUsuario
		Escribir "Ingrese la contraseña:"
		Leer contraseñaActual
		
		usuarios[nuevoTotal] <- nombreUsuario
		contraseñas[nuevoTotal] <- contraseñaActual
		Escribir "Usuario registrado exitosamente."
	Sino
		Escribir "No se pueden registrar más usuarios (límite alcanzado)."
	FinSi
	
	
FinFuncion

// SUBPROCESO: Muestra todos los usuarios y sus contraseñas
SubProceso MostrarUsuarios(usuarios, contraseñas, totalUsuarios)
	
	Si totalUsuarios = 0 Entonces
		Escribir "No hay usuarios registrados."
	Sino
		Escribir "Lista de usuarios registrados:"
		Para i <- 1 Hasta totalUsuarios Con Paso 1 Hacer
			Escribir i, ". Usuario: ", usuarios[i], " | Contraseña: ", contraseñas[i]
		FinPara
	FinSi
	
	
FinSubProceso

// SUBPROCESO: Verifica la seguridad de todas las contraseñas registradas
SubProceso VerificarTodasLasContraseñas(usuarios, contraseñas, totalUsuarios)
	
	Definir mensajeDeFallo Como Cadena // Almacena el feedback detallado
	
	Si totalUsuarios = 0 Entonces
		Escribir "No hay contraseñas para verificar."
	Sino
		Escribir "============================================"
		Escribir "      RESULTADOS DE VERIFICACIÓN DE SEGURIDAD"
		Escribir "============================================"
		Para i <- 1 Hasta totalUsuarios Con Paso 1 Hacer
			Escribir "Verificando la contraseña del usuario ", usuarios[i], ":"
			
			// Llama a la función, que devuelve el mensaje de fallo (o vacío si es segura)
			mensajeDeFallo <- VerificarContraseña(contraseñas[i])
			
			Si Longitud(mensajeDeFallo) = 0 Entonces // Si el mensaje está vacío, es segura
				Escribir "? Contraseña segura. Cumple con todos los criterios."
			Sino
				Escribir "? Contraseña débil."
				Escribir "Le falta lo siguiente:"
				// Se imprime la retroalimentación detallada
				Escribir mensajeDeFallo 
			FinSi
			Escribir "--------------------------------------------"
		FinPara
	FinSi
	
	
FinSubProceso

// FUNCIÓN: Verifica la seguridad de una contraseña y devuelve un mensaje de fallo
Funcion mensajeFallo <- VerificarContraseña(contraseña)
	
	Definir tieneMayus, tieneMinus, tieneNumero, tieneSimbolo Como Logico
	Definir long, i Como Entero
	Definir c, mensajeFallo Como Cadena
	
	tieneMayus <- Falso
	tieneMinus <- Falso 
	tieneNumero <- Falso
	tieneSimbolo <- Falso
	long <- Longitud(contraseña)
	mensajeFallo <- "" 
	
	// Primera pasada: Determinar qué elementos contiene la contraseña
	Para i <- 1 Hasta long Con Paso 1 Hacer
		c <- Subcadena(contraseña, i, 1)
		
		// Chequeo de Mayúsculas
		Si c >= "A" Y c <= "Z" Entonces
			tieneMayus <- Verdadero
		FinSi
		
		// Chequeo de Minúsculas
		Si c >= "a" Y c <= "z" Entonces
			tieneMinus <- Verdadero
		FinSi
		
		// Chequeo de Números
		Si c >= "0" Y c <= "9" Entonces
			tieneNumero <- Verdadero
		FinSi
		
		// Chequeo de Símbolos: Se amplía la lista de símbolos
		Si c = "@" O c = "#" O c = "$" O c = "!" O c = "%" O c = "&" O c = "*" O c = "-" O c = "_" Entonces
			tieneSimbolo <- Verdadero
		FinSi
	FinPara
	
	// Segunda pasada: Construir el mensaje de fallo si no cumple los criterios
	
	// 1. Longitud
	Si long < 8 Entonces
		mensajeFallo <- mensajeFallo + " - Longitud mínima de 8 caracteres (actual: " + ConvertirATexto(long) + ").\n"
	FinSi
	
	// 2. Mayúsculas
	Si No tieneMayus Entonces
		mensajeFallo <- mensajeFallo + " - Incluir al menos una letra mayúscula (A-Z).\n"
	FinSi
	
	// 3. Minúsculas 
	Si No tieneMinus Entonces
		mensajeFallo <- mensajeFallo + " - Incluir al menos una letra minúscula (a-z).\n"
	FinSi
	
	// 4. Números
	Si No tieneNumero Entonces
		mensajeFallo <- mensajeFallo + " - Incluir al menos un número (0-9).\n"
	FinSi
	
	// 5. Símbolos
	Si No tieneSimbolo Entonces
		mensajeFallo <- mensajeFallo + " - Incluir al menos un símbolo (@, #, $, !, %, &, *, -, _).\n"
	FinSi
	
	// La función devuelve el mensaje de fallo. Si la contraseña es segura, devuelve una cadena vacía.


FinFuncion