 Unit Uverduleria;
{$mode objfpc}

INTERFACE

USES Ucaja,Uticket,Ucliente,UrandomGenerator,UCarrito;

TYPE
verduleria = class

PRIVATE
  nombre: string;
  cajaAtencion: caja;

PUBLIC
  CONSTRUCTOR create(nombres: string);
  PROCEDURE atender(uncliente: Cliente);
end;

IMPLEMENTATION

CONSTRUCTOR verduleria.create(nombres: string);
var

rd:randomGenerator;
begin
  nombre := nombres;
  
  rd:=randomgenerator.create();
  cajaAtencion := caja.create(rd.getinteger(1,10));  // Instancia la caja de atención correctamente
end;


procedure verduleria.atender(uncliente:cliente);
var
c:carrito;
t:ticket;
ok:boolean;
begin

c:=carrito.create();
uncliente.elegirproductos(c);


t:=cajaAtencion.generarTicket(uncliente,c);
uncliente.cobrar(t,ok);
t.imprimir;
end;
end.
