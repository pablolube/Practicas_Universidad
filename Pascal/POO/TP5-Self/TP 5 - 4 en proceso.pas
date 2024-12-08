

program verdu;

//------------------------------------------------------------------------------------------------------------------------------------------
uses
UrandomGenerator,GenericLinkedList,Udatetime,Ubalanza,Ucarrito,Uticket,Uproducto;
//------------------------------------------------------------------------------------------------------------------------------------------

type
resumen=record
cantidadventas:integer;
montodia:real;
ticketmaximo:ticket;
end;
lista=specialize linkedlist <ticket>;
listanueva=specialize linkedlist <resumen>;
cajas=array[1..3] of lista;

//------------------------------------------------------------------------------------------------------------------------------------------
//                                               PROCEDIMIENTOS 
//------------------------------------------------------------------------------------------------------------------------------------------
procedure prodRandom(var rg:randomgenerator);
var 
vproducto:array[1..10] of string=('Espinaca','Rucula','Papa','Lechuga','Tomate','Remolacha','Limones','Manzana','Banana','Cebolla');
i:integer;
begin
for i:=1 to 10 do
begin
rg.addlabel(vproducto[i]);
end;
end;
//------------------------------------------------------------------------------------------------------------------------------------------
procedure CargarCarrito(var c:carrito;rg:randomgenerator);
var 
i:integer;
p:Producto;
cantP:integer;
begin
//-------------------------------------------------------
prodrandom(rg);
//------------------------------------------------------- 
//Creo carrito
c:=carrito.create(); // Creo Carrito
//-------------------------------------------------------
	cantP:=rg.getInteger(1,5);
	for i:=1 to cantP do 
		begin
		p:=Producto.create(rg.getLabel(), rg.getReal(1,10)); // leo producto
		c.agregarProducto(p); // Agrego a carrito
		end;
end;
//------------------------------------------------------------------------------------------------------------------------------------------
procedure ticketencabezado(var t:ticket;rg:randomGenerator);

var
d1,d2:Date;
h1,h2:time;
nombre:string;
begin
// DIA
d1:=date.create(1,9,2024);
d2:=date.create(30,9,2024);


// HORA
h1:=Time.create(10,0,0);
h2:=Time.create(19,0,0);
t:=ticket.create(rg.getTime(h1,h2),rg.getdate(d1,d2));

// NOMBRE 
writeln('Nombre del Cliente:'); 
readln(nombre);
t.setCliente(nombre);
end;

//------------------------------------------------------------------------------------------------------------------------------------------
//												        PROCESAR COMPRA
//------------------------------------------------------------------------------------------------------------------------------------------
procedure procesarcompra(var t:ticket;var c:carrito;rg:randomgenerator);
var
b:balanza;
prod_en_mano:producto;
begin
b:=balanza.create();
b.limpiar();

	while c.gettotalprod()>0 do

	begin
	//Saco mi producto del carrito
	prod_en_mano:=c.sacarProducto();

	// Paso por Balanza
	b.setprecioporkilo(10);
	b.pesar( prod_en_mano.getpeso());
	
	//Cargo prodcuto a Ticket
	t.agregarProducto(prod_en_mano);
	end;
	
	//Cuando termino de pesar el carrito 
	// Envio el total a pagar de la balanza al ticket
	t.setTotalAPagar(b.getTotalAPagar());
	
end;
//------------------------------------------------------------------------------------------------------------------------------------------
//														GUARDO TICKET (ORDENADO)
//------------------------------------------------------------------------------------------------------------------------------------------
// Realice las modificaciones necesarias para que cada una de las cajas almacene sus tickets ordenados por día.

procedure guardarticket (var l:lista;t:ticket);
var
seguir:boolean;
begin
seguir:=True;
l.reset();
while not l.eol() and seguir do
begin
if t.getday().lessthan(l.current.getday()) then
seguir:=false
else 
l.next();
end;
l.insertcurrent(t);
end;
//------------------------------------------------------------------------------------------------------------------------------------------
//												CALCULOS POSTERIORES COMPRA - RECURSIVAS
//------------------------------------------------------------------------------------------------------------------------------------------
function recursiva1(l: lista): integer;
var
  ticketActual: ticket;
  contador: integer;
begin
  // Caso base: si estamos al final de la lista, el contador es 0
  if l.eol() then
    recursiva1 := 0
  else
  begin
    // Obtenemos el ticket actual
    ticketActual := l.current();
    
    // Verificamos si el ticket tiene más de tres productos
    if ticketActual.cuantosProductosTenes() > 3 then
      contador := 1
    else
      contador := 0;

    // Avanzamos al siguiente ticket
    l.next();
    
    // Llamada recursiva para continuar con el siguiente ticket
    recursiva1 := contador + recursiva1(l);
  end;
end;
//------------------------------------------------------------------------------------------------------------------------------------------
procedure recursiva2(l: lista; var l2: lista; parametro: real);
begin
    if not l.eol() then  
    begin
        if (l.current.gettotalapagar() > parametro) then  // Si el total a pagar es mayor que el parámetro
        begin
            l2.add(l.current); 
        end;
        l.next(); 
        recursiva2(l, l2, parametro);  
    end;
end;

//------------------------------------------------------------------------------------------------------------------------------------------
//												CARGO A CAJA
//------------------------------------------------------------------------------------------------------------------------------------------
procedure cargarvtacaja(var l:lista);
var
rg:randomGenerator;
c:carrito;
t:ticket;
i:integer;
begin
rg:=RandomGenerator.create();
l:=lista.create();

for i:=1 to 5 do
	begin
	cargarcarrito(c,rg);
	ticketencabezado(t,rg);
	procesarcompra(t,c,rg);
	guardarticket(l,t);
	end;
end;
//------------------------------------------------------------------------------------------------------------------------------------------
//												IMPRESIONES
//------------------------------------------------------------------------------------------------------------------------------------------

procedure imprimircajas(l:lista);
begin
l.reset();
while not l.eol do
begin
l.current.imprimir();
l.next();
end;
end;
//------------------------------------------------------------------------------------------------------------------------------------------
procedure imprimircajas2(l:lista);
var 
l2:lista;
parametro:real;
begin
l.reset();
writeln(' El total de Tickets con mas de 3 Productos son',recursiva1(l));
//------------------------------------------------------------------------------------------------------------------------------------------
l.reset();
l2:=lista.create();
writeln('Filtrar por tickets con total de compra mayor que :');
readln(parametro);
recursiva2(l,l2,parametro);

// IMPRIMO LOS TICKETS CON  MAS QUE PARAMETRO
writeln('');
writeln('XXXXX Tickets con de de $ ', parametro,' de gasto XXXXXX');
writeln('');
imprimircajas(l2);
writeln('');
writeln('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
end;










Modifique el programa de la actividad 4 de la clase 4 (VerduleriaPOO3.pas).

• Implemente un módulo que reciba las listas de tickets de las cajas y
retorne una lista con los resúmenes de ventas por día. Para cada uno de
los días se desea saber la cantidad de ventas, monto total facturado y el
ticket de la compra de mayor monto. Nota: implemente una clase
Resumen con los campos necesarios.
• Implemente un módulo que imprima los resúmenes de ventas por día.
• Escriba un programa que invoque a los dos módulos implementados y
compruebe el correcto funcionamiento del mismo.
type
resumen=record
cantidadventas:integer;
montodia:real;
ticketmaximo:ticket;
end;

procedure resumenxdia(v:cajas,listanueva:resumen);
for i:=1 to 3 do
begin
v[i].reset();
end;

while not l.eol do begin


 







//------------------------------------------------------------------------------------------------------------------------------------------
//                                               PROGRAMA 
//------------------------------------------------------------------------------------------------------------------------------------------
var
caja:cajas;
i:integer;
begin
//Bucle
for i:=1 to 3 do
	begin
	writeln('VAYA A LA CAJA ',i);
	cargarvtacaja(caja[i]);
	end;
	
	for i:=1 to 3 do
	begin
	writeln('----------------------CAJA ',i,'------------------------------------------');
	imprimircajas(caja[i]);
	end;
end.

