unit UProductoEnGondola;
{$mode objfpc}
INTERFACE
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


end.


