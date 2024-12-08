program arboldeclientes;

uses UABBgenerico,Ucliente,Urandomgenerator,UCadena,Ucajadeahorro;



//------------------------------------------------------ PUNTO 5 A
procedure cargararbol(var arbol: ABBgenerico);
var
  clave:comparable;
  dato_cliente:cliente;
  rg: randomgenerator;
  unNombre: string;
  cajacliente:cajadeahorro;
  undni:string;
  monto:real;
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
//creo dni
   undni:=rg.getstring(6);
   clave:=Cadena.create(undni);
   
   
   //creo caja de ahorro 
   monto:=rg.getinteger(100,1000);
   cajacliente:=cajadeahorro.create(1);
   cajacliente.depositar(monto);
      
   //creo cliente
   dato_cliente:=cliente.create(unnombre,undni,cajacliente);
   
   //agrego arbol
   arbol.agregar(clave, dato_cliente);
   writeln('Agregando: ', unNombre); // Para verificar que se está agregando
   unnombre := rg.getlabel;
   end;
   end;


procedure buscarcliente(arbol:abbgenerico;dni:string);
var 
existe:boolean;
c1:Tobject;

begin
arbol.buscarElemento(cadena.create(dni),c1,existe); // Aclaraciones el proceso necesita que DNI sea un comparable, devuelve un Tobject (me lo guarde en la variable c1) y Existe
	if existe then
		begin
		writeln ('DNI ',cliente(c1).getDNI);
		writeln ('Saldo ',cliente(c1).getsaldo():2:0);// Aca lo transformo de Tobject a cliente Cliente(toobjetct)
		writeln('Nombre ',cliente(c1).getNombre);
		end
	 else	
		begin
		writeln('No estaba en el arbol')
	end;
 end;

var 
arbol:ABBgenerico;
dni:string;
min,max:string;
begin

//Creo Arbol
arbol := ABBgenerico.create; 
cargararbol(arbol);

//imprimo arbol en orden
arbol.imprimirEnOrden();

//Busco cliente en arbol si existe
writeln('Ingrese DNI');
readln(dni);
buscarcliente(arbol,dni);

writeln('Minimo');
readln(min);

writeln('Maximo');
readln(max);
arbol.imprimirAcotado(cadena.create(min),cadena.create(max));
end.

