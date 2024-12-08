//1. Implemente una solución para los siguientes enunciados simples:

//a. Calcular e imprimir el promedio de 2 números que se leen del teclado.
program sacar_promedio;
var
a,b : integer;
promedio : real;
begin
writeln ('Introduce Valor'); 
readln(a);
writeln('Introduce Valor 2');
readln(b);
promedio:=(a+b)/2;
writeln('El promedio de los dos valores es ', promedio:0:2);
end.

//b. Leer 2 números por teclado e imprimir el mayor.

Program mayor;
var
num1,num2 : integer;
begin
writeln('Escribe un numero');
readln(num1);
writeln('Escribe otro numero');
readln(num2);
if num1>num2 then 
writeln('El mayor num es ',num1)
else if num1<num2 then
writeln('El mayor num es ',num2)
else
writeln('Ambos numeros son identicos');
end.

//c. Leer un número desde teclado e imprimir si es par o no.

program es_par; 
var
num1 : integer;
begin
writeln('Escribe un numero');
read(num1);
if num1 mod 2 =0
    then writeln ('El numero es par ')
else writeln('El numero es impar');
end.

//d. Leer un número e imprimir si es o no múltiplo de 5 (termina en 0 o 5).
program multiplos;
var
num1 : integer;
begin
writeln('Inserte un numero');
readln(num1);
if num1 mod 5 = 0 then 
writeln('Es multiplo de 5')
else
writeln('No es multiplo de 5');
end.

//e. Leer un número del 0 al 9 e imprimir la tabla de multiplicar de ese número.


//f. Leer base y altura de un rectángulo e imprimir el área (base x altura) y perímetro (2x(base+altura)) de este.

program rectangulo;
var
base : real;
altura : real;
begin
writeln('Escribe base');
readln(base);
writeln('Escribe Altura');
readln(altura);
writeln('area: ',(base*altura));
writeln('perimetro', 2*(base+altura));
end.

// g. Leer la cantidad de millas de un boleto de avión y determinar las millas de regalo que les corresponden al comprador, sabiendo que se acumula 1 milla de regalo cada 100 millas de viajes.

Program promo_millas;
var
cant_millas : integer;
millas_ganadas : real;
begin
writeln ('Ingrese cantidad de millas de su Ticket');
readln(cant_millas);
millas_ganadas:= cant_millas/100;
Writeln('Usted gano ',millas_ganadas:0:2,' millas para gastar en futuros vuelos');
end.

// h. Leer la edad de un estudiante e informar si pertenece al preescolar (edad menor a 7), primaria (entre 7 y 12), secundaria (entre 13 y 18) y universitario (mayor que 18).
program estudiante_tipo;
var
edad:integer;
begin
writeln('Inserte edad estudiante');
var
edad:integer;
begin
writeln('Inserte la edad  del estudiante');
readln('Edad');


//i. Leer edad y sexo de una persona e indicar la cantidad de años que le faltan para jubilarse,
//considerando la edad de jubilación para hombres (65 años) y mujeres(60 años) en Argentina. Tener
//en cuenta que el valor de los años para jubilarse no puede ser menor que 0.

program jubilacion;
const edad_jub_mujer = 60;
edad_jub_hombre = 65;
var sexo:char;
edad:real;
begin writeln ('Ingrese edad');
readln (edad);
writeln ('Ingrese el sexo F o M');
readln (sexo);
if (sexo= 'F')
  then writeln ('Falta para jubilarse ', (edad_jub_mujer - edad):0:0)
  else
  writeln ('Falta para jubilarse ', (edad_jub_hombre - edad):0:0,' años');
end.

//j. Leer el año de nacimiento de una persona e indicar a qué generación pertenece (Baby Boomers:
//1946-1964, Generación X: 1965-1980, Millennials: 1981-1996, Generación Z: 1997-presente).

program generacion;
var
año_nac :integer;

begin
writeln ('Inserte año de nacimiento ');
readln('año_nac');

if año_nac >= 1945 and año_nac =<1964 
then writeln('Generación Baby Boomers')
else

if año_nac >= 1965 and año_nac =<1980
then writeln('Generación X')
else

if año_nac >= 1981 and año_nac =<1996 
then writeln('Generación Millenials')
else
if año_nac >= 1997
then writeln('Generación Z')
else
writeln('Su edad esta fuera del rango de este programa');
end.


//2. Realizar un programa que lea 3 números enteros y los imprima en orden descendente. Por ejemplo, si se
//ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10

program reordenamiento;
var
num1,num2,num3 : integer;
begin
writeln('ingrese el primer numero');
readln(num1);
writeln('ingrese el segundo numero');
readln(num2);
writeln('ingrese el tercer numero');
readln(num3);

if (num1<num2) and (num2<num3)
then 
writeln('Sus numeros ordenados son: ',num1,',',num2,',',num3)
else

if (num1<num3) and (num3<num2)
then 
writeln('Sus numeros ordenados son: ',num1,',',num3,',',num2)
else


if (num2<num1) and (num1<num3)
then 
writeln('Sus numeros ordenados son: ',num2,',',num1,',',num3)
else

if (num2<num3) and (num3<num1)
then 
writeln('Sus numeros ordenados son: ',num2,',',num3,',',num1)
else

if (num3<num2) and (num2<num1)
then 
writeln('Sus numeros ordenados son: ',num3,',',num2,',',num1)
else

if (num3<num1) and (num1<num2)
then 
writeln('Sus numeros ordenados son: ',num3,',',num1,',',num2)
else
writeln('no cumple condiciones');
end.

//3. Modifique el programa anterior para que el mensaje de salida muestre la suma de los tres números:
//a. Utilizando una variable adicional

program reordenamiento;
var
num1,num2,num3,suma : integer;
begin
writeln('ingrese el primer numero');
readln(num1);
writeln('ingrese el segundo numero');
readln(num2);
writeln('ingrese el tercer numero');
readln(num3);
suma:= (num1 + num2 + num3);
writeln('La suma total de los numeros es igual a ', suma);
end.


//b. Sin utilizar una variable adicional

program reordenamiento;
var
num1,num2,num3 : integer;
begin
writeln('ingrese el primer numero');
readln(num1);
writeln('ingrese el segundo numero');
readln(num2);
writeln('ingrese el tercer numero');
readln(num3);
writeln('La suma total de los numeros es igual a ',(num1 + num2 + num3));
end.

//4. Implemente un programa que lea el diámetro D de un círculo e imprima:
//a. El radio (R) del círculo (la mitad del diámetro).
//b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
//c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula D*PI (o
//también PI*R*2).PI es 3,1416


program calculo_circulo;
const
pi = 3.1946;
var
radio,diametro : real;
begin
writeln ('Inserte diametro');
readln(diametro);
radio:=(diametro/2);
writeln('Radio: ',radio:0:2);
writeln('Area: ',(pi*radio*radio):0:2);
writeln('Perimetro: ',(diametro*pi):0:2);
end.

//5. Realice un programa que informe el valor total en pesos de una transacción en dólares. Para ello, el programa
//debe leer el monto total en dólares de la transacción, el valor del dólar al día de la fecha y el porcentaje (en
//pesos) de la comisión que cobra el banco por la transacción. Por ejemplo, si la transacción se realiza por 10
//dólares, el dólar tiene un valor 863,50 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
//La transacción será de 8980.4 pesos argentinos (resultado de multiplicar 10*863,50 y adicionarle el 4%)

program cotizador;

var
total_trans_usd,cot_usd,com_bco : real;
begin
writeln ('Inserte monto en USD de la transacción');
readln(total_trans_usd);

writeln ('Inserte cotizacion del dia USD/Pesos');
readln(cot_usd);

writeln ('Inserte valor de la comision bancaria');
readln(com_bco);

writeln('El valor total de la transacción es de ',(total_trans_usd*cot_usd*(1+(com_bco/100))):0:2,' Pesos');
end.

//6. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno
//de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son vocales”,
//y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.

program es_vocal;
var
char1,char2,char3 : char;
begin
writeln('introduce un caracter');
readln(char1);

writeln('introduce un caracter');
readln(char2);

writeln('introduce un caracter');
readln(char3);

if ((char1='a') or (char1='e') or (char1='i') or (char1='o') or (char1='u')) and  
   ((char2='a') or (char2='e') or (char2='i') or (char2='o') or (char2='u')) and
   ((char3='a') or (char3='e') or (char3='i') or (char3='o') or (char3='u')) 
then
   writeln('Todos las letras son vocales')
else
    writeln('Por lo menos una de  las letras no es una vocal');
end.
