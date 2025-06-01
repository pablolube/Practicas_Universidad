#3. Crea un programa que calcule la suma de los primeros 100 números naturales utilizando un bucle for.

def sumatoria_naturales():
    total=0
    for i in range (1,101):
        total +=i
    return total

total=sumatoria_naturales()
print(f"La suma de los primeros 100 números naturales es: {total}")
