unit UProductoEnGondola;
{$mode objfpc}
INTERFACE
uses UABBgenerico,sysutils;
type

ProductoEnGondola=class

private
producto_descripcion:string;
precio:real;
stock:real;

public

CONSTRUCTOR create(unProducto: string; unPrecio: real; unStock: real); // constructo
FUNCTION getPrecio(): real; // getter
PROCEDURE setPrecio(unPrecio: real); // setter
FUNCTION getStock(): real; // getter
PROCEDURE setStock(unStock: real); // setter
FUNCTION toString(): ansistring;override;// overide devuelve una representación del objeto en formato string
PROCEDURE aumentarprecio();
FUNCTION getproducto(): string; // getter

end;


nodohistorial= class (nodo)

private
contador:integer;
stocktotal:real;
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
CONSTRUCTOR productoengondola.create(unProducto: string; unPrecio: real; unStock: real); // constructo
begin
producto_descripcion:=unproducto;
precio:=unprecio;
stock:=unstock;
end;

FUNCTION  productoengondola.getPrecio(): real; // getter
begin
			getPrecio:=precio;
end;

PROCEDURE productoengondola.setPrecio(unPrecio: real); // setter
begin
precio:=unprecio;
end;

FUNCTION  productoengondola.getStock(): real; // getter
begin
getstock:=stock;
end;

FUNCTION  productoengondola.getproducto(): string; // getter
begin
getproducto:=producto_descripcion;
end;


PROCEDURE productoengondola.setStock(unStock: real); // setter
begin
stock:=unstock;
end;



FUNCTION productoengondola.toString(): ansistring; // devuelve una representación del objeto en formato string
var
  precioStr, stockStr: string;
begin
  str(precio:10:2, precioStr); // Convierte 'precio' a string con 2 decimales
  str(stock:10:2, stockStr);   // Convierte 'stock' a string con 2 decimales
  toString := 'Producto ' + producto_descripcion + '    Precio: ' + precioStr + ' Stock: ' + stockStr;
end;
PROCEDURE  productoengondola.aumentarprecio();

begin

precio:=precio*1.1;
end;

CONSTRUCTOR nodohistorial.create(unclave:comparable;undato:TObject);
begin
inherited create(unclave,undato);
contador:=1;
stocktotal:=productoengondola(undato).getStock();
end;

procedure  nodohistorial.agregar(unnodo:nodo);
begin
if unnodo.getclave().equals(self.getclave())then
begin
contador:=contador+1;
stocktotal := stocktotal + productoengondola(unNodo.getDato()).getstock();  // Actualiza el peso total
end
else
begin
inherited agregar(unnodo);
end;
end;

function NodoHistorial.toString(): ansistring;
begin
  Result := inherited toString() + 
            Format(' | Cantidad: %d | Stock Total: %.2f', [contador, stocktotal]) + ' kg';
end;

//-------------------------------------------------------------------------------------------------
procedure ABBhistorial.agregar(unaClave: Comparable;
unDato: TObject);
 var n: Nodo;
begin
n:= nodohistorial.create(unaClave, unDato);
self.agregarNodo(n);
end;
end.
end.


