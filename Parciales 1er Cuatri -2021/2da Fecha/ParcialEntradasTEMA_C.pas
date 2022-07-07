{ PARCIAL ---- VENTA DE ENTRADAS-----
TEMA C 
ENUNCIADO :
El comite organizador del campeonato de futbol eurocopa 2021 está analizando  
la informacion de las entradas vendidas para sus 51 partidos.
Para ello, dispone de una estructura de datos con informacion de todas las ventas de entradas. 
De cada venta se conoce : el codigo de partido (entre 1 y 51) ; 
codigo del cliente y la cantidad de entradas vendidas. 
Esta informacion no se encuentra ordenada por ningun criterio.
Realizar un programa que :

a) Invoque a un modulo que lea la informacion de los 51 partidos
y la almacene en una estructura de datos adecuada.
De cada partido se conoce : su codigo (entre 1 y 51) , nombre del estadio donde se juega,
la capacidad maxima del estadio y la hora de inicio.
Esta informacion se ingresa por teclado y se ingresa sin ningun orden en particular.

b) Invoque a un modulo que reciba la informacion de las ventas de entradas
y la informacion de los partidos, y retorne una lista con los codigos de partidos que ya tienen todas las entradas vendidas.}

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
  vectorContador = array[rango] of integer;
  
  ListaNue =^nodoNue;
  nodoNue = record 
                dato : rango;
                sig : ListaNue;
            end;
// PROCESOS

Procedure LeerVenta(var t : venta);     // se dispone
Begin
  with t do begin
    writeln('ingrese un codigo de cliente');
    readln(codCliente);
    if (codCliente <> -1) then begin
      writeln('ingrese un codigo de partido(1..51)');
      readln(codPartido);
      writeln('ingrese la cantidad de entradas vendidas');
      readln(entradasV);
    end;
  end;
End;
Procedure AgregarAdelante (var L : Lista; t : venta);  // se dispone
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := t;
  aux^.sig := L;
  L := aux;
End;
Procedure CargarListaVentas(var L : Lista);  // se dispone
var
  t : venta;
Begin
  LeerVenta(t);
  while (t.codCliente <> -1) do begin
    AgregarAdelante(L,t);
    LeerVenta(t);
  end;
End;

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
    writeln('ingrese un codigo de partido(1..51)');
    readln(codP);
    writeln('ingrese el nombre del estadio');
    readln(nomEstadio);
    writeln('ingrese la capacidad maxima de personas en el estadio');
    readln(capMax);
    writeln('ingrese la hora de inicio del partido');
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
    vecP[p.codP] := p;
  end;
End;

Procedure AgregarAdelante( var L2 : ListaNue; num : rango);
var
  aux : ListaNue;
Begin
  new(aux);
  aux^.dato := num;
  aux^.sig := L2;
  L2 := aux;
End;

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos; var L2 : ListaNue);
var
  i : rango;
  vecCon : vectorContador;
Begin
  InicializarVectorContador(vecCon);
  while (L <> nil) do begin
    vecCon[L^.dato.codPartido] := vecCon[L^.dato.codPartido] + L^.dato.entradasV;
    L := L^.sig;
  end;
  for i := 1 to tope do 
    if (vecCon[i] = vecP[i].capMax) then
      AgregarAdelante (L2,i);
End;

Procedure ImprimirListaNueva (L2 : ListaNue);
Begin
  while (L2 <> nil) do begin
    writeln('codigos de partidos que ya tienen todas las entradas vendidas');
    writeln(L2^.dato);
    L2 := L2^.sig;
  end;
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
  L2 : ListaNue;
BEGIN
  L := nil;
  L2 := nil;
  CargarListaVentas(L);
  CargarVectorPartidos(vecP);
  ProcesarInformacion (L,vecP,L2);
  ImprimirListaNueva (L2);
END.