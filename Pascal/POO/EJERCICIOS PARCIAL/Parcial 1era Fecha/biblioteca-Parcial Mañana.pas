Program libreria;

uses sysUtils, Uabbgenerico, Ubiblioteca, Urandomgenerator, Uentero, Genericlinkedlist, Ufecha;

type 
procedimiento=procedure(libro2:Tobject);
procedure CargarArbol(var arbol: ABBContador);
var
ISBN:integer;
titulo:string;
autor:string;
anio:integer;
clave: entero; //fechas / entero
rg,rgautor,rglibro: RandomGenerator;
i,j: integer;
dato:libro;

begin
  // Inicialización de generadores de datos aleatorios
  rgautor:= RandomGenerator.Create();
  rgautor.AddLabel('Loper Rumpdaum');
  rgautor.AddLabel('Freyre');
  rgautor.AddLabel('Cortazar');
  rgautor.AddLabel('Boy Casares');  
  
  // Configuración de localidades de retiro
  rg:= RandomGenerator.Create();
  rglibro:= RandomGenerator.Create();
  
  rglibro.AddLabel('100 anios de soledad');
  rglibro.AddLabel('Corazon Delator');
  rglibro.AddLabel('1000 Leguas en Viaje Submarino');
  rglibro.AddLabel('El ultimo Mohicano');  
  rglibro.AddLabel('El capital');  



for i:=1 to 10 do 

	begin
	ISBN:=rg.getinteger(100,300);
	autor:=rgautor.getlabel;
	titulo:=rglibro.getlabel;
	anio:=rg.getinteger(1890,2024);
		for j:=1 to 3 do 
		begin

		clave := Entero.Create(ISBN); //fechas o entero
		dato := libro.Create(ISBN,Titulo,autor,anio);
		arbol.agregar(clave,dato);
		end;
	end;
end;

procedure imprimiracotado1(arbol:abbcontador);
var
min,max:integer;
begin
writeln('Ingrese un ISBN') ;
readln(min);
writeln ('Ingrese otro ISBN');
readln(max);

arbol.imprimiracotado(Entero.Create(min),Entero.Create(max));
end;


function  exitelemento(arbol:abbcontador;ISBN:integer):boolean;

begin
exitelemento:=arbol.existeElemento(Entero.Create(isbn));
end;



PROCEDURE imprimirfiltrado(libro2:Tobject);
var
a:libro;

begin
a:=(libro2);


if a.getcontador()<5 then
begin
a.sumacontador(10);
end;
end;

var
arbol:ABBContador;
ISBN:INTEGER;
begin
arbol:=ABBContador.create();

CargarArbol(arbol);





writeln('--------------------------------------------------------------------');
writeln('                          PUNTO 2                                          ');
writeln('--------------------------------------------------------------------');
imprimiracotado1(arbol);



writeln ('Ingrese otro ISBN');
readln(isbn);
if  exitelemento(arbol,isbn) = True then 
writeln('Existe Elemento')
else
writeln('No existe Elemento'); 


arbol.procesar(entero.create(100),entero.create(300),@imprimirfiltrado);



writeln('--------------------------------------------------------------------');
writeln('                          PUNTO 3                                         ');
writeln('--------------------------------------------------------------------');
arbol.imprimirEnOrden;

end.
