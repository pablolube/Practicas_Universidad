program milista;

uses Urandomgenerator,Ulista;

var
rd:randomgenerator;
l:lista;
palabra:string;
elemento:string;


begin
//----------------------------------------------- Punto 5

l:=lista.create();
rd:=rd.create();
palabra:=rd.getString(3);
	while palabra<> 'zzz' do 
	begin
	l.agregar(palabra);
	palabra:=rd.getString(3);
	end;
	
writeln('Imprimir cantidad de elementos ');
writeln(l.cantidaddedatos);


//writeln('Imprimir en orden');
//l.imprimir;
//writeln('Imprimir inverso');
//l.imprimirInverso;

//----------------------------------------------- Punto 6
writeln('Ingrese elemento a buscar');
readln(elemento);
if l.existeElemento(elemento) then 
writeln('El elemento esta') 
else
writeln('NO esta en la lista')

end.
