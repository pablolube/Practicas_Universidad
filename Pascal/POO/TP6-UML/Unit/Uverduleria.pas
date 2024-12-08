 Unit Uverduleria;
{$mode objfpc}


INTERFACE

USES Ucaja,Uticket,Ucliente,UrandomGenerator,Ucajadeahorro,UCarrito;

TYPE
verduleria = class

PRIVATE
  nombre: string;
  cajaAtencion: caja;
  cajaverdu:cajadeahorro;
PUBLIC
  CONSTRUCTOR create(nombres: string;cajav:cajadeahorro);
  PROCEDURE atender(uncliente: Cliente);
end;

IMPLEMENTATION

CONSTRUCTOR verduleria.create(nombres: string;cajav:cajadeahorro);
var

rd:randomGenerator;
begin
  nombre := nombres;  
  rd:=randomgenerator.create();
  cajaverdu:=cajav;

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
if ok=True then 
begin
cajaverdu.depositar(t.gettotalapagar)
end;
t.imprimir;
end;
end.
