UNIT  Uvendedoras;
{$mode objfpc}
//---------------------------------------------------------------------------------
INTERFACE
USES UABBGenerico,Genericlinkedlist,UdateTime,sysutils;

type
//---------------------------------------ENTERO (COMPARABLE) ------------------------------------------

entero = class (comparable)
		private
		valor : integer;
		public
		constructor create(unValor: integer); // constructor
		function getValor(): integer; // getter
		function toString(): ansistring; override; // devuelve el nombre como string
		function equals(otroComparable: Comparable): boolean;override;
		function lessThan(otroComparable: Comparable): boolean;override;
		function greaterThan(otroComparable: Comparable): boolean;override;
		function lessThanOrEquals(otroComparable: Comparable): boolean;override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;override;
		end;

//--------------------------    VENTA      -------------------------------------
venta=class
private
codigo:integer;
precio:real;
cantVendidas:integer;
fecha:date;
public
constructor create(Uncodigo:integer;unprecio:real;unacantvendida:integer;unafecha:date);
function getCodigo:integer;
function getPrecio:real;
function getCantidadVendida:integer;
function getFecha:date;
function getmonto:real;
function tostring:ansistring;override;
end;


//----------------------------   NODO LISTA         ------------------------------------------
lista=specialize  linkedlist <venta>;

nodovendedora = class(Nodo)
PRIVATE
listavtas: lista;

public
constructor create(clave: Comparable; dato: TObject);
procedure agregar(unNodo: Nodo); override;
function toString(): ansistring; override;
function devolverElemento():Tobject ;override;
procedure insertarordenado (var l:lista;a:venta);
end;



//---------------------------------------------------------------------------------

abbvendedora = class(ABBgenerico)
public
procedure agregar(Clave: Comparable; Dato: TObject);override;
end;

IMPLEMENTATION 

//---------------------------------------IMPLEMENTACION ENTERO (COMPARABLE) ------------------------------------------

	constructor entero.create(unValor: integer); // constructor
	begin
		valor := unValor;
		end;
	
	
	function entero.getValor(): integer; // getter
		begin
		getValor := valor;
		end;
		
	function entero.toString(): ansistring; // devuelve el nombre como string
		begin
		toString := inttostr(valor);
		end;
		
	function entero.equals(otroComparable: Comparable): boolean;
	begin
		equals := valor = (otroComparable as entero).getValor();
		end;
		
		function entero.lessThan(otroComparable: Comparable): boolean;
		begin
	lessThan:= valor < (otroComparable as entero).getvalor();
	end;

		function entero.greaterThan(otroComparable: Comparable): boolean;
		begin
		greaterThan:= valor > (otroComparable as entero).getvalor();
		end;
		
		function entero.lessThanOrEquals(otroComparable: Comparable): boolean;
		begin
		lessThanOrEquals:= valor <= (otroComparable as entero).getvalor();
		end;
		
		function entero.greaterThanOrEquals(otroComparable: Comparable): boolean;
		begin
		greaterThanOrEquals:= valor >= (otroComparable as entero).getvalor();
		end;

//----------------------------- IMPLEMENTACION VENTAS ----------------------------------
CONSTRUCTOR venta.create(Uncodigo:integer;unprecio:real;unacantvendida:integer;unafecha:date);
begin
codigo:=Uncodigo;
precio:=unprecio;
cantVendidas:=unacantvendida;
fecha:=unafecha;
end;

function venta.getCodigo:integer;
begin
getcodigo:=codigo;
end;
function venta.getPrecio:real;
begin
getPrecio:=precio;
end;
function venta.getCantidadVendida:integer;
begin
getcantidadvendida:=cantVendidas;
end;
function venta.getFecha:date;
begin
getfecha:=fecha;
end;
function venta.getmonto:real;
begin
getmonto:=cantVendidas*precio;
end;

function venta.toString: ansistring;
begin
  toString := Format('  Codigo: %10d | Precio: %10.2f | Cantidad: %10d | Monto: %10.2f', 
                     [codigo, precio, cantVendidas, getMonto]);
end;


//------------------------------    IMPLEMENTACION NODO LISTA          -----------------------------------

//  CONSULTAR INSERTAR ORDENADO
procedure nodovendedora.insertarordenado (var l:lista;a:venta);
var
seguir:boolean;
begin
seguir:=True;
l.reset();
while not l.eol() and seguir do
begin
if a.getcodigo<l.current().getcodigo then
seguir:=false
else 
l.next();
end;
l.insertcurrent(a);
end;

//CREO NODO
constructor nodovendedora.create(Clave: Comparable;Dato: TObject);
begin

inherited create(Clave, Dato);
listavtas:= lista.create();
end;

function nodovendedora.devolverElemento(): Tobject;
begin
devolverElemento:=listavtas;
end;
//AGREGAR
procedure nodovendedora.agregar(unNodo: Nodo);
begin
if unNodo.getClave().equals(self.getClave())
then
insertarOrdenado(listavtas,unNodo.Getdato() as VENTA)
else
inherited agregar(unNodo);
end;

function nodovendedora.toString: ansistring;
var
  s: ansistring;
  cantidadtotalvtas:integer;
  totalunidadvendida:integer;
  totalmonto:real;
begin
  s := 'ID Vendedora: ' + self.getClave().toString() + LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  s := s + 'Ventas:' + LineEnding;
  cantidadtotalvtas:=0;
  totalunidadvendida:=0;
  totalmonto:=0;
  
  listavtas.reset();
  while not listavtas.eol() do
  begin
	cantidadtotalvtas:=cantidadtotalvtas+1;
	totalunidadvendida:=totalunidadvendida+listavtas.current.getcantidadvendida;
	totalmonto:=totalmonto+listavtas.current.getmonto;

    s := s + listavtas.current.toString() + LineEnding; // este si quiere imprimir lo de adentro
    listavtas.next();
       
  end;
  //calculos
  s:=  s + 'Cant total ventas: ' + IntToStr(cantidadtotalvtas)+  LineEnding;
  s:=  s + 'Cant total unidades vendidas: ' + IntToStr(totalunidadvendida) + LineEnding;
  s:=  s + 'Cant total monto: ' + FloatToStr(totalmonto)+ LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  toString := s;
end;


//------------------------------    IMPLEMENTACION ABB LISTA          -----------------------------------


procedure abbvendedora.agregar(Clave: Comparable; Dato: TObject);
 var n: Nodo;
begin
n:= nodovendedora.create(Clave, Dato);
self.agregarNodo(n);
end;


		
end.


