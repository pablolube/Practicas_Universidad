program almacen;
  
uses Uproductoalmacen,Uabbgenerico,urandomgenerator,Ucadena,sysutils;

type 
procedimiento=procedure(Uproductoalmacen:Tobject);

procedure aumentarprecio(Uproductoalmacen:Tobject);
var
p:producto;
begin
p:=producto(uproductoalmacen);
p.aumentarprecio(15);
end;


{3) Haga un módulo que reciba el ABB generado e imprima toda la información de los
productos cuyo rubro es “indumentaria”.}

procedure imprimirIndumentaria(Uproductoalmacen: TObject);
var
  p: producto;
begin
  p := producto(Uproductoalmacen);
  if p.getcodrubro() = 1 then 
  begin
    writeln(p.toString);  
  end;
end;


{4) Haga un módulo que reciba el ABB generado, un ID de producto y una cantidad
vendida y actualice el stock de dicho producto.}


procedure actualizarStock(arbol: ABBGenerico; idProducto: string; cantidadVendida: integer);
var
  p: TObject;
  prod:producto;
  existe: boolean;
begin
  arbol.buscarElemento(cadena.create(idProducto), p, existe);
  if existe then
  begin
	prod:=producto(p);
	prod.actualizarStock(cantidadVendida);
    writeln('Stock actualizado: ', p.tostring());
  end
  else
    writeln('Producto no encontrado.');
end;

{5) Haga un módulo que reciba el ABB generado e imprima aquellos productos con un
stock menor a 10 unidades.}

procedure imprimirstockmenor(Uproductoalmacen: TObject);
var
  p: producto;
begin
  p := producto(Uproductoalmacen);
  if p.getstockactual() < 10 then  
  begin
    writeln(p.toString);  
  end;
end;


{6)Haga un módulo que reciba el ABB generado y dos ID de producto e imprima el stock
actual de todos los productos que se encuentran entre los dos ID.}

procedure imprimirstockacotado(Uproductoalmacen: TObject);
var
  p: producto;
begin
	p := producto(Uproductoalmacen);
    writeln(p.tostringstock);  
  end;





procedure cargararbol(var arbol:abbgenerico);
var
id:string;
codrubro:integer;
codunidad:integer;
precio:real;
stockactual:integer;
rg:randomgenerator;
i:integer;
clave:cadena;
unproducto:TObject;
begin
rg:=randomgenerator.create;
for i:=1 to 45 do
begin
codrubro:=rg.getinteger(1,10);
codunidad:=rg.getinteger(1,10);
precio:=rg.getreal(1,99.99);
stockactual:=rg.getinteger(1,100);
id:=(IntToStr(codrubro) + ' - ' +IntToStr(codunidad));

clave:= cadena.create(id);
unproducto:=producto.create(codrubro,codunidad,precio,stockactual);
arbol.agregar(clave,unproducto);

end;
end;

var
arbol:abbgenerico;
stringmin,stringmax:string;
id:string;
cantvendida:integer;
begin
{1) Haga un módulo que genere 45 productos generados al azar y sin orden alguno.
Almacene los alquileres en un ABB ordenado por ID.}

writeln('-----------------------------------------------------------------------------------------------------');
writeln(' PUNTO 1 - ARBOL DE PROD ORD X ID ' );
writeln('-----------------------------------------------------------------------------------------------------');

arbol:=abbgenerico.create();
cargararbol(arbol);
arbol.imprimirenorden;

{2) Haga un módulo que reciba el ABB generado y permita aumentar el precio un 15 %.}

writeln('-----------------------------------------------------------------------------------------------------');
writeln(' PUNTO 2 - ARBOL  CON AUMENTO 15%' );
writeln('-----------------------------------------------------------------------------------------------------');
stringmin := IntToStr(Low(Integer)) + ' - ' + IntToStr(Low(Integer));
stringmax := IntToStr(High(Integer)) + ' - ' + IntToStr(High(Integer));

arbol.procesar(cadena.create(stringmin),cadena.create(stringmax),@aumentarprecio);
arbol.imprimirenorden;

{3) Haga un módulo que reciba el ABB generado e imprima toda la información de los
productos cuyo rubro es “indumentaria”.}
writeln('-----------------------------------------------------------------------------------------------------');
writeln('Imprimir punto 3');
writeln('-----------------------------------------------------------------------------------------------------');
arbol.procesar(cadena.create(stringmin),cadena.create(stringmax),@imprimirIndumentaria);




{4) Haga un módulo que reciba el ABB generado, un ID de producto y una cantidad
vendida y actualice el stock de dicho producto.}
writeln('-----------------------------------------------------------------------------------------------------');
writeln('Imprimir punto 4');
writeln('-----------------------------------------------------------------------------------------------------');
writeln('Ingrese Id');
readln(id);
writeln('Ingrese cantvendida');
readln(cantvendida);
actualizarStock(arbol,id,cantvendida);
arbol.imprimirenorden;



writeln('-----------------------------------------------------------------------------------------------------');
writeln('Imprimir punto 5');
writeln('-----------------------------------------------------------------------------------------------------');

{5) Haga un módulo que reciba el ABB generado e imprima aquellos productos con un
stock menor a 10 unidades.}
arbol.procesar(cadena.create(stringmin),cadena.create(stringmax),@imprimirstockmenor);

{6)Haga un módulo que reciba el ABB generado y dos ID de producto e imprima el stock
actual de todos los productos que se encuentran entre los dos ID.}
writeln('ingrese ID1');
readln(stringmin);
writeln('ingrese ID2');
readln(stringmAX);
arbol.procesar(cadena.create(stringmin),cadena.create(stringmax),@imprimirstockacotado);

end.



