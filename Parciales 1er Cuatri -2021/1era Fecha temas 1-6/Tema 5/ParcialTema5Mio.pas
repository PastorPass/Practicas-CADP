{  Una compañia aerea desea analizar la informacion de los tickets vendidos a sus clientes. La empresa cuenta con
400 sevicios de vuelo diferentes, en adelante denominados "vuelo"
De cada ticket se conoce el codigo de vuelo ( entre 1 y 400); numero de ticket , apellido del cliente;  pais de 
origen y pais de destino; 
------------------------------------------------------------------------------------------------------------
Aclaracion Psnal : siempre que exista un rango de algun elemento '400 servicios de vuelo diferentes' o codigo de vuelo (1..400)
                    me indica a que debe crearse un vector contador que sea cargado por cod de vuelo por cliente
------------------------------------------------------------------------------------------------------------
La informacion de los tickets ya se encuentra disponible en una estructura de datos adecuada, y se encuentra ordenada 
por el apellido del cliente ( un cliente puede haber comprado mas de un ticket en distintos vuelos)
------------------------------------------------------------------------------------------------------------
quiere decir que el cargar Lista se dispone junto con los demas procesos como el Leerticket y el InsertarOrdenado,
ya que esta ordenada por Apellido del cliente, y luego debe ser "refrescado esta implementacion en el recorrerLista"
como 'esta ordenado por el Apellido del cliente' significa que debo crear en el recorrerLista : una variable auxiliar
para luego pasarla como condicion en el 2do while junto al dato que esta en el campo de la lista por ejemplo :
auxApellido := L^.dato.Apellido y para pasar al siguiente nodo --> L := l^.SIG;
------------------------------------------------------------------------------------------------------------
Realizar un programa que procese la informacion de los tickets y calcule : 

a) Cantidad de vuelos dentro de un mismo pais que hayan tenido mas de 65 pasajeros      // SE UTILIZA UN VECTOR CONTADOR previamente una condicion de que sea del mismo pais
------------------------------------------------------------------------------------------------------------
y se refiere que para asignar a una posicion del vector se recurre a la lista, por ejemplo :
vec[L^.dato.codVuelo] := vec[L^.dato.codVuelo] + 1; 
siempre es referenciado a la misma variable que tiene el mismo rango que el vector, en este caso es la variable codVuelo : rango;
------------------------------------------------------------------------------------------------------------
b) Apellido del cliente que compro mas tickets

c) Cantidad de tickets cuyo numero termine en 2 o en 5.     }

program uno;
const
  tope = 65;
type
  rango = 1..400;
  ticket = record   
                codVuelo : rango;
                numTicket : integer;
                apellido : string[20];
                paisOrigen : string[20];
                paisDestino : string[20];
           end;
  Lista=^nodo;
  nodo = record
             dato : ticket;
             sig : Lista;
         end;
  
  vectorVuelos = array [rango] of integer;
  
// PROCESOS

Procedure InicializarVector ( var vecCon : vectorVuelos);   // inicializa al contador de pasajeros por vuelo para el inciso a)
var
  i : rango;
Begin
  for i := 1 to 400 do 
    vecCon[i] := 0;
End;

{Procedure CargarLista (var L : Lista);      // se dispone
var
  t : ticket;
Begin
  Leerticket (t);
  while (...) do begin // no especifa la condicion de corte
    auxApellido := L^.dato.apellido;
    while (L <> nil) and (auxApellido = L^.dato.apellido) do begin
      tickets := tickets + 1;   // un cliente con un mismo apellido puede haber comprado mas de un ticket
      InsertarOrdenado (L,t);       // se ordena por criterio del apellido del cliente
      Leerticket(t);
    end;
  end;
End;}

Procedure MaxApellido (unApellido : string; cantTickets : integer; var ape : string);
var
  max : integer;
Begin
  max := -1;
  if (cantTickets > max) then begin
    max := cantTickets;
    ape := unApellido;
  end;
End;

Function EsDosoCinco (unNumtick : integer) : boolean;   
var
  resto : integer;
  ok : boolean;
Begin
// EsDosoCinco := (unNumtick MOD 10 = 2) or (unNumtick MOD 10 = 5);
  ok := false;
  resto := 0;
  while ( unNumtick <> 0) and (not ok ) do begin
    resto := unNumtick MOD 10;
    if ( resto = 2) or ( resto = 5) then
      ok := true
    else
      unNumtick := 0;
  end;
  EsDosoCinco := ok;
End;

Procedure Vuelo65Pasajeros (vecCon : vectorVuelos ; var vuelos : integer);
var
  i : rango;
Begin
  for i := 1 to 400 do
    if (vecCon[i] > tope) then
      vuelos := vuelos + 1;
End;


Procedure RecorrerLista ( L : Lista; vecCon : vectorVuelos);
var
  auxApellido : string;
  tickets : integer;
  cantTick : integer;
  ape : string;
  vuelos : integer;
Begin
  ape := ' ';
  vuelos := 0;
  cantTick := 0;
  while (L <> nil) do begin
    auxApellido := L^.dato.apellido;
    tickets := 0;
    while ( L <> nil) and (auxApellido = L^.dato.apellido) do begin
      tickets := tickets + 1;
      if (EsDosoCinco (L^.dato.numTicket)) then     // incrementa el contador cantTick si el dni termina en 2 o en 5.
        cantTick := cantTick + 1;
      if(L^.dato.paisOrigen = L^.dato.paisDestino) then     // incrementa la cantidad de pasajaeros del vuelo,
        vecCon[L^.dato.codVuelo] := vecCon[L^.dato.codVuelo] + 1;   // si es que dicho vuelo fue dentro de un mismo pais
      L := L^.sig;
    end;
    MaxApellido (auxApellido,tickets,ape);
  end;
  writeln('el apellido del cliente que compro mas tickets : ' , ape);
  writeln('Cantidad de tickets cuyo numero termine en 2 o en 5 : ' , cantTick);
  Vuelo65Pasajeros(vecCon,vuelos);
  writeln('la Cantidad de vuelos dentro de un mismo pais que hayan tenido mas de 65 pasajeros = ' , vuelos);
End;

// P.P 
VAR
  L : Lista;
  vecCon : vectorVuelos;
BEGIN
  InicializarVector (vecCon);   
  L := nil;
 // CargarLista(L);   // se  dispone
  RecorrerLista(L,vecCon);  
END.