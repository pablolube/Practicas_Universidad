{
2. Dado el siguiente programa, indicar cuál es el error.
program alcance4;

function cuatro: integer; // Falta () en la declaracion formal de la funcion

begin
 cuatro:= 4; 
var a: integer;
begin
 cuatro; //Falta () y dar la variable  en el cual se va a guardar lo que devuelve la funcion
 writeln(a);
end.

}

// Codigo bien escrito


program alcance4;

function cuatro(): integer; // Falta () en la declaracion formal de la funcion
begin
 cuatro:= 4;
end;
var a: integer;

begin
a:= cuatro(); //Falta () y dar la variable  en el cual se va a guardar lo que devuelve la funcion
 writeln(a);
end.

{4. a. Realice un módulo que reciba dos números enteros y retorne la suma de los mismos.
 b. Implemente un programa que invoque al módulo del inciso a, e informe lo pedido}

//4) i) Usando variables globales y procedimientos
program entero;
var
a,b,suma : integer;
    procedure sumar();
    begin
    suma:=a+b;
    end;
begin
read(a);
read(b);
sumar();
writeln('La suma es igual ', suma);
end.

//4) ii) Usando variables globales y funciones
program entero;
var
a,b,suma : integer;
    function sumar() : integer;
    begin
    sumar:=a+b;
    end;
begin
read(a);
read(b);
suma:=sumar();
writeln('La suma es igual ', suma);
end.

//4) iii) Usando parametros por referencia y procedimientos
program entero;
    procedure sumar(a,b : integer; var suma: integer);
    begin
    suma:=a+b;
    end;
var
suma : integer;
num1,num2 : integer;
begin
read(num1);
read(num2);
sumar(num1,num2,suma);
writeln('La suma total es ', suma);
end.

//4) iV) Usando parametros de entrada y funciones
program entero;
    function sumar(a,b:integer) : integer;
    begin
    sumar:=a+b;
    end;
begin
var
a,b,suma : integer;
readln(a);
readln(b);
suma:=sumar;
writeln('La suma es igual ', suma);
end.

{5. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo y retorne cuál fue
el número par más alto.
 b. Implemente un programa que invoque al módulo del inciso a, e informe lo pedido.
}

program maximo;
procedure maximopar(num:integer;var max : integer);
begin
max:=0;
    while (num>=0) do
    begin    
        if(num mod 2=0) and (num>max) then
        begin
        max:= num;
        end;
    writeln('Escribe un numero');
    read(num);
    end;

//b) b. Implemente un programa que invoque al módulo del inciso a, e informe lo pedido.

program maximo;
procedure maximopar(num:integer;var max : integer);
begin
max:=0;
    while (num>0) do
    begin    
        if(num mod 2=0) and (num>max) then
        begin
        max:= num;
        end;
    writeln('Escribe un numero');
    read(num);
    end;
end;
var
num,resultado : integer;
begin
writeln('Escribe un numero');
read(num);
maximopar(num,resultado);
writeln('El maximonumero es ', resultado)
end.

{6. a. Escriba un procedimiento que lea la altura de una cantidad de personas y devuelva el promedio de éstas. La
cantidad de personas se recibe como parámetro.
b. Escriba un programa que procese la edad de 25 personas utilizando el módulo desarrollado en a) e informe el
resultado.
}



//7) TEORICO 


7. Dado el siguiente programa:
program anidamientos;
procedure leer; 
    var
    letra: char;
    function analizarLetra: boolean     
    // La declaracion de la funcion se realiza aparte no dentro de un procedimiento
    // Falta parentesis - Y valores de entrada
    // Falta un else donde incluya elementos que no cumpla con que sea una letra
    // El procedure tiene que llamar al procedimiento.
     begin
         if (letra >= ‘a’) and (letra <= ‘z’) then
         analizarLetra := true;
         else
         if (letra >= ‘A’) and (letra <= ‘Z’) then
         analizarletra := false;
        end; {fin de la funcion analizarLetra}
 begin
 readln(letra);
 if (analizarLetra) then
 writeln(‘Se trata de una minúscula’)
 else
 writeln(‘Se trata de una mayúscula’);
 end; {fin del procedure leer
var
 ok: boolean;
begin {programa principal
leer;
ok := analizarLetra;
if ok then
 writeln(‘Gracias, vuelva prontosss’);
end.
a. La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto puede
traer problemas en el código del programa principal.
i) ¿Qué clase de problema encuentra?
ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
b. La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?
ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
iii) ¿Cómo se puede resolver este problema?
}


{resolucion practica}

program anidamientos;
   function analizarLetra(letra:char) : boolean; 
         begin
             if (letra >= 'a') and (letra <= 'z') then
             analizarLetra := true
             else
             if (letra >= 'A') and (letra <= 'Z') then
             analizarLetra := false;
        end; {fin de la funcion analizarLetra}

// Procedimiento
procedure leer(var analisisletras:boolean);
var
letra: char;

begin
readln(letra);
analisisletras:=analizarLetra(letra);
                if (analisisletras) then
                writeln('Se trata de una minúscula')    
                 else
 writeln('Se trata de una mayúscula');
 end; {fin del procedure leer}


// EMPIEZA EL PROGRAMA
var
 ok: boolean;
begin {programa principal}
  leer(ok);

 if (ok) then
                writeln('Gracias Vuelva prontosss')    
end.

{9. Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste:}

program ejercicio12;
2. {suma los números entre a y b, y retorna el resultado en c}
3. procedure sumar(a, b, c : integer) 
// Falta ; al final // Falta Var en la declaracion del parametro c para que el 
//procedure registre en la mismo espacio que la variable del programa
4. var
5. suma: integer;
// falta declarar variables i y suma
6. begin
7.
8. for i := a to b do
9. suma := suma + i;
10. c := c + suma;
11. end;
12. var
13. result: integer;
// falta declarar a,b,result,ok
14. begin
15. result := 0;
16. readln(a);
17. readln(b);
18. sumar(a, b, 0);
// se debe usar result para depositar el parametro no 0
19. write(‘La suma total es ‘,result);
20. {averigua si el resultado final estuvo entre 10 y 30}
21. ok := (result >= 10) or (result <= 30);
// se debe modificar el or por el and, sino estaria siendo true cuando simplemente
//se cumpla con una del las 2 condiciones lo que no seria correcto
22. if (not ok) then
23. write (‘La suma no quedó entre 10 y 30’);
24. end.


// codigo corregido
program ejercicio12;

procedure sumar(a, b:integer;var c: integer);
var
    suma, i: integer; 
begin
    suma := 0;
    for i := a to b do
        suma := suma + i;
    c := c + suma;
end;

var
    result, a, b: integer;
    ok: boolean;
begin
    result := 0;
    readln(a);
    readln(b);
    sumar(a, b, result);
    writeln('La suma total es ', result);
    ok := (result >= 10) and (result <= 30);
    if not ok then
        writeln('La suma no quedó entre 10 y 30');
end.

{10. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada producto
debe leer el precio y código. Informar:
• Código de los dos productos más baratos.
• Precio promedio.}
program calculapromedio;
    procedure calculaminimo(var codmin1,codmin2 : integer;var prom :real);
    var
    cod,contador :integer;
    min1,min2,suma,precio : real; 
    begin
    // incializo variables
    min1:=9999;
    min2:=9999;
    codmin1:=0;
    codmin2:=0;
    suma:=0;
    prom:=0;
    contador:=0;
    writeln('Ingrese un codigo de un producto');
    read(cod);
    
        while(contador<3) do
        begin
        writeln('Ingrese su precio');
        read(precio);
        
        contador:=contador + 1;
        
            if(precio<min1) then
            begin
                min2:=min1;
                codmin2:=codmin1;
                min1:=precio;
                codmin1:=cod;
            end
            
            else if(precio<min2) then
            begin
                   
                    min2:=precio;
                    codmin2:=cod;
            end;
        suma:=suma+precio;
        writeln('Ingrese un codigo de un producto');
        read(cod);
    
        end;
    prom:=suma/contador;
    end;
var
cod1,cod2 : integer;
promedio: real;
begin
cod1:=0;
cod2:=0;
promedio:=0;
calculaminimo(cod1,cod2,promedio);
writeln('Los productos con precio minimos tienen los codigos ',cod1,' y ',cod2 );
writeln('El precio promedio es ',promedio:0:2);
end.
{ 11. El factorial de un número n se expresa como n! y se define como el producto de todos los números desde 1 hasta
 n. Por ejemplo, el factorial de 6 o 6! equivale a 6*5! es igual a 1*2*3*4*5*6 que equivale a 720. Escriba una
 función que reciba un número n y retorne su factorial.}

program calcula_factorial;
    function factorial(numero : integer ) : integer;
    var
    factorialrdo,i : integer; 
    begin
    factorialrdo:=1;
        for i:=1 to numero do
        begin
        factorialrdo:=factorialrdo*i;
        end;
    factorial:=factorialrdo;
    end;
var
num,resultado : integer;
begin
writeln('Ingrese un numero');
read(num);
resultado:=factorial(num);
writeln('El factorial de ',num,' es ',resultado);
end.
    
{12. Escriba un módulo que reciba 2 números enteros i y n, y calcule la potencia enésima de i (in
).}


program calcula_potencia;
    function potencia(numero : real;exponente :integer) : real;
    var
    resultado : real; 
    begin
    resultado:=numero;
        for i:=1 to exponente do
        begin
        resultado:=resultado*numero;
        end;
    potencia:=resultado;
    end;
var
num :real;
exp;rdo : integer;
begin
writeln('Ingrese un numero');
read(num);
writeln('Ingrese un exponente');
read(exp);
rdo:=potencia(num,exp);
writeln('La potencia de ',num,'elevado a ',exp,' es ',rdo);
end.


{12- Escriba un modulo que reciba 2 numeros enteros i y n y calcule la potencia enesima ed i (i a la n)}
program calcula_potencia;

function potencia(numero: real; exponente: integer): real;
var
    resultado: real;
    i: integer;
begin
    resultado := 1; // Inicializamos el resultado en 1
    if exponente >= 0 then // Solo calculamos potencias para exponentes no negativos
    begin
        for i := 1 to exponente do
        begin
            resultado := resultado * numero;
        end;
    end
    else // Si el exponente es negativo, calculamos la potencia inversa
    begin
        for i := 1 to -exponente do
        begin
            resultado := resultado / numero;
        end;
    end;
    potencia := resultado;
end;

var
    num, rdo: real;
    exp: integer;
begin
    writeln('Ingrese un numero:');
    readln(num);
    writeln('Ingrese un exponente:');
    readln(exp);
    rdo := potencia(num, exp);
    writeln('La potencia de ', num:0:2, ' elevado a ', exp, ' es ', rdo:0:2);
end.










