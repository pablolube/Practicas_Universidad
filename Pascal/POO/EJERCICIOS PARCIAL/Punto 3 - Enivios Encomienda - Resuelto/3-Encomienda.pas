program encomiendaprog;

uses 
  sysUtils, Uabbgenerico, Uencomienda, Urandomgenerator, Udatetime, Ucadena, Genericlinkedlist, Ufecha;

type
  lista = specialize linkedlist<encomienda>;
	Procedimiento = procedure(unDato: TObject);



{1) Haga un módulo que simule 60 despachos/recepciones en total repartidas en 15
puntos de retiro. Las encomiendas (generadas al azar) no tienen orden alguno.
Almacene las encomiendas en un ABB ordenado por punto de retiro. Para cada punto
de retiro almacene todas sus encomiendas discriminadas en “despachadas” y
“recepcionadas”. Las “despachadas” deben almacenarse ordenada por peso.}

procedure CargarArbol(var arbol: abbencomienda);
var
  puntoRetiro, remitente, direccionDestino, tipo: string;
  peso: real;
  locGen, tipoGen, rg, provGen: RandomGenerator;
  clave: Cadena;
  encomiendaNueva: encomienda;
  fecha, fmin, fmax: date;
  i: integer;
begin
  // Inicialización de generadores de datos aleatorios
  tipoGen := RandomGenerator.Create();
  rg := RandomGenerator.Create();
  locGen := RandomGenerator.Create();
  provGen := RandomGenerator.Create();

  // Configuración de tipos de encomienda
  tipoGen.AddLabel('Recepcionadas');
  tipoGen.AddLabel('Despachadas');

  // Configuración de provincias
  provGen.AddLabel('Buenos Aires');
  provGen.AddLabel('Formosa');

  // Configuración de localidades de retiro
  locGen.AddLabel('La Plata');
  locGen.AddLabel('Bahia Blanca');
  locGen.AddLabel('Saladillo');
  locGen.AddLabel('CABA');
  locGen.AddLabel('Junin');
  locGen.AddLabel('Olavarria');
  locGen.AddLabel('La Costa');
  locGen.AddLabel('Tres Olmos');

  // Fechas de mínimo y máximo para las encomiendas
  fmin := date.Create(1, 1, 2020);
  fmax := date.Create(31, 12, 2024);

  // Generación de 60 encomiendas aleatorias
  for i := 1 to 60 do
  begin
    fecha := rg.getDate(fmin, fmax);
    puntoRetiro := provGen.GetLabel() + ' ' + locGen.GetLabel();
    remitente := puntoRetiro;
    peso := rg.GetReal(1, 99.99);
    direccionDestino := rg.GetString(4);
    tipo := tipoGen.GetLabel();

    // Crear clave para el ABB usando el punto de retiro como clave
    clave := Cadena.Create(puntoRetiro);

    // Crear objeto `Encomienda` con los datos generados
    encomiendaNueva := encomienda.Create(remitente, peso, direccionDestino, fecha, tipo);

    // Agregar la encomienda al árbol binario de búsqueda
    arbol.Agregar(clave, encomiendaNueva);
  end;
end;

{2) Haga un módulo que reciba el ABB previamente generado e imprima para todos los
punto de retiro de Formosa, las encomiendas despachadas menores a 50 KG.}

procedure encomiendasFormosa(Uencomienda: TObject);
var
  e: encomienda;
begin
  e := encomienda(Uencomienda);

  // Filtrar solo las encomiendas de Formosa que sean despachadas y pesen menos de 50 kg
  if (e.getPeso < 50) and (e.getTipo = 'Despachadas') then
  begin
    writeln(e.toString());  // Imprimir la encomienda
  end;
end;


{3) Haga un módulo que reciba el ABB previamente generado y un identificador de punto
de retiro, recupere todas sus encomiendas y almacénelas en otro ABB ordenado por
fecha.}

procedure CargarArbolFecha(arbol: abbencomienda; ptoretiro: string; var arbol2: abbgenerico);
var
  dato: TObject;
  existe: boolean;
  fecha: date;
  elemento:encomienda;

begin
  arbol.BuscarElemento(Cadena.Create(ptoretiro), dato, existe);
 elemento := encomienda(dato);
 fecha:=elemento.getfecha();
 arbol2.agregar(fechas.create(fecha),elemento);
end;

var
  arbol: abbencomienda;
  arbol2: abbgenerico;
  provincia, localidad, ptoretiro: string;
  dia,mes,anio:integer;
  fechamin,fechamax:date;
begin
writeln ('------------------------------------------------------------------------------');
writeln ('                            PUNTO 1                                           ');
writeln ('------------------------------------------------------------------------------');
  arbol := abbencomienda.Create();
  CargarArbol(arbol);
  arbol.ImprimirEnOrden;


writeln ('------------------------------------------------------------------------------');
writeln ('                            PUNTO 2                                           ');
writeln ('------------------------------------------------------------------------------');

arbol.procesar(cadena.create('Formosa'),cadena.create('J'),@encomiendasformosa);

writeln ('------------------------------------------------------------------------------');
writeln ('                            PUNTO 3                                           ');
writeln ('------------------------------------------------------------------------------');

{3) Haga un módulo que reciba el ABB previamente generado y un identificador de punto
de retiro, recupere todas sus encomiendas y almacénelas en otro ABB ordenado por
fecha.}
  // Pedir al usuario el punto de retiro
  writeln('Ingrese Provincia');
  readln(provincia);
  writeln('Ingrese Localidad');
  readln(localidad);
  ptoretiro := provincia + ' ' + localidad;
  arbol2 := abbgenerico.Create;
  // Cargar el segundo árbol con las encomiendas ordenadas por fecha
  CargarArbolFecha(arbol, ptoretiro, arbol2);

  // Imprimir el segundo árbol (ordenado por fecha)
  arbol2.ImprimirEnOrden;

writeln ('------------------------------------------------------------------------------');
writeln ('                            PUNTO 4                                           ');
writeln ('------------------------------------------------------------------------------');

{4) Haga un módulo que reciba el ABB con las encomiendas de un punto de retiro (el
creado en el inciso anterior) e imprima toda la información de las encomiendas entre
dos fechas recibidas.}
writeln('Ingrese la primera fecha (mínima):');
write('Día: ');
readln(dia);
write('Mes: ');
readln(mes);
write('Año: ');
readln(anio);
fechamin := date.create(dia, mes, anio);

writeln('Ingrese la segunda fecha (máxima):');
write('Día: ');
readln(dia);
write('Mes: ');
readln(mes);
write('Año: ');
readln(anio);
fechamax := date.create(dia, mes, anio);
arbol2.imprimiracotado(fechas.create(fechamin),fechas.create(fechamax));
end.


