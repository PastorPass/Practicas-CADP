{  PARCIAL ---- VENTA DE ENTRADAS----
TEMA E 
ENUNCIADO : 
La fifa esta analizando la informacion de las entradas vendidas para los 38 partidos del mundial de futbol ARGENTINA 78 
Para ello, dispone de una estructura de datos con informacion de todas las entradas vendidas.
De cada entrada, se conce : el numero de partido (entre 1 y 38) y el pais de origen del comprador.
La informacion se encuentra ordenada por el pais de origen del comprador.
Realizar un programa que :

1. Invoque a un modulo que lea la informacion de los 38 partidos y la almacene en una estructura adecuada.
De cada partido se conoce : su numero( entre 1 y 38); nombre del estadio donde se jugó
y nombre de los 2 equipos que participaron.
Esta informacion se ingresa por teclado y se ingresa sin ningun orden en particular.

2. Invoque a un modulo que reciba la informacion de las entradas y la informacion de los partidos , e informe :
a) Cantidad de partidos con menos de 30.000 entradas vendidas

b) Nombre del pais con mayor cantidad de entradas adquiridas para partidos en los que juega su equipo.      }

program uno;
const
  tope = 38;
type
  rango = 1..tope;
  entrada = record
                numPartido : rango;
                paisOrigen : string;
            end;
            
  Lista = ^nodo;
  nodo = record
             dato : entrada;
             sig : Lista;
         end;
  partido = record
                numP : rango;
                nomEstadio : string;
                equipo1 : string;
                equipo2 : string;
            end;
  vectorPartidos = array[rango] of partido;
  vectorContador = array[rango] of integer;  

// PROCESOS

Procedure LeerEntrada (var e : entrada);                      // se dispone
Begin
  with e do begin
    writeln('ingrese el pais origen del comprador');
    readln(paisOrigen);
    if (paisOrigen <> 'z') then begin
      writeln('ingrese un numero de partido (1..38)');
      readln(numPartido);
    end;
  end;
End;
Procedure InsertarOrdenado (var L : Lista; e : entrada);     // se dispone
var
  act,ant,aux : Lista;
Begin
  new(aux);
  aux^.dato := e;
  act := L;
  ant := L;
  while (act <> nil) and (act^.dato.paisOrigen < e.paisOrigen) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;
Procedure CargarListaEntradas (var L : Lista);  // se dispone
var
  e : entrada;
Begin
  LeerEntrada(e);
  while (e.paisOrigen <> 'z') do begin   // corte de control dispuesto por mi
    InsertarOrdenado(L,e);
    LeerEntrada(e);
  end;
End;

Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    writeln('ingrese un numero de partido (1..38)');
    readln(numP);
    writeln('ingrese el nombre del estadio');
    readln(nomEstadio);
    writeln('ingrese el equipo1');
    readln(equipo1);
    writeln('ingrese el equipo2');
    readln(equipo2);
  end;
End;

Procedure CargarVectorPartidos (var vecP : vectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to tope do begin
    LeerPartido (p);
    vecP[p.numP] := p;
  end;
End;

Procedure InicializarVectorContador (var vecCon : vectorContador);
var
  i : rango;
Begin
  for i := 1 to tope do 
    vecCon[i] := 0;
End;

Procedure PartidosMenos30milEntradasV (vecCon : vectorContador);
var
  i : rango;
  cantPartidos : integer;
Begin
  cantPartidos := 0;
  for i := 1 to tope do 
    if (vecCon[i] < 30000) then
      cantPartidos := cantPartidos + 1;
  writeln('cantidad de partidos con menos de 30000 entradas vendidas = ' , cantPartidos);
End;

Procedure MaximoPais (var paisMax : string; unPais : string; cantidadEntradas : integer; var max : integer);
Begin
  if(cantidadEntradas > max) then begin
    max := cantidadEntradas;
    paisMax := unPais;
  end;
End;

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos);
var
  auxPaisOrigen : string;
  vecCon : vectorContador;
  paisMax : string;
  entradasAdquiridas : integer;
  max : integer;
Begin
  paisMax := ' ';
  max := -1;
  InicializarVectorContador (vecCon);
  while (L <> nil) do begin
    auxPaisOrigen := L^.dato.paisOrigen;
    entradasAdquiridas := 0;
    while (L <> nil) and (auxPaisOrigen = L^.dato.paisOrigen) do begin
      vecCon[L^.dato.numPartido] := vecCon[L^.dato.numPartido] + 1;
      if (L^.dato.paisOrigen = vecP[L^.dato.numPartido].equipo1) or (L^.dato.paisOrigen = vecP[L^.dato.numPartido].equipo2) then
        entradasAdquiridas := entradasAdquiridas + 1;
      L := L^.sig;
    end;
    MaximoPais(paisMax,auxPaisOrigen,entradasAdquiridas, max);
  end;
  PartidosMenos30milEntradasV (vecCon);
  writeln('nom del pais con mayor cant. de entradasAdquiridas para partidos en los que juega su equipo = ' , paisMax);
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
BEGIN
  L := nil;
  CargarListaEntradas (L);  // se dispone
  CargarVectorPartidos (vecP);
  ProcesarInformacion (L,vecP);
END.