from pathlib import Path
from constant import  TEMP_DATA
from utils import functions
#

def menu_option(op):
      
    option = int(input(f'''Ingrese la estación de
                       la que quiere temp {op} a la                               
                               1️⃣) Anual
                               2️⃣) Verano
                               3️⃣) Otoño
                               4️⃣) Invierno
                               5️⃣) Primavera
                               opcion: '''))
    return option

def demo():
    data_temp = functions.open_file(TEMP_DATA)
    print(data_temp)
    op = int(input('''Ingrese la opción del menú
                1) Menor 
                2) Mayor
                   opcion:    '''))
                   
    operation = 'menores' if op==1 else 'mayores'
    if op in (1,2):
        season =  menu_option(operation)
        
        result = 0
        match op, season:
            case 1, season if season in [1, 2, 3, 4, 5] :     
                result = functions.smaller_prom_temp(data_temp, season-1)
            case 2, season if season in [1, 2, 3, 4, 5]:     
                result = functions.greater_prom_temp(data_temp, season-1)
            case _:
                print("🙅 ⚠️opción inválida")
        if result !=0:
            print(result)
    else:
        print(" ⚠️opción inválida")
