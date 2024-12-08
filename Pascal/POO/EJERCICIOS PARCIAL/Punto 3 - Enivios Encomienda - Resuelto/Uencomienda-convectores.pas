unit Uencomienda;
{$mode objfpc}

INTERFACE

USES Udatetime, sysutils, genericlinkedlist, Uabbgenerico, ucadena;

type
  encomienda = class
  private
    remitente: string;
    peso: real;
    direccion_destino: string;
    fecha: date;
    tipo: string;
  public
    constructor create(unremitente: string; unpeso: real; undireccion: string; unfecha: date; untipo: string);
    function getRemitente(): string;
    function getPeso(): real;
    function getDireccion(): string;
    function getFecha(): date;
    function getTipo(): string;
    function toString(): ansistring; override;
  end;

  lista = specialize linkedlist<encomienda>;
  vencomienda = array[0..1] of lista;
    
  	
	
	encomiendasagrupadas = class
		private
			encomiendas: vencomienda;
		public
    constructor create();
   procedure agregarencomienda(tipo:string;encomiendanueva:encomienda);
	procedure insertarOrdenadoRecepcionadas(var l: lista; a: encomienda);
    procedure insertarOrdenadoDespachadas(var l: lista; a: encomienda);
    function getlistaencomienda(tipo: string): lista;

   // function getencomienda(tipo:string): lista;

	end;

  nodoencomienda = class(Nodo)
  private
    Encomiendas: encomiendasagrupadas;
  public
    constructor create(clave: Comparable; dato: TObject);
    procedure agregar(unNodo: Nodo); override;
    function devolverElemento(): TObject; override;
    function toString: ansistring; override;
  end;

  abbencomienda = class(ABBgenerico)
  public
    procedure agregar(Clave: Comparable; Dato: TObject); override;
  end;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
IMPLEMENTATION

constructor encomienda.create(unremitente: string; unpeso: real; undireccion: string; unfecha: date; untipo: string);
begin
  remitente := unremitente;
  peso := unpeso;
  direccion_destino := undireccion;
  fecha := unfecha;
  tipo := untipo;
end;

function encomienda.getRemitente(): string;
begin
  result := remitente;
end;

function encomienda.getPeso(): real;
begin
  result := peso;
end;

function encomienda.getDireccion(): string;
begin
  result := direccion_destino;
end;

function encomienda.getFecha(): date;
begin
  result := fecha;
end;

function encomienda.getTipo(): string;
begin
  result := tipo;
end;

function encomienda.toString(): ansistring;
begin
  result := 'Tipo: ' + tipo +
            ' Fecha: ' + fecha.toString +
            ' Remitente: ' + remitente +
            ' Direccion: ' + direccion_destino +
            ' Peso: ' + FloatToStr(peso) + LineEnding;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Implementación de nodoencomienda

constructor encomiendasagrupadas.create();
var x:integer;
begin
for x:=0 to 1 do 
	encomiendas[x]:=lista.create();
end;

procedure encomiendasagrupadas.insertarOrdenadoDespachadas(var l: lista; a: encomienda);
var
  seguir: boolean;
begin
  seguir := true;
  l.reset();
  while not l.eol() and seguir do
  begin
    if a.getPeso < l.current().getPeso then
      seguir := false
    else 
      l.next();
  end;
  l.insertcurrent(a);
end;

procedure encomiendasagrupadas.insertarOrdenadoRecepcionadas(var l: lista; a: encomienda);
var
  seguir: boolean;
begin
  seguir := true;
  l.reset();
  while not l.eol() and seguir do
  begin
    if a.getDireccion < l.current().getDireccion then
      seguir := false
    else 
      l.next();
  end;
  l.insertcurrent(a);
end;

	
procedure encomiendasagrupadas.agregarencomienda(tipo:string;encomiendanueva:encomienda);
begin
if tipo='Despachadas' then
      insertarOrdenadoDespachadas(encomiendas[0], encomiendaNueva)
    else
      insertarOrdenadoRecepcionadas(encomiendas[1], encomiendaNueva);
  end;
  
   function encomiendasagrupadas.getlistaencomienda(tipo: string): lista;
   begin
   if tipo='Despachadas' then
      getlistaencomienda:=encomiendas[0]
    else
      getlistaencomienda:=encomiendas[1];
  end;
  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Implementación de nodoencomienda

constructor nodoencomienda.create(Clave: Comparable; Dato: TObject);
var 
unaencomienda:encomienda;
begin
  inherited create(Clave, Dato);
encomiendas:=encomiendasagrupadas.create();
unaencomienda:=Dato as encomienda;
encomiendas.agregarencomienda(unaencomienda.getTipo,unaencomienda);
end;


procedure nodoencomienda.agregar(unNodo: Nodo);
var
unaencomienda:encomienda;
begin
  if unNodo.getClave().equals(self.getClave()) then
  begin
    unaencomienda := unNodo.getDato() as encomienda;
    encomiendas.agregarencomienda(unaencomienda.getTipo,unaencomienda);
    end
  else
    inherited agregar(unNodo);  // Llamar al método heredado si las claves no coinciden
end;

function nodoencomienda.devolverElemento(): TObject; 
begin
devolverElemento:= encomiendas;
end;



function nodoencomienda.toString: ansistring;
var
  s: ansistring;
  tipo: string;
  l: lista;
  encomiendaActual: encomienda;
begin
  s := 'Punto de Retiro: ' + self.getClave().toString + LineEnding;

  // Recorrer ambas listas: Despachadas y Recepcionadas
  for tipo in ['Despachadas', 'Recepcionadas'] do
  begin
    s := s + 'Encomiendas ' + tipo + ':' + LineEnding;
    
    // Obtener la lista de encomiendas según el tipo
    l := encomiendas.getlistaencomienda(tipo);
    l.reset();
    
    // Recorrer y agregar cada encomienda a la cadena de salida
    while not l.eol() do
    begin
      encomiendaActual := l.current();
      s := s + encomiendaActual.toString + LineEnding;
      l.next();
    end;
    
    s := s + LineEnding;
  end;
  
  Result := s;
end;


procedure abbencomienda.agregar(Clave: Comparable; Dato: TObject);
var n: Nodo;
begin
n:= nodoencomienda.create(clave, dato);
self.agregarNodo(n);
end;

end.
