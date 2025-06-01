# 2. Haz un programa que pida al usuario que ingrese una temperatura en grados Celsius y luego convierta esa temperatura a grados Fahrenheit, mostrando el resultado.
#Lo obligo a ingresar una edad valida

def conversor_temperatura():
    Celsius = float(input("Ingrese su temperatura: "))
    fahrenheit = Celsius*9/5 + 32
    print(f"La temperatura en Fahrenheit es  de {fahrenheit} grados Fahrenheit ")
conversor_temperatura()