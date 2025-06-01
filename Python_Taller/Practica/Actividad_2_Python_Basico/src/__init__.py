#--------------------------------------------------------------------------------------------------------------
#importo librerias 
#--------------------------------------------------------------------------------------------------------------
import string
import random

#--------------------------------------------------------------------------------------------------------------
#1 Función para filtrar lineas cuyas segunda palabra inicia con una vocal
#--------------------------------------------------------------------------------------------------------------
def filtrar_2dapalabra_vocal(text):
    """
    Filtra y muestra las líneas en las que la segunda palabra comienza con una vocal.
    
    Parámetros:
    Texto de entrada donde cada línea se separa por un salto de línea.

    Retorno:
    No tiene return.Solo imprime las líneas que cumplen la condición.
    """
    vocal=("AEIOUaeiou")
    lineas= text.split('\n')
    for linea in lineas: 
        if len(linea)>=2:
            palabra=linea.split(' ')
            if palabra[1][0] in vocal:
                print(linea)

#--------------------------------------------------------------------------------------------------------------
#2 Función Título más largo
#--------------------------------------------------------------------------------------------------------------
def titulo_mas_largo(titulos):
    """
    Encuentra y devuelve el título con la mayor cantidad de palabras en una lista de títulos.

    Parámetros:
    titulos (list of str): Lista de títulos en formato de cadena de texto.

    Retorno:
    str: El título con la mayor cantidad de palabras.
    """
    maximo=0
    titulo_max =""
    for titulo in titulos:
        palabra=titulo.split(' ')
        largo=len(palabra)
        if  largo>=maximo:
            maximo=largo
            titulo_max=titulo
    return titulo_max

#--------------------------------------------------------------------------------------------------------------
#3 Imprime reglas que cumplen con palabra
#--------------------------------------------------------------------------------------------------------------

def buscar_regla(reglas,palabra):
    """
        Inicializa el objeto con las reglas.
        1-Separa a las palabras en líneas,las transforma en una lista. 
        2-Recorre cada la lista, regla por regla y revisa que la palabra.
        3-Transforma ambas en minuscula para que sea comparables

        Parámetros:
        reglas (str): Un conjunto de reglas en formato de texto .
        palabra (str):una palabra clave.

        Return
        No tiene return.Solo imprime, no devuelve ninguna variable.

    """

    reglas = reglas.split('\n') 
    encontrado = False  

    for regla in reglas:
        if palabra.lower() in regla.lower():
            print(regla)
            encontrado = True  
    if not encontrado:  
        print(f"No se han encontrado - {palabra} - en nuestras reglas de discord")



#--------------------------------------------------------------------------------------------------------------
#4 Función valida usuario
#--------------------------------------------------------------------------------------------------------------
    
def validacion_usuario(usuario):

    """
    "Parametros: Ingresa un texto 
    La funcion validar nombres de usuario según estos criterios específicos.
    
    Requisitos:
    - Debe tener al menos 5 caracteres.
    - Debe ser alfanumérico.
    - Debe contener al menos una letra mayúscula, una letra minúscula y un número.

    Return
    No tiene return.Solo imprime si el usuario cumple  o no  con los requisitos
    """

    #Inicializo variables
    cumple=False
    cant_minuscula=0
    cant_mayuscula=0
    cant_numeros=0
    i=0
    
    #Valido que al menos tenga 5 caracteres 
    #Valido que sea alfanumerico y 
    if  len(usuario)>=5 and usuario.isalnum():
        while not cumple and i<len(usuario):
            char=usuario[i]
            #sumo si encuentra minuscula
            if char.isupper():
                cant_minuscula+=1
            #sumo si encuentra mayuscula
            if char.islower():
                    cant_mayuscula+=1
            if char.isdigit():
                cant_numeros+=1
                 
            if cant_minuscula>=1  and cant_mayuscula>=1 and cant_numeros>=1:
                cumple=True
            i=i+1
    if cumple:
           print("El nombre de usuario es válido.")
    else:
           print("El nombre de usuario no cumple con los requisitos.")

#--------------------------------------------------------------------------------------------------------------
# 5 Funcion de velocidad de reacción en un juego
#--------------------------------------------------------------------------------------------------------------

def tiempo_reaccion(tiempo):
        
        """
    Evalúa la velocidad de reacción en milisegundos y la categoriza en 'Rápido', 'Normal' o 'Lento'.

    Parámetros:
    tiempo (str): Tiempo de reacción ingresado por el usuario en milisegundos.

    Retorno:
    No tiene return.Solo Imprime la categoría correspondiente al tiempo ingresado.
    
    Categorías:
    - Menos de 200 ms: "Rápido"
    - Entre 200 y 500 ms: "Normal"
    - Más de 500 ms: "Lento"
        """
    
        if not tiempo.isdigit():
             print("No ha ingresado un numero, ingrese la velocidad de reacción en ms")
        tiempo=int(tiempo)
         
        if  tiempo <0 :
            print("Tiempo ingresado es menor a 0, vuelva a ingresar")
            return
        reaccion="" 
        #Menos de 200 ms: Rápido 
        if  0<= tiempo <200:
            reaccion="Rápido"

        #Entre 200 y 500 ms: Normal
        elif 200<=tiempo<=500:      
            reaccion="Normal"

        #Más de 500 ms: Lento
        else:
             reaccion="Lento"
               
        print (f"Categoria: {reaccion}")

#--------------------------------------------------------------------------------------------------------------
#6 Análisis de descripciones de una plataforma de stream
#--------------------------------------------------------------------------------------------------------------
        """
        Paramatros: Una lista con texto, donde se buscaran palabras claves definidas
        
        Recorre el texto y si enuentra la palabra le suma 1 en el contador.
        
        Return
        No tiene return. Solo imprime al final el contador de cada palabra.
        """

def cuenta_palabras(texto):
    palabras_buscar=["música","charla","entretenimiento"]
    contador={"música":0,"charla":0,"entretenimiento":0}

    for line in texto:
        palabras = line.lower().split() # separo palabras del texto
        for palabra_buscar in palabras_buscar: #recorro la lista de palabras a buscar
            if palabra_buscar.lower() in palabras: #Verifico si la palabra a buscar esta en la palabra
                contador[palabra_buscar]+=1 
    # Imprimir las menciones
    for palabra_buscar, cantidad in contador.items():
        print(f"Menciones de {palabra_buscar}: {cantidad}")

#--------------------------------------------------------------------------------------------------------------
#7 Generador de códigos de descuento
#--------------------------------------------------------------------------------------------------------------
def codigo_descuento(usuario,fecha):
    """    
        Parámetros:
        usuario (str): Nombre de usuario (máximo 15 caracteres).
        fecha (str): Fecha en formato YYYY-MM-DD."
       
        -Verifica que el usuario tenga como maximo 15 caracteres
        -Tranforma a mayusulas
        -Contatena con la fecha y calcula cantidad de caracteres restantes hassta completar 30
        -Completa la diferencia con caracteres random.
        -Conatena con "-"

        Return:
        No tiene return.Solo imprime el codigo si cumple y si no cumple con condiciones imprime que no cumple
    """ 

    if len(usuario)<=15:
       
        usuario=usuario.upper()
        fecha=str(fecha).replace("-","")
        
        codigo=usuario+"-"+fecha

        caracteres=string.ascii_uppercase + string.digits

        restantes=30-len(codigo)
        
        codigo += "-" + ''.join(random.choices(caracteres, k=restantes))
        print(codigo)       
    else: 
        print("El usuario supera los 15 caracteres")

#--------------------------------------------------------------------------------------------------------------
# 8. Identificación de anagrama
#--------------------------------------------------------------------------------------------------------------
     
def son_anagramas(palabra1, palabra2):
    """
    Parametros: Ingreso de 2 variables
    Reordena ambas palabras alfabeticamente y si son iguales imprime que son anagramas         
    Retorno:
    No tiene return,solo imprime mensaje indicando si las palabras son anagramas o no.
    """ 
    
    if sorted(palabra1) == sorted(palabra2):
        print("Son anagramas")
    else:
        print("No son anagramas")

#--------------------------------------------------------------------------------------------------------------
#9. Limpieza de Datos para un Sistema de Clientes
#--------------------------------------------------------------------------------------------------------------

#Elimino elementos nulos
def elimino_nulos(lista):
        """
        Elimina los elementos nulos, vacíos o que contienen solo espacios de una lista.

        Parámetros:
        lista (list): Lista de elementos que se desea filtrar.

        Retorno:
        list: Lista filtrada sin elementos nulos, vacíos o que contengan solo espacios.
        """

    
        lista =[elemento for elemento in lista if elemento not in [None, "", " "]]
        return lista
    
def elimino_blancos(lista):
        """
        Elimina los espacios en blanco al inicio y al final de cada elemento en una lista.
        Además, reemplaza los espacios múltiples en el medio de las cadenas por un solo espacio.

        Parámetros:
        lista (list): Lista de cadenas de texto a limpiar.

        Retorno:
        list: Lista de cadenas sin espacios al inicio y al final y con espacios múltiples reemplazados.
        """
        #Elimino espacios en blanco al inicio y final
        lista =[elemento.strip() for elemento in lista]
        #Elimino espacios en blanco en el medio
        lista =[elemento.replace("  "," ") for elemento in lista]
        return lista
        
    

#Capitalizo primera letra
def capitalizo_palabras(lista):
        """
        Capitaliza la primera letra de cada palabra en una lista de cadenas.

        Parámetros:
        lista (list): Lista de cadenas de texto a capitalizar.

        Retorno:
        list: Lista de cadenas con la primera letra de cada palabra capitalizada.
        """
        lista=[elemento.title() for elemento in lista]
        return lista

#Elimino repetidos
def elimino_repetidos(lista):

        lista_sin_repetidos=[]
        for elemento in lista:
            if elemento not in lista_sin_repetidos:
                lista_sin_repetidos.append(elemento)
        return lista_sin_repetidos

#Limpieza de nombres repetidos
def limpieza_nombres(nombres):
        """
    Realiza un proceso de limpieza sobre una lista de nombres:
    1. Elimina los elementos nulos, vacíos o con solo espacios.
    2. Elimina los espacios en blanco al principio y final y reemplaza espacios múltiples.
    3. Capitaliza la primera letra de cada palabra.
    4. Elimina los nombres repetidos.

    Parámetros:
    nombres (list): Lista de nombres a limpiar.

    Retorno:
    list: Lista de nombres limpiada según los criterios mencionados.
        """
        nombres=elimino_nulos(nombres)
        nombres=elimino_blancos(nombres)
        nombres=capitalizo_palabras(nombres)
        nombres=elimino_repetidos(nombres)
        return nombres

#--------------------------------------------------------------------------------------------------------------
#10  Limpieza de Datos para un Sistema de Clientes
#--------------------------------------------------------------------------------------------------------------

def inicializo(tabla_general,jugador):
    """
    Inicializa los datos de un jugador en la tabla general si aún no existe.
    
    Parametros:
        tabla_general (dict): Diccionario que almacena las estadísticas generales de los jugadores.
        jugador (str): Nombre del jugador a inicializar.

    Returns:
        dict: Tabla general actualizada.
    """

    if jugador not in tabla_general:
        tabla_general[jugador]={'kills': 0, 'assists': 0, 'deaths': 0,'MVPs':0,'Puntajes':0}
    return tabla_general


def calculo_puntaje(ronda_datos, jugador, puntos):
    """
    Calcula el puntaje de un jugador en una ronda en función de sus estadísticas.
    
    Parametros:
        ronda_datos (dict): Diccionario con las estadísticas de la ronda actual.
        jugador (str): Nombre del jugador.
        puntos (dict): Valores de puntaje asignados a kills, assists y deaths.

    Returns:
        dict: Datos actualizados del jugador con su puntaje calculado.
    """

    ronda_datos[jugador]['Puntajes'] = (ronda_datos[jugador]['kills'] * puntos['kills'] +
                                        ronda_datos[jugador]['assists'] * puntos['assists'] +
                                        int(ronda_datos[jugador]['deaths']) * puntos['deaths'])
    return ronda_datos[jugador]


def calcula_max_ronda(ronda_datos,jugador,max_ronda,jugador_mvp):
    """
    Guarda el jugador con el puntaje más alto en la ronda.
    
    Parametros:
        ronda_datos (dict): Diccionario con estadísticas de la ronda actual.
        jugador (str): Nombre del jugador evaluado.
        max_ronda (int): Puntaje máximo registrado en la ronda.
        jugador_mvp (str): Nombre del jugador con el puntaje más alto hasta el momento.

    Returns:
        tupla: Nombre del jugador con mayor puntaje y su puntaje.
    """

    if ronda_datos[jugador]['Puntajes']>max_ronda:
       max_ronda=ronda_datos[jugador]['Puntajes']
       jugador_mvp=jugador
    return jugador_mvp,max_ronda

def acumulo_ronda(tabla_general, jugador, rdo_jugador_ronda):
    """
    Acumula las estadísticas de la ronda en la tabla general.
    
    Parametros:
        tabla_general (dict): Diccionario con estadísticas generales de los jugadores.
        jugador (str): Nombre del jugador.
        rdo_jugador_ronda (dict): Estadísticas del jugador en la ronda actual.

    Returns:
        dict: Tabla general actualizada con los valores acumulados.
    """    

    tabla_general[jugador]['kills'] += rdo_jugador_ronda[jugador]['kills']
    tabla_general[jugador]['assists'] += rdo_jugador_ronda[jugador]['assists']
    tabla_general[jugador]['deaths'] += int(rdo_jugador_ronda[jugador]['deaths'])
    tabla_general[jugador]['Puntajes'] += rdo_jugador_ronda[jugador]['Puntajes']
    return tabla_general

#FUNCION PROCESAR RONDA 
def procesar_ronda(ronda_datos, tabla_general,puntos):
    """Procesa una ronda de juego y actualiza la tabla general con los resultados.

    Para cada jugador en la ronda actual, la función realiza los siguientes pasos:
    
    1. Inicializa sus estadísticas en la tabla general si aún no está registrado.
    2. Calcula su puntaje de la ronda según los valores asignados a cada evento.
    3. Determina si tiene el puntaje más alto de la ronda y lo marca como posible MVP.
    4. Acumula sus estadísticas en la tabla general.
    5. Asigna el MVP de la ronda al jugador con el puntaje más alto y actualiza su total de MVPs.

    Parámetros:
        ronda_datos (dict): Diccionario con las estadísticas de los jugadores en la ronda actual.
        tabla_general (dict): Diccionario acumulativo que mantiene el historial de estadísticas.
        puntos (dict): Diccionario con los valores asignados a kills, assists y deaths para calcular puntajes.

    Retorna:
        dict: La tabla general actualizada con los resultados de la ronda.
        """

    max_ronda=0
    jugador_mvp=""
    for jugador in  ronda_datos:

        #1- Inicializo la tabla general si el jugador es nuevo
        inicializo(tabla_general,jugador)

        #2- Calculo puntaje 
        calculo_puntaje(ronda_datos,jugador,puntos)

        #3- Guarda si es el max puntaje ronda       
        jugador_mvp,max_ronda=calcula_max_ronda(ronda_datos,jugador,max_ronda,jugador_mvp)
        

        #4- Acumulo resultados de ronda a la tabla géneral
        acumulo_ronda(tabla_general,jugador,ronda_datos)
        
    #5- inicializo mvp de la ronda
        ronda_datos[jugador]['MVPs'] = 0
             
    #5- Calculo MVP y acumulo
    if jugador_mvp:
        ronda_datos[jugador_mvp]['MVPs'] = 1 
        tabla_general[jugador_mvp]['MVPs'] += 1
    
    
    return tabla_general

#FUNCION PRINCIPAL - IMPRIMIR
def imprimir_tabla(tabla):
    
    #Imprimo encabezado
    print(f"{'Jugador':<10} {'Kills':<7} {'Asists':<7} {'Deaths':<7} {'MVPs':<7} {'Puntajes':<10}")
    print("-" * 50)
    
    #reordena la tabla por el puntaje descendente 
    tabla_ordenada = sorted(tabla.items(), key=lambda x: x[1]['Puntajes'], reverse=True)

    #Imprimo tabla
    for jugador, rdo in tabla_ordenada:
     print(f"{jugador:<10} {rdo['kills']:<7} {rdo['assists']:<7} {rdo['deaths']:<7} {rdo['MVPs']:<7} {rdo['Puntajes']:<10}")
