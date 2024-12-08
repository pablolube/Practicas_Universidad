unit Ulista;
{$mode objfpc}
interface
uses unodo;

type
	lista = class
	private
		estoyvacia: boolean;
		primerelemento:nodo;
				
	public
		constructor create();
		procedure 	agregar(unDato:string);
procedure imprimir();
procedure imprimirinverso();
function cantidaddedatos():integer;
function estasvacia():boolean;	
function existeElemento(undato:string):boolean;
procedure imprimirmenores(unlimite:string);
procedure imprimirmayores(unlimite:string);
procedure imprimiracotado(unLimiteMin:string ; unLimiteMax:String);
	end;

implementation

//----------------------------------------------- Punto 4

//crear lista
		constructor lista.create();
	begin	
		estoyvacia:= true;
	end;
	

//Agregar lista
procedure	lista.agregar(unDato:string);
var
n:nodo;
begin
n:=nodo.create(undato);
	if estoyvacia then 
	begin
	estoyvacia:=false;
	primerelemento:=n;
	end
	else 
	primerelemento.agregar(n);
end;


//imprimir 
procedure lista.imprimir();
begin
if not estoyvacia then
primerelemento.imprimir();
end;

//imprimir inverso
procedure lista.imprimirinverso();
begin
primerelemento.imprimirInverso();
end;


//cantidad de elementos
function lista.cantidaddedatos():integer;
begin
if not estoyvacia then
	begin
	cantidaddedatos:=primerelemento.contar()
	end;
end;

//
function lista.estasVacia():boolean;
begin
		estasVacia:=estoyVacia;
end;

//----------------------------------------------- Punto 6


//existeelemento(undato:string);
function lista.existeElemento (undato:string):boolean;
begin
if not estoyvacia then
	begin
	existeElemento:=primerelemento.existeElemento(undato); 
	end;
end;


//----------------------------------------------- Punto 7

//
procedure lista.imprimirmenores(unlimite:string);
begin
if not estoyvacia then
	begin
	primerelemento.imprimirmenores(unlimite);
	end;
end;

procedure lista.imprimirmayores(unlimite:string);
begin
if not estoyvacia then
	begin
	primerelemento.imprimirmayores(unlimite);
	end;
end;



//----------------------------------------------- Punto 8

//
procedure lista.imprimiracotado(unLimiteMin:string; unLimiteMax: string);
begin
if not estoyvacia then
	begin
	primerelemento.imprimiracotado(unLimiteMin, unLimiteMax);
	end;
end;
end.

//----------------------------------------------- Punto 9