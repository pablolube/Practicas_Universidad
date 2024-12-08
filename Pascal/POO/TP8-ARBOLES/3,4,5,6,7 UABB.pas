UNIT UABB;
{$mode objfpc}

INTERFACE
type

// ------------------------------------------- PUNTO 1
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
// ------------------------------------------- PUNTO 3
procedure imprimir();
procedure imprimirinverso();
// ------------------------------------------- PUNTO 4
procedure RECORRERPREORDEN();
procedure recorrerPostOrden();
// ------------------------------------------- PUNTO 5
function minimo():integer;
function maximo():integer;
// ------------------------------------------- PUNTO 6
procedure imprimirmenores(unValor:integer);
procedure imprimirmayores(unValor:integer);
// ------------------------------------------- PUNTO 7
procedure imprimirAcotado(unValorMin, unValorMax: integer);
end;

ABB=Class

PRIVATE
raiz:nodo;
estoyVacio:boolean;

PUBLIC
// ------------------------------------------- PUNTO 1 NODO
CONSTRUCTOR create();
PROCEDURE agregar (unDato:integer);
function existeElementoarbol(unDato:integer):boolean;
function cantidadDeElementos():integer; 
// ------------------------------------------- PUNTO 3 NODO
procedure imprimir();
procedure imprimirinverso();
// ------------------------------------------- PUNTO 4 NODO

procedure imprimirpreorden();
procedure imprimirpostorden();
// ------------------------------------------- PUNTO 5 NODO
function minimo():integer;
function maximo():integer;
// ------------------------------------------- PUNTO 6 NODO
procedure imprimirmenores(unValor:integer);
procedure imprimirmayores(unValor:integer);
// ------------------------------------------- PUNTO 7 NODO
procedure imprimirAcotado(unValorMin, unValorMax: integer);
end;

IMPLEMENTATION


// PROPIEDADES DEL NODO
// ------------------------------------------- PUNTO 1 NODO
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


//---EXISTE ELEMENTO NODO
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

 
// CONTAR 
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

// ------------------------------------------- PUNTO 3 NODO
// IMPRIMIR  MENOR A MAYOR
procedure nodo.imprimir();
begin
if tengohijoizquierdo then
hijoIzquierdo.imprimir();
writeln(elemento);
if tengoHijoDerecho then
hijoDerecho.imprimir();
end;

// IMPRIMIR  MAYOR A MENOR
procedure nodo.imprimirinverso();
begin
if tengoHijoDerecho then
hijoDerecho.imprimirinverso();
writeln(elemento);
if tengohijoizquierdo then
hijoIzquierdo.imprimirinverso();

end;

// ------------------------------------------- PUNTO 4 NODO
// Recorrer en preorden
procedure NODO.recorrerPreOrden();
begin
  writeln(elemento);
  if tengoHijoIzquierdo then
    hijoIzquierdo.recorrerPreOrden();
  if tengoHijoDerecho then
    hijoDerecho.recorrerPreOrden();
end;

// Recorrer en postorden
procedure NODO.recorrerPostOrden();
begin
  if tengoHijoIzquierdo then
    hijoIzquierdo.recorrerPostOrden();
  if tengoHijoDerecho then
    hijoDerecho.recorrerPostOrden();
  writeln(elemento);
end;

// ----------------------------------------- PUNTO 5 NODO
function nodo.minimo():integer;
begin
  if tengoHijoIzquierdo then
  begin
    minimo:=hijoIzquierdo.minimo()
    end
    else
    begin
    minimo:=elemento;
    end;
end;
function nodo.maximo():integer;
begin
  if tengohijoderecho then
  begin
    maximo:=hijoderecho.maximo()
    end
    else
    begin
    maximo:=elemento;
    end;
    
end;

// ----------------------------------------- PUNTO 6 NODO
procedure nodo.imprimirMenores(unValor: integer);
begin
if (elemento <= unValor ) THEN
	BEGIN	
	if tengohijoizquierdo then
			hijoizquierdo.imprimirMenores(unValor);
			writeln(elemento);
				if tengohijoderecho then
					hijoderecho.imprimirMenores(unvalor);
		end
	else
		if tengohijoizquierdo then
		hijoizquierdo.imprimirmenores(unvalor);
	end;

procedure nodo.imprimirMayores(unValor: integer);
begin
if (elemento >= unValor ) THEN
	BEGIN	
	if tengohijoizquierdo then
			hijoizquierdo.imprimirMayores(unValor);
			writeln(elemento);
				if tengohijoderecho then
					hijoderecho.imprimirMayores(unvalor);
		end
	else
		if tengohijoizquierdo then
		hijoizquierdo.imprimirMayores(unvalor);
	end;
// ------------------------------------------- PUNTO 7
procedure Nodo.imprimirAcotado(unValorMin, unValorMax: integer);
begin
if (elemento >= unValorMin) and (elemento <= unValorMax) then
begin
if tengoHijoIzquierdo then
 hijoIzquierdo.imprimirAcotado(unValorMin, unValorMax);
writeln(elemento);
if tengoHijoDerecho then
 hijoDerecho.imprimirAcotado(unValorMin, unValorMax);
end
else
if (elemento < unValorMin) then
begin
if tengoHijoDerecho then
 hijoDerecho.imprimirAcotado(unValorMin, unValorMax);
end
else
if tengoHijoIzquierdo then
 hijoIzquierdo.imprimirAcotado(unValorMin, unValorMax);
end;

//XXXXXXXXXXXXXX PROPIEDADES DEL ARBOL XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

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


// ARBOL EXISTE ELEMENTO?
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

// ARBOL CANTIDAD DE ELEMENTOS
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


// ------------------------------------------- PUNTO 3 ARBOL
//IMPRIMIR  MENOR A MAYOR
procedure abb.imprimir();
begin
if not estoyvacio then
begin
raiz.imprimir();
end
else 
writeln('Estoy vacio');
end;


//IMPRIMIR MAYOR A MENOR
procedure abb.imprimirinverso();
begin
if not estoyvacio then
begin
raiz.imprimirinverso();
end
else 
writeln('Estoy vacio');
end;

// ------------------------------------------- PUNTO 4 ARBOL
//IMPRIMIR  PRE ORDEN
procedure abb.imprimirpreorden();
begin
if not estoyvacio then
begin
raiz.recorrerPreOrden();
end
else 
writeln('Estoy vacio');
end;


//IMPRIMIR  POST ORDEN
procedure abb.imprimirpostorden();
begin
if not estoyvacio then
begin
raiz.recorrerPostOrden();
end
else 
writeln('Estoy vacio');
end;

// ------------------------------------------- PUNTO 4 ARBOL


function abb.minimo():integer;  
begin
		if not estoyvacio then 
		begin
			minimo:=raiz.minimo();
		end
		else
		begin
			minimo:=high(integer);
		end;
	
end;

function abb.maximo():integer;
Begin
		if not estoyvacio then 
		begin
			maximo:=raiz.maximo();
		end
		else
		begin
			maximo:=low(integer);
		end;
end;
// ------------------------------------------- PUNTO 6

procedure ABB.imprimirMenores(unValor: integer);
begin
if not estoyVacio then
 raiz.imprimirMenores(unValor);
end;

procedure ABB.imprimirmayores(unValor: integer);
begin
if not estoyVacio then
 raiz.imprimirmayores(unValor);
end;
// ------------------------------------------- PUNTO 7
procedure abb.imprimirAcotado(unValorMin, unValorMax: integer);
begin
	if not estoyvacio then
	raiz.imprimirAcotado(unvalormin,unvalormax)
	else
	writeln('Esta vacio el arbol');
end;
end.
