program pverduleria;

uses Uverduleria,Ucaja,Ucliente,Ucajadeahorro,Urandomgenerator,Uticket;

var
v:verduleria;
nombreverdu,nombrecliente:string;
c:cliente;
billetera:cajadeahorro;
num:integer;
rg:randomgenerator;

begin
rg:= randomgenerator.create();

writeln('Ingrese el nombre de la Verduleria');
readln(nombreverdu);
v:=verduleria.create(nombreverdu);

writeln('Ingrese numero de caja');
readln(num);
billetera:=cajadeahorro.create(num);

billetera.depositar(rg.getReal(10000, 20000));
writeln(billetera.consultarSaldo():0:2);


writeln('Ingrese nombre cliente');
readln(nombrecliente);

c:=cliente.create(nombrecliente,billetera);

v.atender(c);

end.

