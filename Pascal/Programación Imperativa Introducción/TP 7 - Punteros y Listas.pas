//PRACTICO 7
//Nos faltó el punto 6 que lo salteamos porque era parecido al resto y el último inciso del 7 que ya estabamos cansados 


{Punto 1  y 2}
program Listas;
uses GenericLinkedList;
type
ListaEnteros = specialize LinkedList <integer>;

Procedure armarLista (var le:ListaEnteros);
var
 num: integer;
begin
 le:= ListaEnteros.create(); // crea la lista vacía
 writeln('ingrese numero');
 readln(num);
 While (num <> 0) do begin

le.add(num);
writeln('ingrese numero');
readln(num);
 end;
end;

//● Implementar un módulo que imprima los números enteros guardados en la lista generada.


procedure imprimir(le:listaenteros);
begin
le.reset();
while not le.eol() do
begin
writeln(le.current());
le.next()
end;
end;

procedure multiplo(le:listaenteros;x:integer);
begin
le.reset();
while not le.eol() do
begin
	if(le.current() mod x=0) then 
	begin
	writeln(le.current())
	end;
le.next();
end;
end;

{punto 2}
//Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
procedure darmaximo(le:listaenteros;var maximo:integer);

begin
le.reset();
	while not le.eol() do
	begin
		if(le.current()>maximo) then 
		begin
		maximo:=le.current();
		end;
	le.next();
	end;
end;
//● Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
procedure darminimo(le:listaenteros;var minimo:integer);

begin
le.reset();
	while not le.eol() do
	begin
		if(le.current()<minimo) then 
		begin
		minimo:=le.current();
		end;
	le.next();
	end;
end;
//Son mayores : recibe como parámetros la lista L y un valor entero Y, y retorna la cantidad de elementos de la lista que son mayores a Y.
procedure  mayoresy(le:listaenteros; y:integer;var cant:integer);
begin
le.reset();
	while (not le.eol()) do 
	begin
		if(y>le.current()) then
		begin
		cant:=cant + 1;
		end;
	le.next();
	end;
end;


{declaración de variables del programa principal}
var
 le : ListaEnteros;
 x,y,maximo,minimo,cant:integer;
{cuerpo del programa principal}
begin
minimo:=999;
maximo:=-1;
cant:=0;
 armarLista(le);

//● Implementar un módulo que imprima los números enteros guardados en la lista generada.
 //imprimir lista
  imprimir(le);
  
 // informar múltiplos

//● Indicar qué hace el programa.
{Armar una lista por medio de un procedimiento donde le carga numeros y devuele lista armada hasta el corte num=0}
//● Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 80, 1, 63, 120, 0.
{80, 1, 63, 120}

// Implementar un módulo que reciba la lista y un valor x, e informe los números múltiplos de x.
writeln('ingrese numero para informar multiplos');
readln(X);
writeln('multiplos de',x);
multiplo(le,x);

{Punto 2 }
//Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.

darmaximo(le,maximo);
writeln('valor maximo',maximo);

//● Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
darminimo(le,minimo);
writeln('valor minimo',minimo);
//Son mayores : recibe como parámetros la lista L y un valor entero Y, y retorna la cantidad de elementos de la lista que son mayores a Y.
writeln('contar mayores que, ingrese numero');
readln(y);
writeln('la cantidad de numeros',y,'son ');
mayoresy(le,y,cant);
writeln('La cantidad es ',cant);

end.

{punto 3}
{3 Se lee información de empleados que trabajaron en la empresa “DotCom”. De cada empleado se lee código,
nombre y apellido, DNI, área en la que trabaja y año de ingreso. Almacenar la información separada para los
empleados que trabajan en la empresa, un listado de empleados que trabajan desde el 2023 y otro listado de
los empleados que ingresaron antes del 2023. Una vez leída y almacenada la información se desea:
● Informar los nombres y apellidos de los empleados que ingresaron desde el 2023.
● Informar los nombre y apellidos de los empleados que ingresaron antes del 2023.}

program punto3;
//------------------------------------------------------------
uses genericlinkedlist;

//------------------------------------------------------------
type
empleados=record
codigo:integer;
nombre:string;
apellido:string;
dni:integer;
area:string;
anio:integer;
end;
//------------------------------------------------------------
lista_anio= specialize linkedlist <empleados>;
//------------------------------------------------------------
procedure leer(var a:empleados);
begin
readln(a.codigo);
if(a.codigo<>0) then  // DUDA que hago cuando no tengo corte control
begin
readln(a.nombre);
readln(a.apellido);
readln(a.dni);
readln(a.area);
readln(a.anio);
end;
end;

//------------------------------------------------------------
procedure almacenar(var lista2023post,lista2023pre:lista_anio);
var 
a:empleados;
begin
lista2023post:=lista_anio.create();
lista2023pre:=lista_anio.create();

leer(a);

	while (a.codigo<>0) do  // DUDA que hago cuando no tengo corte control
	begin	
		if(a.anio>=2023) then
		begin
		lista2023post.add(a);
		end
		else
		begin
		lista2023pre.add(a);
		end;
	leer(a);
	end;
end;

procedure imprimir(lista2023post,lista2023pre:lista_anio);
var
l2023:empleados;
l2023pre:empleados;
begin

lista2023post.reset();
lista2023pre.reset();
//● Informar los nombres y apellidos de los empleados que ingresaron desde el 2023.


while (not lista2023post.eol()) do
begin
writeln('Empleados post 2023');
l2023:=lista2023post.current();
writeln(l2023.nombre,' , ',l2023.apellido);
lista2023post.next();
end;


//● Informar los nombre y apellidos de los empleados que ingresaron antes del 2023.}
writeln('Empleados pre 2023');
while (not lista2023pre.eol()) do
begin
l2023pre:=lista2023pre.current();
writeln(l2023pre.nombre,' , ',l2023pre.apellido);
lista2023pre.next();
end;
end;

//---------------- PROGRAMA -------------------------------
var
lista2023post,lista2023pre:lista_anio;

begin


almacenar(lista2023post,lista2023pre);

imprimir(lista2023post,lista2023pre);
end.



{punto 4 
* Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto
se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa el código 0.
Una vez leída y almacenada toda la información, calcular e informar:
● Porcentaje de productos con stock actual por debajo de su stock mínimo.
● Descripción de aquellos productos con código par.
● Código de los dos productos más económicos.}

program punto4;

uses  GenericLinkedlist; 

type
productos=record
codigo:integer;
descripcion:string;
stockactual:integer;
stockmin:integer;
precio:real;
end;

listaprod = specialize linkedlist <productos>;

procedure leer (var p:productos);
begin
writeln ('ingrese codigo');
readln (p.codigo);
if (p.codigo <> 0) then begin
writeln ('ingrese descripcion');
readln (p.descripcion);
writeln ('ingrese stockactual');
readln (p.stockactual);
writeln ('ingrese stockmin');
readln (p.stockmin);
writeln ('ingrese precio');
readln (p.precio);
end;
end;

procedure almacenar (var lp:listaprod);
var
p:productos;
begin
lp:= listaprod.create();
leer (p);
while (p.codigo<>0) do begin
lp.add (p);
leer (p);
end;
end;

// Porcentaje de productos con stock actual por debajo de su stock mínimo.
function porcentaje(lp:listaprod):real;
var
cant,total:integer;
produc:productos;

begin
cant:=0;
total:=0;
lp.reset ();
while (not lp.eol()) do begin
produc:=lp.current();
if (produc.stockactual < produc.stockmin) then begin
cant:= cant + 1;
end;
total:= total + 1;
lp.next ();
end;
porcentaje:= (cant/total)*100;
end;

 //● Descripción de aquellos productos con código par.
procedure codpar (lp:listaprod);
var 
codipar:productos;
begin
lp.reset ();
while (not lp.eol ()) do begin
codipar:=lp.current ();
if (codipar.codigo MOD 2=0)then begin
 writeln(codipar.descripcion);
end;
lp.next ();
end;
end;

//● Código de los dos productos más económicos.}
procedure minimos (lp:listaprod);
var
min1,min2:real;
cod2,cod1:integer;
codi:productos;
begin
min1:=999;
min2:=999;
cod1:=0;
cod2:=0;
lp.reset();
	while (not lp.eol()) do begin
	codi:=lp.current ();
		if (codi.precio < min1) then begin
		min2:= min1;
		cod2:=cod1;
		min1:=codi.precio;
		cod1:=codi.codigo;
		end
		else if (codi.precio<min2) then begin
		min2:=codi.precio;
		cod2:=codi.codigo;
		end;
			lp.next();
	end;

writeln ('los dos codigos de los productos con precios min son', cod1,' y ',cod2); 
end;
//----------------------------Program-----------------------------//

var
lp:listaprod;
porcentajes:real;
begin
almacenar (lp);
porcentajes:=porcentaje(lp);
writeln( 'El porcentaje es ',porcentajes:0:2);
codpar(lp);
minimos (lp);
end.
{punto 5}
{5. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos
los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android instalada,
el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La información
disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la información
disponible de todos los dispositivos e informe:
● La cantidad de dispositivos para cada versión de Android.
● La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
● El tamaño promedio de las pantallas de todos los dispositivos.}

program punto5;
uses genericlinkedlist;

//--------------------------------------------------------------
type
dispositivo=record
android:string;
pantalla:real;
ram:integer;
end;
//--------------------------------------------------------------

listadispositivo= specialize linkedlist <dispositivo>;

// OBSERVACION ES UNA LISTA ORDENADA

//LEO EL REGISTRO
procedure leer(var d:dispositivo);
begin
writeln('android');
readln(d.android);
if(d.android<>'0') then
begin
writeln('pantalla');
readln(d.pantalla);
writeln('ram');
readln(d.ram);
end;
end;

//--------------------------------------------------------------
procedure almacenar(var l:listadispositivo);
var
d:dispositivo;
begin
l:=listadispositivo.create();
leer(d);
	while (d.android<>'0') do
	begin
	l.add(d);
	leer(d);
	end;
end;
//--------------------------------------------------------------
//● La cantidad de dispositivos para cada versión de Android.
procedure  informar(l:listadispositivo);
var 
androidactual:string;
cant,cant2,contador:integer;
promedio,suma:real;
d:dispositivo;
begin
cant:=0;
cant2:=0;
contador:=0;
suma:=0;
promedio:=0;
l.reset();
d:=l.current();
androidactual:=d.android;
while (not l.eol()) do
begin
d:=l.current();
		if(d.android=androidactual) then
		begin
		cant:=cant +1;
		end
			else
			begin
			writeln('El total de dispositivos de ', androidactual, ' es ',cant);
			androidactual:=d.android;
			cant:=1;
			end;
//-------------------------------------------------------------
//● La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
		if(d.ram>3) and (d.pantalla<=5) then
		begin
		cant2:=cant2+1;
		end;
//--------------------------------------------------------------
//● El tamaño promedio de las pantallas de todos los dispositivos.
	suma:=suma + d.pantalla;
	contador:=contador+1;
	l.next();
	end;
//----------------------- IMPRIMO -----------------------------
writeln('El total de dispositivos de ', androidactual, ' es ',cant);
writeln('El total de dispositivs con los requisitos en el punto b es ',cant2);
promedio:= suma/contador;
writeln('El promedio de los tamanios de las pantallas es',promedio:0:2);
end;
var
l:listadispositivo;
begin
almacenar(l);
informar(l);
end.


{punto 7}
{
Se dispone de información de vehículos que posee la empresa “DotCom”. De cada vehículo se conoce su patente,
marca, modelo, año y todos los choferes que lo conducen (no se repiten). De cada chofer se conoce su número
de licencia, nombre, apellido, día de la semana (1..7) y turno que cubre (mañana, tarde o noche). Calcular e
informar:
● El día de la semana que más choferes trabajan.
● Cantidad de vehículos que conduce el chofer “Alain Prost”.
● La patente de los dos vehículos que más choferes tuvieron.}

program punto7;
uses GenericLinkedlist;

type
chofer=record
licencia:integer;
nombre:string;
apellido:string;
diasemana:integer;
turno:string;
end;

vehiculos=record
patente:string;
marca:string;
anio:integer;
choferes:chofer;
end;

listavehiculos=Specialize Linkedlist <vehiculos>;

vdia=array[1..7] of integer;

procedure leer (var a:vehiculos);
begin
read(a.patente);
	if(a.patente<>'0') then
	begin
	read(a.marca);
	read(a.anio);
	read(a.choferes.nombre);
	read(a.choferes.apellido);
	read(a.choferes.diasemana);
	read(a.choferes.turno);
	end;
end;

procedure almacenar(var l:listavehiculos);
var
a:vehiculos;
begin
l:=listavehiculos.create();
leer(a);
	while (a.patente<>'0') do
	begin
	l.add(a);
	leer(a);
	end;
end;

procedure iniciarvector(var vd:vdia);
var
i:integer;
begin
	for i:=1 to 7 do
	begin
	vd[i]:=0;
	end;
end;

// Conte los choferes que viajaron cada dia.

procedure contardias(var l:listavehiculos;var vd:vdia);
var

v:vehiculos;
dia:integer;
begin
iniciarvector(vd);
l.reset();
while (not l.eol) do
begin
v:=l.current(); // me guardo el valor de la lista
dia:=v.choferes.diasemana;  // busco en el registro de la lista que me habia guardado el dia
vd[dia]:=vd[dia]+1; //voy sumando en la pos del vector que igual al dia el acumulado
l.next();
end;
end;


// El día de la semana que más choferes trabajan. ACA CALCULO EL MAXIMO
procedure maximo (vd:vdia);
var
i,dia:integer;
maximo:integer;
begin
maximo:=-1;
for i:=1 to 7 do
begin
if(vd[i]>maximo) then
maximo:=vd[i];
dia:=i
end;
writeln('El dia que mas choferes viajaron es',dia);
end;

//----------------------------------------------------------------------
//Cantidad de vehículos que conduce el chofer “Alain Prost”.
procedure alainprost(l:listavehiculos);
var
cant:integer;
v:vehiculos;
begin
l.reset();
cant:=0;
	while (not l.eol()) do 
	begin
	v:=l.current();
		if (v.choferes.nombre='Alain') and (v.choferes.apellido='Prost') then 
		begin
		cant:=cant+1;
		end;
	l.next();
	end;
writeln('La cantidad de vehiculos que condujo Alan son ',cant);
end;
//------------------- PROGRAMA  ------------------------------
var 
l:listavehiculos;
vd:vdia;

begin
almacenar(l);
contardias(l,vd);
maximo(vd);
//● Cantidad de vehículos que conduce el chofer “Alain Prost”.

alainprost(l);
end.
