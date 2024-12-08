UNIT UABB;
{$mode objfpc}

INTERFACE
type


NODO=class
private
elemento:integer;
hijoizquierdo:Nodo;
hijoDerecho:Nodo;
tengoHijoIzquierdo: boolean;
tengoHijoDerecho:boolean;
public
constructor create(unDato:integer);
procedure agregar(unnodo:nodo);
function contar():integer;
function getelemento():integer;
function existeElementonodo(unDato:integer):boolean;
end;

ABB=Class

PRIVATE
raiz:nodo;
estoyVacio:boolean;

PUBLIC
CONSTRUCTOR create();
PROCEDURE agregar (unDato:integer);
function existeElementoarbol(unDato:integer):boolean;
function cantidadDeElementos():integer; 
end;

IMPLEMENTATION


// PROPIEDADES DEL NODO
constructor nodo.create (unDato:integer);
begin
elemento:=unDato;
end;


function nodo.getelemento():integer;
begin
getelemento:= elemento;
end;

//--- Agregar elementos (en nodos)
PROCEDURE nodo.agregar (unNodo:nodo);
begin
	if unNodo.getelemento<elemento then
	begin 
		if tengoHijoIzquierdo then 
			begin
			hijoizquierdo.agregar(unnodo);
			end
		else
			begin
			hijoizquierdo:=unnodo;
			tengohijoizquierdo:=True;
			end;
			end
	else
	begin
		if tengoHijoDerecho then 
			begin
			HijoDerecho.agregar(unnodo);
			end
		else
			begin
			hijoderecho:=unnodo;
			tengohijoderecho:=True;
			end
		end
	end;

function NODO.existeElementoNodo(unDato: integer): boolean;
begin
	if elemento = unDato then
		existeElementoNodo := True
	else 
	  if unDato < elemento then 
		begin
		if tengoHijoIzquierdo then
			existeElementoNodo := hijoIzquierdo.existeElementoNodo(unDato)
		else  
			existeElementoNodo := False;
		end
	 else
		begin
		if tengoHijoDerecho then
		  existeElementoNodo := hijoDerecho.existeElementoNodo(unDato)
		else  
		  existeElementoNodo := False;
	end;
end;

function nodo.contar():integer;
var
cont:integer;

begin
cont:=0;
if tengohijoizquierdo then
cont:=cont + hijoizquierdo.contar();
	if tengohijoderecho then
	cont:=cont+hijoderecho.contar();
	contar:=cont+1;
end;




// PROPIEDADES DEL ARBOL
CONSTRUCTOR ABB.create();
begin
estoyVacio:=True;
end;

PROCEDURE ABB.agregar (unDato:integer);
var
n:nodo;
begin
n:=NODO.create(Undato);
	if estoyvacio then 
	begin 
		raiz:=n;
		estoyvacio:=false;
	end
	else
		begin
			raiz.agregar(n);
	end;
END;

function ABB.existeElementoarbol(unDato:integer):boolean;
begin
if not estoyvacio then
begin
	existeElementoarbol:=raiz.existeElementonodo(unDato);
end
else
begin
	existeElementoarbol:=False;
end;
end;

function abb.cantidadDeElementos():integer; 
begin
if  estoyvacio then
begin
	cantidadDeElementos:=0;
	end
		else
	begin
	cantidadDeElementos:=raiz.contar();
	end;
end;

end.
