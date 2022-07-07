{ PARCIAL TEMA 1 : RESOLUCION CATEDRA

Una compañia aerea desea analizar la informacion de los tickets vendidos a sus clientes . La empresa cuenta con 1200 servicios de 
vuelos diferentes, en adelante denominadas "vuelo".
De cada ticket se conoce el codigo de vuelo ( entre 1 y 1200) dni del cliente, pais de origen, pais de destino, y valor del ticket.
La informacion de los tickets se dispone en una estructura de datos adecuada, y se encuentra ordenada por el dni del cliente (un cliente
puede haber comprado mas de un ticket en distintos vuelos)
Realizar un programa que procese la informacion de los tickets y calcule :
a) Cantidad de vuelos dentro de un mismo pais se hayan tenido mas de 50 pasajeros

b) Dni del cliente que mas dinero gastó en tickets 

c) Cantidad de clientes cuyo dni terminen en 0 o en 5.      }

program uno;
const
  MaxVuelo = 1200;
type
  tCodigoVuelo = 1..MaxVuelo;
  tNombrePais = string[20];
  rTicket = record
                codigoVuelo : tCodigoVuelo;
                dniCliente : integer;
                PaisOrigen : tNombrePais;
                PaisDestino : tNombrePais;
                valorTicket : real;
            end;
  ListaTickets = ^nodo;
  nodo = record
            dato : rTicket;
            sig : ListaTickets;
         end;
  VectorVuelos = array[tCodigoVuelo] of integer;
  
//PROCESOS 

Procedure InicializarContadorPorVuelo ( var vec : VectorVuelos);
var
  i : integer;
Begin
  for i := 1 to MaxVuelo do 
    vec[i] := 0;
End;

Procedure IncrementarContador (t : rTicket; var vec : VectorVuelos);
Begin
  if (t.PaisOrigen = t.PaisDestino) then
    vec[t.CodigoVuelo] := vec[t.CodigoVuelo] + 1;
End;

Procedure ContarSiCumpleDni (dni : integer; var cant : integer);
var
  dig : integer;
Begin
  dig := dni MOD 10;
  if (dig = 0) or (dig = 5) then
    cant := cant + 1;
End;

Procedure ActualizarMaximo (dni : integer; gasto : real; var MaxDni : integer; var MaxGasto : real);
Begin
  if (gasto > MaxGasto) then begin
    MaxDni := dni;
    MaxGasto := gasto;
  end;
End;

Procedure ProcesarTickets (L : ListaTickets; var vec : VectorVuelos; var dnimax : integer; var cant : integer);
var
  MaxGasto : real;
  dniAct : integer;
  gastos : real;
Begin
  cant := 0;
  MaxGasto := -1;
  while (L <> nil) do begin
    dniAct := L^.dato.dniCliente;
    gastos := 0;
    while (L <> nil) and (L^.dato.dniCliente = dniAct) do begin
      IncrementarContador (L^.dato, vec);
      gastos := gastos + L^.dato.valorTicket;
      ContarSiCumpleDni ( L^.dato.dniCliente, cant);
      L := L^.sig;
    end;
    ActualizarMaximo (dniAct,gastos,dnimax,MaxGasto);
  end;
End;

Function cantVuelosSuperanPasajeros ( valor : integer; vec : VectorVuelos) : integer;
var
  cant, i : integer;
Begin
  cant := 0;
  for i := 1 to MaxVuelo do begin
    if (vec[i] > valor) then
      cant := cant + 1;
  end;
  cantVuelosSuperanPasajeros := cant;
End;

// P.P
VAR
  Ltickets : ListaTickets;
  Vvuelos : VectorVuelos;
  dniMasGasto : integer;
  cantClientes : integer;
BEGIN
  //CargarTickets (Ltickets);     // se dispone 
  InicializarContadorPorVuelo (Vvuelos);
  ProcesarTickets (Ltickets,Vvuelos, dniMasGasto,cantClientes);
  writeln(cantVuelosSuperanPasajeros(50,Vvuelos));
  writeln('el dni del cliente que mas gasto : ',dniMasGasto);
  writeln('la cantidad de clientes con dni terminado en 0 o en 5',cantClientes);
END.