program milista;

uses Urandomgenerator,Ulista;

var
l:lista;
mayores,menores:string;
desde,hasta:string;

begin
//----------------------------------------------- Punto 9

l:=lista.create();
 l.agregar('AAA');
  l.agregar('BBB');
  l.agregar('CCC');
  l.agregar('DDD');
  l.agregar('EEE');
  l.agregar('FFF');
  l.agregar('GGG');
  l.agregar('HHH');
  l.agregar('III');
  l.agregar('JJJ');
  l.agregar('KKK');
  l.agregar('LLL');
  l.agregar('MMM');
  l.agregar('NNN');
  l.agregar('OOO');
    l.agregar('PPP');
    l.agregar('RRR');


	
writeln('Imprimir cantidad de elementos ');
writeln(l.cantidaddedatos);


writeln ('Imprimir entre rango ');
write('Desde: ');
readln(DESDE);
write('Hasta: ');
readln(HASTA);
l.imprimiracotado(desde,hasta);



write('Imprimir mayores que: ');
readln(mayores);
l.imprimirmayores(mayores);



write('Imprimir menores que: ');
readln(menores);
l.imprimirmenores(menores);


end.

