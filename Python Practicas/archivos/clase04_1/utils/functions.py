import csv
def open_file(name):
    '''Abre el archivo y genera la estructura con los datos organizados'''
    data ={}
    anual = []
    with  open(name) as file_temp:
        csv_reader = csv.reader(file_temp, delimiter=',') 
        header = next(csv_reader)
        
        for row in csv_reader:
            data[row[0]] = [float(elem) for elem in row[1:]]
    return data

def smaller_prom_temp(data, col):
    '''Devuelve las temp menores que la  promedio 
    de la columna indicada'''

    anual = data['Argentina']
    print(f'Promedio anual {anual[col]}')
    lista = list(filter( lambda prov: prov[1][col] < anual[col], list(data.items())[1:]))
    return lista

def greater_prom_temp(data, col):
    '''Devuelve las temp mayores que la  promedio 
    de la columna indicada'''

    anual = data['Argentina']
    print(f'Promedio anual {anual[col]}')
    lista = list(filter( lambda prov: prov[1][col] > anual[col], list(data.items())[1:]))
    return lista
    
    
