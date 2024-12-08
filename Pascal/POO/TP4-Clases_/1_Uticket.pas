UNIT Uticket;
{$mode objfpc}
INTERFACE
uses GenericLinkedlist,Uproducto,Udatetime;

TYPE

lista=specialize linkedlist <producto>;

Ticket=class


PRIVATE

cliente:string;
hora:time;
dia:Date;
totalApagar:real;
cantidadDeProductos: integer;
l:lista;
PUBLIC

constructor create(unaHora: Time; unDia: Date); // Constructor
procedure setCliente(unCliente: string); // Setter
procedure setTotalAPagar(unTotalAPagar: real); // Setter
procedure  agregarProducto(unProducto: producto); // Agrega unProducto a la lista y actualiza el contador de productos.
function cuantosProductosTenes():integer; // Getter
function getTotalAPagar(): real;// Getter
procedure imprimir(); // Imprime toda la información del ticket
end;
IMPLEMENTATION

constructor ticket.create(unaHora: Time; unDia: Date); // Constructor
	begin
	hora:=UnaHora;
	dia:=Undia;
	l:=lista.create();
	cantidadDeProductos:=0;
	end;
procedure ticket.setCliente(unCliente: string); // Setter
	begin
	cliente:=uncliente;
	end;
procedure ticket.setTotalAPagar(unTotalAPagar: real); // Setter
	begin
	totalApagar:=unTotalAPagar;
	end;
procedure  ticket.agregarProducto(unProducto: Producto);
	begin
	l.add(unproducto);
	cantidaddeproductos:=cantidaddeproductos+1;
	end;
// Agrega unProducto a la lista y actualiza el contador de productos.
function ticket.cuantosProductosTenes():integer; // Getter
	begin
	cuantosProductosTenes:=CantidaddeProductos;
	end;


function ticket.getTotalAPagar():real; // Getter
	begin
	getTotalAPagar:=totalApagar;
	end;

procedure ticket.imprimir(); // Imprime toda la información del ticket

begin
	
writeln('                  TICKET DE COMPRA                      ');
writeln('========================================================');
writeln('Fecha: ', dia.toString(), '    Hora: ', hora.toString());
writeln('Cliente: ', cliente);
writeln('');  // Espacio entre secciones
writeln('Productos: ');
l.reset();
while not l.eol() do
begin
    write(l.current.getDescripcion():30);  
    writeln(l.current.getPeso():10:2);  
    l.next();
end;

writeln('');  // Espacio entre productos y total
writeln('Total a pagar: $', totalApagar:0:2);  
writeln('========================================================');
writeln('');

end;
end.



