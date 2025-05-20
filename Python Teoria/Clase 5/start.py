# start.py
import streamlit as st
import datetime
import pandas as pd
import numpy as np
from PIL import Image

# Configuración de la página
st.set_page_config(
    page_title="Mi Aplicación Interactiva",  # Título de la página en la pestaña del navegador
    page_icon="📊",  # Ícono de la página (puede ser un emoji, URL o imagen)
    layout="wide",  # Disposición del contenido: "centered" o "wide"
    initial_sidebar_state="collapsed"  # Estado inicial de la barra lateral: "expanded" o "collapsed"
)

# Título de la aplicación
st.title("Bienvenido a mi aplicación")

# Mostrar contenido
st.write("Este es un ejemplo de una aplicación con configuración personalizada.")



# Crear un DataFrame de ejemplo
data = pd.DataFrame(np.random.randn(10, 3), columns=["Columna 1", "Columna 2", "Columna 3"])

# Mostrar el DataFrame
st.write("Aquí está el DataFrame generado aleatoriamente:", data)

# Crear y mostrar un gráfico de líneas
st.line_chart(data)

st.write ("HERE STARTS THE EXAMPLE ")

st.title("🎛️ Ejemplos de Inputs en Streamlit")

# Botón
if st.button("st.button"):
    st.write("¡Hiciste clic en el botón!")


import streamlit as st

st.title("🍔 Elegí tus toppings")

st.write("Seleccioná los toppings que querés:")

# Un checkbox por opción
tomate = st.checkbox("Tomate")
palta = st.checkbox("Palta")
mayo = st.checkbox("Mayo")
mostaza = st.checkbox("Mostaza")
ketchup = st.checkbox("Ketchup")

# Mostrar los seleccionados
seleccionados = []
if tomate: seleccionados.append("Tomate")
if palta: seleccionados.append("Palta")
if mayo: seleccionados.append("Mayo")
if mostaza: seleccionados.append("Mostaza")
if ketchup: seleccionados.append("Ketchup")

st.write("Toppings seleccionados:", seleccionados)



# Checkbox
if st.checkbox("st.checkbox"):
    st.write("Checkbox activado")

# Número con límites
st.write("EJEMPLO NUMERO INPUT")
numero = st.number_input(
    "st.number_input (edad)",
    min_value=0,
    max_value=120,
    value=20,
    format="%i"
)
st.write(f"Edad ingresada: {numero}")

# Slider
st.title(" SLIDER BAR ")

slider_val = st.slider("st.slider", value=50, min_value=0, max_value=100, step=1)
st.write(f"Valor seleccionado: {slider_val}")

# Select slider
st.title(" Select slider  ")
select_slider_val = st.select_slider("st.select_slider", options=["uno", "dos", "tres", "cuatro"])
st.write(f"Seleccionaste: {select_slider_val}")

# Date input
st.title(" CALENDAR INPUT ")
fecha = st.date_input("Inserte una fecha:", datetime.date(2000, 7, 6))
st.write(f"Fecha seleccionada: {fecha}")

# Time input
st.title(" TIME  INPUT ")
hora = st.time_input("st.time_input", datetime.time(8, 24,1))
st.write(f"Hora seleccionada: {hora}")

# Color picker
st.title(" COLOR PICKER ")
color = st.color_picker("st.color_picker", "#00f900")
st.write(f"Color seleccionado: {color}")

# Text input
st.title(" TEXT_INPUT ")
usuario = st.text_input(":blue[Usuario:]", placeholder="Nombre de usuario")
st.write(f"Usuario ingresado: {usuario}")

# Text area
st.title(" TEXT_AREA ")
comentario = st.text_area("st.text_area", placeholder="Escribí tus comentarios acá...")
st.write(f"Comentario: {comentario}")

# Radio
st.title(" RADIO ")
radio_val = st.radio("st.radio", options=["AM", "FM", "Online"])
st.write(f"Seleccionado: {radio_val}")

# Selectbox
st.title(" SELECT BOX ")

dia = st.selectbox("st.selectbox", options=["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"])
st.write(f"Día elegido: {dia}")

# Multiselect
st.title(" MULTISELECT ")
salsas = st.multiselect(
    "st.multiselect", 
    options=["Tomate", "Palta", "Mayo", "Mostaza", "Ketchup"]
)
st.write(f"Salsas elegidas: {salsas}")

# Cámara (solo funciona si tu navegador tiene permiso y soporte)
st.title(" CAMARA_INPUT ")
imagen = st.camera_input("st.camera_input")
if imagen:
    st.image(imagen)

# File uploader
st.title(" FILE UPLOADER ")

archivo = st.file_uploader("st.file_uploader", type=["csv", "txt", "jpg", "png"])
if archivo:
    st.success(f"Archivo cargado: {archivo.name}")









recognized_women = {
    'Informática': ['Cecilia Berdichevsky', 'Rebeca Cherep De Guber', 'Victoria Raquel Bajar', 'Noemí García ',
                    'Ida Holz','Gladys Beatriz Rizzo','Ida Bianchi'],
    'Ciencia': ['Eugenia Sacerdote de Lutig', 'Carolina Vera', 'Emma Perez Ferreira', 'Silvia Braslavky',
                'Emilia Ferreiro', 'Cecilia Grierson', 'Julieta Lanteri'],
    'Deportes': ['Gabriela Sabatini','Luciana Aymar','Cecilia Carranza Saroli','Noemí Simoneto','Paula Pareto',
                 'Jeanette Campbell', 'Mary Terán'],
    'Cantantes': ['Mariana Bianchini', 'Gilda','Mercedes Sosa','Tita Merello' ,'Lali Espósito']
}
st.title('Mujeres Destacadas en Argentina')



# Diccionario de mujeres reconocidas por ámbito
recognized_women = {
    "Ciencia": ["Marie Curie", "Rosalind Franklin", "Ada Lovelace"],
    "Arte": ["Frida Kahlo", "Georgia O'Keeffe", "Yayoi Kusama"],
    "Política": ["Angela Merkel", "Margaret Thatcher", "Cristina Fernández"],
}

# Lista de nombres de las pestañas (ámbitos)
tabs = list(recognized_women.keys())
selected_tab = st.radio('Selecciona un Ámbito', tabs)

if selected_tab in recognized_women:
    st.subheader(f'{selected_tab.capitalize()}')

    # Obtener la lista de mujeres para la pestaña seleccionada
    women = recognized_women[selected_tab]

    # Mostrar el selectbox con las mujeres en la lista
    selected_mujer = st.selectbox('Selecciona una Mujer', women)

    if selected_mujer:
        st.write(f'Has seleccionado: {selected_mujer}')
        st.write('Es reconocida por su contribución en este ámbito.')

# -----------------------------
# FORMULARIO
# -----------------------------
st.title("📋 Formulario de Opinión")

questions_data = [1, 2, 3]

with st.form(key="my_form"):
    st.write("## Información del usuario")

    usuario = st.text_input('Usuario', 'completar')
    answer = st.radio('Cuánto te gusta Streamlit:', questions_data, index=None)

    submitted = st.form_submit_button("Responder")

# Evaluar respuesta fuera del formulario
if submitted:
    if answer is not None:
        st.success(f'✅ La respuesta de {usuario} es: {answer}')
    else:
        st.warning("⚠️ Por favor seleccioná una opción.")
