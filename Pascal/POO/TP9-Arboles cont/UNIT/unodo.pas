unit UNodo;
{$mode objfpc}

interface

type
	nodo = class
	
	private
		dato: string;
		siguiente: nodo;
		soyElUltimo: boolean;
		
	
		
	public
		constructor create(unDato: string);
		procedure agregar(unNodo: nodo);
		procedure imprimir();
		procedure imprimirInverso();
		function contar():integer;
	function existeElemento(unDato: string): boolean;
	    procedure imprimirmenores(unlimite:string);
	    procedure  imprimirmayores(unlimite:string);
	    procedure imprimiracotado(unLimiteMin:string;unLimiteMax:string);

	end;

implementation

//----------------------------------------------- Punto 1
	
constructor nodo.create(unDato: string);
	begin	
		dato:= unDato;
		soyelultimo:= true;
	
	end;
	
procedure nodo.agregar(unNodo: nodo);
	begin
		if soyelultimo then
		begin
			siguiente:= unNodo;
			
			soyelultimo:= false;
		end
		else
		siguiente.agregar(unNodo);
	end;

//----------------------------------------------- Punto 2
procedure nodo.imprimir();
	begin
		writeln(dato);
		if not soyelultimo then
			siguiente.imprimir();
	end;
	

procedure nodo.imprimirInverso();
	begin
		if not soyElUltimo then
		begin
			siguiente.imprimirInverso();
			writeln(dato);
		end
		else
			writeln(dato);
	end;
	
function nodo.contar():integer;
	begin
	if not soyelultimo then
		contar:=1 + siguiente.contar()
	else
		contar:=1;
	end;
//----------------------------------------------- Punto 6
function nodo.existeElemento(unDato: string): boolean;
begin
	if dato = unDato then
		existeElemento := true
	else if not soyElUltimo then
		existeElemento := siguiente.existeElemento(unDato)
	else
		existeElemento := false;
end;

//----------------------------------------------- Punto 7

procedure  nodo.imprimirmenores(unlimite:string);
begin
	if  not soyelultimo then
	begin
		if dato<=unlimite then 
		begin
		writeln(dato);
		siguiente.imprimirmenores(unlimite);
		end
	end;
end;

procedure  nodo.imprimirmayores(unlimite:string);
begin
if   dato>=unlimite then
writeln(dato);
  if not soyElUltimo then
siguiente.imprimirmayores(unlimite);
end;

procedure  nodo.imprimiracotado(unLimiteMin:string; unLimiteMax:string);
begin
if not soyelultimo then
begin
	if dato<unLimiteMin then
	begin
	siguiente.imprimiracotado(unLimiteMin,unLimiteMax);
	end
	else
			if	(dato>=unLimiteMin) and (dato<=unLimiteMax) then
			begin
			writeln(dato);
			siguiente.imprimiracotado(unLimiteMin,unLimiteMax);
			end;
	end;		
end;
end.

