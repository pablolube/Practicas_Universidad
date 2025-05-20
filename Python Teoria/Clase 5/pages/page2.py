# page2.py
import streamlit as st
import pandas as pd
import numpy as np


st.title("Página 2")
st.write("¡Bienvenido a la **Página 2**!")
st.write("Esta página contiene una tabla de ejemplo y un gráfico de barras.")

data = pd.DataFrame({
    'A': np.random.randn(10),
    'B': np.random.randn(10),
    'C': np.random.randn(10)
    })

st.write("Aquí está una tabla de ejemplo:")
st.write(data)
st.write("Gráfico de barras de los datos aleatorios:")
st.bar_chart(data)