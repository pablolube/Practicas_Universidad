#7. Escribe un programa que tome una lista de números enteros como entrada del usuario. Luego, convierte cada número en la lista a string 
# #  únelos en una sola cadena, separados por guiones ('-'). Sin embargo, excluye cualquier número que sea múltiplo de 3 de la cadena final.
'''
def lista_numeros():
    lista = []
    while True:
        numero = input('Ingrese un número o ingrese stop para terminar: ')
        
        # Verifica si la entrada es 'stop' para terminar el bucle
        if numero == 'stop':
            break
        
        # Intenta convertir la entrada a un número
        else:
            numero = int(numero)
            lista.append(numero)
    return lista
'''
       
def convertir_string(lista):
#Convierte numeros string
    cadena=''
    for i in  lista:
        if  i %3 ==0:
            continue
        else:
            cadena +=str(i)
    print(f'cadena 1 {cadena}')
    cadena='-'.join(cadena)    
    print(f'cadena 2 {cadena}')
  

lista=[3, 7, 12, 18, 25, 30, 41, 50, 60, 77]
convertir_string(lista)        