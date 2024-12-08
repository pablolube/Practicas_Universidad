program pverduleria;

uses Uverduleria,Ucaja,Ucliente,Ucajadeahorro,Urandomgenerator,Uticket;

var
v:verduleria;
nombreverdu,nombrecliente:string;
c:cliente;
j:integer;
cajaverdu:cajadeahorro;
rg:randomgenerator;
i:integer;
caja:cajadeahorro;
begin
rg:= randomgenerator.create();

writeln('Ingrese el nombre de la Verduleria');
readln(nombreverdu);
cajaverdu:=cajadeahorro.create(1);
v:=verduleria.create(nombreverdu, cajaverdu);
	
	for j:=1 to 15 do
	begin
	writeln('Ingrese nombre del cliente');
	readln(nombrecliente);
	c:=cliente.create(nombrecliente);

	for i:=1 to 3 do
	begin;
	caja:=cajadeahorro.create(i);
	caja.depositar(rg.getReal(100, 1000));
	writeln('Saldo de CTA CTE ', i ,' cliente ',j);
	writeln(caja.consultarSaldo():0:2);
	c.agregarCaja(caja);
	end;

	v.atender(c);

	end;
		writeln('Total Ganado en el Dia');
	writeln(cajaverdu.consultarSaldo():2:0);

end.

