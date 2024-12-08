unit Utransferencia;
{$mode objfpc}
interface

uses Ucajadeahorro;

type
transferencia=class
private
cajaDestino:CajaDeAhorro;
public
procedure create(unDestino: CajaDeAhorro);
procedure transferir(unOrigen: CajaDeAhorro; unMonto: real; var ok: boolean);
end;

IMPLEMENTATION
procedure transferencia.create(unDestino: CajaDeAhorro);
begin
cajadestino:=unDestino;
end;


procedure transferencia.transferir(unorigen:cajadeahorro;unmonto:real;var ok:boolean);
begin
	if ok=True then 
		begin
		unorigen.extraer(unMonto,ok);
		cajadestino.depositar(unmonto);
		end
		else
		begin
		writeln('La operacion no tuvo exito fondos insuficientes');
	end;
end;
end.
