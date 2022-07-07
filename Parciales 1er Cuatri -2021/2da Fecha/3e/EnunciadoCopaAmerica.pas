{ ENUNCIADO 
El comite organizador del torneo de futbol Copa America 2021 , 
esta analizando la informacion de las entradas vendidas para los 38 partidos del torneo.

Para ello, dispone de una estructura de datos con informacion de todas las ventas de entradas.

De cada venta se conoce el codigo de partido ( entre 1 y 38) , codigo de cliente y la cantidad de entradas vendidas.
Esta informacion no se encuentra ordenada por ningun criterio

Realizar un programa que :

a) Invoque a un modulo que lea la informacion de los 38 partidos y la almacene en una estructura de datos adecuada.  // me dice la cantidad exacta de elementos ( es un vector de tipo registro)
De cada partido se conoce su codigo ( entre 1 y 38); nombre del estadio donde se juega, la capacidad maxima del estadio y la hora de inicio.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

b) Invoque a un modulo que reciba la informacion de las ventas de entradas y la informacion de los partidos y retorne :
i) Una lista con los codigos de partidos que superan el 50 % de la capacidad del estadio    // si se venden entradas, y cada entrada vendida es una persona, si se llegan a vender mas entradas que la mitad de la capacidad maxima entonces ahi se cumple la condicion

ii) Cantidad de ventas de menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39.        }

program uno;
type
  rango = 1..38;
  venta = record
             codPartido : rango;
             codCliente : integer;
             cantVendidas : integer;
          end;

  partido = record
                codP : rango;
                nomEstadio : string[20];
                capMax : integer;
                hora : integer;
            end;
  
  Lista =^nodo;
  nodo = record
            dato : venta;
            sig : Lista;
         end;
  vectorPartidos = array[rango] of partido;
// PROCESOS

{Procedure CargarListaVentas (var L : Lista);
var
  v : venta;
Begin
  LeerVenta(v)      // se dispone
  while (...) do begin // se dispone la condicion de corte
    AgregarAdelante (L,v)      // se dispone el orden en que como se acomoden los datos
    LeerVenta(v);       // se dispone
  end;
End;}

Procedure LeerPartido ( var p : partido);
Begin
  with p do begin
    readln(codP);
    readln(nomEstadio);
    readln(capMax);
    readln(hora);
  end;
End;

Procedure CargarVectorPartidos ( var vec : vectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to 38 do begin
    LeerPartido(p);
    vec[i] := p;
  end;
End;

Function CumpleCliente(Uncod : integer) : boolean;
var
  ok : boolean;
Begin
  ok := false;
  if (Uncod MOD 100 = 30) or (Uncod MOD 100 = 39) then      // MOD 100 saca los ultimos dos digitos , MOD 10 saca el ultimo digito
    ok := true;
  CumpleCliente := ok;
End;

Procedure GenerarListaAgregandoAdelante (var pri : Lista; unCod : rango);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato.codPartido := unCod;
  aux^.sig := pri;
  pri := aux;
End;

Procedure Procesar (L : Lista; vec : vectorPartidos; var pri : Lista; var cantVentas : integer);
Begin
  while ( L <> nil) do begin
    if(L^.dato.cantVendidas > vec[L^.dato.codPartido].capMax /2) then // no entiendo la condicion
      GenerarListaAgregandoAdelante(pri,L^.dato.codPartido);
    if(L^.dato.cantVendidas < 5) and (CumpleCliente(L^.dato.codCliente)) then
      cantVentas := cantVentas + 1;
    L := L^.sig;
  end;
End;

Procedure ImprimirListaCreada(pri : Lista);
Begin
  while (pri <> nil) do begin
    writeln('el codigo de partido es : ' , pri^.dato.codPartido);
    pri := pri^.sig;
  end;
End;

// P.P
VAR
  L,pri : Lista;            // <-- 1er lista a crear con cods de partidos
  vecP : vectorPartidos;
  cantVentas : integer;     // <-- 2do dato a retornar
BEGIN
  L := nil;
  pri := nil;
  cantVentas := 0;
  //CargarListaVentas(L);     // se dispone tanto el leerVenta como el AgregarAdelante y la condicion de corte
  CargarVectorPartidos (vecP); // se carga el vector con los datos del registro partido (1..38)
  Procesar (L,vecP,pri, cantVentas);     // tiene que retornar los dos items pedidos, (una lista y la cantidad de ventas)
  ImprimirListaCreada(pri);
  writeln('Cantidad de ventas de menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39 = '  , cantVentas);
END.