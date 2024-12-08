
//punto 1

program sumador;
type
vnums=array[1..10] of integer;
var
numeros:vnums;
i:integer;
begin

for i:=1 to 10 do 
begin
numeros[i] := i;
end;

//punto 1

writeln('----------Primer bucle--------------');

for i:= 1 to 10 do 
begin
write(numeros[i]);
write(';');
end;
for i:= 2 to 10 do 
begin
numeros[i]:= numeros[i] + numeros[i-1];
end;


writeln('');
//punto b


writeln('----------Segundo  bucle--------------');
writeln('');

for i:= 1 to 10 do 
begin
write(numeros[i]);
write(';');
end;
writeln('');

writeln('----------Tercer punto --------------');


//punto c
for i:=1 to 10 do 
begin
numeros[i] := i;
end;

for i:= 1 to 9 do 
begin
numeros[i]:= numeros[i] + numeros[i-1];
end;

for i:=1 to 10 do 
begin
write(numeros[i]);
write(';');
end;
end.



// 2)
program Vectores;
const
cant_datos = 3;
type
vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
num:integer;
//a { completar }
begin
writeln('Ingrese un numero');
readln(num);
    while (num<>0 ) and (diml<cant_datos) do
    begin
    diml:=diml+1;
    v[diml]:=num;
    writeln('Ingrese un numero');
    readln(num);
    end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
i:integer;
begin
    for i:=1 to diml do
    begin
    v[i]:=v[i] + n;
    suma:=suma+v[i];
    end;
end;

var
 datos : vdatos;
 i, dim : integer;
 num, suma : real;

begin
 dim := 0;
 suma := 0;

 cargarVector(datos,dim); 
 writeln('Ingrese un valor a sumar');
 readln(num);

 modificarVectorySumar(datos,dim,num,suma);
 
  for i := 1 to dim do
  begin
    write(datos[i]:0:2);
    write(';');
 end;
 
 writeln('La suma de los valores es: ', suma:0:2);
 writeln('Se procesaron: ',dim, ' números');
end.


//3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.

program programa;
const
dimf=100
type
vector=array[1..dimf] of integer

//a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
procedure imprmea(var v:vector, diml:integer)
var
i:integer
for i:1 to  diml do 
writeln([i]);
end;

var
dim:integer
v:vector
begin

imprimea(v,diml)

end;
//b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.

program numentero;
const
dimf=10;
type
vector=array[1..dimf] of integer;

//a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
procedure imprmea(var v:vector; dimL:integer);
var
i:integer;
begin
for i:=1 to  diml do
    begin
    writeln(v[i]);
    end;
end;
var
diml:integer;
v:vector;
begin
writeln('Ingrese la cantidad de valores ingresado');
read(diml);
imprmea(v,dimL);
end.


//c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la mitad más uno hacia la última posición.

procedure imprmea(var v:vector; dimL:integer);
var
i:integer;

//-------------------------------------- Primera mitad
begin
for i:=(diml div 2) downto  1 do
    begin
    writeln(v[i]);
    end;
end;

//-------------------------------------- Segunda mitad
begin
for i:=(diml div 2)+1 to diml do
    begin
    writeln(v[i]);
    end;
end;



//d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición
//X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que, dependiendo
//de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.

program numentero;
const
dimf=10;
type
  vector = array[1..dimf] of integer;

// Módulo que imprime el vector desde la posición X hasta la Y
procedure imprimirSegmentoVector(var v: vector; x, y: integer);
var
  i: integer;
begin
    if (x>y) then 
    begin
    for i:=x to y  do
        
        writeln(v[i]);
    end
    else if (y<x)  then
    begin
     for i:=y to x  do
        begin
        writeln(v[i]);
        end;
    end
    end;
    


var
  dimL, X, Y, i: integer;
  v: vector;
begin
  writeln('Ingrese la cantidad de valores ingresados');
  readln(dimL);

  writeln('Ingrese los ', dimL, ' valores:');
  for i := 1 to dimL do
  begin
    readln(v[i]);
  end;

  writeln('Ingrese la posición X:');
  readln(X);
  writeln('Ingrese la posición Y:');
  readln(Y);

  // Verificar si las posiciones X e Y son válidas
  if (X >= 1) and (X <= dimL) and (Y >= 1) and (Y <= dimL) then
  begin
    writeln('Segmento del vector desde la posición ', X, ' hasta la posición ', Y, ':');
    imprimirSegmentoVector(v, X, Y);
  end
  else
  begin
    writeln('Las posiciones X e Y deben estar dentro del rango válido.');
  end;
end.
// e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.

//4 Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
//a 
{posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor
-1 en caso de no encontrarse}

program ejercicio4a;
const
dimf=3;
type vector=array[1..dimf] of integer;
//-----------------------------------------------------------------------------------------------------------------


Procedure cargar (var v:vector);
Var
 i:integer;
Begin
 for i:= 1 to dimf do
 begin
 read(v[i]);
 end;
End;

//-----------------------------------------------------------------------------------------------------------------
function posicion(v:vector):integer;
var 
seguir:boolean;
x:integer;
pos:integer;
begin
//Inicializo
pos:=1;
seguir:=true;

writeln('Ingrese el numero a buscar ');
readln(x);

while(pos<=dimf) and (seguir=true) do 
begin    
    if(x=v[pos]) then
    begin
    seguir:=false;
    end
    else
    begin
    pos:=pos+1;
    writeln(pos);
    end;
end;    
    if(seguir=false) then 
    begin
    posicion:=pos;
    end
    else
    posicion:=-1;
    end;

//-----------------------------------------------------------------------------------------------------------------

var 
v:vector;
pos:integer;
Begin
 cargar (v);
 pos:= posicion (v);
     if pos=-1 then 
     begin
     writeln ('No se encontró el número');
     end
     else
     writeln ('La posición es ', pos);
     
End. 


{intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde
se intercambiaron los valores de las posiciones x e y}

program ejercicio4b;
const
dimf=5;
type vector=array[1..dimf] of integer;
//-----------------------------------------------------------------------------------------------------------------

Procedure cargar (var v:vector);
Var
 i:integer;
Begin
 for i:= 1 to dimf do
 begin
 read(v[i]);
 end;
End;

//-----------------------------------------------------------------------------------------------------------------
procedure intercambiar (var v:vector;x,y:integer);
var
temp:integer;
begin
if(x<=dimf) and (y<=dimf) then 
begin
temp:=v[x];
v[x]:=v[y];
v[y]:=temp;
end
else
begin
writeln('Los valores de x o y no estan dentro del rango')
end;
end;



//-----------------------------------------------------------------------------------------------------------------

var 
v:vector;
i,pos,x,y:integer;

Begin
 cargar (v);
 
 writeln('Ingrese 2 valores del 1 al 100');
 readln(x);
 readln(y);
 intercambiar(v,x,y);
 for i:=1 to dimf  do
     begin
     write(v[i]);
     write(';');
     end;
End. 


{c. sumaVector: retorna la suma de todos los elementos del vector}

program ejercicio4c;
const
dimf=5;
type vector=array[1..dimf] of integer;
//-----------------------------------------------------------------------------------------------------------------

Procedure cargar (var v:vector);
Var
 i:integer;
Begin
 for i:= 1 to dimf do
 begin
 read(v[i]);
 end;
End;

//-----------------------------------------------------------------------------------------------------------------
procedure sumatoria (var v:vector;var suma:integer);
var
i:integer;
begin
    for i:=1 to dimf do 
    begin
    suma:=suma+v[i];
    end;
end;

//-----------------------------------------------------------------------------------------------------------------

var 
v:vector;
suma:integer;

begin
suma:=0;

cargar(v);
sumatoria(v,suma);
writeln('La cantidad total es de ',suma);
End. 


{d. sumaVector: retorna la suma de todos los elementos del vector}


program ejercicio4d;
const
dimf=5;
type vector=array[1..dimf] of integer;
//-----------------------------------------------------------------------------------------------------------------

Procedure cargar (var v:vector);
Var
 i:integer;
Begin
 for i:= 1 to dimf do
 begin
 read(v[i]);
 end;
End;

//-----------------------------------------------------------------------------------------------------------------
procedure sumatoria (var v:vector;var suma:integer);
var
i:integer;
begin
    for i:=1 to dimf do 
    begin
    suma:=suma+v[i];
    end;
end;

//-----------------------------------------------------------------------------------------------------------------

var 
v:vector;
suma:integer;

begin
suma:=0;

cargar(v);
sumatoria(v,suma);
writeln('La cantidad total es de ',suma/dimf);
End. 

//-----------------------------------------------------------------------------------------------------------------

//f. elementoMaximo: retorna la posición del mayor elemento del vector

program ejercicio4e;
const
dimf=5;
type vector=array[1..dimf] of integer;
type vectormax=array[1..dimf] of integer;
//-----------------------------------------------------------------------------------------------------------------

Procedure cargar (var v:vector);
Var
 i:integer;
Begin
 for i:= 1 to dimf do
 begin
 read(v[i]);
 end;
End;

//-----------------------------------------------------------------------------------------------------------------

function maximo(v:vector):integer;
Var
i,max:integer;
begin
max:=-1;
    for i:=1 to dimf do
    begin;
        if (v[i]<max) then
        begin
        max:=v[i];
        end;
    end;    
maximo:=max;
end;
    
//-----------------------------------------------------------------------------------------------------------------
function cantmax (v:vector;maximo:integer):integer;
var
i,cant:integer;
begin
cant:=0;
    for i:=1 to dimf do
    begin
        if(maximo=v[i]) then
        cant:=cant+1;
    end;
    cantmax:=cant;
end;

procedure buscapos(v:vector;cantmax:integer;max:integer;var pos:vectormax);
var
i,j:integer;
sigue:boolean;
begin
i:=1;
j:=0;
sigue:=true;
    while(sigue=true) do 
    begin
        if(v[i]=max) then
        begin
            j:=j+1;
            pos[j]:=i;
           
        end;
        
        if(j=cantmax) then
        begin
            sigue:=false
        end;
    i:=i+1;
    end;
end;     

//-----------------------------------------------------------------------------------------------------------------

var 
v:vector;
pos:vectormax;
i,largo:integer;
begin
cargar(v);

largo:=cantmax(v,maximo(v));

buscapos(v,largo,maximo(v),pos);
    
for i:=1 to largo do
    Begin
    write(pos[i]);
    write(';');
    end;
End. 

//f. elementoMaximo: retorna la posición del mayor elemento del vector

//e. elementoMaximo: retorna la posición del mayor elemento del vector

program ejercicio4e;
const
dimf=5;
type vector=array[1..dimf] of integer;
type vectormax=array[1..dimf] of integer;
//-----------------------------------------------------------------------------------------------------------------

Procedure cargar (var v:vector);
Var
 i:integer;
Begin
 for i:= 1 to dimf do
 begin
 read(v[i]);
 end;
End;

//-----------------------------------------------------------------------------------------------------------------

function minimo(v:vector):integer;
Var
i,min:integer;
begin
min:=-1;
    for i:=1 to dimf do
    begin;
        if (v[i]<min) then
        begin
        min:=v[i];
        end;
    end;    
minimo:=min;
end;
    
//-----------------------------------------------------------------------------------------------------------------
function cantmin (v:vector;min:integer):integer;
var
i,cant:integer;
begin
cant:=0;
    for i:=1 to dimf do
    begin
        if(maximo=v[i]) then
        cant:=cant+1;
    end;
    cantmin:=cant;
end;

procedure buscapos(v:vector;cantmin:integer;min:integer;var pos:vectormin);
var
i,j:integer;
sigue:boolean;
begin
i:=1;
j:=0;
sigue:=true;
    while(sigue=true) do 
    begin
        if(v[i]=min) then
        begin
            j:=j+1;
            pos[j]:=i;
           
        end;
        
        if(j=cantmin) then
        begin
            sigue:=false
        end;
    i:=i+1;
    end;
end;     

//-----------------------------------------------------------------------------------------------------------------

var 
v:vector;
pos:vectormax;
i,largo:integer;
begin
cargar(v);

largo:=cantmin(v,minmo(v));

buscapos(v,largo,minmo(v),pos);
    
for i:=1 to largo do
    Begin
    write(pos[i]);
    write(';');
    end;
End.

{a. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros desde
teclado (a lo sumo 100) y los almacene en un vector. 
La carga finaliza al leer el número 0. 

Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la operación realizada de la
siguiente manera: “El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el elemento
mínimo ... que se encontraba en la posición ...”.
b. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra
para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas posiciones.}



program ej5a;
const
dimf=100;
type
vector=array[1..dimf] of integer;
//-------------------------------------------------------------------------------------
procedure cargar(var v:vector;var diml:integer);
var
num:integer;
begin
diml:=0;

//Cargo datos
writeln('Ingrese numero');
readln(num);
    while(num<>0) and (diml<=dimf) do
    begin
    diml:=diml+1;
    v[diml]:=num;
    writeln('Ingrese numero');
    read(num);
    end;
end;
//-------------------------------------------------------------------------------------

procedure maxmin(v:vector;var diml:integer;var max,min,posmax,posmin:integer);
var
i:integer;
begin
max:=-1;
min:=9999;
    for i:=1 to diml do
    begin
    if (v[i]>max) then
        begin
        max:=v[i];
        posmax:=i;
        end;
        
    if (v[i]<min) then
        begin
        min:=v[i];
        posmin:=i;
        end;
    end;    
end;
//-------------------------------------------------------------------------------------
procedure intercambiar (var v:vector;x,y:integer);
var
temp:integer;
begin

if(x<=dimf) and (y<=dimf) then 
begin
temp:=v[x];
v[x]:=v[y];
v[y]:=temp;
end
else
begin
writeln('Los valores de x o y no estan dentro del rango')
end;
end;


//-------------------------------------------------------------------------------------
procedure imprimir(var v:vector;diml:integer);
var
i:integer;
begin
for i:=1 to diml do
write(v[i],';');
end;
//-------------------------------------------------------------------------------------
var
v:vector;
diml:integer;
max,min:integer;
posmax,posmin:integer;
begin
diml:=0;

cargar(v,diml);

maxmin(v,diml,max,min,posmax,posmin);

intercambiar(v,posmax,posmin);

imprimir(v,diml);
writeln('');

writeln(' El elemento máximo ', max, ' que se encontraba en la posición ',posmax);
writeln('fue intercambiado con el elemento mínimo ',min,'que se encontraba en la posición ',posmin);
end.

{6 a. Realizar un programa que lea y almacene la información de 
560 alumnos ingresantes de la carrera Ciencia de Datos
en Organizaciones en el año 2024.
De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de
nacimiento.
Una vez leída y almacenada toda la información, calcular e informar:
● El porcentaje de alumnos con DNI pares.
● Apellido y nombre de los dos alumnos de mayor edad.
b. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo sumo
560 alumnos. La lectura finaliza cuando se i}

program ej6;

//--------------------------------------------------------------------------------------------

const
dimf=3;

//--------------------------------------------------------------------------------------------

type
alumnos=record
nroinsc:integer;
dni:integer;
apellido:string;
nombre:string;
anionac:integer;
end;

//--------------------------------------------------------------------------------------------

valumnos=array[1..dimf] of alumnos;

//--------------------------------------------------------------------------------------------

procedure cargar(var v:valumnos;var cantpar:integer);
var 
i:integer;
begin
cantpar:=0;

    for i:=1 to dimf do
    begin
    writeln('Ingrese nro inscripcion');
    readln(v[i].nroinsc);
     writeln('Ingrese dni');
    readln(v[i].dni);
     writeln('Ingrese apellido');
    readln(v[i].apellido);
     writeln('Ingrese nombre');
    readln(v[i].nombre);
     writeln('Ingrese anionac');
    readln(v[i].anionac);
    
    
    if(v[i].dni mod 2=0) then
    cantpar:=cantpar+1;
    end;
end;




procedure menoredad(v:valumnos;var apellido1,apellido2,nombre1,nombre2:string);
var 
i:integer;
min1,min2:integer;
begin
min1:=9999;
min2:=9999;
apellido1:='';
apellido1:='';
nombre1:='';
nombre2:='';

    for i:=1 to dimf do
    begin
        if(v[i].anionac<min1) then
        begin
        min2:=min1;
        apellido2:=apellido1;
        nombre2:=nombre1;
        
        min1:=v[i].anionac;
        apellido1:=v[i].apellido;
        nombre1:=v[i].nombre;
        end
        else if(v[i].anionac<min2) then
        begin
        min2:=v[i].anionac;
        apellido2:=v[i].apellido;
        nombre2:=v[i].nombre;
        end;
    end;
end;
//--------------------------------------------------------------------------------------------

procedure imprimir(var v:valumnos);
var
i:integer;
begin
    for i:=1 to dimf do
    begin
    write(v[i].nroinsc);
    write(';');
    write(v[i].dni);
    write(';');
    write(v[i].apellido);
    write(';');
    write(v[i].nombre);
    write(';');
    write(v[i].anionac);
    writeln('')
    end;
end;


//--------------------------------------------------------------------------------------------

var
cantpar:integer;
v:valumnos;
porcentaje:real;
apellido1,apellido2,nombre1,nombre2:string;
begin
cargar(v,cantpar);
porcentaje:=cantpar/dimf;
writeln('El porcentaje de alumnos con DNI par es ', porcentaje:0:2);
menoredad(v,apellido1,apellido2,nombre1,nombre2);
writeln('Las personas con menores sueldos son ',apellido1,' ',nombre1);
writeln('Las personas con menores sueldos son ',apellido2,' ',nombre2);
imprimir(v);

end.

{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo sumo
560 alumnos. La lectura finaliza cuando se ingresa el DNI -1.}

{6 a. Realizar un programa que lea y almacene la información de 
560 alumnos ingresantes de la carrera Ciencia de Datos
en Organizaciones en el año 2024.
De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de
nacimiento.
Una vez leída y almacenada toda la información, calcular e informar:
● El porcentaje de alumnos con DNI pares.
● Apellido y nombre de los dos alumnos de mayor edad.
b. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo sumo
560 alumnos. La lectura finaliza cuando se i}

program ej6;

//--------------------------------------------------------------------------------------------

const
dimf=5;

//--------------------------------------------------------------------------------------------

type
alumnos=record
nroinsc:integer;
dni:integer;
apellido:string;
nombre:string;
anionac:integer;
end;

//--------------------------------------------------------------------------------------------

valumnos=array[1..dimf] of alumnos;

//--------------------------------------------------------------------------------------------

procedure cargar(var v:valumnos;var cantpar:integer;var i:integer);
begin
cantpar:=0;
i:=1;
    writeln('Ingrese dni');
    readln(v[i].dni);
    
    while (v[i].dni<>-1) and (i<=dimf) do
    begin
    writeln('Ingrese nro inscripcion');
    readln(v[i].nroinsc);
    writeln('Ingrese apellido');
    readln(v[i].apellido);
    writeln('Ingrese nombre');
    readln(v[i].nombre);
    writeln('Ingrese anionac');
    readln(v[i].anionac);
    
    
    if(v[i].dni mod 2=0) then
    begin
    cantpar:=cantpar+1;
    end;
    
    i:=i+1;
    writeln('Ingrese dni');
    readln(v[i].dni);
    end;
    i:=i-1
end;
//--------------------------------------------------------------------------------------------

procedure menoredad(v:valumnos;diml:integer;var apellido1,apellido2,nombre1,nombre2:string);
var 
i:integer;
min1,min2:integer;
begin
min1:=9999;
min2:=9999;
apellido1:='';
apellido1:='';
nombre1:='';
nombre2:='';

    for i:=1 to diml do
    begin
        if(v[i].anionac<min1) then
        begin
        min2:=min1;
        apellido2:=apellido1;
        nombre2:=nombre1;
        
        min1:=v[i].anionac;
        apellido1:=v[i].apellido;
        nombre1:=v[i].nombre;
        end
        else if(v[i].anionac<min2) then
        begin
        min2:=v[i].anionac;
        apellido2:=v[i].apellido;
        nombre2:=v[i].nombre;
        end;
    end;
end;
//--------------------------------------------------------------------------------------------

procedure imprimir(var v:valumnos;diml:integer);
var
i:integer;
begin
    for i:=1 to diml do
    begin
    write(v[i].nroinsc);
    write(';');
    write(v[i].dni);
    write(';');
    write(v[i].apellido);
    write(';');
    write(v[i].nombre);
    write(';');
    write(v[i].anionac);
    writeln('')
    end;
end;


//--------------------------------------------------------------------------------------------

var
cantpar:integer;
v:valumnos;
porcentaje:real;
apellido1,apellido2,nombre1,nombre2:string;
diml:integer;
begin
cargar(v,cantpar,diml);
porcentaje:=cantpar/diml;
writeln('El porcentaje de alumnos con DNI par es ', porcentaje:0:2);
menoredad(v,diml,apellido1,apellido2,nombre1,nombre2);
writeln('Las personas con mayor  edad son ',apellido1,' ',nombre1);
writeln('Las personas con mayor sueldos edad  ',apellido2,' ',nombre2);
imprimir(v,diml);

end.

//-----------------------------------------------------------------------------------------------------------------

{7. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300
empleados). La carga finaliza cuando se lea el salario 0 o cuando se completa el vector. Una vez finalizada la carga
de datos se pide:
● Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un módulo
que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y retorne el mismo
vector en el cual cada elemento fue multiplicado por el valor X.
● Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program ej7;
const
dimf=300;
x=0.15;
//----------------------------------------------------------------------------------------------
type 
vsalario=array[1..dimf] of real;

//----------------------------------------------------------------------------------------------
procedure cargar(var v:vsalario;var i:integer);
begin
i:=1;
    readln(v[i]);
    while (v[i]<>0) and (i<=dimf) do
    begin
    i:=i+1;
    read(v[i]);
    end;
i:=i-1;
end;
//----------------------------------------------------------------------------------------------
procedure imprmir(var v:vsalario;diml:integer);
var
i:integer;

begin

for i:=1 to diml do
begin
write((v[i]):0:2,';');
end;
end;
//----------------------------------------------------------------------------------------------
procedure ajustar(var v:vsalario;diml:integer;x:real);
var
i:integer;
begin
for i:=1 to diml do
begin
v[i]:=v[i]*(1+x);
end;
end;
//----------------------------------------------------------------------------------------------
procedure promedio(var v:vsalario;diml:integer);
var
i:integer;
suma,prom:real;
begin
suma:=0;
for i:=1 to diml do
begin
suma:=suma +v[i];
end;
prom:=suma/diml;
writeln('');
writeln('El promedio de lossuel es ',prom:0:2);
end;
//----------------------------------------------------------------------------------------------

var
diml:integer;
v:vsalario;
begin

cargar(v,diml);
imprmir(v,diml);
writeln('');
ajustar(v,diml,x);
imprmir(v,diml);
promedio(v,diml);
end.
//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

{ El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, para
cada una de las 200 fotos publicadas en su Instagram, cuenta con la siguiente información: título de la foto, el autor
de la foto, cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios. Realizar un programa que
lea y almacene esta información. Una vez finalizada la lectura, el programa debe procesar los datos e informar:
● Título de la foto más vista (la que posee mayor cantidad de clics).
● Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
● Cantidad de comentarios recibidos para cada una de las fotos publicadas}

program ejercicio8;
const
dimf=4;
type
fotos=record
titulo:string;
autor:string;
megusta:integer;
clics:integer;
comentarios:integer;
end;

vfotos=array[1..dimf] of fotos;

procedure cargarfotos(var v:vfotos);
var
i:integer;
begin
for i:=1 to dimf do
begin
writeln('Ingresa Titulo');
readln(v[i].titulo);
writeln('Ingresa Autor ');
readln(v[i].autor);
writeln('Ingresa Cantidad de me gustas');
readln(v[i].megusta);
writeln('Ingresa cantidad de clics ');
readln(v[i].clics);
writeln('Ingresa cantidad de comentarios ');
readln(v[i].comentarios);
end;
end;

//● Título de la foto más vista (la que posee mayor cantidad de clics).
procedure informar(v:vfotos);
var
i,max,sumamg:integer;
titulomax:string;
begin
max:=-1;
titulomax:='';
sumamg:=0;
    for i:=1 to dimf do
    begin
    //● Título de la foto más vista (la que posee mayor cantidad de clics).
        if(v[i].clics>max) then
        begin
        max:=v[i].clics;
        titulomax:=v[i].titulo;
        end;
    //● Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
        if(v[i].autor='Art Vandelay') then
        begin
        sumamg:=sumamg+v[i].megusta;
        end;
//● Cantidad de comentarios recibidos para cada una de las fotos publicadas.
        write(v[i].comentarios,';');
    end;
    writeln(' Titulo de la foto mas vista ',titulomax);
    writeln(' Me gusta recibidas Art Vandelay ',sumamg);
end; 
var
v:vfotos;
begin
cargarfotos(v);
informar(v);
end.









