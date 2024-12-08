program verdu;

//------------------------------------------------------------------------------------------------------------------------------------------
uses
UrandomGenerator,GenericLinkedList,Udatetime,Ubalanza,Ucarrito,Uticket,Uproducto;
//------------------------------------------------------------------------------------------------------------------------------------------
type
lista=specialize linkedlist <ticket>;

//------------------------------------------------------------------------------------------------------------------------------------------
//                                               PROCEDIMIENTOS 
//------------------------------------------------------------------------------------------------------------------------------------------


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
//												PUNTO 3.1
//------------------------------------------------------------------------------------------------------------------------------------------

procedure guardarticket(var l:lista;t:ticket);
begin
l.add(t);
end;
//------------------------------------------------------------------------------------------------------------------------------------------
//												PUNTO 3.2
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
//												PUNTO 3.2
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


Procedure imprimirtotaldia(l:lista);
begin
l.reset();
while not l.eol do
begin
	l.current().imprimir();
	l.next();
end;
writeln('');
writeln('');
end;
//------------------------------------------------------------------------------------------------------------------------------------------
//                                               PROGRAMA 
//------------------------------------------------------------------------------------------------------------------------------------------
var
t:ticket;
c:carrito;
rg:randomGenerator;
l,l2:lista;
i:integer;
parametro:real;
//------------------------------------------------------------------------------------------------------------------------------------------
//												PUNTO 2
//------------------------------------------------------------------------------------------------------------------------------------------
begin
//Inicio mis objetos
rg:=RandomGenerator.create();
l:=lista.create();

//Bucle
for i:=1 to 20 do
	begin
	cargarcarrito(c,rg);
	ticketencabezado(t,rg);
	procesarcompra(t,c,rg);
	t.imprimir();

//------------------------------------------------------------------------------------------------------------------------------------------
//												PUNTO 3.1
//------------------------------------------------------------------------------------------------------------------------------------------
	guardarticket(l,t);
	end;

//------------------------------------------------------------------------------------------------------------------------------------------
//												PUNTO 3.2
//------------------------------------------------------------------------------------------------------------------------------------------
 
l.reset();
writeln(' El total de Tickets con mas de 3 Productos son',recursiva1(l));

//------------------------------------------------------------------------------------------------------------------------------------------
//												PUNTO 3.3
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
imprimirtotaldia(l2);
writeln('');
writeln('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
end.
