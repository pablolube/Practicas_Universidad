Unit Ubiblioteca;
{$mode objfpc}


INTERFACE
USES SYSUTILS,UABBGENERICO,Ucadena;
TYPE
libro= class

PRIVATE
ISBN:integer;
titulo:string;
autor:string;
anio:integer;

PUBLIC
CONSTRUCTOR CREATE(unISBN:integer;untitulo:string;unautor:string;unanio:integer);

function getISBN():integer;
function gettitulo():string;
function getautor():string;
function getanio():integer;
function tostring:ansistring;override;
END;


Nodocontador = class(Nodo)
PRIVATE
contador:integer;

public
constructor create(unaClave: Comparable;unDato: TObject);
procedure agregar(unNodo: Nodo); override;
function ToString: ansistring;override;
procedure sumacontador(valor:integer);
function getcontador:integer;

end;


ABBContador = class(ABBGenerico)
public
procedure agregar(unaClave: Comparable; unDato: TObject);override;
end;

IMPLEMENTATION
CONSTRUCTOR libro.CREATE(unISBN:integer;untitulo:string;unautor:string;unanio:integer);
begin
ISBN:=unISBN;
titulo:=untitulo;
autor:=unautor;
anio:=unanio;
end;

function libro.getISBN():integer;
begin
getISBN:=ISBN
end;
function libro.gettitulo():string;
begin
gettitulo:=titulo;
end;
function libro.getautor():string;
begin
getautor:=autor;
end;
function libro.getanio():integer;
begin
getanio:=anio;
end;

function libro.tostring:ansistring;
var
s:ansistring;
begin
  s := 'ISBN: ' + IntToStr(ISBN) + LineEnding;
  s:=  s + ' Titulo: ' + Titulo +  LineEnding;
  s:=  s + 'Autor : ' + Autor + LineEnding;
  s:=  s + 'Anio : ' + IntToStr(anio)+ LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  toString := s;
  end;


constructor NodoContador.create(unaClave: Comparable;unDato: TObject);
begin
inherited create(unaClave, unDato);
contador:= 1;
end;

procedure NodoContador.agregar(unNodo: Nodo);
begin
if unNodo.getClave().equals(self.getClave())
then
contador:= contador + 1
else
inherited agregar(unNodo);
end;


function NodoContador.getcontador:integer;
begin
getcontador:=contador;
end;

procedure NodoContador.sumacontador(valor:integer);
begin
contador:=contador + valor;
end;

function NodoContador.toString: ansistring;
begin
toString:= inherited toString()+ ' Copias Disponibles (' + IntToStr(contador) + ')';
end;

procedure ABBContador.agregar(unaClave: Comparable;
unDato: TObject);
 var n: Nodo;
begin
n:= NodoContador.create(unaClave, unDato);
self.agregarNodo(n);
end;

end.
