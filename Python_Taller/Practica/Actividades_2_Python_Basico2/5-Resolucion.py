# 5. Implementa un programa que solicite al usuario que ingrese una lista de números. Luego, imprime la lista pero detén la impresión si encuentras un número negativo. Nota: utilice la sentencia `break` cuando haga falta.

def lista_numeros():
    lista = []
    while True:
        numero = input("Ingrese un número o ingrese 'stop' para terminar: ")
        
        # Verifica si la entrada es 'stop' para terminar el bucle
        if numero.lower() == "stop":
            break
        
        # Intenta convertir la entrada a un número
        else:
            numero = float(numero)
            lista.append(numero)
       
    return lista

lista = lista_numeros()

for i in lista:
    if i<0:
        break   
    else:
        print(i)