Unit UCaja;
{$mode objfpc}
INTERFACE

	USES 	Ubalanza,Uproducto,Ucarrito,Uticket,UDateTime,UrandomGenerator,Ucliente;
TYPE
	caja=class
		PRIVATE
			numero:integer;
			balanzacomercial:Balanza;

		PUBLIC
			CONSTRUCTOR create(unnumero:integer);
			function generarTicket(unCliente:Cliente;c:Carrito):Ticket;

	end;

IMPLEMENTATION
	CONSTRUCTOR Caja.create(unnumero:integer);
		begin
			numero:=unnumero;
			balanzacomercial.create();
		end;

function Caja.generarTicket(unCliente:Cliente;c:Carrito):Ticket;
var
	d1,d2:Date;
	dia:date;

	h1,h2:time;
	hora:time;

	prod_en_mano:producto;
	rg:randomGenerator;
	t:ticket;

begin
	rg:=randomGenerator.create();

	// ENCABEZADOgetTime
	//CUERPO TICKET
	// DIA
	
	d1:=date.create(1,9,2024);
	d2:=date.create(30,9,2024);
	dia:= rg.getdate(d1,d2);

	// HORA
	h1:=Time.create(10,0,0);
	h2:=Time.create(19,0,0);
	hora:=rg.gettime(h1,h2);
writeln('pasoa4');
	t:=ticket.create(hora,dia);
	writeln('pasoa5');
	// CLIENTE
	t.setcliente(uncliente.getnombre());
writeln('pasoa6');
	//CUERPO
	//PROCESO DE COMPRA
	balanzacomercial:=balanza.create();
	writeln('pasoa6');
	balanzacomercial.limpiar();
writeln('paso7');
		while c.gettotalprod()>0 do

		begin
		//Saco mi producto del carrito
		prod_en_mano:=c.sacarProducto();

		// Paso por Balanza
		balanzacomercial.setprecioporkilo(rg.getreal(800,5000));
		balanzacomercial.pesar( prod_en_mano.getpeso());
		
		//Cargo prodcuto a Ticket
		t.agregarProducto(prod_en_mano);
		end;
		writeln('pasoq8');
		//Cuando termino de pesar el carrito 
		// Envio el total a pagar de la balanza al ticket
		t.setTotalAPagar(balanzacomercial.getTotalAPagar());
		writeln('pasoa9');
		generarTicket:=t;
		writeln('pasoa10');
end;
end.
