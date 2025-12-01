import re

usuarios = []
contraseñas = []

def verificar_contraseña(contraseña):
    tiene_mayus = bool(re.search(r"[A-Z]", contraseña))
    tiene_minus = bool(re.search(r"[a-z]", contraseña))
    tiene_num = bool(re.search(r"[0-9]", contraseña))
    tiene_simbolo = bool(re.search(r"[^A-Za-z0-9]", contraseña))

    return len(contraseña) >= 8 and tiene_mayus and tiene_minus and tiene_num and tiene_simbolo


def registrar_usuario():
    usuario = input("Ingrese un nombre de usuario: ")
    contraseña = input("Ingrese una contraseña: ")

    #Guardar SIEMPRE el usuario
    usuarios.append(usuario)
    contraseñas.append(contraseña)

    # Verificar si es fuerte o débil
    if verificar_contraseña(contraseña):
        print(" Usuario registrado correctamente (contraseña FUERTE).\n")
    else:
        print(" Usuario registrado, PERO la contraseña es débil.")
        print(" Requisitos para una contraseña fuerte:")
        print("- Mínimo 8 caracteres")
        print("- Mayúsculas")
        print("- Minúsculas")
        print("- Números")
        print("- Símbolos\n")


def generar_alertas():
    print("\n Contraseñas Débiles Encontradas:")
    debiles = 0

    for i in range(len(contraseñas)):
        if not verificar_contraseña(contraseñas[i]):
            print(f" - Usuario {usuarios[i]} tiene una contraseña débil.")
            debiles += 1

    if debiles == 0:
        print("No se encontraron contraseñas débiles. ✔")
    print()


def mostrar_menu():
    while True:
        print("===== MENÚ =====")
        print("1. Registrar usuario")
        print("2. Mostrar alertas de contraseñas débiles")
        print("3. Mostrar usuarios registrados")
        print("4. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            registrar_usuario()
        elif opcion == "2":
            generar_alertas()
        elif opcion == "3":
            print("\nUsuarios registrados:")
            for user in usuarios:
                print(" -", user)
            print()
        elif opcion == "4":
            print("Saliendo del sistema...")
            break
        else:
            print("Opción inválida. Intente nuevamente.\n")


mostrar_menu()
