 Unit Uverduleria;
{$mode objfpc}


INTERFACE

USES sysutils,Ucaja,UABBgenerico,Uticket,Uclientes,UrandomGenerator,Ucajadeahorro,UCarrito,Uproducto;

TYPE
verduleria = class

PRIVATE
  nombre: string;
  cajaAtencion: caja;
  cajaverdu:cajadeahorro;
PUBLIC
  CONSTRUCTOR create(nombres: string;cajav:cajadeahorro);
  PROCEDURE atender(uncliente: Clientes);
  procedure cerrar();
end;


nodohistorial= class (nodo)

private
contador:integer;
pesototal:real;

public
constructor create(unclave:comparable;undato:TObject);
procedure agregar(unnodo:nodo);override;
function  tostring():ansistring;override;
end;


ABBhistorial=class(ABBGenerico)
public
procedure agregar(unaClave: Comparable; unDato: TObject);override;
end;


IMPLEMENTATION
//-------------------------------------------------------------------------------------------------

CONSTRUCTOR verduleria.create(nombres: string;cajav:cajadeahorro);
var

rd:randomGenerator;
begin
  nombre := nombres;  
  rd:=randomgenerator.create();
  cajaverdu:=cajav;
  cajaAtencion := caja.create(rd.getinteger(1,10));  // Instancia la caja de atención correctamente
end;


procedure verduleria.atender(uncliente:clientes);
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
//-------------------------------------------------------------------------------------------------

CONSTRUCTOR nodohistorial.create(unclave:comparable;undato:TObject);
begin
inherited create(unclave,undato);
contador:=1;
pesototal:=producto(undato).getpeso();
end;

procedure  nodohistorial.agregar(unnodo:nodo);
begin
if unnodo.getclave().equals(self.getclave())then
begin
contador:=contador+1;
pesoTotal := pesoTotal + producto(unNodo.getDato()).getPeso();  // Actualiza el peso total
end
else
begin
inherited agregar(unnodo);
end;
end;

function nodohistorial.tostring():ansistring;
begin
toString:= inherited toString() + ' Cant:' + IntToStr(contador) + '  Peso Total: ' + FloatToStr(pesototal);
end;

//-------------------------------------------------------------------------------------------------
procedure ABBhistorial.agregar(unaClave: Comparable;
unDato: TObject);
 var n: Nodo;
begin
n:= nodohistorial.create(unaClave, unDato);
self.agregarNodo(n);
end;
// FALTA HACER LO DE CERRAR QUE NO LO ENTENDI

end.



