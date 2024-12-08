program catalogo;


uses UABBgenerico,UProductoEnGondola,Ucadena,Urandomgenerator;

type 
procedimiento=procedure(UnProdcutoEnGondola:Tobject);

procedure aumentarprecio(UnProdcutoEnGondola:TObject);
var
p:productoengondola;
begin
p:= ProductoEnGondola(UnProdcutoEnGondola);
p.aumentarprecio();
end;

procedure cargararbol(var arbol: ABBgenerico);
var
  rg: randomgenerator;
  nombre_prod: string;
  precio:real;
  stock:real;
  producto:ProductoEnGondola;
  clave:comparable;

  begin
rg := randomgenerator.create;
rg.addlabel('Zanahoria');
rg.addlabel('Lechuga');
rg.addlabel('Tomate');
rg.addlabel('Frutilla');
rg.addlabel('Pepino');
rg.addlabel('Espárrago');
rg.addlabel('Calabacín');
rg.addlabel('Berenjena');
rg.addlabel('Tomatee');
rg.addlabel('Coliflor');
rg.addlabel('zzz');
rg.addlabel('Espinaca');
nombre_prod := rg.getlabel;
  //BUCLE
while nombre_prod <> 'zzz' do 
begin
writeln(nombre_prod);
precio:=rg.getreal(100,9999);
stock:=rg.getReal(1,100);
producto:=productoengondola.create(nombre_prod,precio,stock);
clave:=Cadena.create(nombre_prod);

arbol.agregar(clave, producto);
nombre_prod := rg.getlabel;
end; 
end;



var
arbol:ABBgenerico;
min,max:string;
begin
arbol:=ABBgenerico.create();
cargararbol(arbol);
writeln('Arbol Ordenado');
arbol.imprimirEnOrden;
//PUNTo 8
writeln('Ingrese nombre prod min');
readln(min);
writeln('Ingrese nombre prod max');
readln(max);
arbol.procesar(cadena.create(min),cadena.create(max),@aumentarprecio);
arbol.imprimirEnOrden;


end.
