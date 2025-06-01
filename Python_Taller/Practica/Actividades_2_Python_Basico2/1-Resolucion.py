# 1. Desarrolla un programa que solicite al usuario que ingrese su edad y luego calcule y muestre cuántos años le faltan para alcanzar los 100 años.

reingreso = True

#Lo obligo a ingresar una edad valida
while reingreso:
    edad = input("Ingrese su edad: ")
    if edad.isdigit() and 0 < int(edad) < 120:
        reingreso = False  

#Calculo de cuanto le falta para 100
if edad: 
    edad = int(edad)
    if edad < 100:
        print(f"Te faltan {100 - edad} años para llegar a los 100 años.")
    elif edad == 100:  
        print("Tienes 100 años.")
    else:
        print("Tu edad es mayor a 100 años.")
          
  
