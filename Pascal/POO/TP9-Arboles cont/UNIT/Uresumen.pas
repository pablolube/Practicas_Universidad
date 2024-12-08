UNIT Uresumen;
{$mode objfpc}
INTERFACE
uses Uticket;
type
resumen = class
	private
	cantidadventas:integer;
	montodia:real;
	ticketmaximo:ticket;
	public
	CONSTRUCTOR create();
end;
implementation

CONSTRUCTOR  resumen.create();
begin
cantidadventas:=0;
montodia:=0;
ticketmaximo:=ticket.create();
end.
