program parcial;
uses GenericLinkedList;
const
catservicio=18;
// registros

Type
 reserva= record
 numreserva:integer;
 dni:integer;
 diaevento:integer;
 horainicio:integer;
 horafin:integer;
 categoriaservicio:integer;
 end;
 
 precioreserva=record
 num:integer;
 precio:real;
 end;

//listas y vectores declaraciones
 
	listareservas= specialize LinkedList <reserva>;
	vectorprecio= Array[1..catservicio] of real;
	vectordia= Array[1..31] of integer;
	listanueva=specialize LinkedList <precioreserva>;
	
//procesos que se disponen
procedure leerlista(var r:reserva); // se dispone
begin
  writeln('Ingrese el número de reserva:');
  readln(r.numreserva);
  writeln('Ingrese el DNI:');
  readln(r.dni);
  writeln('Ingrese el día del evento:');
  readln(r.diaevento);
  writeln('Ingrese la hora de inicio:');
  readln(r.horainicio);
  writeln('Ingrese la hora de fin:');
  readln(r.horafin);
  writeln('Ingrese la categoría del servicio:');
  readln(r.categoriaservicio);
end;

procedure armarlista1(var l1: listareservas); // se dispone
var
  r: reserva;
begin
  leerlista(r);
  while r.numreserva <> -1 do
  begin
    l1.add(r);
    leerlista(r);
  end;
end;

procedure armarvector (var v:vectorprecio);//se dispone
var
i:integer;
begin
for i:=1 to 18 do
begin
v[i]:=1;
end;
end;

//insertar ordenado punto 1
procedure insertarordenado(var l2:listanueva;p:precioreserva);
var
seguir:boolean;
begin
seguir:=True;
l2.reset();
	while(not l2.eol()) and seguir do
begin
if (l2.current.precio<p.precio) then // aca se me hizo bola el signo jajaj
seguir:=false
else
l2.next();
end;
l2.insertcurrent(p);
end;

//inicio vector dia punto 2
procedure  iniciovc(var vc:vectordia);
var
i:integer;
begin
for i:=1 to 31 do
begin
vc[i]:=0;
end;
end;

//calculo minimo
procedure minimo(vc: vectordia);
var
  i: integer;
  diamin1: integer;
  diamin2: integer;
  min1: integer;
  min2: integer;
begin
  // Inicialización de variables fuera del bucle
  diamin1 := 0;
  diamin2 := 0;
  min1 := 999;
  min2 := 999;

  for i := 1 to 31 do
  begin
    if vc[i] < min1 then
    begin
      min2 := min1;
      diamin2 := diamin1;
      min1 := vc[i];
      diamin1 := i;
    end
    else if vc[i] < min2 then
    begin
      min2 := vc[i];
      diamin2 := i;
    end;
  end;

  writeln('Los 2 días con menos eventos son: ', diamin1, ' y ', diamin2);
end;


//recorrido principal
procedure recorroycalculo(l1:listareservas;var l2:listanueva;vc:vectordia;v:vectorprecio);
var
p:precioreserva;

//2
duracionevento:integer;
segundaquin:integer;
//3
porcentaje:real;
totalreservas:integer;

begin

//inicializo variables
iniciovc(vc);
duracionevento:=0;
segundaquin:=0;
totalreservas:=0;
porcentaje:=0;

l1.reset();
l2:=listanueva.create();
while not l1.eol() do
begin

//punto 1
p.num:=l1.current().numreserva;
duracionevento:=l1.current().horafin-l1.current().horainicio;
p.precio := v[l1.current().categoriaservicio] * duracionevento;
insertarordenado(l2,p);

//punto 2
if l1.current().dni mod 2 <> 0 then 
begin
vc[l1.current().diaevento]:=vc[l1.current().diaevento]+1;
end;
//punto 3
totalreservas:=totalreservas+1;
if (l1.current().horainicio>12 )and (l1.current().diaevento>=15) then
begin
segundaquin:=segundaquin+1;
end;
l1.next();
end;
//punto 2
minimo(vc);

//punto 3
porcentaje:=(segundaquin /totalreservas)*100;
writeln('El porcentaje de reservas que iniciaron despues de las 12 y son de la segunda quincena es', porcentaje);


end;

//programa principal
var
l1:listareservas;
l2:listanueva;
v:vectorprecio;
vc:vectordia;
begin
l1:=listareservas.create();
armarlista1(l1);
armarvector(v);
iniciovc(vc);
recorroycalculo(l1,l2,vc,v);
end.
