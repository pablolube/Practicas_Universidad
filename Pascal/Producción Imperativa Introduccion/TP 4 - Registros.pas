{1) a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e
informe la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0.
Nota: utilizar el módulo leer.}

program Registros;

type
  alumno = record
    codigo : integer;
    nombre : string;
    promedio : real;
  end;

procedure leer(var alu: alumno);
begin
  writeln('Ingrese el código del alumno:');
  readln(alu.codigo);
  if (alu.codigo <> 0) then 
  begin
    writeln('Ingrese el nombre del alumno:');
    readln(alu.nombre);
    writeln('Ingrese el promedio del alumno:');
    readln(alu.promedio);
  end;
end;

var
  a: alumno;
  cantidadAlumnos: integer;

begin
  cantidadAlumnos := 0;
  leer(a);
  
  while (a.codigo <> 0) do 
  begin
    cantidadAlumnos := cantidadAlumnos + 1;
    leer(a);
  end;

  writeln('La cantidad de alumnos leídos es: ', cantidadAlumnos);
end.

{b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}

program Registros;

type
  alumno = record
    codigo : integer;
    nombre : string;
    promedio : real;
  end;

procedure leer(var alu: alumno);
begin
  writeln('Ingrese el código del alumno:');
  readln(alu.codigo);
  if (alu.codigo <> 0) then 
  begin
    writeln('Ingrese el nombre del alumno:');
    readln(alu.nombre);
    writeln('Ingrese el promedio del alumno:');
    readln(alu.promedio);
  end;
end;

var
  a: alumno;
  cantidadAlumnos: integer;
  mayor:real;
  nombrealu : string;
begin
  cantidadAlumnos := 0;
  leer(a);
  mayor:=-1;
  while (a.codigo <> 0) do 
  begin
    cantidadAlumnos := cantidadAlumnos + 1;
        if(a.promedio>mayor) then 
        begin
        mayor:=a.promedio;
        nombrealu:=a.nombre;
        end;
    leer(a);
  end;
  writeln('La cantidad de alumnos leídos es: ', cantidadAlumnos);
  writeln('El alumno con mayor promedio es: ', nombrealu);
  writeln('Con un promedio total de ', mayor);
end.

{2. Realizar un programa que lea desde el teclado el ancho, alto y profundidad de un prisma rectangular (cuerpo
geométrico de 6 caras rectangulares, como una caja) e informe su volumen y área de la superficie formada por
sus caras. Elija una estructura de datos adecuada y modularice la solución.}
progam calculoprisma;
type prisma=record
ancho:integer;
alto:integer;
profun:integer;
end;


{3. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2023. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el
definido en el inciso a).
c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2023. La lectura finaliza
al ingresar el año 2024, e informe la cantidad de casamientos realizados durante los meses de verano
(enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de cada mes. Nota:
utilizar el módulo realizado en b) para la lectura de fecha}

//a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
program registricivil;
type fecha=record
dia:integer;
mes:integer;
anio:integer;
end;

// b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el

procedure escribefecha(var f:fecha);
begin
writeln('Ingresa dia');
readln(f.dia);
writeln('Ingresa mes');
readln(f.mes);
writeln('Ingresa anio');
readln(f.anio);
end;

{c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2023. La lectura finaliza
al ingresar el año 2024, e informe la cantidad de casamientos realizados durante los meses de verano
(enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de cada mes. Nota:
utilizar el módulo realizado en b) para la lectura de fecha}

//Function esverano()
function esverano(f:fecha):boolean;
begin
esverano:=(f.mes=1) or (f.mes=2) or (f.mes=3);
end;

//Function mes()
procedure primermes(f:fecha;var total1ermes:integer);
begin
    if (f.dia<=10) then
    begin
    total1ermes:=total1ermes+1;
    end;
end;

// Programa
var
f : fecha;
total1ermes:integer;
casverano:integer;

begin
casverano:=0;
total1ermes:=0;

escribefecha(f);
while(f.anio<2024) do 
begin
    if (f.anio=2023) and esverano(f)then
    begin
    casverano:= casverano+1
    end;
    if (f.anio=2023) then
    begin
    primermes(f,total1ermes);
    end;
    escribefecha(f);
end;
writeln('El total de casamientos en verano ',casverano);
writeln('El total de casamientos primer mes ',total1ermes);
end.


{4)4. El Ministerio de Educación desea realizar un relevamiento de las 
2400 escuelas primarias de la provincia de Bs.As,

con el objetivo de evaluar si se cumple la 
proporción de alumnos por docente calculada por la UNESCO 
parael año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de:
CUE (código único de establecimiento), 
nombre del establecimiento,
cantidad de docentes, 
cantidad de alumnos, 
localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos (mínimo).
El programa debe utilizar:
a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la
cantidad de alumnos y la cantidad de docentes).}


program analisis;

//relacion (1 docente cada 23,435 alumnos)
const
unesco=(1/2435);

type escuela=record
CUE,cantdocentes,cantalumnos : integer; 
nombre,localidad : string;
end;
//a. Un módulo para la lectura de la información de la escuela.
//modulo de lectura
procedure leeresc (var e :escuela);
begin
writeln('Ingrese');
writeln('Escuela numero (CUE) : ');
readln(e.CUE);
writeln('Nombre escuela: ');
readln(e.nombre);
writeln('localidad : ');
readln(e.localidad);
writeln('Cantidad de alumnos : ');
readln(e.cantalumnos);
writeln('Cantidad de docentes: ');
readln(e.cantdocentes);
end;

//
function calratio(e:escuela):real;
begin
calratio:=(e.cantdocentes/e.cantalumnos);
end;

//b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la
//cantidad de alumnos y la cantidad de docentes).}

var 
e:escuela;
contador,i :integer;
nom1,nom2 : string;
cue1,cue2,min1,min2 :real;
begin
contador:=0;
min1:=9999;
min2:=9999;
cue1:=0;
cue2:=0;
nom1:='prueba';
nom2:='prueba';

 for i:=1 to 4 do
 begin
leeresc(e);

        if(calratio(e)<min1) then
        begin
        min2:=min1;
        cue2:=cue1;
        nom2:=nom1;
        
        min1:=calratio(e);
        cue1:=e.cue;
        nom1:=e.nombre;
        end
        else if (calratio(e)<min2) then
       begin
        min1:=calratio(e);
        cue1:=e.cue;
         nom2:=e.nombre;
        end;
    
    if (e.localidad='La Plata') and (calratio(e)>unesco) then
    begin
    contador:=contador+1;
    end;
    end;
    writeln('El numero total en La Plata es': contador);    
    writeln('los minimos son ', cue1,',',cue2 );
    writeln('los minimos son ',nom1,',',nom2);
    end.
{5) Una compañía de telefonía celular debe realizar la facturación mensual de sus 8700 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente
y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos
consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de
los clientes de la compañía e informe el monto total a facturar para cada uno y el promedio de MB consumidos.
Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, 
lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a.) y retorne la cantidad total de minutos y la cantidad total de MB a
facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $9,80 y cada MB consumido cuesta
$2,35.}
program facturacion;
const
valorminuto=9.80;
valormega=2.35;
cantcliente=8700;
type 
lineas=record
nrotel: integer;
mega : real;
minuto: real;
end;


type
cliente=record
codcliente : integer;
cantlineas : integer;
lineas : lineas;
end;

//Modulo linea telefonico

procedure leetel(var t:lineas);
begin
writeln('Ingrese numero de telefono');
readln(t.nrotel);
writeln('Ingrese cantidad de megas gastado');
readln(t.mega);
writeln('Ingrese minutos consumidos');
readln(t.minuto);
end;

//Modulo datos cliente y calculador

procedure leecliente (var c:cliente;var sumamb,sumamin : real);
var
l:lineas;
contador:integer;
begin
contador:=0;
sumamb:=0;
sumamin:=0;
writeln('Ingrese codigo de cliente');
readln(c.codcliente);
writeln('Ingrese cantidad de lineas');
readln(c.cantlineas);
    while (contador<c.cantlineas) do
    begin
    leetel(l);
    sumamb:=sumamb+l.mega;
    sumamin:=sumamin+l.minuto;
    contador:=contador+1;
    end;
end;    

var
c:cliente;
totalmb,totalmin,megasprom:real;
i:integer;
factcliente:real;

begin
for i:=1 to cantcliente do
begin
leecliente(c,totalmb,totalmin);
factcliente:=(totalmb*valormega+totalmin*valorminuto);
megasprom:=(totalmin/c.cantlineas);
writeln('Total de megas consumidos promedio es:',megasprom:0:2 );
writeln('Total a facturar en el mes es promedio es:',(factcliente):0:2);
end;
end.

{6 Una fábrica de alfajores y mermeladas maneja información sobre los diferentes productos que tiene para la
venta. Para ello se lee la información de cada producto hasta que llega el producto con código 999. De cada
producto se lee: código, tipo (alfajor o mermeladas), cantidad de unidades fabricados para el mes,
y precio. Se
desea informar:
● Cantidad de alfajores fabricados para el mes.
● Precio promedio de las mermeladas.
● Los nombres de los dos productos con mayor cantidad de unidades de fabricación}
{6 Una fábrica de alfajores y mermeladas maneja información sobre los diferentes productos que tiene para la
venta. Para ello se lee la información de cada producto hasta que llega el producto con código 999. De cada
producto se lee: código, tipo (alfajor o mermeladas), cantidad de unidades fabricados para el mes,
y precio. Se
desea informar:
● Cantidad de alfajores fabricados para el mes.
● Precio promedio de las mermeladas.
● Los nombres de los dos productos con mayor cantidad de unidades de fabricación}

type
producto=record
cod:integer;
tipo:string;
precio:real;
cantfab:integer;
end;
//------------------------------------------------------------------------------------------------------Procedimiento
procedure cargaprod(var c:producto);
begin
writeln('Ingrega codigo producto');
        readln(c.cod);
if(c.cod<>999) then
begin
    writeln('Ingrega el tipo de productor Alfajor o Mermelada');
    readln(c.tipo);
//------------------------------------------------------------------------------------------------------

//comprobar que se alfajor o mermelada 
        while ((c.tipo<>'Alfajor') and (c.tipo<>'Mermelada')) do
        begin
        writeln('Ingrega el tipo de productor Alfajor o Mermelada');
        readln(c.tipo);
        end;
    writeln('Ingresa Precio');
    readln(c.precio);
    writeln('Ingresa cantidad fabricada');
    readln(c.cantfab);
end;
end;

//------------------------------------------------------------------------------------------------------
//cantidad alfajores mes
procedure totalalfajores(p:producto;var totalfabmes:integer);
begin
if p.tipo='Alfajor' then
begin
totalfabmes:=totalfabmes+p.cantfab;
end;
end;
//------------------------------------------------------------------------------------------------------
//precioprom mermeladas
procedure totalmer (p:producto;var totalprecio:real;var cont:integer);
begin
if p.tipo='Mermelada' then
begin
    totalprecio:=totalprecio+p.precio;
    cont:=cont+p.cantfab;
end;    
end;
//------------------------------------------------------------------------------------------------------
//Los nombres de los dos productos con mayor cantidad de unidades de fabricación
procedure caculamaximo(var p:producto;var cantmayor1, cantmayor2 :integer; var cod1,cod2:integer);
begin
if (p.cantfab>cantmayor1) then 
    begin
    cod2:=cod1;
    cantmayor2:=cantmayor1;
    cantmayor1:=p.cantfab;
    cod1:=p.cod;
    end
    else if  (p.cantfab>cantmayor2) then 
    begin
    cantmayor2:=p.cantfab;
    cod2:=p.cod;
    end;
end;
//------------------------------------------------------------------------------------------------------programa

//Programa 
var
totalfabmes: integer;
p:producto;
ingeresomes,prom:real;
codmax1,codmax2,mayor1,mayor2,contador:integer;
begin
ingeresomes:=0;
codmax1:=-1;
codmax2:=-1;
mayor1:=0;
mayor2:=0;
contador:=0;
totalfabmes:=0;

cargaprod(p);
while (p.cod<>999) do
    begin
    //calculo cantidad alfajores al mes
    totalalfajores(p,totalfabmes);
    
    //precioprom mermeladas
    totalmer(p,ingeresomes,contador);
    
    //maximos
    caculamaximo(p,mayor1,mayor2,codmax1,codmax2);
    
    //vuelve a llamar al leer
    cargaprod(p);
        
    end;
prom:=(ingeresomes/contador);
writeln('Cantidad de alfajores fabricados por mes ',totalfabmes);
writeln('Precio promedio mermeladas ',prom:0:2);
writeln('Productos con mas unidades de fabricacion ',codmax1,' y ',' siendo un toatal de ',mayor1,' y ',codmax2,' siendo ',mayor2);
end.

{8) Se desea procesar la información de todos los radares de velocidad que posee la ciudad de La Plata en un día.
Para ello se lee de cada radar: código de radar, velocidad máxima permitida y cantidad de vehículos registrados,
y para cada vehículo en cada radar, se lee patente y velocidad. La lectura finaliza cuando se lee el código de radar
-1. Se pide calcular e informar:
● La velocidad promedio de los automóviles para cada radar.
● La cantidad de vehículos que fueron multados para cada radar.
● La patente del vehículo con mayor velocidad y la patente del vehículo con menor velocidad}

program calcularmultas;

//---------------------------------------------------------------------------------------------------------Declaro tipos
//Creo tipos 
type
vehiculo=record
patente : string;
velocidad : integer;
end;


radar=record
codrad :integer;
velmax :integer;
cantv :integer;
end;

//---------------------------------------------------------------------------------------------------------Procedimientos

//procedimiento leer radar
procedure leerrad(var r:radar);
begin

writeln('Ingrese codigo del radar');
readln(r.codrad);
if (r.codrad<>-1) then
begin
writeln('Ingrese velocidad maxima permitida  del radar');
readln(r.velmax);
writeln('Ingrese cantidad de vehiculos');
readln(r.cantv);
end;
end;
//---------------------------------------------------------------------------------------------------------
// procedimiento leer vehiculo
procedure leerv(var v:vehiculo);
begin
writeln('Ingrese la patente del vehiculo');
readln(v.patente);
writeln('Ingrese la velocidad registrada del vehiculo');
readln(v.velocidad);
end;

//---------------------------------------------------------------------------------------------------------

//velocidad promedio
procedure calculavelocidad(v:vehiculo;var velocidadtotal:integer);
begin
velocidadtotal:=velocidadtotal+v.velocidad
end;

//---------------------------------------------------------------------------------------------------------

// calculo multa
procedure multa( v:vehiculo;r:radar;var multadorad:integer);
    begin
        if (v.velocidad>r.velmax) then
        begin
        multadorad:=multadorad+1;
        end;
    end;
//---------------------------------------------------------------------------------------------------------
//procedimiento max min
procedure maxmin(v:vehiculo;var max,min:integer;var patentemax,patentemin:string);
begin
if (v.velocidad>max) then
begin
max:=v.velocidad;
patentemax:=v.patente
end;

if (v.velocidad<min) then
begin
min:=v.velocidad;
patentemin:=v.patente;
end;
end;

//---------------------------------------------------------------------------------------------------------Programa
var
i,multadorad,velocidadtotal,max,min : integer;
r:radar;
v:vehiculo;
velpromedio : real;
patentemin,patentemax : string;
//---------------------------------------------------------------------------------------------------------inicializo variables
begin
writeln('Ingrese un radar o -1 para finalizar: ');

//INICIO VARIABLES
multadorad:=0;
velocidadtotal:=0;
velpromedio:=0;
max:=-1;
min:=999;
patentemax:='a';
patentemin:='b';

//CARGA RADAR
leerrad(r);
//-------------------------------------------------------------------------------------------------------INICIO EL WHILE

    while (r.codrad<>-1) do
    begin
        //--------------------------------------------------------------------------------------------INICIO FOR
        for i:=1 to r.cantv do
        begin
        //CARGA VEHICULOtifier I" found
        leerv(v);
        
        //● Calculo velocidad total para prom.
        calculavelocidad(v,velocidadtotal);
        
        //● Calculo multa.
        multa(v,r,multadorad);
        
        //Calculo maxmin
         maxmin(v, max,min, patentemax,patentemin);
        
        //-----------------------------------------------------------------------------------------FIN DEL FOR
        end;      

        //Imprimo velocidad promedio.
        velpromedio:=velocidadtotal/r.cantv;
        writeln('La velocidad promedio es ',velpromedio:0:2);     
        
        //● Imprimo autos multados.
        writeln('La cantidad de vehiculos multados por el radar ',r.codrad ,' es ',multadorad);
        
        //reseteo variables
        velocidadtotal:=0;
        multadorad:=0;
        
        //Cargo otro radar
        leerrad(r);
    
    //-----------------------------------------------------------------------------------------FIN WHILE RADAR
    end;
     writeln('El auto que fue a una velocidad maxima con patente ',patentemax ,' a la velocidad de ',max);
     writeln('El auto que fue a una velocidad minima con patente ',patentemin ,' a la velocidad de  ',min);
        
end.
//------------------------------------------------------------------------------------------------Fin programa


{9) En la ciudad de La Plata se llevó a cabo un importante concurso de Informática, en el cual se presentaron
participantes europeos, asiáticos y americanos. Una vez finalizado el concurso, se evaluaron los exámenes. De
cada examen se conoce el nombre de la persona que lo realizó, su continente de origen y puntaje (de 0 a 100).
Se procesarán exámenes hasta que llegue el examen con nombre de la persona igual a ‘zzz’. Obtener e informar:
● Participante que obtuvo la mejor calificación.
● Continente origen de los participantes que promocionaron (se promociona con puntaje mayor que 90).
● Cantidad de americanos que aprobaron (se aprueba con puntaje mayor que 70) y no promocionaron.
● Puntaje promedio de los europeos}

program examen;
//----------------------------------------------------------------------------------------------------Constantes
const
  aprobado = 70;
  promo = 90;
//----------------------------------------------------------------------------------------------------Declaro tipos
type
  participante = record
    nombre: string;
    contorigen: string;
    puntaje: integer;
  end;
//-------------------------------------------------------------------------------------------------------Procedimientos
procedure leeparticipante(var p: participante);
begin
  writeln('Ingresa nombre de participante (o un nombre alfabéticamente inferior a "zzz" para terminar):');
  readln(p.nombre);
  if p.nombre < 'zzz' then
  begin
    writeln('Ingresa país de origen:');
    readln(p.contorigen);
    writeln('Ingresa puntaje:');
    readln(p.puntaje);
  end;
  end;
 //-------------------------------------------------------------------------------------------------------------------- 
// calcula maximo

procedure calculamayor(p:participante; var mayor:integer ;var participantemax:string);
  begin
      if(p.puntaje>mayor) then
      begin
      mayor:=p.puntaje;
      participantemax:=p.nombre;
      end;
  end;
//--------------------------------------------------------------------------------------------------------------------
//calcula promocionado x continente 

procedure continentepromo(var p: participante; var europapromo: integer; var asiapromo: integer; var americapromo: integer);
begin
  if (p.contorigen = 'Europa') and (p.puntaje >= promo) then
    europapromo := europapromo + 1
  else if (p.contorigen = 'Asia') and (p.puntaje >= promo) then
    asiapromo := asiapromo + 1
  else if (p.contorigen = 'America') and (p.puntaje >= promo) then
    americapromo := americapromo + 1;
end;

//--------------------------------------------------------------------------------------------------------------------

//suma cantidad  americanos aprobados  
procedure americaprobado(p:participante;var cantameric:integer);
 begin
 if(p.contorigen='America' ) and (p.puntaje>=aprobado) and (p.puntaje < promo) then
     begin
     cantameric:=cantameric + 1;
     end;
 end;
 

//--------------------------------------------------------------------------------------------------------------

//suma puntaje americanos y cantidad 
procedure europaprom(var p:participante;var canteuropa:integer;var sumaeuropa:integer);
 begin
 if(p.contorigen='Europa' ) then
 begin
 canteuropa:=canteuropa + 1;
 sumaeuropa:=sumaeuropa+p.puntaje;
 end;
end;
 
//-------------------------------------------------------------------------------------------------------------fin procedimiento
  
//------------------------------------------------------------------------------------------------------------Inicio Progrma
var
  p: participante;
  mayor,europapromo,asiapromo,americapromo,sumaeuropa,canteuropa,cantameric: integer;
  participantemax:string;
  
begin
    mayor:=-1;
    participantemax:='0';
    europapromo:=0;
    asiapromo:=0;
    americapromo:=0;
    canteuropa:=0;
    sumaeuropa:=0;
    cantameric:=0;
  leeparticipante(p);
  while p.nombre < 'zzz' do
  begin
    //Calculo de mayor calificacion
    calculamayor(p,mayor,participantemax);

    //Calculo continente  calificacion
    continentepromo(p, europapromo, asiapromo, americapromo);
    
    //Calculo americanos aprobados  
    americaprobado(p, cantameric);
    
    //Calculo europeo  promo
    europaprom(p,canteuropa,sumaeuropa);

    leeparticipante(p);
  end;

  writeln('--------------------------------- Resultados ---------------------------------');
  writeln('Participante con la mejor calificación:', participantemax, ' con un puntaje de ', mayor);
  writeln('Cantidad de participantes que promocionaron por continente:');
  writeln('Europa:', europapromo);
  writeln('Asia:', asiapromo);
  writeln('América:', americapromo);
  writeln('Cantidad de americanos que aprobaron pero no promocionaron:', cantameric);
  if canteuropa > 0 then
    writeln('Puntaje promedio de los participantes europeos:', sumaeuropa / canteuropa:0:2)
  else
    writeln('No hay participantes europeos.');
  writeln('------------------------------------------------------------------------------');
end.


{10)
Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se
lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
● El precio promedio por marca.
● Marca y modelo del auto más caro.}
program concesionaria;
//-----------------------------------------------------------------------------Tipos
type auto=record
marca:string;
modelo:string;
precio:real;
end;
//-----------------------------------------------------------------------------Procedimientos
procedure leeauto(var a:auto);
begin
writeln('Ingrese Modelo');
readln(a.modelo);
writeln('Ingrese precio');
readln(a.precio);
end;
//-----------------------------------------------------------------------------
procedure totalmarca(a:auto; var sumaprecio:real;var cantauto:integer);
            begin 
            sumaprecio:=sumaprecio+a.precio;
            cantauto:=cantauto+1;
            end;
            
procedure maximo(a:auto;var max:real; var marcamax:string; var modelomax:string);
begin
if(a.precio>max) then
begin
    max:=a.precio;
    marcamax:=a.marca;
    modelomax:=a.modelo;
end;

end;
   
//-----------------------------------------------------------------------------Programa
var
a:auto;
nueva,marcamax,modelomax:string;
sumaprecio,max :real;
cantauto:integer;
begin
nueva:='No';
sumaprecio:=0;
cantauto:=0;
max:=-1;

//-----------------------------------------------------------------------------
writeln('Ingrese marca');
readln(a.marca);
    while (a.marca<'zzz')  do
    begin
            while (nueva='No') or(nueva='no') do
            begin
            leeauto(a);
            
            //TOTAL PRECIO
            totalmarca(a, sumaprecio, cantauto);
            
            //maximo
            maximo(a, max, marcamax,modelomax);
    
            writeln('Desea ingresar otra marca (Si/No)');
            readln(nueva);
            end;
    writeln('El precio promedio de la marca ',a.marca,' es ',(sumaprecio/cantauto):0:2);  
    sumaprecio:=0;
    cantauto:=0;
    nueva := 'No';
    
    writeln('Ingrese marca');
    readln(a.marca);
    end;
    writeln('El auto mas caro es  de marca ',marcamax,' y modelo ',(modelomax));  
    
{11. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad
y la lectura finaliza al leer un centro con 0 investigadores. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros
Los dos centros con menor cantidad de becarios.}


program centrosuniversitarios;
type centro=record
nombre:string;
Universidad: string;
investigadores : integer;
becarios :integer;
end;

procedure leercentro(var c:centro);
begin
writeln('Ingrese nombre de universidad');
readln(c.universidad);
writeln('Ingrese nombre de centro');
readln(c.nombre);
writeln('Ingrese cantdad de investigadores');
readln(c.investigadores);
writeln('Ingrese cantidad de becarios');
readln(c.becarios);
end;
//------------------------------------------------------------------------------------------------------------------------------------
procedure calculominimo(c: centro; var min1: integer; var min2: integer; var centromin1: string; var centromin2: string);
begin
  if c.becarios < min1 then
  begin
    min2 := min1;
    centromin2 := centromin1;
    min1 := c.becarios;
    centromin1 := c.nombre;
  end
  else if c.becarios < min2 then
  begin
    min2 := c.becarios;
    centromin2 := c.nombre;
  end;
end;

//------------------------------------------------------------------------------------------------DECLARO VARIABLES
var
c:centro;
universidadactual,univermax,centromin1,centromin2:string;
max,min1,min2,totalcentros,totalinvestigadores:integer;

begin
//------------------------------------------------------------------------------------------------Inicializo variables
centromin1:='';
centromin2:='';
min1:=9999;
min2:=9999;
max:=-1;
univermax:='';
totalcentros:=0;
totalinvestigadores:=0;

//------------------------------------------------------------------------------------------------------Empieza el programa
leercentro(c);
universidadactual:=c.universidad;
//------------------------------------------------------------------------------------------------------INICIA EL BUCLE
while (c.investigadores<>0) do
begin

calculominimo(c,min1,min2,centromin1,centromin1);

//------------- INICIO IF-------------------------------------------------------------------------------------------
    if(universidadactual=c.universidad) then
    begin
    totalcentros:=totalcentros+1;
    totalinvestigadores:=totalinvestigadores+c.investigadores;
    end
    else    
        writeln('La universidad',c.universidad ,'dispone de ',totalcentros,' investigadores');
    
//------------------------------------------------------------------------------------
    
    if totalinvestigadores>max then
    begin
        max=totalinvestigadores;
        univermax:=c.universidad;
    end
    totalinvestigadores:=1;
    totalcentros:=totalcentros;

    end;
leercentro(c);
//------------------------------------------------------------------------------------------------------FINALIZA EL BUCLE

end;
