
program nombres;
uses Ucadena, Urandomgenerator, UABBgenerico;


//------------------------------------------------------ PUNTO 3
procedure cargararbol(var arbol: ABBgenerico);
var
  rg: randomgenerator;
  unNombre: string;
begin
  rg := randomgenerator.create;
  rg.addlabel('Alan');
  rg.addlabel('Bruno');
  rg.addlabel('Belice');
  rg.addlabel('Damian');
  rg.addlabel('Esteban');
  rg.addlabel('Fermin');
  rg.addlabel('Giuliana');
  rg.addlabel('Hilda');
  rg.addlabel('Javier');
  rg.addlabel('Lautaro');
  rg.addlabel('zzz');
  rg.addlabel('Acasio');
  
  unNombre := rg.getlabel;
  while unNombre <> 'zzz' do 
  begin
    writeln('Agregando: ', unNombre); // Para verificar que se está agregando
    arbol.agregar(Cadena.create(unNombre)); 
    unNombre := rg.getlabel;
  end;
end;

procedure existe (arbol : ABBgenerico; nombre :string);
begin
if arbol.existeElemento(Cadena.create(nombre))then // ____________________ NO ENTIENDO
writeln ('el nombre existe')
else
writeln('el nombre no existe');
end;


//------------------------------------------------------ PUNTO 3 CONTINUACION



procedure imprimiracotado(arbol:abbgenerico);
var
unNombre:string;
OtroNombre:string;
begin
writeln('Ingrese un nombre');
readln(unNombre);
writeln('Ingrese un Otro nombre');
readln(otroNombre);
arbol.imprimirAcotado(Cadena.create(unNombre),Cadena.create(otroNombre));
writeln('salio');
end;


var
ARBOL : ABBGenerico;
nombre : string;


//------------------------------------------------------ PUNTO 3 CONTINUACION

BEGIN
ARBOL := ABBGenerico.create; //Creo arbol
cargararbol(arbol);

writeln ('Ingrese nombre a buscar: ');
readln (nombre);
existe (ARBOL,NOMBRE);

writeln ('Aca deberia imprimir Arbol: ');
arbol.imprimirEnOrden();


writeln ('Aca deberia imprimir acotado: ');
imprimiracotado (ARBOL);

END.

