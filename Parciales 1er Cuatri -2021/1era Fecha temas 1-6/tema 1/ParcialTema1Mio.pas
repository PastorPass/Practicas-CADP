{ TEMA 1 -PARCIAL PRIMERA FECHA
 Una compañia aerea desea analizar la informacion de los tickets vendidos a sus clientes , La empresa cuenta con 1200 servicios
 de vuelos diferentes, en adelante denominadas 'vuelo'
De cada ticket se conoce el codigo de vuelo(entre 1 y 1200), dni del cliente , pais de origen, pais de destino y valor del ticket
La informacion de los tickets se dispone en una estructura de datos adecuada , y se encuentra ordenada por el dni del cliente
(un cliente puede haber comprado mas de un ticket en distintos vuelos)      // vector Contador de vuelos (1..1200)

Realizar un programa que procese la informacion de los tickets y calcule :
a) Cantidad de vuelos dentro de un mismo pais se hayan tenido mas de 50 pasajeros.

b) Dni del cliente que mas dinero gasto en tickets

c) Cantidad de clientes cuyo dni terminen en 0 o en 5.      }

program uno;
type
  rango = 1..1200;
  ticket = record
             codVuelo : rango;
             dniCliente : integer;
             paisOrigen : string[20];
             paisDestino : string[20];
             precio : real;
           end;
           
  Lista =^nodo;
  nodo = record
            dato : ticket;
            sig : Lista;
         end;
  VectorVuelos = array[rango] of integer;

// PROCESOS 

Procedure InicializarVectorContadorVuelos ( var vecCon : VectorVuelos);
var
  i : rango;
Begin
  for i := 1 to 1200 do
    vecCon[i] := 0;
End;

Procedure IncrementarContador (t : ticket; var vecCon : VectorVuelos);      // el (L^.dato,....) se convierte en una variable t : ticket        // L^.DATO = T : TICKET
Begin
  if (t.paisOrigen = t.paisDestino) then
    vecCon[t.codVuelo] := vecCon[t.codVuelo] + 1;   // incrementa la cantidad de pasajeros del vuelo, si es que dicho vuelo fue dentro de un mismo pais
End;

Procedure ContarSiCumpleDni (unDni : integer; var cantCli : integer);
var
  resto : integer;
Begin
  resto := unDni MOD 10;
  if ((resto = 0) or (resto = 5)) then
    cantCli := cantCli + 1;       // incrementa cant si el dni termina en 0 o en 5
End;

Procedure ActualizarMaximo (dniAct : integer; gasto : real; var dniMasGasto : integer; MaxGasto : real);
Begin
  if ( gasto > MaxGasto) then begin
    dniMasGasto := dniAct;
    MaxGasto := gasto;
  end;
End;

Procedure RecorrerLista( L : Lista; var vecCon : VectorVuelos; var dniMasGasto : integer; var cantCli : integer);
var
  dniAct : integer;     // como esta ordenada por dni se necesita una variable auxiliar de dni
  gastos : real;        // calcula quien tiene mayor gasto
  MaxGasto : real;      // calcula el maximo gasto hasta ese momento    (donde se maneja un maximo)
Begin
  cantCli := 0;
  MaxGasto := -1;
  while (L <> nil) do begin
    gastos := 0;
    dniAct := L^.dato.dniCliente;
    while (L <> nil) and (dniAct = L^.dato.dniCliente) do begin
      IncrementarContador(L^.dato,vecCon);      // primera parte del inciso a)   L^.dato --> le pasa un registro completo de un nodo, uno por uno, es como pasarle una variable  t : ticket
      gastos := gastos + L^.dato.precio;
      ContarSiCumpleDni (L^.dato.dniCliente,cantCli);    // inciso c) cant. de clientes cuyo dni terminan en 0 o en 5
      L := L^.sig;
    end;
    ActualizarMaximo (dniAct,gastos,dniMasGasto,MaxGasto);
  end;
End;

Function cantVuelosSuperanPasajeros (cinku : integer; vecCon : VectorVuelos) : integer;
var
  i : integer;
  aux : integer;
Begin
  aux := 0;
  for i := 1 to 1200 do 
    if (vecCon[i] > cinku) then
      aux := aux + 1;
  cantVuelosSuperanPasajeros := aux;
End;

// P.P
VAR
  L :Lista;
  vecCon : VectorVuelos;
  dniMasGasto : integer;
  cantCli : integer;
BEGIN
  InicializarVectorContadorVuelos(vecCon);
  L := nil;
  CargarTickets(L);     // se dispone 
  RecorrerLista (L,vecCon,dniMasGasto,cantCli);     // le paso las variables de los 3 incisos
  writeln(cantVuelosSuperanPasajeros (50,vecCon));      // inciso a) segunda parte
  writeln('el dni que mas gasto en tickets es : ' , dniMasGasto);
  writeln('la cantidad de clientes cuyo dni terminan en 0 o en 5 son : ' , cantCli);
END.