{Práctica 9 – Repaso
1. Una remisería dispone de información acerca de los 550 viajes realizados durante el mes de mayo de 2023. De
cada viaje se conoce: número de viaje, código de auto, categoría del viaje (1..5), dirección de origen, dirección
de destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto
y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Informar las dos categorías de viaje que menos kilómetros recorrieron.
c. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.}

program tp91;
uses genericlinkedlist;
const
dimf= 550;
type
viaje=record
nro:integer;
cod:integer;
categoria:integer;
origen:string;
destino:string;
km:real;
end;

vviaje=array[1..dimf] of viaje;
vectorcontador=array[1..5] of real;
lista5km= specialize linkedlist <viaje>;

procedure Leer(var v: viaje);
begin
 
  writeln('Ingrese el código de viaje:');
  readln(v.cod);
  
  if (v.cod<>0) then
  begin
  writeln('Ingrese el número de viaje:');
  readln(v.nro);
  
 
  
  writeln('Ingrese la categoría de viaje:');
  readln(v.categoria);
  
  writeln('Ingrese el origen del viaje:');
  readln(v.origen);
  
  writeln('Ingrese el destino del viaje:');
  readln(v.destino);
  
  writeln('Ingrese los kilómetros del viaje:');
  readln(v.km);
 end;
end;

procedure almacenar(var vv:vviaje); // se dispone
var
a:viaje;
i:integer;
begin
leer(a);
i:=1;
	while (a.cod<>0) do 
	begin
	vv[i]:=a;
	leer(a);
	i:=i+1;
	end;
end;


procedure inicializovc(var vc:vectorcontador);
var 
i:integer;
begin
	for i:=1 to 5 do 
	begin
	vc[i]:=0;
	end;
end;


procedure agregarordenado(var l:lista5km;a:viaje);
var
seguir:boolean;
begin
seguir:=true;
l.reset();
while (not l.eol()) and seguir do
BEGIN
	IF (not l.eol()) and (l.current().nro>a.nro) then
	seguir:=false
	ELSE
	L.NEXT()
end;
l.insertcurrent(a);	
end;


procedure maximo(codactual:integer;autoactualkm:real;var max1,max2:real;var cod1,cod2:integer);
	begin
	
	if (autoactualkm>max1) then
	begin
	cod2:=cod1;
	max2:=max1;
	max1:=autoactualkm;
	cod1:=codactual;
	end
		else if(autoactualkm>max2) then
		begin
		max2:=autoactualkm;
		cod2:=codactual;
		end;
	end;





procedure informo(v:vviaje;var l:lista5km;var max1,max2:real; var cod1,cod2:integer;var vc:vectorcontador) ;
var
i:integer;
codactual:integer;
autoactualkm:real;

begin
// INICIALIZO VARIABLES
i:=1;
max1:=0;
max2:=0;
cod1:=0;
cod2:=0;
inicializovc(vc);
		
		while (i<=dimf) do
		//WHILE EXTERNO
		begin
		codactual:=(v[i].cod);
		autoactualkm:=0;

							while (i<=dimf) and (codactual=v[i].cod) do 
							//WHILE INTERNO
							begin
							//a. Informar los dos códigos de auto que más kilómetros recorrieron.
							autoactualkm:=autoactualkm+v[i].km;

							//b. Informar las dos categorías de viaje que menos kilómetros recorrieron.
							VC[v[i].categoria]:=VC[v[i].categoria]+ v[i].km;
							
							//c. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, 
							//ordenada por número de viaje.}
								if (v[i].km>5)  then
								begin
								agregarordenado(l,v[i]);
								end;
							i:=i+1;
		end;	
		//aca calculo maximo km
		maximo(codactual,autoactualkm,max1,max2,cod1,cod2);
		end;
	
		
		
end;		
	
procedure minimo(vc: VectorContador; var catmin1, catmin2: integer);
var 
  i: integer;
  min1, min2: real;
begin
  min1 := 9999;
  min2 := 9999;
  
  for i := 1 to 5 do
  begin
    if vc[i] < min1 then
    begin
      min2 := min1;
      catmin2 := catmin1;
      min1 := vc[i];
      catmin1 := i;
    end
    else if vc[i] < min2 then
    begin
      min2 := vc[i];
      catmin2 := i;
    end;
  end;
end;


// PROGRAMA
var

l:lista5km;
v:vviaje;
max1,max2:real;
cod1,cod2:integer;
vc:vectorcontador;
catmin1,catmin2:integer;

begin
almacenar(v);
l:=lista5km.create();
//
informo(v,l,max1,max2,cod1,cod2,vc);
//calculo minimos
minimo(vc,catmin1,catmin2);

//1
writeln( 'Los 2 autos que mas recorrieron fueron ',cod1, ' y ',cod2);
//2
writeln( 'Las categorias de viajes que menos km tuvieron fueron',catmin1, ' y ', catmin2);
end.

///---------------------------------------------------------------------------------------------


//                              PUNTO 2

///---------------------------------------------------------------------------------------------

{La billetera virtual MP dispone de una lista de transferencias realizadas entre Enero y Diciembre del 2023. De
cada transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora y monto. Esta estructura no posee orden alguno.
Se pide:
a. Generar una lista que contenga sólo las transferencias a terceros (son aquellas en las que las cuentas origen
y destino no pertenecen al mismo titular). Debe estar ordenada por número de cuenta origen.
Utilizar la lista del inciso a. para:
b. Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c. Calcular e informar el mes que más transferencias a terceros tuvo.
d. Calcular e informar el promedio de monto transferido a terceros en el mes de octubre. 
 }

program Ejerciciodos;
uses GenericLinkedlist;

type
rfecha=record
dia:integer;
mes:integer;
anio:integer;
end;

MP=Record
NumCuenOrg:Integer;
DniOrigen:integer;
NumCuenDest:integer;
DniDest:integer;
fecha:rfecha;
hora:string;
monto:real;
end;

lista= specialize linkedlist <mp>;

vectorcontador=array[1..12] of real;


// - procesos - se dispone

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    SE DISPONE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure leer(var a:mp);
begin
  writeln('Ingrese el número de cuenta origen: ');
    readln(a.NumCuenOrg);
    
    writeln('Ingrese el DNI del origen: ');
    readln(a.DniOrigen);
    
    writeln('Ingrese el número de cuenta destino: ');
    readln(a.NumCuenDest);
    
    writeln('Ingrese el DNI del destino: ');
    readln(a.DniDest);
    
    writeln('Ingrese la fecha (dia mes año): ');
    readln(a.fecha.dia, a.fecha.mes, a.fecha.anio);
    
    writeln('Ingrese la hora: ');
    readln(a.hora);
    
    writeln('Ingrese el monto: ');
    readln(a.monto);

end;

// Creo lista

procedure almacenar ( var l:lista );
var
a:mp;
begin
leer(a);
	while (a.NumCuenOrg<>0) do 
	begin
	l.add(a);
	leer(a);
	end;
end;



// - procesos y funciones -

procedure insertarordenado ( var Lterceros: lista;valor:mp);
var
seguir: boolean;
begin
lterceros.reset();
seguir:= true;
while(not lterceros.eol()) and seguir do begin
if (lterceros.current().NumCuenOrg > valor.NumCuenOrg) then
seguir:= false
	else
	lterceros.next();
end;
lterceros.insertCurrent(valor);
end; 


//a. Generar una lista que contenga sólo las transferencias a terceros (son aquellas en las que las cuentas origen
//y destino no pertenecen al mismo titular). Debe estar ordenada por número de cuenta origen.

Procedure CrearListaTerceros (l: lista; var Lterceros:lista);
var
a:mp;
begin
Lterceros:=lista.create();
l.reset();
while ( not l.eol) do
begin
a:=l.current();
if ( a.dniorigen <> a.dnidest ) then begin
  insertarordenado( Lterceros,a)
  end;
l.next
end;
end;



// inicializo vector contador

procedure iniciar(var vc:vectorcontador);
var
i:integer;
begin
	for i:=1 to 12 do
	begin
	vc[i]:=0;
	end;
end;



procedure maximo(vc:vectorcontador;var mesmax:integer);
var
i:integer;
maximo:real;
begin
maximo:=-1;
	for i:=1 to 12 do
	begin
		if  vc[i] > maximo  then
		begin
		maximo:=vc[i];
		mesmax:=i;
		end;
	end;
end;
//b. Calcular e informar para cada cuenta de origen el monto total transferido a terceros.

procedure informar (lt:lista);
var
ctaorigenact:integer;
sumamontos:real;
vc:vectorcontador;
transoct:integer;
a:mp;
mesmax:integer;
prom:real;

begin
transoct:=0;
prom:=0;
lt.reset();
iniciar(vc);
	while not lt.eol() do
	begin
	ctaorigenact:=lt.current().NumCuenOrg;
	sumamontos:=0;

		while ((not lt.eol())and (lt.current().NumCuenOrg=ctaorigenact)) do 
		begin 
		a:=lt.current();
		//b. Calcular para cada cuenta de origen el monto total transferido a terceros.
		sumamontos:=sumamontos + a.monto;

		//c. Calcular e informar el mes que más transferencias a terceros tuvo.
		vc[a.fecha.mes]:=vc[a.fecha.mes]+ a.monto;
		
		//d. Calcular e informar el promedio de monto transferido a terceros en el mes de octubre. 
			if(a.fecha.mes=10) then
			begin
			transoct:=transoct+1;
			end;
		
		lt.next();
		if( not lt.eol() )then 
		ctaorigenact:=lt.current().NumCuenOrg;		
		end;
		//b. Informar para cada cuenta de origen el monto total transferido a terceros.
		writeln('El total de transferencias en la cuenta ',ctaorigenact,' fue de ',sumamontos);
	
	end;
			//c. Calcular e informar el mes que más transferencias a terceros tuvo.
			maximo(vc,mesmax);
			writeln('El mes que mas transferencias tuvo fue ',mesmax);
			//d. Calcular e informar el promedio de monto transferido a terceros en el mes de octubre. 
			prom:=vc[10]/transoct;
			writeln('El monto transferido a terceros en el mes de octubre fue de' , prom);
	end;
	

///  ---- programa principal-------
var
l,lt:lista;

begin
l:=lista.create();
almacenar(l);
CrearListaTerceros(l,lt);
informar(lt);
end.
//-------------------------------------------------------------------------------------------------------
//                              PUNRTO 3
//-------------------------------------------------------------------------------------------------------
{Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva película,
para ello se debe leer y almacenar la información de las personas que desean participar de dicho casting. De
cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que prefiere (1: drama, 2:
romántico, 3: acción, 4: suspenso, 5: terror). 
* La lectura finaliza cuando llega una persona con edad -1. Una vez
finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas con edad par.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal.}

program punto3;
uses genericlinkedlist;
const
nrogen=5;

type
actores=record
dni:integer;
apellido:string;
nombre:string;
edad:integer;
codgenero:integer;
end;

// Creo listas y vectores
listaactores=specialize linkedlist <actores>;
vcgeneros=array[1..nrogen] of integer;

//PROCEDIMIENTOS

procedure  leer(var a:actores);
begin
writeln('Ingrese edad');
readln(a.edad);
	if(a.edad<>-1) then 
	begin
	writeln('Ingrese dni');
	readln(a.dni);
	writeln('Ingrese apellido');
	readln(a.apellido);
	writeln('Ingrese nombre');
	readln(a.nombre);
	writeln('Ingrese genero pelicula');
	readln(a.codgenero);
	end;
end;

procedure almacenar (var l:listaactores);
var
a:actores;
begin
leer(a);
	while (a.edad<> -1 ) do
	begin
	leer(a);
	l.add(a);
	end;
end;

procedure inicalizarvc(var vc:vcgeneros);
var
i:integer;
begin
for i:=1 to nrogen do
	begin
	vc[i]:=0;
	end;
end;


procedure maximo(vc:vcgeneros;var codmax1,codmax2:integer);
var
max1,max2:integer;
i:integer;
begin
max1:=0;
max2:=0;

	for i:=1 to nrogen do
	begin
		if (vc[i]> max1) then
		begin
		max2:=max1;
		codmax2:=codmax1;
		max1:=vc[i];
		codmax1:=i;
		end
		else if (vc[i]> max2) then
		begin
		max2:=vc[i];
		codmax2:=i;
		end;
	end; 
end;

procedure recorrerinformar(l:listaactores);
var
a:actores;
cant,codmax1,codmax2:integer;
vc:vcgeneros;
begin
//inicializo 
inicalizarvc(vc);
cant:=0;
codmax1:=-1;
codmax2:=-1;
l.reset();
//recorro
		while (not l.eol()) do
		begin
		a:=l.current();
		//a. Informar la cantidad de personas con edad par.
		if (a.edad mod 2 = 0) then
		begin
		cant:=cant+1;
		end;

		//b. Informar los dos códigos de género más elegidos.
		vc[a.codgenero]:=vc[a.codgenero]+1;
		
		l.next();
		end;
//a
writeln('La cantidad de personas con edad par es de',cant);

//b
maximo(vc,codmax1,codmax2);
writeln('Los generos mas elegidos son aquellos con los codigos',codmax1,codmax2);
end;

procedure eliminar(var l:listaactores;dni:integer; var encontre:boolean);
begin
encontre:=false;
l.reset();
	while (not l.eol) and (not encontre) do
	begin
		if(dni=l.current().dni) then
		begin
		l.removecurrent();
		encontre:=true;
		end
		else
		begin
		l.next();
		end;
	end;
end;

// PROGRAMA PRINCIPAL
var
l:listaactores;
dni:integer;
existe:boolean;
begin
l:=listaactores.create();
almacenar (l);
recorrerinformar(l);

//c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.	
read(dni);
eliminar(l,dni,existe);
	if not existe then
	writeln('No se encuentra el dni',dni,'en la lista')
	else 
	writeln('Se elimino de la lista el DNI',dni);
	
end.
//------------------------------------------------------------------------------------------------------------
	//              							PUNTO 4 
	//------------------------------------------------------------------------------------------------------------
	





{4. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de
préstamos de libros efectuados en febrero de 2024. Para ello, se debe leer la información de los préstamos
realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el
libro, día del préstamo (1..29). La información de los préstamos se lee de manera ordenada por ISBN y finaliza
cuando se ingresa el ISBN -1

Se pide:
a. Generar una lista que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado. Debe quedar
ordenada por ISBN de libro.
b. Calcular e informar el día del mes en que se realizaron menos préstamos.
c. Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par
}

program punto4;
uses genericlinkedlist;
const
dimdia=29;
type
prestamo=record
nro:integer;
isbn:integer;
nrosocio:integer;
dia:integer;
end;

vecesprestado=record
isbn:integer;
cant:integer;
end;

listaprestamos=specialize linkedlist <vecesprestado>;
vectprestamos=array[1..dimdia] of integer;

procedure leer(var a:prestamo);
begin
writeln('Libro');
readln(a.isbn);
if (a.isbn<>-1)then 
begin
writeln('Numero de prestamo');
readln(a.nro);
writeln('Numero de socio');
readln(a.nrosocio);
writeln(' dia');
readln(a.dia);
end;
end;

procedure iniciarvc(var vc:vectprestamos);
var
i:integer;
begin
	for i:=1 to 29 do
	begin
	vc[i]:=0;
	end;
end;

//b. Calcular e informar el día del mes en que se realizaron menos préstamos.

procedure minimo (vc:vectprestamos);
var
i,min,diamin:integer;
begin
min:=999;
for i:=1 to dimdia do 
begin
if (vc[i]<min) then 
min:=vc[i];
diamin:=i;
end;
writeln('El dia que menos prestamos se realizaron fue',diamin);
end;


procedure armarlista(var l:listaprestamos;var vc:vectprestamos);
var
a:prestamo;
vp:vecesprestado;
pcumplen,totalprestamos:integer;
ISBNactual,pactual:integer;
porcentaje:real;
begin
//inicializo 
totalprestamos:=0;
pcumplen:=0;
pactual:=0;
porcentaje:=0;
//leo
iniciarvc(vc);
leer(a);
ISBNactual:=a.ISBN; // IGUAL EL ISBN
	while (a.ISBN<>-1) do
	begin
	//cantidad de prestamos 
	totalprestamos:=totalprestamos+1;

//------------------------------------------------------------------------------------------------------------
	//b. Calcular e informar el día del mes en que se realizaron menos préstamos.
		vc[a.dia]:=vc[a.dia]+1;
//------------------------------------------------------------------------------------------------------------
	//c. Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par
		if ((a.nro mod 2=1) and (a.nrosocio mod 2=0)) then 
		pcumplen:=pcumplen +1;
//------------------------------------------------------------------------------------------------------------
	// LOS HIZO CON UN IF???
		if(ISBNactual=a.ISBN) then
		begin
		pactual:=pactual+1
		end
				else
				begin 
				vp.ISBN:=ISBNACTUAL;
				vp.cant:=pactual;
				l.add(vp);
				pactual:=1; 
				ISBNactual:=a.ISBN;
				end;
	leer(a);
	end;
	//------------------------------------------------------------------------------------------------------------
	//              							FUERA DEL WHILE INFORMO
	//------------------------------------------------------------------------------------------------------------
	//b. Calcular e informar el día del mes en que se realizaron menos préstamos.
	minimo(vc);
	//c. Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par
	porcentaje:=pcumplen/totalprestamos;
	writeln('El porcentaje de prestamos fue',porcentaje:0:2);
end;
	var
vc:vectprestamos;
l:listaprestamos;
begin
l:=listaprestamos.create();
iniciarvc(vc);
armarlista(l,vc);
end.

//-------------------------------------------------------------------------------------------------------
///                                 PUNTO 5
//-------------------------------------------------------------------------------------------------------

{Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De cada
evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3: obra de
teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas para el evento
y costo de la entrada. Se pide:
Generar una lista con las ventas de entradas para tales eventos culturales. 

* De cada venta se debe guardar: códigode venta, número de evento (1..100), DNI del comprador y cantidad de entradas adquiridas. No superan la
cantidad máxima permitida para cada evento. La lectura de las ventas finaliza con código de venta -1.
Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador tiene DNI impar para el evento de tipo “unipersonal”.
c. Si la cantidad de entradas vendidas para el evento número 20 alcanzó la cantidad máxima de personas
permitidas.}
program Ejerciciodos;
uses GenericLinkedlist;

const
dimf=100;

type
evento=record
nombre:string;
tipo:integer;
lugar:string;
capmax:integer;
costo:real;
end;

ventas=record
codvta:integer;
codevento:integer;
dnicomp:integer;
cantentradas:integer;
end;

vectorevento=array[1..100] of evento;
listavtas=specialize linkedlist <ventas>;
vectorcontador=array[1..100] of real;

// LEO EVENTO 
procedure leer(var a:evento); //se dispone
begin

readln(a.nombre);
readln(a.tipo);
readln(a.lugar);
readln(a.capmax);
readln(a.costo);
end;

// ALMACENO EVENTO EN VECTOR

procedure almacenar(var v:vectorevento); // se dispone
var
a:evento;
i:integer;
begin
for i:=1 to dimf do
	begin
	leer(a);
	v[i]:=a;
	end;
end;


//CREO LISTA DE VENTAS
{Generar una lista con las ventas de entradas para tales eventos culturales. 
De cada venta se debe guardar: códigode venta, número de evento (1..100), DNI del comprador y cantidad de entradas adquiridas. No superan la
cantidad máxima permitida para cada evento. La lectura de las ventas finaliza con código de venta -1.
Una vez leída y almacenada la información de las ventas, calcular e informar:}

procedure leervta(var a:ventas); //se dispone
begin
readln(a.codvta);
if (a.codvta<>-1) then 
begin
readln(a.codevento);
readln(a.dnicomp);
readln(a.cantentradas);
end;
end;


procedure crearlistavta(var l:listavtas);
var
a:ventas;
begin
leervta(a);
while (a.codvta<>-1) do 
begin
l.add(a);
leervta(a);
end;
end;

procedure iniciar(var vc:vectorcontador);
var
i:integer;
begin
for i:=1 to 100 do
begin
vc[i]:=0;
end;
end;
procedure minimo(vc:vectorcontador;var posmin1,posmin2:integer);
var
minimo1,minimo2:real;
i:integer;
begin
minimo1:=9999;
minimo2:=9999;

	for  i:=1 to 100 do
	begin
		if (vc[i]<minimo1) then
		begin
		minimo2:=minimo1;
		posmin2:=posmin1;
		minimo1:=vc[i];
		posmin1:=i;
		end
		else if  (vc[i]<minimo2) then
		begin
		minimo2:=vc[i];
		posmin2:=i;
		end;
	end;
end;
//  RECORRO Y INFORMO 
procedure recorre(l:listavtas;v:vectorevento);
var

av:ventas;
vc:vectorcontador;
totalentradas:integer;
posmin1,posmin2:integer;
totalev20:integer;
begin
posmin1:=0;
posmin2:=0;
totalentradas:=0;
totalev20:=0;
iniciar(vc);

l.reset();

while (not l.eol) do
begin
av:=l.current();

//a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
vc[av.codevento]:=vc[av.codevento]+ av.cantentradas*v[av.codevento].costo;

//b. La cantidad de entradas vendidas cuyo comprador tiene DNI impar para el evento de tipo “unipersonal”.
if (av.codevento=4)and (av.dnicomp mod 2 =1) then 
totalentradas:=totalentradas+av.cantentradas;

//c. Si la cantidad de entradas vendidas para el evento número 20 alcanzó la cantidad máxima de personas permitidas.}
if av.codevento=20 then
totalev20:=totalev20 + av.cantentradas;
l.next();
end;
//a 
minimo(vc,posmin1,posmin2);
writeln( 'Los 2 eventos que menos recaudacion tuvieron fueron ',v[posmin2].nombre,v[posmin2].lugar, ' y ', v[posmin1].nombre,  v[posmin1].lugar);

//b. La cantidad de entradas vendidas cuyo comprador tiene DNI impar para el evento de tipo “unipersonal”.
writeln('La cantidad de entradas vendidas cuyo comprador tiene DNI impar para el evento de tipo “unipersonal', totalentradas);

//c. Si la cantidad de entradas vendidas para el evento número 20 alcanzó la cantidad máxima de personas permitidas.}

if (v[20].capmax>=totalev20) then
writeln('El total de entradas no alcanzo la capacidad')
else 
writeln('Se paso de la capacidad');


end;


var
v:vectorevento;
l:listavtas;
begin
almacenar(v);
crearlistavta(l);
recorre(l,v);
end.






