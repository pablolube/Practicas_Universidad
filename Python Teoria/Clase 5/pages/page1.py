# page1.py
import streamlit as st
import numpy as np
import matplotlib.pyplot as plt


st.title("Página 1")
st.write("¡Bienvenido a la **Página 1**!")
st.write("Aquí puedes agregar cualquier contenido, como gráficos, tablas o texto.")
st.write("Esta página podría contener, por ejemplo, un gráfico de ejemplo.")

x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.plot(x, y)
st.pyplot(plt)
