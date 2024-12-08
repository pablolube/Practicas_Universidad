Unit Ucliente;
{$mode objfpc}

INTERFACE
uses Ucajadeahorro, Ucarrito, Uticket, Uproducto, UrandomGenerator;

type
  cliente = class
  Private
    nombre: string;
    dni:string;
    billetera: CajaDeAhorro;

  PUBLIC
constructor create(unNombre: string; undni:string;unaBilletera: CajaDeAhorro);
    function getNombre(): string;
    procedure elegirProductos(unCarrito: carrito);
    procedure cobrar(t: Ticket; var ok: boolean);
  	function toString(): ansistring; override; // 
	 function getDNI(): string;		
	 function getsaldo():real;

	
  end;

IMPLEMENTATION


constructor cliente.create(unNombre: string; undni:string;unaBilletera: CajaDeAhorro);
begin
  nombre := unNombre;
  billetera := unaBilletera;
  dni:=undni;
end;


function cliente.getNombre(): string;
begin
  getnombre := nombre;
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

procedure cliente.cobrar(t: Ticket; var ok: boolean);
begin
  billetera.extraer(t.getTotalApagar(), ok);
end;
	 function cliente.getDNI(): string;
	 begin
	 getDNI:=dni;
	end;
	
function cliente.toString(): ansistring; // devuelve el nombre como string
var
saldo:string;
		begin
		Str(billetera.consultarSaldo(),saldo);
		toString :=   dni+ ' ' + nombre + ' ' + saldo; 
		end;
		
	function cliente.getsaldo():real;
	begin
	 getsaldo:=billetera.consultarSaldo();
	end;
	
end.
