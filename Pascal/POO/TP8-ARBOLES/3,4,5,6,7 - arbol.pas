Program Arbolito;
uses UABB,Urandomgenerator;
var
arbol:ABB;
rg:randomgenerator;
i,num,max,min:integer;
// ------------------------------------------- PUNTO 2

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

for i:=1 to 10 do
	begin
	if not  arbol.existeElementoarbol(i) then
	 writeln (i,': No existe en el árbol') 
	else 
	 writeln (i,': ESTA!') ;
	end;
writeln('La cantidad de elementos son ',arbol.cantidadDeElementos());

// ------------------------------------------- PUNTO 3

writeln('IMprimir en orden');
arbol.imprimir();

writeln('IMprimir inverso');
arbol.imprimirinverso();
// ------------------------------------------- PUNTO 4 

writeln('IMprimir en preorden');
arbol.imprimirpreorden();

writeln('IMprimir imprimirpostorden');
arbol.imprimirpostorden;

// ------------------------------------------- PUNTO 5 
write('Minimo: ');
writeln(arbol.minimo);

write('Maximo: ');
writeln(arbol.maximo);


// ------------------------------------------- PUNTO 6 

writeln('Ingrese valor minimo');
readln(min);

writeln('Menores que : ',min);
arbol.imprimirmenores(min);

writeln('Ingrese valor maximo');
readln(max);

writeln('Mayores que : ',max);
arbol.imprimirmayores(max);

// ------------------------------------------- PUNTO 7


writeln('RANGO ACOTADO NUMEROS entre ',min,' y ',max);
arbol.imprimirAcotado(min,max);


end.
