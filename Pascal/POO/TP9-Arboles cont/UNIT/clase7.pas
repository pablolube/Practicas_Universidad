program Nombres;

uses UNodo;

var n1, n: nodo; i: integer; nom: stringa;
BEGIN
	readln(nom);
	n:= nodo.create(nom);
	for i:= 1 to 4 do
	begin
		readln(nom);
		n1:= nodo.create(nom);
		n.agregar(n1);
	end;
	writeln('Ndoso Orden de ingreso');
	n.imprimir();
	writeln('INVERSO');
	n.imprimirinverso();
	writeln('El total de nodos son ',n.contar());
END.

