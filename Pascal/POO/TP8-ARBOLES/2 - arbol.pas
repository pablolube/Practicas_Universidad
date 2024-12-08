Program Arbolito;
uses UABB,Urandomgenerator;
var
arbol:ABB;
rg:randomgenerator;
i,num:integer;
begin
rg:=randomgenerator.create();
arbol:=ABB.create();
for i:=1 to 20 do
begin
num:=rg.getinteger(1,30);
writeln(num);
arbol.agregar(num);
end;

writeln('------------  IMPRIME   ------------');

for i:=1 to 20 do
	begin
	if not  arbol.existeElementoarbol(i) then
	 writeln (i,': No existe en el árbol') 
	else 
	 writeln (i,': ESTA!') ;
	end;
writeln('La cantidad de elementos son ',arbol.cantidadDeElementos());
end.

