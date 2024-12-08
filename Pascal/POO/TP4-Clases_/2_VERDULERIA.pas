program verdu;
uses
UrandomGenerator,GenericLinkedList,Udatetime,Ubalanza,Ucarrito,Uticket,Uproducto;

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




var
t:ticket;
c:carrito;
rg:randomGenerator;
begin
rg:=RandomGenerator.create();
cargarcarrito(c,rg);
ticketencabezado(t,rg);
procesarcompra(t,c,rg);
t.imprimir();
end.
