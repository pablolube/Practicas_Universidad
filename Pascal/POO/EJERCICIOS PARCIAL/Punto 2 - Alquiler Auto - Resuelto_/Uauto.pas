Unit Uauto;
{$mode objfpc}
INTERFACE 
uses sysutils, uabbgenerico, Udatetime;

type
  alquiler = class
  private
    patente: string;
    fecha: date;
    marca: string;
    modelo: string;
    diasalquiler: integer;
    preciodia: real;
  
  public
    constructor create(unapatente: string; unafecha: date; unamarca: string; unmodelo: string; undiasalquiler: integer; unpreciodia: real);
    function getpatente(): string;
    function getfecha(): date;
    function getmarca(): string;
    function getmodelo(): string;
    function getdiasalquiler(): integer;
    function getpreciodia(): real;
    function dia(): integer;
    function mes(): integer;
    function anio(): integer;
    function toString(): ansistring; override;
  end;

//--------------------------------- NODO AUTO---------------------------------------------------------------------------------

  nodoauto = class(Nodo)
  public
    constructor Create(unaClave: Comparable; unDato: TObject);
    procedure procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:string);

  end;

//--------------------------------- ARBOL  ---------------------------------------------------------------------------------

  // Árbol binario específico para autos
  Abbauto = class(ABBGenerico)
  public
	constructor Create();
	procedure agregar(unaClave: Comparable; unDato: TObject); override;
	procedure procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:string);
end;
//------------------------------------------------------------------------------------------------------------------------

IMPLEMENTATION

constructor alquiler.create(unapatente: string; unafecha: date; unamarca: string; unmodelo: string; undiasalquiler: integer; unpreciodia: real);
begin
  patente := unapatente;
  fecha := unafecha;
  marca := unamarca;
  modelo := unmodelo;
  diasalquiler := undiasalquiler;
  preciodia := unpreciodia;
end;

function alquiler.getpatente(): string;
begin
  Result := patente;
end;

function alquiler.getfecha(): date;
begin
  Result := fecha;
end;

function alquiler.getmarca(): string;
begin
  Result := marca;
end;

function alquiler.getmodelo(): string;
begin
  Result := modelo;
end;

function alquiler.getdiasalquiler(): integer;
begin
  Result := diasalquiler;
end;

function alquiler.getpreciodia(): real;
begin
  Result := preciodia;
end;

function alquiler.dia(): integer;
begin
  Result := fecha.getday();
end;

function alquiler.mes(): integer;
begin
  Result := fecha.getmonth();
end;

function alquiler.anio(): integer;
begin
  Result := fecha.getyear();
end;

function alquiler.toString(): ansistring;
begin
  Result := 'Patente: ' + patente + LineEnding +
            'Fecha: ' + fecha.toString() + LineEnding +
            'Marca: ' + marca + LineEnding +
            'Modelo: ' + modelo + LineEnding +
            'Días de alquiler: ' + IntToStr(diasalquiler) + LineEnding +
            'Precio por día: $' + format('%10.2f', [preciodia]) + LineEnding +
            '------------------------------------------------------------' + LineEnding;
end;



//---------------------------- NODO    METODOS --------------------------------------------------------------

constructor nodoauto.Create(unaClave: Comparable; unDato: TObject);
begin
  inherited Create(unaClave, unDato);
END;

//---------------------------- ABB    METODOS --------------------------------------------------------------

constructor Abbauto.Create();
begin
  inherited Create();
end;

// Agrega un nodo específico de auto al ABB
procedure Abbauto.agregar(unaClave: Comparable; unDato: TObject);
var
  n: nodoauto;
begin
  n := nodoauto.Create(unaClave, unDato);
  self.agregarNodo(n);
end;
//-------------------------------------------------------------------------------------------------------------------------------------
//              							ADICIONALES
//-------------------------------------------------------------------------------------------------------------------------------------
	procedure nodoauto.procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:string); 
	begin

	if nodoauto(self).getClave().greaterThanOrEquals(min) and nodoauto(self).getClave().lessThanOrEquals(max) then
		begin
		if self.tenesHijoIzq() then
			nodoauto(getHijoIzq()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		
		if (unaPatente = Alquiler(self.getDato()).getPatente())	then
			self.procesar(queHacer);
		
		if self.tenesHijoDer() then
			nodoauto(getHijoDer()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		end
	else
	if nodoauto(self).getClave().lessThan(min) then
		begin
		if self.tenesHijoDer() then
			nodoauto(getHijoDer()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		end
	else
		begin
		if self.tenesHijoIzq() then
			 nodoauto(getHijoIzq()).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
		end;
	end;	

procedure Abbauto.procesarSoloUnaPatente(min, max: Comparable; queHacer: Procedimiento; unaPatente:string); 
	begin
		if not self.estasVacio then
			nodoauto(raiz).procesarSoloUnaPatente(min, max, queHacer, unaPatente);
	end;
end.


