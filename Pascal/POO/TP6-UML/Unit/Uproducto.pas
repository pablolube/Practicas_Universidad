unit Uproducto;
{$mode objfpc}
INTERFACE
uses sysutils;
type
producto=class
	PRIVATE
		descripcion:string;
		peso:real;
	PUBLIC
		CONSTRUCTOR create(unaDescripcion:string;unPeso:real);
		FUNCTION getdescripcion():string;
		FUNCTION getpeso():real;
		FUNCTION toString():ansistring;override;
end;
IMPLEMENTATION
	
	CONSTRUCTOR producto.create(unaDescripcion:string;unPeso:real);
	begin
	descripcion:=unaDescripcion;
	peso:=unPeso;
	end;
	
	FUNCTION producto.getdescripcion():string;
	begin
	getdescripcion:=descripcion;
	end;
	
	FUNCTION producto.getpeso():real;
	begin
	getpeso:=peso;
	end;
	
	FUNCTION producto.tostring():ansistring;
	begin
	toString:= format('%10.3f', [peso]);
	end;
end.
