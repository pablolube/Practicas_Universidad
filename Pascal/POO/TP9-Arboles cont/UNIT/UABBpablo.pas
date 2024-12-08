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
function existeElementonodo(unDato:integer):boolean;
            agregar (unnodo:nodo);
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
PROCEDURE agregar (unDato:integer);
end;

IMPLEMENTATION


// PROPIEDADES DEL NODO
constructor nodo.create (unDato:integer);
begin
elemento:=unDato;
end;


function nodo.existeElementonodo(unDato:integer):boolean;
begin
existeElementonodo:=True; /// COMPLETAR
end;

PROCEDURE nodo.agregar (unNodo:nodo);
begin
if unNodo.getelemento<elemento then
begin 
if tengoHijoIzquierdo then 
hijoizquierdo.agregar(unnodo:nodo);
else
hijoizquierdo:=unnodo;
tengohijoizquierdo:=True;

end;
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
			raiz.agregar(Undato);
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


