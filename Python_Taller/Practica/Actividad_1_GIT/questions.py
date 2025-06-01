import random

# Preguntas para el juego
questions = [
    "¿Qué función se usa para obtener la longitud de una cadena en Python?",
    "¿Cuál de las siguientes opciones es un número entero en Python?",
    "¿Cómo se solicita entrada del usuario en Python?",
    "¿Cuál de las siguientes expresiones es un comentario válido en Python?",
    "¿Cuál es el operador de comparación para verificar si dos valores son iguales?",
]
# Respuestas posibles para cada pregunta, en el mismo orden que las preguntas
answers = [
    ("size()", "len()", "length()", "count()"),
    ("3.14", "'42'", "10", "True"),
    ("input()", "scan()", "read()", "ask()"),
    (
        "// Esto es un comentario",
        "/* Esto es un comentario */",
        "-- Esto es un comentario",
        "# Esto es un comentario",
    ),
    ("=", "==", "!=", "==="),
]
# Índice de la respuesta correcta para cada pregunta, el el mismo orden que las preguntas
correct_answers_index = [1, 2, 0, 3, 1]

# El usuario deberá contestar 3 preguntas
points = 0

# Se selecciona una pregunta aleatoria
questions_to_ask = random.sample(list(zip(questions, answers, correct_answers_index)), k=3)

for question, answers_option, correct_answer in questions_to_ask:
    print(question)
    # Se muestra la pregunta y las respuestas posibles
    for i, answer in enumerate(answers_option):
        print(f"{i + 1}. {answer}")

    # El usuario tiene 2 intentos para responder correctamente
    for intento in range(2):
        user_answer = input("Respuesta: ")

        # Verifica si el dato ingresado por el usuario es un dato dentro del rango de opciones de respuesta
        if not user_answer.isdigit() or (int(user_answer) - 1) not in range(len(answers_option)):
            print("Respuesta no válida")
            exit(1)
        else:
            user_answer = int(user_answer) - 1

        # Se verifica si la respuesta es correcta
        if user_answer == correct_answer:
            print("¡Correcto!")
            points += 1
            print(f"Tu puntaje parcial es: {points}")
            break
        else:
            if points >=0.5:
                points -= 0.5
    else:
    # Si el usuario no responde correctamente después de 2 intentos,
    # se muestra la respuesta correcta
      print("Incorrecto. La respuesta correcta es:")
      print(answers_option[correct_answer])
      print(f"Tu puntaje parcial es: {points}")


# Al final, se muestra el puntaje final
print(f"Tu puntaje final es: {points}")
