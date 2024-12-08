program pverduleria;

uses Uverduleria,Ucaja,Ucliente,Ucajadeahorro,Urandomgenerator,Uticket;

var
v:verduleria;
nombreverdu,nombrecliente:string;
c:cliente;

rg:randomgenerator;
i:integer;
caja:cajadeahorro;
begin
rg:= randomgenerator.create();

writeln('Ingrese el nombre de la Verduleria');
readln(nombreverdu);
v:=verduleria.create(nombreverdu);

writeln('Ingrese nombre cliente');
readln(nombrecliente);
c:=cliente.create(nombrecliente);

for i:=1 to 3 do
begin;
caja:=cajadeahorro.create(i);
caja.depositar(rg.getReal(10000, 20000));
writeln(caja.consultarSaldo():0:2);
c.agregarCaja(caja);
end;

v.atender(c);


end.

