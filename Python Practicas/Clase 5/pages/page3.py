# page3.py
import streamlit as st

st.title("Página 3")
st.write("¡Bienvenido a la **Página 3**!")
st.write("Esta página contiene un slider y un formulario para entrada de datos.")

    # Slider interactivo
st.slider("Selecciona un valor:", 0, 100, 50)

    # Formulario de ejemplo
st.text_input("Ingresa tu nombre:")
st.text_area("Ingresa tu mensaje:")

import streamlit as st

questions_data = [1, 2, 3]

# Crear el formulario y guardarlo en una variable
with st.form("formulario_usuario") as my_form:
    st.write("Dentro del form")  # Esto puede ir fuera o dentro del form, como prefieras
    st.write("## Información del usuario")

    usuario = st.text_input('Usuario', 'completar')
    answer = st.radio('Cuánto te gusta Streamlit:', questions_data, index=None)

    submitted = st.form_submit_button("Responder")

    if submitted:
        st.success(f"Gracias por responder, {usuario}. Valoración: {answer}")

        st.form_submit_button("Enviar")



