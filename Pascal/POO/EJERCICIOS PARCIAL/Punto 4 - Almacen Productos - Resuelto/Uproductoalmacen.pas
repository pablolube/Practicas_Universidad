Unit Uproductoalmacen;
{$mode objfpc}


INTERFACE
USES SYSUTILS;
TYPE
producto= class

PRIVATE
id:string;
codrubro:integer;
codunidad:integer;
precio:real;
stockactual:integer;

PUBLIC
CONSTRUCTOR CREATE(uncodrubro:integer;uncodunidad:integer;unprecio:real;unstockactual:integer);
function getid():string;
function getcodrubro():integer;
function getcodunidad():integer;
function getprecio():real;
function getstockactual():integer;
function tostring:ansistring;override;
procedure aumentarprecio(numero:integer);
procedure actualizarstock(numero:integer);
function tostringstock:ansistring;


END;


IMPLEMENTATION
CONSTRUCTOR producto.CREATE(uncodrubro:integer;uncodunidad:integer;unprecio:real;unstockactual:integer);
begin
id:=(IntToStr(uncodrubro) + ' - ' +IntToStr(uncodunidad));
codrubro:=uncodrubro;
codunidad:=uncodunidad;
precio:=unprecio;
stockactual:=unstockactual;
end;

function producto.getid():string;
begin
getid:=id;
end;

function producto.getcodrubro():integer;
begin
getcodrubro:=codrubro;
end;

function producto.getcodunidad():integer;
begin
getcodunidad:=codunidad;
end;

function producto.getprecio():real;
begin
getprecio:=precio;
end;

function producto.getstockactual():integer;
begin
getstockactual:=stockactual;
end;
procedure producto.aumentarprecio(numero:integer);
begin
precio:=precio*(1+(numero/100));
end;

procedure producto.actualizarstock(numero:integer);
begin
stockactual:=stockactual - numero;
end;

function producto.tostring:ansistring;
var
s:ansistring;
begin
  s := 'Id: ' + id + LineEnding;
  s:=  s + 'Codigo de Rubro: ' + IntToStr(Codrubro)+  LineEnding;
  s:=  s + 'Codigo de Unidad: ' + IntToStr(Codunidad) + LineEnding;
  s:=  s + 'Precio : ' + FloatToStr(Precio)+ LineEnding;
  s:=  s + 'Stock Actual : ' + FloatToStr(stockactual)+ LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  toString := s;
  end;


function producto.tostringstock:ansistring;
var
s:ansistring;
begin
  s := 'Id: ' + id + LineEnding;
  s:=  s + 'Stock Actual : ' + FloatToStr(stockactual)+ LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  toStringstock := s;
  end;
end.



