UNIT Ucontadormanual // Nombre a usarse fuera del archivo
{$mode objfpc};// Es para  avisarle a Pascal que trabajas un Objeto
INTERFACE // Aca se declara el objeto sus variables y elementos
TYPE // TODA LA CLASE ES UN GRAN TYPE
	contadormanual=class 
			PRIVATE  // Parte que no puede ser vista por fuera de la clase,ni modificada
			cantidad:integer;
		
			PUBLIC  // Parte que puede ser vista utilizada por fuera
				CONSTRUCTOR  Create(); // Inicia la clase,  deja todo listo para que el objeto se pueda usar
				PROCEDURE  	Incrementar();
				FUNCTION 	getCantidad():integer;
				FUNCTION 	sosIgual(c: ContadorManual): boolean;

end;
IMPLEMENTATION   // Aca se desarrollan los modulos

CONSTRUCTOR contadormanual.Create();
begin
cantidad:=0;
end;

PROCEDURE contadormanual.Incrementar();
Begin
cantidad:=cantidad+1;
end;

FUNCTION contadormanual.getCantidad():INTEGER;
begin
getCantidad:=cantidad;
end;
FUNCTION contadormanual.sosIgual(c:ContadorManual): boolean;
begin
if self.getCantidad()=c.getCantidad() then
 sosIgual:=True
 else
 SosIgual:=False;
 end;
end.
