
{1. a. Dado un vector de enteros de 500 valores enteros, realice un módulo que reciba dicho vector y un valor n y
retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}
program ej1a;

const
  dimf = 500;

type 
  vector = array[1..dimf] of integer;

function encontrar(v: vector; valor: integer): Boolean;
var 
  pos: integer;
  sigue: boolean;
begin
  pos := 1;
  sigue := False;
  while (pos <= dimf) and not sigue do
  begin
    if v[pos] = valor then
      sigue := True
    else
      pos := pos + 1;
  end;
  encontrar := sigue;
end;

var
  v: vector;
  valor: integer;
  i: integer;
  encontro: boolean;
begin
  { Llenar el vector con valores del 1 al 500 }
  for i := 1 to dimf do
    v[i] := i;

  { Leer el valor a buscar }
  readln(valor);

  { Llamar a la función encontrar y mostrar el resultado }
  if encontrar(v, valor) then 
    writeln('Se encontró el valor ', valor, ' en el vector')
  else
    writeln('NO se encontró el valor ', valor, ' en el vector');
end.

{b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}
program ej1a;

const
  dimf = 500;

type 
  vector = array[1..dimf] of integer;

function encontrar(v: vector; valor: integer): Boolean;
var 
  pos: integer;
  sigue: boolean;
begin
  pos := 1;
  sigue := False;
  while (pos <= dimf) and v[pos]<valor do // ACA SE HIZO EL CAMBIOOOO
  begin
    if v[pos] = valor then
      encontrar := True
    else
      pos := pos + 1;
  end;
var
  v: vector;
  valor: integer;
  i: integer;
  encontro: boolean;
begin
  { Llenar el vector con valores del 1 al 500 }
  for i := 1 to dimf do
    v[i] := i;

  { Leer el valor a buscar }
  readln(valor);

  { Llamar a la función encontrar y mostrar el resultado }
  if encontrar(v, valor) then 
    writeln('Se encontró el valor ', valor, ' en el vector')
  else
    writeln('NO se encontró el valor ', valor, ' en el vector');
end.


    {
2. Construir un programa que implemente y use:
a. Un módulo que lea números enteros desde el teclado y los almacene en un vector de dimensión física 100.
b. Un módulo que informe los números almacenados en las posiciones impares.
c. Un módulo que retorne la posición en que se encuentra almacenado el primer valor par. Si no hay ningún valor
par deberá devolver el valor 0.}

program punto2a;
const 
dimf=100;

type
vector=array[1..dimf] of integer;

//a. Un módulo que lea números enteros desde el teclado y los almacene en un vector de dimensión física 100.
 
procedure cargar(VAR v:vector)
var 
i:integer;
begin
    for i:=1 to dimf
    v[i]:=i
    end;
end;

//b. Un módulo que informe los números almacenados en las posiciones impares.

procedure informar(v:vector)
var 
i:integer;
begin
    for i:=1+1 to dimf
    writeln(v[i]);
    end;
end;

var
v:vector;
begin
cargar(v);
informar(v);
end.

{2. Construir un programa que implemente y use:
}
program punto2a;
const 
dimf=100;

type
vector=array[1..dimf] of integer;

//a. Un módulo que lea números enteros desde el teclado y los almacene en un vector de dimensión física 100.
 
procedure cargar(VAR v:vector);
var 
i:integer;
begin
    for i:=1 to dimf do
    begin
    v[i]:=i;
    end;
end;

//b. Un módulo que informe los números almacenados en las posiciones impares.

procedure informar(v:vector);
var 
i:integer;

begin

    for i:=1 to  dimf do
    begin
    if (i mod 2=0) then
    write(v[i],';')
    end;
end;

//Un módulo que retorne la posición en que se encuentra almacenado el primer 
//valor par. Si no hay ningún valor par deberá devolver el valor 0

function informar2(v:vector):integer;
var 
pos:integer;
sigue:boolean;
begin
sigue:=True;
pos:=1;
     while sigue and (pos<=dimf) do
     if (v[pos] mod 2=0) then
     begin
        sigue:=false;
        informar2:=pos;
     end
     else
     begin
        pos:=pos+1;
        informar2:=0;
    end;
    
end;

var
v:vector;
pos:integer;
begin
cargar(v);
informar(v);
pos:=informar2(v);
writeln('');

writeln('La posicion es ');
writeln(pos);
end.


{3. Se dispone de un vector con 150 nombres de flores. Realizar un programa que lea desde el teclado un nombre de
una flor e informe:
a. La posición del vector que coincida con este nombre}

program punto3a;
const 
dimf=5;

type
vector=array[1..dimf] of string;

procedure cargar(VAR v:vector);
var 
i:integer;
begin
    for i:=1 to dimf do
    begin
    writeln('Ingrese una flor ');
    readln(v[i]);
    end;
end;

procedure buscar(v:vector;nombre:string;Var posi:integer);
var 
seguir:boolean;
pos:integer;
begin
posi:=-1;
pos:=1;
seguir:=True;
    while  (seguir) and (pos<=dimf) do
    begin
    if(nombre=v[pos]) then
    begin
    seguir:=False;
    posi:=pos;
    end
    else
    begin
        pos:=pos+1;
    end;
end;
end;
var
v:vector;
nombre:string;
pos:integer;
begin
cargar(v);
writeln('Ingrese una Flor a Buscar ');
readln(nombre);
buscar(v,nombre,pos);

if(pos=-1) then 
begin
writeln('No se encontro la flor de nombre ',nombre);
end
else
begin
writeln('La flor de nombre ',nombre,('esta en la posicion  '),pos);
end;
end.


{b. Resolver el punto a. previa ordenación del vector.
 Nota: Tener en cuenta que dicho nombre puede no existir.}


program punto3a;
const 
dimf=5;
//-----------------------------------------------------------------------------------------

type
vector=array[1..dimf] of string;
//-----------------------------------------------------------------------------------------

procedure cargar(VAR v:vector);
var 
i:integer;
begin
    for i:=1 to dimf do
    begin
    writeln('Ingrese una flor ');
    readln(v[i]);
    end;
end;
//-----------------------------------------------------------------------------------------
procedure buscar(v:vector;nombre:string;Var posi:integer);
var 
pos:integer;
begin
posi:=-1;
pos:=1;
    while  (pos<=dimf) and (v[pos]<nombre) do
    begin
    if(nombre=v[pos]) then
    begin
    posi:=pos;
    end
    else
    begin
        pos:=pos+1;
    end;
end;
end;
//-----------------------------------------------------------------------------------------

var
v:vector;
nombre:string;
pos:integer;
begin
cargar(v);
writeln('Ingrese una Flor a Buscar ');
readln(nombre);
buscar(v,nombre,pos);

if(pos=-1) then 
begin
writeln('No se encontro la flor de nombre ',nombre);
end
else
begin
writeln('La flor de nombre ',nombre,('esta en la posicion  '),pos);
end;
end.

{4) 
Una cátedra dispone de información de sus 1000 alumnos. 
De cada alumno se conoce número de alumno, apellido,nombre y cantidad de asistencias a clase. 
Dicha información se encuentra ordenada por apellido de manera
ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un número de alumno recibido por parámetro o debe
retornar -1 si no existe.

b. Un módulo que informe apellido, nombre y número de alumno de todos los alumnos cuyo apellido comienza
con una letra que se recibe como parámetro.

a. Un módulo que retorne la cantidad de alumnos con cantidad de asistencias a clase en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos leídos
de teclado.}
program p4a;
const
dimf=1000;
//----------------------------------------------------------------------------

type
alumno=record
nro:integer;
apellido:string;
nombre:string;
cantasis:integer;
end;
//----------------------------------------------------------------------------

vector=array[1..dimf] of alumno;
//----------------------------------------------------------------------------
procedure cargaralum(var a:alumno);
begin
writeln('Ingrese nro alumno');
readln(a.nro);
    if (a.nro<>-1) then 
    begin
    writeln('Ingrese apellido');
    readln(a.apellido);
    writeln('Ingrese nombre');
    readln(a.nombre);
    writeln('Ingrese cantasis');
    readln(a.cantasis);
    end;
end;
//--------------------------------------------------------------------------
procedure ordenar(var v:vector;diml:integer);
var
i,j,p:integer;
posicion:alumno;
begin
    for i:=1 to diml-1 do
    begin
    p:=i;
        for J:=i+1 to diml do
        begin
            if(v[j].apellido<v[p].apellido) then
            begin
             p:=j;
             posicion := v[ p ];
             v[ p ] := v[ i ];
             v[ i ] := posicion;
             end;
        end;     
    end;
end;    
//----------------------------------------------------------------------------
procedure cargarv(var v:vector; var diml:integer);
var
a:alumno;
begin
diml:=0;
cargaralum(a);
    while(a.nro<>-1) and (diml<dimf) do
    begin 
    diml:=diml+1;
    v[diml]:=a;
    cargaralum(a);
    end;
ordenar(v,diml)
end;
//a. Un módulo que retorne la posición del alumno con un número de alumno recibido por parámetro o debe
//retornar -1 si no existe.
//----------------------------------------------------------------------------
procedure buscaralumno(var v:vector;nro:integer;var pos:integer;diml:integer);
var
i:integer;
sigue:boolean;
begin
pos:=-1;
i:=1;
sigue:=True;
while sigue and (i<=diml) do 
begin
    if (v[i].nro = nro) then
    begin
    pos:=i;
    sigue:=false;
    end
    else
        begin
        i:=i+1;        
        end;
end;    
end;
//----------------------------------------------------------------------------

procedure imprimir(v:vector; diml:integer);
var
i:integer;
begin
    for i:=1 to diml do
    begin
    writeln(v[i].nro,';');
    write(v[i].apellido,';');
    write(v[i].nombre,';');
    write(v[i].cantasis,';') ;
    end;
end;
//----------------------------------------------------------------------------
procedure impapellido(v: vector; letra: char; diml: integer);
var
  i: integer;
  encontrado: boolean;
begin
  encontrado := False; // Inicialmente no se ha encontrado ningún apellido que empiece con la letra dada

  writeln('Alumnos cuyo apellido comienza con la letra ', letra, ':');
  i := 1; // Inicializamos el contador de índice
  while (i <= diml) and (v[i].apellido[1] <= letra) do // Seguimos iterando mientras no se haya llegado al final y el apellido sea menor o igual que la letra dada
  begin
    if v[i].apellido[1] = letra then
    begin
      writeln('Apellido: ', v[i].apellido);
      writeln('Nombre: ', v[i].nombre);
      writeln('Número de alumno: ', v[i].nro);
      writeln('----------------------------------');
      encontrado := True; // Marcamos que se ha encontrado al menos un apellido que comienza con la letra dada
    end;
    i := i + 1; // Avanzamos al siguiente elemento
  end;

  if encontrado=False then
    writeln('No se encontraron alumnos cuyo apellido comience con la letra ', letra);
end;

//----------------------------------------------------------------------------
 procedure abandono(v:vector; var cantidad:integer;diml:integer);
 var
 i:integer;
 begin
 for i:=1 to diml do
    begin
        if(v[i].cantasis=0) then
        begin
        cantidad:=cantidad+1;
        end;
    end;
 end;
 
//-------------------------      PROGRAMA         -----------------------------

var
  diml: integer;
  v: vector;
  nro, pos, invocar,cantidad: integer;
  letra: char;
begin
  cargarv(v, diml);

  writeln('Ingrese:');
  writeln('1 : Para imprimir vector');
  writeln('2 : Para buscar alumno por número');
  writeln('3 : Para buscar alumnos por letra del apellido');
  writeln('4 : Para imprimir cantidad de alumnos con 0 asistencias');
  writeln('-1: Para salir');

  readln(invocar);
  while (invocar <> -1) do
  begin
//----------------------------------------------------------------------------

    if (invocar = 1) then
    begin
      imprimir(v, diml);
    end
//----------------------------------------------------------------------------

    else if (invocar = 2) then
    begin
      writeln('Ingrese número de alumno:');
      readln(nro);
      buscaralumno(v, nro, pos, diml);
        if (pos <> -1) then
        begin
        writeln('El alumno está en la posición: ', pos);
        end
      else
        writeln('El alumno no existe');
    end
//----------------------------------------------------------------------------

    else if (invocar = 3) then
    begin
      writeln('Ingrese letra del apellido');
      readln(letra);
      impapellido(v, letra, diml);
    end
//----------------------------------------------------------------------------

    else if (invocar = 4) then
    begin
      abandono(v,cantidad ,diml);
      writeln('Cantidad de alumnos con 0 asistencias: ', cantidad );
    end;
//----------------------------------------------------------------------------
    writeln(' ');
    writeln('--------------------------------------------------------------');
    writeln('Ingrese:');
    writeln('1 : Para imprimir vector');
    writeln('2 : Para buscar alumno por número');
    writeln('3 : Para buscar alumnos por letra del apellido');
    writeln('4 : Para imprimir cantidad de alumnos con 0 asistencias');
    writeln('-1: Para salir');

    readln(invocar);
  end;
end.

{5. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes.
Para ello, cuenta con
información sobre todos los viajes realizados durante el mes de marzo.

De cada viaje se cuenta con la siguiente 
información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión (medida en
kilómetros).
Realizar un programa que lea y almacene la información de los 200 viajes realizados. Realizar un módulo
que reciba el vector generado e informe:
a. El monto promedio de dinero transportado de los viajes realizados
b. La distancia recorrida y el día del mes en que se realizó el viaje que transportó más dinero.
c. La cantidad de viajes realizados cada día del mes.]}

program p5a;
const
dimf=2;
//--------------------------------------------------------------------------------------------------------------
type
viaje=record
monto:real;
distancia:integer;
dia:integer;
end;
//--------------------------------------------------------------------------------------------------------------

vviaje=array[1..dimf] of viaje;
vmes=array[1..12] of integer;
procedure registroviaje(var a:viaje);
begin
writeln('Distancia del viaje');
readln(a.distancia);
    if(a.distancia<>0) then
        begin
        writeln('Ingrese el monto');
        readln(a.monto);
        writeln('Dia');
        readln(a.dia);
        end;
end;
//--------------------------------------------------------------------------------------------------------------

procedure cargovector(var v:vviaje);
var 
i:integer;
suma:real;
a:viaje;
begin
suma:=0;
    for i:=1 to dimf do
    begin
    registroviaje(a);
    v[i]:=a;
//a. El monto promedio de dinero transportado de los viajes realizados
    suma:=suma+v[i].monto;
    end;
suma:=suma/dimf; 
writeln('Cantidad promedio de dinero transportado por viaje es ',suma:0:2);
end;
//--------------------------------------------------------------------------------------------------------------
//b. La distancia recorrida y el día del mes en que se realizó el viaje que transportó más dinero.
//--------------------------------------------------------------------------------------------------------------



//--------------------------------------------------------------------------------------------------------------
//c. La cantidad de viajes realizados cada día del mes.]}
//--------------------------------------------------------------------------------------------------------------

 procedure inicializovmes(var vm:vmes);
 var
 i:integer;
begin
        for i:=1 to 31 do
        begin
        vm[i]:=0;
        end;
end;
//c. La cantidad de viajes realizados cada día del mes.]}
procedure viajesxmes(v:vviaje);
var
vm:vmes;
i:integer;
begin
inicializovmes(vm);
    for i:=1 to dimf do
    begin
    vm[v[i].dia]:=vm[v[i].dia]+1;
    end;

    for i:=1 to 31 do
    begin
    writeln(' Dia ',i ,' Viajes ',vm[i],' , ')
    end;

    
end;
//-----------------Programa-----------------------------
var
v:vviaje;
begin
cargovector(v);
viajesxmes(v);
end.

{6. La empresa EEE se encuentra desarrollando un sistema de versionado de un documento. De cada versión se conoce,
el título, un link al texto completo y la fecha en formato UNIX (un entero). Esta información se encuentra ordenada
por fecha. Se nos asigna desarrollar:
a. Un módulo que reciba las 20 últimas versiones de un documento (esta información se encuentra almacenada
ordenada por fecha), y una fecha en formato UNIX, y retorne la versión correspondiente a esa fecha. En caso de
no encontrar una versión retornar una versión con título “Inexistente”.
b. Modificar el módulo del punto anterior para que, en caso de no encontrar la versión, devolver la versión con la
fecha más cercana.
}




{7. Realice un programa para procesar los datos de los 800 empleados administrativos de la Facultad. De cada empleado
se conoce: DNI, Apellido, Nombre, fecha de nacimiento (día, mes, año) y el nombre de oficina en donde desempeña
sus tareas dentro de la facultad. Realizar un módulo para cada ítem:
a. Leer la información de los empleados y almacenarla.
b. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro.
c. Ordenar los empleados por nombre de oficina.
d. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro
(atención: los empleados están ordenados por nombre de oficina).
e. Informar el total de empleados por oficina (atención: los empleados están ordenados por nombre de oficina).
f. Informar la cantidad de empleados que cumplen años en cada mes.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos leídos
de teclado.
}

program ejercicio7a;
const
dimf=5;
type
rfecha=record
dia:integer;
mes:integer;
anio:integer;
end;

rempleado=record
dni:integer;
apellido:string;
nombre:string;
oficina:string;
fecha:rfecha;
end;
vempleado=array [1..dimf] of rempleado;
vmeses=array[1..12] of integer;

//--------- Procesos------------------
// a. Leer la información de los empleados y almacenarla.
//--------------------------------------------------------------------------------------
procedure leerempleado(var e:rempleado);
begin
writeln('Cargar  DNI');
readln(e.dni);
writeln('Ingrese apellido');
readln(e.apellido);
writeln('Ingrese nombre');
readln(e.nombre);
writeln('Ingrese el nombre de la oficina');
readln(e.oficina);
writeln('Ingrese el dia');
readln(e.fecha.dia);
writeln('Ingrese el mes');
readln(e.fecha.mes);
writeln('Ingrese el anio');
readln(e.fecha.anio);
end;
//--------------------------------------------------------------------------------------

procedure cargarempleado (var v:vempleado);
var
i:integer;
e:rempleado;
begin
for i:=1 to dimf do 
begin 
leerempleado(e);
v[i]:=e;
end;
end;

//--------------------------------------------------------------------------------------
//b. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro.
//--------------------------------------------------------------------------------------

procedure informar(v:vempleado;ofi:string);
var 
i:integer;
begin
for i:=1 to dimf do
    begin
    if (ofi=v[i].oficina) then 
    writeln('Informo: Apellido ',v[i].nombre, ' y Nombre ',v[i].apellido);
    end;
end;    

//--------------------------------------------------------------------------------------
//c. Ordenar los empleados por nombre de oficina.
//--------------------------------------------------------------------------------------

procedure ordenar(var v: vempleado);
var
  i, j, p: integer;
  elemento: rempleado; 
begin
  for i := 1 to dimf - 1 do
  begin
    p := i;
    for j := i + 1 to dimf do
    begin
      if v[j].oficina < v[p].oficina then
        p := j;
    end;
    // Swap elements if needed
    if p <> i then
    begin
      elemento := v[p];
      v[p] := v[i];
      v[i] := elemento;
    end;
  end;
end;
//--------------------------------------------------------------------------------------
//d. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro
//(atención: los empleados están ordenados por nombre de oficina).
//--------------------------------------------------------------------------------------

procedure buscarxofi(v: vempleado; ofi: string);
var
  i: integer;
  hay:boolean;
begin
  i := 1; // Inicio el loop
  hay:=false;
  while (i <= dimf) and (v[i].oficina <= ofi) do
  begin
    if ofi=v[i].oficina then
    begin
    writeln(v[i].Apellido,'  ',v[i].Nombre);
    hay:=true
    end;    
    i := i + 1; 
    if not hay then 
    begin
    writeln('No hay empleados en esa oficina');
    end;
  end;
end;
//------------------------------------------------------------------------------------
//e. Informar el total de empleados por oficina (atención: los empleados están ordenados por nombre de oficina).
//------------------------------------------------------------------------------------

procedure informaempxofi(v: vempleado);
var
  i,contador: integer;
  ofiactual:string;
begin
ofiactual:=v[1].oficina;
contador:=0;
for i:=1 to dimf do
    begin
        if(v[i].oficina=ofiactual) then
        begin
            contador:=contador+1;
        end
        else
        begin
        writeln('La oficina ',ofiactual, ' tiene ',contador,' de empleados');
        ofiactual:=v[i].oficina;
        contador:=1;
        end;
    end;
end;

//------------------------------------------------------------------------------------
//f. Informar la cantidad de empleados que cumplen años en cada mes.
//------------------------------------------------------------------------------------
procedure cumples(v:vempleado);
var
vm:vmeses;
i:integer;
begin

//Inicializo el vector 
    for i:=1 to 12 do
    begin
    vm[i]:=0;
    end;

    for i:=1 to dimf do
    begin
    vm[v[i].fecha.mes]:=vm[v[i].fecha.mes]+1;
    end;

    for i:=1 to 12 do
    begin
    writeln('Mes ',i,' cumpleanios ',vm[i]);
    end;
end;
//--------- Programa Principal -------
var 
v:vempleado;
ofi:string;
begin
// a. Leer la información de los empleados y almacenarla.
cargarempleado(v);

//b. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro.
writeln('Ingrese oficina para conocer la plantilla');
readln(ofi);
informar(v,ofi);

//c. Ordenar los empleados por nombre de oficina.
ordenar(v);

//d. Informar el Apellido y Nombre de los empleados que trabajan en una oficina que se recibe como parámetro
//(atención: los empleados están ordenados por nombre de oficina).
//--------------------------------------------------------------------------------------

writeln('Ingrese oficina para conocer la plantilla');
readln(ofi);
buscarxofi(v,ofi);

//e. Informar el total de empleados por oficina (atención: los empleados están ordenados por nombre de oficina).
writeln('Listado de empleados por oficina');
informaempxofi(v);

//f. Informar la cantidad de empleados que cumplen años en cada mes.
cumples(v);

end.






