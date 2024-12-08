program arboldeclientes;

uses UABBgenerico,Ucliente,Urandomgenerator,uCadena;



//------------------------------------------------------ PUNTO 5 A
procedure cargararbol(var arbol: ABBgenerico);
var
  clave:comparable;
  dato:TObject;
  rg: randomgenerator;
  unNombre: string;

  undni:string;
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
  unnombre := rg.getlabel;
  
  //BUCLE
  while unNombre <> 'zzz' do 
  begin

    


//CREAR CLIENTE 
    undni:=rg.getstring(6);
    clave:=Cadena.create(undni);
    dato:=cliente.create(undni,unnombre);
    arbol.agregar(clave, dato);
    writeln('Agregando: ', unNombre); // Para verificar que se está agregando
   unnombre := rg.getlabel;

 end;
end;
var 
arbol:ABBgenerico;
begin
  arbol := ABBgenerico.create; 
cargararbol(arbol);

end.
