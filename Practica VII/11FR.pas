{11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales.
De cada evento se dispone la siguiente informacion : nombre del evento; tipo del evento
(1.Musica;  2.Cine;  3.Obra de teatro;  4.Unipersonal;  5.Monologo) ; lugar del evento; 
cantidad maxima de personas permitidas para el evento y costo de la entrada,  Se pide :

1. Generar una estructura con las ventas de entradas para tales eventos culturales .
De cada venta se debe guardar: codigo de venta; numero de evento (1..100); dni del comprador; y
cantidad de entradas adquiridas. La lectura de las ventas finaliza con codigo de venta -1.

2. Una vez leida y almacenada la informacion de las ventas, calcular e informar : 
a) El nombre y lugar de los 2 eventos que han tenido menos recaudacion.
b) La cantidad de entradas vendidas cuyo comprador contiene en su dni mas digitos pares que impares 
y que sean para el evento de tipo "obra de teatro"
c) Si la cantidad de entradas vendidas para el evento numero 50 alcanzó la cantidad maxima de personas de personas permitidas.  }

Program eje11p7;
type
  rango_tipo = 1..5;
  evento = record
    nombre: string[50];
    tipo: rango_tipo;
    lugar: string[100];
    cantPersonas: integer;
    costo: real;
  end;
  eventos = array[1..100] of evento;
  venta = record
    codigo: integer;
    evento: 1..100;
    dni: integer;
    cantidad: integer;
  end;
  lista = ^nodo;
  nodo = record
    dato: venta;
    sig: lista;
  end;
  contador = array[1..100] of real;
procedure leerEvento(var e: evento);
procedure cargarEventos(var e: eventos);

procedure leerVenta(var v: venta);
begin
     writeln('Codigo');
     readln(v.codigo);
     if (v.codigo <> -1 ) then begin
       writeln('Evento');
       readln(v.evento);
       writeln('DNI');
       readln(v.dni);
       writeln('Cantidad de entradas');
       readln(v.cantidad);
     end;
end;

procedure agregarAdelante(var pri: lista; v: venta);
var
  aux: lista;
begin
     new(aux);
     aux^.dato:= v;
     aux^.sig:= pri;
     pri:= aux;
end;

procedure cargarVentas(var pri:lista);
var
  v: venta;
begin
     leerVenta(v);
     while (v.codigo <> -1) do begin
       agregarAdelante(pri, v);
       leerVenta(v);
     end;
end;

procedure informarDosMinimos(c: contador; e: eventos);
var
  i, codMin1, codMin2: integer;
  min1, min2: real;
begin
     min1:= 999999999;
     min2:= 999999999;
     for i:= 1 to 100
         if (c[i] < min1) then begin
         min2:= min1;
         codMin2:= codMin1;
         min1:= c[i];
         codMin1:= i;
         end else if(c[i] < min2) then begin
              min2:= c[i];
              codMin2:= i;
         end;
     writeln('El minimo1 fue' , e[codMin1].nombre, 'con $', min1);
     writeln('El minimo2 fue' , e[codMin2].nombre, 'con $', min2);
end;

function cumple(dni: integer): boolean;
var
  pares, impares, resto: integer;
begin
     pares:=0;
     impares:=0;
     while (dni <> 0) do begin
        resto:= dni mod 10;
        if ( resto mod 2 = 0) then pares:= pares +1
           else impares:= impares +1;

       dni:= dni div 10;
     end;
     cumple:= pares > impares;
end;

procedure calcular( pri: lista; e: eventos);
var
   c: contador;
   i, vendidas: integer;

begin
     vendidas:= 0;
     for i:= 1 to 100 do
         c[i]:= 0;
     while(pri<>nil) do begin
       c[pri^.dato.evento]:= c[pri^.dato.evento] + pri^.dato.cantidad;
       if ((e[pri^.dato.evento].tipo = 3) and cumple(pri^.dato.dni)) then
          vendidas:= vendidas + pri^.dato.cantidad;
       pri:= pri^.sig;
     end;
     if (c[50]>=e[50].cantPersonas) then
        writeln('El evento 50 alcanzo el maximo de personas permitidas');
     for i:= 1 to 100 do
         c[i]:= c[i]*e[i].costo;
     informarDosMinimos(c, e);
     writeln('Inciso B cumplieron', vendidas);
end;

var
  pri: lista;
  e: eventos;
begin
     pri:= nil;
     cargarEventos(e); //Se dispone
     cargaVentas(pri);
     calcular(pri, e);
end.