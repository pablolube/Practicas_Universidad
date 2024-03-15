//PRACTICA 2
program numeros;
var
num,total,i,mayor : integer;
BEGIN
mayor :=0;
total:=0;
    for i:=1 to 10 do
        begin
        writeln('Inserte 10 numeros');
        read(num);
        total:=total + num;
        if num>5 then
        mayor:=mayor + 1;
        
        end;
writeln('EL total es : ',total,' .Hay un total de ',mayor,' numeros mayor que  5');
readln()
end.

// 2) Realizar un numero que imprima la tabal del numero de 0 al 9 
// Realizar un numero que imprima la tabal del numero de 0 al 9 
Program tabla;
var
i,j,k : integer;
num,multiplica : real;
begin
writeln('Este programa multiplica un numero por cada numero dentro del rango que defina el usuario');
writeln('Escribir un numero');
readln(num);
writeln('Multiplica desde');
readln(i);
writeln('multiplica hasta');
readln(j);
for i:=i to j do
begin
multiplica := num * i;
writeln(num:0:2,' x ',i,' = ',multiplica:0:2);
end;
read();
end.
// 3) escribe un numeros hasta que ingresen 0 y finaliza cantidad de num ingresados
program cantnum;
var
num : real;
contador : integer;
begin
contador:= 1;
writeln ('Calcula la cantidad de numeros ingresados');
writeln ('Ingrese un numero (ingrese 0 para finalizar el programa) ');
readln(num);
while num <>0 do
begin 
contador:=(contador+1);
writeln ('Ingrese num real');
readln(num);
end;
writeln('Cantidad de numeros ingresados es ',contador);
read()
end.

//3a se pare cuando ingrese 0 o cuando llegue a 10 numeros ingresados

program ContarNumeros;
var
  numero, contador: integer;
begin
  contador := 0;
writeln ('Calcula la cantidad de numeros ingresados');
writeln ('Ingrese 10 numeros o ingrese 0 para finalizar el programa ');
  readln(numero);

  while (numero <> 0)  and (contador <9) do
  begin
    contador := contador + 1;
    writeln('Ingrese un numero (ingrese 0 para salir): ');
    readln(numero);
  end;
  
  if numero <> 0 then 
  writeln('No se ingreso 0');
  writeln('Se ingresaron ', contador, ' numeros antes de ingresar 0.');
  readln;
end.

{4) Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura finaliza
cuando se ingresa el legajo -1.
Por ejemplo, se lee la siguiente secuencia:
• 33423
• 8.40
• 19003
• 6.43
• -1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003,
cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un promedio).
Al finalizar la lectura, informar:
• La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
• La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
}

program contadorlegajo;
const
corte=-1;
promsup=6.5;
var
legajo,promedio : real;
cantmayor:real;
contalumnos,i : integer;
begin
writeln('Ingrese un legajo o ingrese -1 para finalizar el programa');
read(legajo);
cantmayor:=0;
contalumnos:=0;
while(legajo<>corte) do
    begin
    contalumnos:=contalumnos+1;
    writeln('Ingrese un promedio');
    readln(promedio);
        if (promedio>promsup) then
        begin
        cantmayor:=cantmayor+1;
        end;
    writeln('Ingrese un legajo o ingrese -1 para finalizar el programa');
    readln(legajo);
    end;
writeln('El total de legajos es: ',contalumnos);
writeln('El total de alumnos mayor que ',promsup:0:2,' es ',cantmayor:0:2);
end.

{ 5) Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si se lee la
secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”}

program lector;
var
num,i,mayor : integer;
begin
mayor:=-1;
for i:=1 to 10 do
BEGIN
writeln('Ingrese un numero');
readln(num);

    if(num>mayor) then
    BEGIN
    mayor:=num;
    end;
    end;
writeln('El mayor numero es: ',mayor);
read()
end.


{5a) 5. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si se lee la
secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
a. Modifique el programa anterior para que, además de informar el mayor número leído, se informe el número
de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}
program lector2;
var
num,i,mayor,ubicacion : integer;
begin
mayor:=-1;
ubicacion:=0;
for i:=1 to 10 do
BEGIN
writeln('Ingrese un numero');
readln(num);

    if(num>mayor) then
    BEGIN
    mayor:=num;
    ubicacion:=i
    end;
    end;
writeln('El mayor numero es: ',mayor);
writeln('La ubicacion del mayor numero es: ',ubicacion);

read()
end.

{6. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.
}

program mini;
var
num,i,min1,min2 :integer;
BEGIN
min1:=9999;
min2:=9999;
    for i:=1 to 10 do
    BEGIN
    writeln('Ingrese un numero entero');
    read(num);
        if (num<min1) then
        BEGIN
        min2:=min1;
        min1:=num;
        end
        else if (num<min2) then 
        BEGIN
            min2:= num;
        end;
    end;
    writeln('Los minimos son:',min1,' y ',min2);
    end.
    
    {6. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número
0.
}
program mini;
const
corte=0;

var
cont,num,i,min1,min2 :integer;
BEGIN
min1:=9999;
min2:=9999;
cont:=0;
writeln('Ingrese numero');
read(num);
while  (cont<1000) and (num<>0) do
    BEGIN
    cont:=(cont+1);
    if(num<min1) then
    BEGIN
        min2:=min1;
        min1:=num;
    end
    else
        if (num<min2) then 
            BEGIN
            min2:= num;
            end;
    
    writeln('Escribe otro numero');
    read(num);
    end;
    writeln('Los minimos son:',min1,' y ',min2);
    end.
    

    


{
7. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee
código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
• Los códigos de los dos productos más baratos.
• La cantidad de productos de más de 16 pesos con código par.
}

program super;

var
cod,i,codmin1,codmin2,contarpar : integer;
precio,min1,min2 :real;

BEGIN
min1:=9999;
min2:=9999;
codmin1:=0;
codmin2:=0;
contarpar:=0;
for i:=1 to 3 do
    BEGIN
    writeln('Ingrese un codigo');
    readln(cod);
    writeln('Ingrese un precio');
    readln(precio);
        if (cod mod 2=0) and(precio>16) then
        BEGIN
        contarpar:=contarpar+1;
        End;
            
        if (precio<min1) and (i=1) then
        BEGIN
            min2:=precio;
            min1:=precio;
            codmin1:=cod;
            codmin2:=cod;
        End

        else if (precio<min1)  then
        BEGIN
            min2:=min1;
            min1:=precio;
            codmin2:=codmin1;
            codmin1:=cod;
        end
            
        else if (precio<min2)  then
         BEGIN
            min2:=precio;
            codmin2:=cod;
        end;
    end;
    writeln('Los codigos con minimos son: ',codmin1,'y ',codmin2);
    writeln('Cantidad de productos: ',contarpar);
    end.

{
8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes, los
montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se lee el monto 0. Se asume
un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo
el mes.
}

-- opcion 1 

program ventas;
var
dia,ingreso,totaldia,totalacum,i : integer;
begin
totalacum:=0;
for i:=1 to 2 do
begin
writeln('Mes de Febrero dia ', i);
writeln('Ingresa montos de ventas');
readln(ingreso);
totaldia:=0;
    while ingreso<>0 do
    begin
    totaldia:=totaldia+ingreso;
    writeln('Ingresa montos de ventas');
    readln(ingreso)
    end;
totalacum:=totalacum+totaldia;    
writeln('Ventas totales dia ',i,' es ',totaldia)
end;
writeln('Total del mes es igual a ',totalacum);
end.

-- Opcion 2

 program AnalisisVentas;

var
  ventas: array[1..31] of Integer;
  total_ventas, monto_dia: Integer;
  dia: Integer;

begin
  total_ventas := 0;

  { Inicializar el arreglo de ventas }
  for dia := 1 to 31 do
    ventas[dia] := 0;

  { Leer los montos de ventas }
  for dia := 1 to 31 do
  begin
    writeln('Ingrese las ventas del dia ', dia, ' (0 para finalizar): ');
    monto_dia := 0;
    repeat
      readln(monto_dia);
      ventas[dia] := ventas[dia] + monto_dia;
    until monto_dia = 0;

    { Actualizar el total de ventas }
    total_ventas := total_ventas + ventas[dia];
  end;

  { Imprimir la cantidad de ventas por día }
  writeln('Cantidad de ventas por día:');
  for dia := 1 to 31 do
    writeln('Día ', dia, ': ', ventas[dia]);

  { Imprimir el monto total acumulado en ventas del mes }
  writeln('Monto total acumulado en ventas del mes: ', total_ventas);

end.


{
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad de
ventas.}



program ventas;
var
dia,ingreso,totaldia,totalacum,i,diamax,totalmax : integer;
begin
totalacum:=0;
totalmax:=0;
diamax:=0;
for i:=1 to 31 do
begin
writeln('Mes de Febrero dia ', i);
writeln('Ingresa montos de ventas');
readln(ingreso);
totaldia:=0;
    while ingreso<>0 do
    begin
    totaldia:=totaldia+ingreso;
    writeln('Ingresa montos de ventas');
    readln(ingreso)
    end;
totalacum:=totalacum+totaldia;
    if totaldia>totalmax then
    begin
        totalmax:=totaldia;
        diamax:=i;
    end;
writeln('Ventas totales dia ',i,' es ',totaldia)
end;
writeln('Total del mes es igual a ',totalacum);
writeln('El maximos de ventas se dio el dia  ',diamax,' con un total de ',totalmax)

end.


{
9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter,
debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia de
números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de números,
e imprimir el resultado final.
Por ejemplo:
o Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
o Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

program OperacionSecuenciaNumeros;

var
  caracter: Char;
  num, resultado,count : Integer;

begin
  writeln('Ingrese el carácter de operación (+ para suma, - para resta): ');
  readln(caracter);
  count:=0;
  
  if (caracter <> '+') and (caracter <> '-') then
  begin
    writeln('Error: Carácter incorrecto. El programa se cerrará.');
    Exit;
  end;
  
  resultado := 0; // Inicializar el resultado
  
  writeln('Ingrese una secuencia de números (termina con 0):');
  readln(num);
  
  
  while num <> 0 do
  begin
  count:=count+1;
  if(caracter ='-') and ( count=1) then
    begin
    resultado := num;
    end
        else
    begin
        if( caracter = '-') then
        resultado := resultado - num
    else 
    
            resultado := resultado + num;
    end;
    readln(num); // Leer el siguiente número
  end;
  
  writeln('El resultado es: ', resultado);
end.