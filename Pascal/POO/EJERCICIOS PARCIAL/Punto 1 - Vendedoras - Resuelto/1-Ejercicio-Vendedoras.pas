program vtas;

uses uvendedoras, Urandomgenerator, Udatetime, Genericlinkedlist, uabbgenerico;

type
  lista = specialize linkedlist<venta>;


{1) Haga un módulo que simule 50 ventas en total repartidas en 10 vendedoras. Las ventas
(generadas al azar) no tienen orden alguno. Almacene las ventas en un ABB ordenado
por ID de vendedora. Para cada vendedora almacene todas sus ventas ordenadas por
código de producto.}
procedure simuladorvtas(var arbol: abbvendedora);
var
  idvendedora, codigo, cantvendida, i: integer;
  precio: real;
  fecha: date;
  fmin, fmax: date;
  clave: entero;
  dato: TObject;
  rg: randomgenerator;
begin
  rg := randomgenerator.create;
  for i := 1 to 50 do 
  begin
    idvendedora := rg.getInteger(1, 10);
    codigo := rg.getInteger(1, 100);
    precio := rg.getReal(100, 999.9);
    cantvendida := rg.getInteger(1, 10);

    fmin := date.create(1, 1, 2020);
    fmax := date.create(31, 12, 2024);
    fecha := rg.getDate(fmin, fmax);  
    clave := entero.create(idvendedora); 
    dato := venta.create(codigo, precio, cantvendida, fecha);
    arbol.agregar(clave, dato);
  end;     
end;


{3) Haga un módulo que reciba el ABB previamente generado y un ID de una vendedora,
recupere las ventas de esa vendedora y almacénelas en otro ABB ordenado por
unidades vendidas.}
procedure cargararbol2(id: integer; arbol: abbvendedora; var arbol2: abbgenerico);
var
  clave: entero;
  dato: TObject;
  existe: boolean;
  listavtas: lista;
  vta: venta;
begin
  clave := entero.create(id);
  arbol.buscarElemento(clave, dato, existe);
  listavtas:= lista(dato);

    listavtas.reset();
    while not listavtas.eol() do
    begin
      vta := listavtas.current(); // Obtener cada venta      arbol2.agregar(entero.create(vta.getCantidadVendida()), vta); // Agregar venta a arbol2 usando cantidad vendida como clave
      arbol2.agregar(entero.create(vta.getcantidadvendida),vta);
      listavtas.next();
    end;

end;

var
  arbol: abbvendedora;
  arbol2: abbgenerico;
  id: integer;

begin
  arbol := abbvendedora.create();
  simuladorvtas(arbol);
  
  writeln('-----------------------------------------------------------------------------');
  writeln('             PUNTO 2    ARBOL COMPLETO   +     ARBOL ACUMULADO                                                       ');
  writeln('-----------------------------------------------------------------------------');
  arbol.imprimirEnOrden;

 writeln('-----------------------------------------------------------------------------');
 writeln('             PUNTO 3    ARBOL X CANT VENDIDA                                                        ');
 writeln('-----------------------------------------------------------------------------');  
  // Punto 3: Cargar y mostrar ventas para una vendedora específica
  
  writeln('Ingrese el ID de una vendedora');
  readln(id);
  arbol2 := abbgenerico.create();
  cargararbol2(id, arbol, arbol2);
  arbol2.imprimirenorden;
 
 
 writeln('-----------------------------------------------------------------------------');
 writeln('             PUNTO 4    ARBOL X     CANT VENDIDA ENTRE 5 Y 10                                                     ');
 writeln('-----------------------------------------------------------------------------');  
  
   {Haga un módulo que reciba el ABB con las ventas de una vendedora (el creado en el
inciso anterior) e imprima toda la información de las ventas cuyas cantidades vendidas
se encuentran entre 5 y 10.}
 
 arbol2.imprimiracotado(entero.CREATE(5),entero.create(10));

 
  
end.
