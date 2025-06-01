## 4. Cree un programa que dada una lista de números imprima sólo los que son pares. Nota: utilice la sentencia `continue` donde haga falta.
import random

#Modulo numeros pares
def num_pares(lista):
    for i in lista:
        if  i % 2==0:
            print(i)
        else:
            continue

#Modulo lista Aleatoria
def lista_aleatoria(minimo, maximo, cantidad):
    lista = [random.randint(minimo, maximo) for k in range(cantidad)]
    return lista

#Programa
minimo = int(float((input("Ingrese el valor mínimo: "))))
maximo = int(float(input("Ingrese el valor máximo: ")))
cantidad = int(float(input("Ingrese la cantidad de números a generar: ")))
lista=lista_aleatoria(minimo, maximo, cantidad)
num_pares(lista)