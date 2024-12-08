unit Ucadena;
{$mode objfpc}

interface
uses UABBgenerico;
type

	cadena = class (comparable)
		private
		valor : string;
		public
		constructor create(unValor: string); // constructor
		function getValor(): string; // getter
		function ctoString(): string; // devuelve el nombre como string
		function equals(otroComparable: Comparable): boolean;override;
		function lessThan(otroComparable: Comparable): boolean;override;
		function greaterThan(otroComparable: Comparable): boolean;override;
		function lessThanOrEquals(otroComparable: Comparable): boolean;override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;override;
		end;
		
implementation
	constructor cadena.create(unValor: string); // constructor
	begin
		valor := unValor;
		end;
	
	
	function cadena.getValor(): string; // getter
		begin
		getValor := valor;
		end;
		
	function cadena.ctoString(): string; // devuelve el nombre como string
		begin
		ctoString := valor;
		end;
		
	function cadena.equals(otroComparable: Comparable): boolean;
	begin
		equals := valor = (otroComparable as cadena).getValor();
		end;
		
		function cadena.lessThan(otroComparable: Comparable): boolean;
		begin
	lessThan:= valor < (otroComparable as cadena).getvalor();
	end;

		function cadena.greaterThan(otroComparable: Comparable): boolean;
		begin
		greaterThan:= valor > (otroComparable as cadena).getvalor();
		end;
		
		function cadena.lessThanOrEquals(otroComparable: Comparable): boolean;
		begin
		lessThanOrEquals:= valor <= (otroComparable as cadena).getvalor();
		end;
		
		function cadena.greaterThanOrEquals(otroComparable: Comparable): boolean;
		begin
		greaterThanOrEquals:= valor >= (otroComparable as cadena).getvalor();
		end;
end.
