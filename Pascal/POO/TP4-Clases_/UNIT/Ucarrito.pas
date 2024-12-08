UNIT Ucarrito
{$mode objfpc};
	INTERFACE
	USES Uproducto,genericlinkedlist; // me traigo los objetos del modulo Uproduct y Genericlinkedlist
		TYPE 
				lista=specialize linkedlist <producto>; 
				carrito=class
				PRIVATE
				cantprod:integer;
				producto:lista;
   			PUBLIC
				CONSTRUCTOR create();
				PROCEDURE agregarProducto(unProducto:Producto); // le envio como parametro la variable del otro modulo
				FUNCTION sacarProducto():producto;
				FUNCTION gettotalprod():integer;
				end;

		IMPLEMENTATION
				CONSTRUCTOR carrito.create();
				begin
				producto:=lista.create(); // creo la lista
				cantprod:=0;
				end;
				
				PROCEDURE carrito.agregarProducto(unProducto:Producto); 
				begin
				producto.add(unproducto); // agrego unproducto del tipo producto (el otro objeto)
				cantprod:=cantprod+1;
				end;
				
				FUNCTION carrito.sacarProducto():Producto;
				begin
				producto.reset();
				sacarProducto:=producto.current();
				producto.removecurrent(); // aca uso objeto lista
				cantprod:=cantprod-1;
				end;
				
				FUNCTION carrito.gettotalprod():integer;
				begin
				gettotalprod:=cantprod;
				end;
		end.

