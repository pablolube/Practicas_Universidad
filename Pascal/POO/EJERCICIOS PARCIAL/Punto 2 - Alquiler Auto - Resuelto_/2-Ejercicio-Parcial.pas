program alquileres;

uses
  Urandomgenerator, Udatetime,  ufecha, Uauto;
  
  type 
procedimiento=procedure(Uauto:Tobject);

procedure imprimirmarca(Uauto:Tobject);
var
a:alquiler;
begin
a:=alquiler(Uauto);

if a.getmarca= 'Ford' then
begin
writeln(a.toString);
end;
end;

procedure imprimirpatente(Uauto:Tobject);
var
a:alquiler;
begin
a:=alquiler(Uauto);
begin
	if a.getpatente()='123qeq' then
	writeln(a.toString);
	end;
end;


procedure simularalquileres(var arbol: Abbauto);
var
  patente: string;
  fechaalq: date;
  marca: string;
  modelo: string;
  diasalquiler: integer;
  preciodia: real;
  clave: fechas;
  rg: randomgenerator;
  i: integer;
  fmin, fmax: date;
  dato: alquiler;

begin
  rg := randomgenerator.create;
  rg.addlabel('Fiat');
  rg.addlabel('Volvo');
  rg.addlabel('Ford');
  
  for i := 1 to 30 do 
  begin
    patente := rg.getstring(6);
    fmin := date.create(1, 1, 2020);
    fmax := date.create(31, 12, 2024);
    fechaalq := rg.getDate(fmin, fmax);  
    marca := rg.getlabel();
    modelo := rg.getstring(5);
    diasalquiler := rg.getinteger(1, 20);
    preciodia := rg.getreal(1, 9999);
    clave := fechas.create(fechaalq); 
    dato := alquiler.create(patente, fechaalq, marca, modelo, diasalquiler, preciodia);
    arbol.agregar(clave, dato);
  end; 
end;


function crearfecha():date;
var
dia:integer;
mes:integer;
anio:integer;
begin
writeln('dia');
readln(dia);

writeln('mes');
readln(mes);

writeln('anio');
readln(anio);
crearfecha:=date.create(dia,mes,anio);


end;
var
  arbol: Abbauto;
  fechamin,fechamax:date;
begin
// Punto 1
  arbol := Abbauto.create();
  simularalquileres(arbol);
 
writeln('--------------------------- PUNTO 1  TODOS LOS ALQUILERES -----------------');

  arbol.imprimirenorden;
  
// Punto 2
writeln('INGRESE FECHA MIN');
fechamin:=crearfecha();

writeln('INGRESE FECHA MAX');
fechamax:=crearfecha();

writeln('');writeln('');writeln('');writeln('');
writeln('--------------------------- PUNTO 2 ALQUIERES ENTRE FECHAS -----------------');
arbol.imprimirAcotado(fechas.create(fechamin),fechas.create(fechamax));

writeln('');writeln('');writeln('');writeln('');
writeln('                                SOLO FORD                            ');

writeln('---------------------------------------------------------------------');
    fechamin := date.create(1, 1, 2020);
    fechamax := date.create(31, 12, 2024);
arbol.procesar(fechas.create(fechamin),fechas.create(fechamax),@imprimirmarca);



writeln('');writeln('');writeln('');writeln('');
writeln('--------------------------- PUNTO 4 ALQUIERES ENTRE FECHAS -----------------');

{4)Haga un módulo que reciba el ABB generado e imprima solo los alquileres del vehículo
cuya patente es ingresada por teclado.}

arbol.procesar(fechas.create(fechamin),fechas.create(fechamax),@imprimirpatente);
end.



