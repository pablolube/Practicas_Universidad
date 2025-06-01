#6. Modifique el ejercicio 4 para que dada la lista de número genere dos nuevas listas, una con los número pares y otras con los que son impares. Imprima las listas al terminar de procesarlas.

import random

def par_impar(lista):
    lista_par = []
    lista_impar = []  
    for i in lista:
        if i % 2 == 0:
            lista_par.append(i)
        else:
            lista_impar.append(i)  # Aquí debes agregar a lista_impar los números impares
    return lista_par, lista_impar

def lista_aleatoria(minimo, maximo, cantidad):
    lista = [random.randint(minimo, maximo) for k in range(cantidad)]
    return lista

# Ejemplo de uso
minimo = int(float((input("Ingrese el valor mínimo: "))))
maximo = int(float(input("Ingrese el valor máximo: ")))
cantidad = int(float(input("Ingrese la cantidad de números a generar: ")))
lista = lista_aleatoria(minimo, maximo, cantidad)

# Llamar a la función par_impar
lista_par, lista_impar = par_impar(lista)

# Imprimir los resultados
print(f"Lista de números pares: {lista_par}")
print(f"Lista de números impares: {lista_impar}")