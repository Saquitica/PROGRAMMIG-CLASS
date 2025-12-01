# 🔐 Gestor de Contraseñas Seguras

Este proyecto implementa un sistema básico para la gestión de usuarios y contraseñas en Python.  
Permite registrar usuarios, validar la seguridad de sus contraseñas y generar alertas sobre contraseñas débiles.  
Es ideal como práctica de estructuras de datos, funciones, condicionales y manejo de expresiones regulares.

---

## 🎯 **Objetivo del Proyecto**

El objetivo principal es desarrollar un programa capaz de:

- Almacenar usuarios y contraseñas.
- Verificar la fuerza de cada contraseña.
- Alertar cuando un usuario posee una contraseña débil.
- Utilizar funciones y estructuras básicas de programación para simular un sistema real.

---

## 🧩 **Componentes del Sistema**

### ✔ **Vectores (Listas)**
El programa utiliza dos listas paralelas:
- `usuarios[]`
- `contraseñas[]`

Cada índice representa un usuario junto a su contraseña correspondiente.

---

### ✔ **Condicionales y Bucles**
Se emplean:
- Bucles `while` y `for` para controlar el menú y recorrer listas.
- Condicionales `if` para validar contraseñas y opciones del menú.

---

### ✔ **Funciones Principales**

#### 🔹 `verificar_contraseña(contraseña)`
Valida la fuerza mediante reglas:
- Mínimo 8 caracteres  
- Mayúsculas  
- Minúsculas  
- Números  
- Símbolos  

Utiliza la biblioteca `re` para evaluaciones con expresiones regulares.

---

#### 🔹 `registrar_usuario()`
Solicita usuario y contraseña.  
Solo permite guardar contraseñas consideradas "fuertes".

---

#### 🔹 `generar_alertas()`
Recorre todas las contraseñas registradas y muestra aquellas que no cumplen los criterios de seguridad.

---

#### 🔹 `mostrar_menu()`
Controla el flujo del sistema con un menú interactivo.

---

## 📚 **Biblioteca Utilizada**

### `re` – Expresiones regulares
Utilizada para detectar:
- Mayúsculas (`[A-Z]`)
- Minúsculas (`[a-z]`)
- Dígitos (`[0-9]`)
- Símbolos (`[^A-Za-z0-9]`)

Permite validar la fortaleza de contraseñas de manera precisa y eficiente.

---

## 📁 **Estructura del Proyecto**

📦 GestorContraseñas
│
├── main.py # Código principal del programa
├── README.md # Documentación del proyecto
└── .gitignore # Archivos a ignorar por Git


---

## ▶️ **Cómo Ejecutar el Programa**

1. Clona el repositorio:
   ```bash
   git clone https://github.com/TU_USUARIO/TU_REPO.git
Entra a la carpeta del proyecto:

cd GestorContraseñas


Ejecuta el programa:

python main.py

🛡️ Reglas de Validación de Contraseñas

Una contraseña es considerada segura si cumple con:

Requisito	Obligatorio
Longitud mínima de 8 caracteres	✔
Al menos una letra mayúscula	✔
Al menos una letra minúscula	✔
Al menos un número	✔
Al menos un símbolo	✔

Ejemplo de contraseña segura:

Alex@2025!

💬 Ejemplo de Uso
===== MENÚ =====
1. Registrar usuario
2. Mostrar alertas de contraseñas débiles
3. Mostrar usuarios registrados
4. Salir
Seleccione una opción:


🧠 Aprendizajes Aplicados

--Manejo de listas (vectores)

--Validación lógica

--Funciones en Python

--Expresiones regulares

--Interacción con el usuario

--Menús interactivos

--Estructuración profesional de proyectos


🤝 Contribuciones

--Este proyecto es de práctica, pero puedes mejorarlo agregando:

--Encriptación de contraseñas

--Guardado en archivos

--Menús gráficos (Tkinter)

--Exportación en CSV

📄 Licencia

Proyecto educativo. Uso libre con fines de aprendizaje.

-----------