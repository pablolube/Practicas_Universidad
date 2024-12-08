Unit Ucliente;
{$mode objfpc}

INTERFACE
uses Ucajadeahorro, Ucarrito, Uticket, Uproducto, UrandomGenerator,GenericLinkedlist;

type
  lista_caja=specialize linkedlist <cajadeahorro>;

  cliente = class

  Private
    nombre: string;
    billeteras:lista_caja;
    dni:string;


  PUBLIC
    constructor create(unNombre: string;undni:string);
    function getNombre(): string;
    procedure elegirProductos(unCarrito: carrito);
    procedure cobrar(t: Ticket; var ok: boolean);
	procedure agregarCaja(unaCaja: CajaDeAhorro);
	 function getDNI(): string;

  end;

IMPLEMENTATION

constructor cliente.create(unNombre: string;undni:string);
begin

  nombre := unNombre;
  billeteras:= lista_caja.create();
  dni:=undni;
 
end;


function cliente.getNombre(): string;
begin
  getnombre := nombre;
end;

function cliente.getDNI(): string;
begin
  getDNI := dni;
end;



procedure cliente.elegirProductos(unCarrito: Carrito);
var
  rg: RandomGenerator;
  p: producto;
  cant:integer;
  i:integer;
  vproducto: array[1..10] of string = ('Espinaca', 'Rucula', 'Papa', 'Lechuga', 'Tomate', 'Remolacha', 'Limones', 'Manzana', 'Banana', 'Cebolla');

begin
  rg:=randomgenerator.create();
  
  
    for i := 1 to 10 do
  begin
    rg.addlabel(vproducto[i]);
  end;
   
  
  
  cant:= rg.getInteger(3, 6);
  for i:=1 to cant do
  begin
  p := producto.create(rg.getlabel(), rg.getReal(1.1, 10.99));
  uncarrito.agregarProducto(p);
  end;
end;

procedure cliente.agregarCaja(unaCaja: CajaDeAhorro);
begin

billeteras.add(unacaja);

end;

procedure cliente.cobrar(t: Ticket; var ok: boolean);
begin
billeteras.reset();
while not billeteras.eol and ok=False do
begin
billeteras.current.extraer(t.gettotalApagar(),ok);
end;
end;
end.
