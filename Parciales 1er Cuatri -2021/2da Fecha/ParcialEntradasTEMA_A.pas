{ ------PARCIAL CON VENTAS DE ENTRADAS--------
TEMA A 
ENUNCIADO :	
El comite organizador del torneo de futbol Copa America 2021
esta analizando la informacion de las entradas vendidas para los 38 partidos del torneo.
Para ello, dispone de una estructura de datos con informacion de todas las ventas de entradas.
De cada venta se conoce el codigo de partido ( entre 1 y 38) , codigo de cliente y la cantidad de entradas vendidas.
Esta informacion no se encuentra ordenada por ningun criterio
Realizar un programa que :

a) Invoque a un modulo que lea la informacion de los 38 partidos y la almacene en una estructura de datos adecuada.
De cada partido se conoce su codigo ( entre 1 y 38); nombre del estadio donde se juega, 
la capacidad maxima del estadio y la hora de inicio.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

b) Invoque a un modulo que reciba la informacion de las ventas de entradas y la informacion de los partidos y retorne :

i) Una lista con los codigos de partidos que superan el 50 % de la capacidad del estadio

ii) Cantidad de ventas de menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39.        }

program uno;
const
  tope = 3;
type 
  rango = 1..tope;
  venta = record
             codPartido : rango;
             codCliente : integer;
             entradasV : integer;
          end;
          
  Lista =^nodo;
  nodo = record
             dato : venta;
             sig : Lista;
         end;
  partido = record
                 codP : rango;
                 nomEstadio : string[20];
                 capMax : integer;
                 horaInicio : integer;
            end;

  vectorPartidos = array[rango] of partido;
  vectorContador = array[rango] of integer; //vector Contador que cuenta la Cantidad de entradas vendidas x partido
  ListaNue = ^nodoD;        // se crea una lista nueva para el inciso b.i)
  nodoD = record
            dato : rango;
            sig : ListaNue;
          end;
// PROCESOS

//Procedure LeerVenta(var t : venta); // se dispone
//Procedure AgregarAdelante(var L : Lista; t : venta);        // se dispone
//Procedure CargarListaVentas (var L : Lista);    // se dispone el modulo y la condicion de corte

Procedure InicializarVectorContador (var vecCon : vectorContador);
var
  i : rango;
Begin
  for i := 1 to tope do 
    vecCon[i] := 0;
End;

Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    writeln('ingrese un codigo de partido(1..18)');
    readln(codP);
    writeln('ingrese el nombre del estadio');
    readln(nomEstadio);
    writeln('ingrese la capacidad maxima de personas en el partido');
    readln(capMax);
    writeln('ingrese la hora de inicio');
    readln(horaInicio);
  end;
End;

Procedure CargarVectorPartidos(var vecP : vectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to tope do begin
    LeerPartido(p);
    vecP[p.codP] := p;      // esta informacion se ingresa sin ningun orden en particular
  end;
End;

Procedure AgregarAdelante(var L2 : ListaNue; num : rango);
var
  aux : ListaNue;
Begin
  new(aux);
  aux^.dato := num;
  aux^.sig := L2;
  L2 := aux;
End;

Procedure GenerarLista (vecCon : vectorContador; vecP : vectorPartidos; var L2 : ListaNue);
var
  i : rango;
Begin
  for i := 1 to tope do
    if(vecCon[i] > (vecP[i].capMax/2)) then
      AgregarAdelante(L2,i)
End;

Procedure ProcesarInformacion(L:Lista; vecP:vectorPartidos; var L2:ListaNue; vecCon:vectorContador; var cantVentas:integer);
Begin
  while(L <> nil) do begin
    vecCon[L^.dato.codPartido] := vecCon[L^.dato.codPartido] + L^.dato.entradasV;  // suma las entradasV x partido
    if(L^.dato.codCliente MOD 100 >= 30) or (L^.dato.codCliente MOD 100 <= 39) and (L^.dato.entradasV < 5) then
      cantVentas := cantVentas + 1;  
    L := L^.sig;
  end;
  GenerarLista(vecCon,vecP,L2); // vamos a ver cuantos partidos superan el 50% de la capacidad
End;

Procedure ImprimirListaNueva(L2 : ListaNue);
Begin
  while (L2 <> nil) do begin
    writeln(L2^.dato);
    L2 := L2^.sig;
  end;
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
  L2 : ListaNue;
  vecCon : vectorContador;
  cantVentas : integer;
BEGIN
  cantVentas := 0;
  InicializarVectorContador (vecCon);
  L := nil;
  //CargarListaVentas(L);  // se dispone
  CargarVectorPartidos(vecP);
  L2 := nil;
  ProcesarInformacion (L,vecP,L2,vecCon, cantVentas);
  writeln('Cantidad de ventas de menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39 = ' , cantVentas);
  ImprimirListaNueva(L2);
END.