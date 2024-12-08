program Ejercicio5;
{$mode objfpc}

uses SysUtils, UABBGenerico, UDateTime, URandomGenerator, GenericLinkedList, UEntero;

const CANTIDAD_LLAMADAS_A_SIMULAR = 1000;

type
	NumeroDeTelefono = class(Comparable)
		private
			cod_pais, cod_area, numero: integer;
		public
			constructor create(unCodPais, unCodArea, unNumero: integer);
			
			function getCodPais(): integer;
			function getCodArea(): integer;
			function getNumero(): integer;
			
			function toString: ansistring; override;
			function equals(otroComparable: Comparable): boolean;   override;
			function lessThan(otroComparable: Comparable): boolean;   override;
			function greaterThan(otroComparable: Comparable): boolean;    override;
			function lessThanOrEquals(otroComparable: Comparable): boolean;    override;
			function greaterThanOrEquals(otroComparable: Comparable): boolean;  override;
	end;
	
	Llamada = class
		private
			telefonoDestino: NumeroDeTelefono;
			duracion: integer;
			fecha: Date;
		public
			constructor create(unTelefonoDestino: NumeroDeTelefono; unaDuracion: integer; unaFecha: Date);
			
			function getMesDeLaLlamada(): integer;
			function getDiaDeLaLlamada(): integer;
			function getDuracion(): integer;
			function getFecha(): Date;
			function getNumero(): NumeroDeTelefono;			
			function toString: ansistring; override;
	end;
	
	ABBUsuarios = class(ABBGenerico)
		public
			procedure agregar(unaClave: Comparable; unDato: TObject); override;
	end;
	
	ListaDeLlamadas = specialize LinkedList<Llamada>;
	
	VectorDeLlamadas = array[1..12] of ListaDeLlamadas;
	
	LlamadasAgrupadas = class
		private
			llamadas: VectorDeLlamadas;
		public
		    constructor create();
		    
			procedure agregarLlamada(unMes: integer; unaLlamada: Llamada);
			
			function getLlamadas(unMes: integer): ListaDeLlamadas;
	end;
	
	NodoUsuario = class(Nodo)
		private
			llamadas: LlamadasAgrupadas;
		public
			constructor create(unaClave: Comparable; unDato: TObject);
			procedure agregar(n: Nodo); override;
			function devolverElemento(): TObject;  override;
			function toString(): ansistring; override;
	end;
	
////////////////////////////////////////////////////////////////////////

constructor NumeroDeTelefono.create(unCodPais, unCodArea, unNumero: integer);
begin
cod_pais:= unCodPais;
cod_area:= unCodArea;
numero:= unNumero;
end;

function NumeroDeTelefono.getCodPais(): integer;
begin
getCodPais:= cod_pais;
end;
			
function NumeroDeTelefono.getCodArea(): integer;
begin
getCodArea:= cod_area;
end;

function NumeroDeTelefono.getNumero(): integer;
begin
getNumero:= numero;
end;

function NumeroDeTelefono.toString: ansistring; 
begin
toString:= '+00' + IntToStr(cod_pais) + ' (' + IntToStr(cod_area) + ')' + IntToStr(numero);
end;

function NumeroDeTelefono.equals(otroComparable: Comparable): boolean; 
var otroNumeroDeTelefono: NumeroDeTelefono;
begin
otroNumeroDeTelefono:= otroComparable as NumeroDeTelefono;
equals:= (cod_pais = otroNumeroDeTelefono.getCodPais()) and
		 (cod_area = otroNumeroDeTelefono.getCodArea()) and
		 (numero = otroNumeroDeTelefono.getnumero()) ;
end;

function NumeroDeTelefono.lessThan(otroComparable: Comparable): boolean;
var otroNumeroDeTelefono: NumeroDeTelefono;
begin
otroNumeroDeTelefono:= otroComparable as NumeroDeTelefono;
if (cod_pais < otroNumeroDeTelefono.getCodPais()) then
	lessThan:= true
else
if (cod_pais = otroNumeroDeTelefono.getCodPais()) and 
   (cod_area < otroNumeroDeTelefono.getCodArea()) then
   lessThan:= true
else
if (cod_pais = otroNumeroDeTelefono.getCodPais()) and 
   (cod_area = otroNumeroDeTelefono.getCodArea()) and
   (numero < otroNumeroDeTelefono.getnumero()) then
	lessThan:= true
else
	lessThan:= false;
end;

function NumeroDeTelefono.greaterThan(otroComparable: Comparable): boolean;  
var otroNumeroDeTelefono: NumeroDeTelefono;
begin
otroNumeroDeTelefono:= otroComparable as NumeroDeTelefono;
if (cod_pais > otroNumeroDeTelefono.getCodPais()) then
	greaterThan:= true
else
if (cod_pais = otroNumeroDeTelefono.getCodPais()) and 
   (cod_area > otroNumeroDeTelefono.getCodArea()) then
   greaterThan:= true
else
if (cod_pais = otroNumeroDeTelefono.getCodPais()) and 
   (cod_area = otroNumeroDeTelefono.getCodArea()) and
   (numero > otroNumeroDeTelefono.getnumero()) then
	greaterThan:= true
else
	greaterThan:= false;
end;

function NumeroDeTelefono.lessThanOrEquals(otroComparable: Comparable): boolean;    
begin
lessThanOrEquals:= self.lessThan(otroComparable) or self.equals(otroComparable);
end;

function NumeroDeTelefono.greaterThanOrEquals(otroComparable: Comparable): boolean; 
begin
greaterThanOrEquals:= self.greaterThan(otroComparable) or self.equals(otroComparable);
end;
	
////////////////////////////////////////////////////////////////////////

constructor Llamada.create(unTelefonoDestino: NumeroDeTelefono; unaDuracion: integer; unaFecha: Date);
begin
telefonoDestino:= unTelefonoDestino;
duracion:= unaDuracion;
fecha:= unaFecha;
end;

function Llamada.getMesDeLaLlamada(): integer;
begin
getMesDeLaLlamada:= fecha.getMonth();
end;

function Llamada.getDiaDeLaLlamada(): integer;
begin
getDiaDeLaLlamada:= fecha.getDay();
end;

function Llamada.getDuracion(): integer;
begin
getDuracion:= duracion;
end;

function Llamada.getFecha(): Date;
begin
getFecha:= fecha;
end;

function Llamada.getNumero(): NumeroDeTelefono;
begin
getNumero:= telefonoDestino;
end;

function Llamada.toString: ansistring; 
begin
toString:= 'Se hizo una llamada el ' + self.getFecha().toString + ' al numero ' + self.getNumero().toString() + ' y duro ' + IntToStr(self.getDuracion()) + ' minutos.'
end;

////////////////////////////////////////////////////////////////////////

procedure ABBUsuarios.agregar(unaClave: Comparable; unDato: TObject);
var n: Nodo;
begin
n:= NodoUsuario.create(unaClave, unDato);
self.agregarNodo(n);
end;

////////////////////////////////////////////////////////////////////////

constructor LlamadasAgrupadas.create();
var x: integer;
begin
for x:= 1 to 12 do
	llamadas[x]:= ListaDeLlamadas.create();
end;
	
procedure LlamadasAgrupadas.agregarLlamada(unMes: integer; unaLlamada: Llamada);
begin
llamadas[unMes].add(unaLlamada);
end;

function LlamadasAgrupadas.getLlamadas(unMes: integer): ListaDeLlamadas;
begin
getLlamadas:= llamadas[unMes];
end;

////////////////////////////////////////////////////////////////////////
	
constructor NodoUsuario.create(unaClave: Comparable; unDato: TObject);
var ll: Llamada;
begin
inherited create(unaClave, unDato);
llamadas:= LlamadasAgrupadas.create();
ll:= unDato as Llamada;
llamadas.agregarLlamada(ll.getMesDeLaLlamada(), ll);	
end;

procedure NodoUsuario.agregar(n: Nodo);
var ll: Llamada;
begin
if n.getClave().equals(self.getClave())  then
	begin
	ll:= n.getDato() as Llamada;
	llamadas.agregarLlamada(ll.getMesDeLaLlamada(), ll);	
	end
else
	inherited agregar(n);
end;

function NodoUsuario.devolverElemento(): TObject; 
begin
devolverElemento:= llamadas;
end;

function NodoUsuario.toString(): ansistring; 
//Función toString para el inciso 2, imprimir el árbol completo
var s: string;
	m: integer;
	l: ListaDeLlamadas;
begin
s:= '';
for m:= 1 to 12 do
	begin
	s:= s + 'Mes ' + IntToStr(m);
	l:= llamadas.getLlamadas(m);
	l.reset();
	while not l.eol() do
		begin
		s:= s + l.current().toString();
		l.next();
		end;
	s:= s + '; ';
	end;
toString:= s;
end;

{function NodoUsuario.toString(): ansistring; 
//Función toString para el inciso 3, imprimir el árbol acotado
var s: string;
	m, c: integer;
	l: ListaDeLlamadas;
begin
s:= '';
for m:= 1 to 12 do
	begin
	s:= s + 'Mes ' + IntToStr(m);
	l:= llamadas.getLlamadas(m);
	l.reset();
	c:= 0;
	while not l.eol() do
		begin
		c:= c + 1;
		l.next();
		end;
	s:= s + ' ==> ' + IntToStr(c) + '; ';
	end;
toString:= s;
end;}

////////////////////////////////////////////////////////////////////////	
	
function crearUsuario(rg: RandomGenerator): NumeroDeTelefono;
begin
crearUsuario:= NumeroDeTelefono.create(rg.getInteger(5,10), rg.getInteger(20,30), rg.getInteger(100,200));
end;

function crearLlamada(rg: RandomGenerator; dateMin, dateMax: Date): Llamada;
begin
crearLlamada:= Llamada.create(crearUsuario(rg), rg.getInteger(1,15), rg.getDate(dateMin, dateMax));
end;

procedure simularLlamadas(abb: ABBUsuarios; var ultimoUsuario: NumeroDeTelefono);
var usuario: NumeroDeTelefono;
	ll: Llamada;
	rg: RandomGenerator;
	dateMin, dateMax: Date;
	x: integer;
begin
rg:= RandomGenerator.create();
dateMin:= Date.create(1, 1, 2010);
dateMax:= Date.create(31, 12, 2023);

for x:= 1 to CANTIDAD_LLAMADAS_A_SIMULAR do
	begin
	usuario:= crearUsuario(rg);
	ll:= crearLlamada(rg, dateMin, dateMax);
	abb.agregar(usuario, ll);
	end;
	
// Devuelvo el último usuario creado sólo para usarlo en la búsqueda del inciso 5.
ultimoUsuario:= usuario;
end;

procedure imprimirTodasLasLlamadas(abb: ABBUsuarios);
begin
writeln('Todas las llamadas');
abb.imprimirEnOrden();
writeln('***************************************************************');
writeln();writeln();writeln();
end;

procedure imprimirLlamadasPorMes(abb: ABBUsuarios; tel1, tel2: NumeroDeTelefono);
begin
writeln('Cantidad de llamadas discriminadas por mes entre los numeros ' + tel1.toString() + ' ' + tel2.toString());
abb.imprimirAcotado(tel1, tel2);
writeln('***************************************************************');
writeln();writeln();writeln();
end;

procedure llamadasDelUsuario(abbUs: ABBUsuarios; unUsuario: NumeroDeTelefono; abbLl: ABBGenerico);
var ok: boolean;
	o: TObject;
	rll: LlamadasAgrupadas;
	x: integer;
	l: ListaDeLlamadas;
	ll: Llamada;
begin
abbUs.buscarElemento(unUsuario, o, ok);
if ok then
	begin
	rll:= o as LlamadasAgrupadas;
	for x:= 1 to 12 do
		begin
		l:= rll.getLlamadas(x);
		l.reset();
		while not l.eol() do
			begin
			ll:= l.current();
			if ll.getDuracion() > 4 then
				abbLl.agregar(Entero.create(ll.getDuracion()), ll);
			l.next();
			end;
		end;
	end;
end;

procedure mayoresA10Minutos(abb: ABBGenerico);
begin
writeln('Llamadas de mas de 10 minutos');
abb.imprimirAcotado(Entero.create(10), Entero.create(1000));
writeln('***************************************************************');
writeln();writeln();writeln();
end;

procedure imprimirLlamada(unObject: TObject);
var ll: Llamada;
begin
ll:= unObject as Llamada;
if ll.getDiaDeLaLlamada() <= 15 then
	writeln(ll.toString());
end;

procedure primeros15Dias(abb: ABBGenerico);
begin
writeln('Llamadas hechas en los primeros 15 dias de cada mes');
abb.procesar(Entero.create(0), Entero.create(1000), @imprimirLlamada);
writeln('***************************************************************');
writeln();writeln();writeln();
end;


////////////////////////////////////////////////////////////////////////

var abbUsers: ABBUsuarios;
	abbLlamadas: ABBGenerico;
	unUsuario, tel1, tel2: NumeroDeTelefono;
begin
abbUsers:= ABBUsuarios.create();

simularLlamadas(abbUsers, unUsuario);

imprimirTodasLasLlamadas(abbUsers);

tel1:= NumeroDeTelefono.create(3, 23, 130);
tel2:= NumeroDeTelefono.create(7, 21, 130);
imprimirLlamadasPorMes(abbUsers, tel1, tel2);

abbLlamadas:= ABBGenerico.create();
llamadasDelUsuario(abbUsers, unUsuario, abbLlamadas);

mayoresA10Minutos(abbLlamadas);

primeros15Dias(abbLlamadas);
end.
