## Actividad Extra
'''
Creación de un programa básico de gestión de inventario.

Desarrollar un programa en Python que permita gestionar un inventario simple de productos, incluyendo funciones básicas 
como agregar productos, eliminar productos y mostrar el inventario.

El programa debe tener un menú interactivo que permita al usuario seleccionar las siguientes operaciones:
- Eliminar un producto existente del inventario, solicitando al usuario el nombre del producto a eliminar.
- Mostrar el inventario actual, que incluya el nombre y la cantidad de cada producto.
- Salir del programa.

El inventario puede ser almacenado utilizando un diccionario simple, donde las claves sean los nombres de los productos y los valores sean las cantidades.
Se deben manejar situaciones simples como la introducción de productos duplicados o la eliminación de productos inexistentes.
'''

# Agregar un nuevo producto al inventario, solicitando al usuario el nombre y la cantidad inicial del producto.
def agregar_producto(invetario):
    
    #Ingreso de productos

    producto=input("Ingrese nombre del producto: ")
    cantidad=int(input("Ingrese cantidad: "))
    
    #Revision si existe en el inventario
    if producto in inventario:
        inventario[producto]+=cantidad
    else:
        print(f"El producto: {producto} no existe en el sistema, se creara en el inventario")
        inventario[producto]=cantidad
    
    print(f"Se agregaron {cantidad} de {producto} en el inventario, hay un total de {cantidad} {producto}")
    return(inventario)

# Eliminar un producto existente del inventario, solicitando al usuario el nombre del producto a eliminar.
def eliminar_producto(inventario):
    producto=input("Ingrese nombre del producto: ")
    
    if producto in inventario:
        del inventario[producto]
        print(f"El  {producto}' ha sido eliminado del inventario")
    else:
        print(f"No existe dicho  {producto} en el  inventario")
    
    return(inventario)

# Esta la agregue dado que no estaba. Saca producto del inventario.
def sacar_producto(inventario):

    producto=input("Ingrese nombre del producto: ")
    cantidad=int(input("Cantidad de inventario a retirar: "))
    if inventario[producto]>=cantidad :
        inventario[producto]-=cantidad
    else:
        print(f"Solo hay : {inventario[producto]} en el inventario, ingrese una cantidad menor")
        sacar_producto(inventario)
    return(inventario)

# Imprime inventario
def mostrar_inventario(inventario):
    for producto in inventario:
        print(f"Producto: {producto} Cantidad Total: {inventario[producto]}")
   


inventario={}
print("Bienvenido al sistema de inventario Empresa S.A")

while True:
    print("\nGestión de Inventario")
    print("1. Agregar producto")
    print("2. Sacar producto de inventario")
    print("3. Eliminar producto")
    print("4. Mostrar inventario")
    print("5. Salir")

    seleccion=int(input("Ingrese el numero de gestion a realizar: "))

    if seleccion==1:
            agregar_producto(inventario)
    elif seleccion==2:
            sacar_producto(inventario)

    elif seleccion==3:
            eliminar_producto(inventario)

    elif seleccion==4:
            mostrar_inventario(inventario)

    elif seleccion==5:
        exit()



