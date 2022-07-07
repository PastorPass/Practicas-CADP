{  PARCIAL ---- VENTA DE ENTRADAS----
TEMA D 
ENUNCIADO :
La fifa esta analizando la informacion de las entradas vendidas para los 52 partidos del mundial de futbol Italia 90. 
Para ello, se dispone de una estructura de datos con informacion de todas las entradas vendidas. 
De cada entrada se conoce el numero de partido (entre 1 y 52) y el pais de origen del comprador
La informacion se encuentra ordenada por el pais de origen del comprador.
Realizar un programa que :

1. Invoque a un modulo que lea la informacion de los 52 partidos y la almacene en una estructura adecuada.
De cada partido se  conoce su numero (entre 1 y 52) ; nombre del estadio donde se jugó,
y nombre de los 2 equipos que participaron.
Esta informacion se ingresa por teclado y se ingresa sin orden en particular.

2. Invoque a un modulo que reciba la informacion de las entradas y la informacion de los partidos e informe :

a) Cantidad de partidos con mas de 30.000 entradas vendidas

b) Nombre del pais con mayor cantidad de entradas adquiridas para partidos en los que no juega su equipo.   }

program uno;
const
  tope = 52;
type
  rango = 1..tope;
  entrada = record
                numPartido : rango;
                paisOrigen : string;
            end;
            
  Lista =^nodo;
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

//Procedure LeerEntrada (var e : entrada);                     // se dispone
//Procedure InsertarOrdenado (var L : Lista ; e : entrada);    // se dispone
//Procedure CargarListaEntradas(var L : Lista);              // se dispone

Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    writeln('ingrese un numero de partido (1..52)');
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
  p : partido;
  i : rango;
Begin
  for i := 1 to tope do begin
    LeerPartido(p);
    vecP[p.numP] := p;      // esta informacion se ingresa sin ningun orden en particular
  end;
End;

Procedure InicializarVectorContador (var vecCon : vectorContador);
var
  i : rango;
Begin
  for i := 1 to tope do
    vecCon[i] := 0;
End;

Procedure PartidosMas30milEntradasV (vecCon : vectorContador);
var
  i : rango;
  cantPartidos : integer;
Begin
  cantPartidos := 0;
  for i := 1 to tope do
    if (vecCon[i] > 30000) then
      cantPartidos := cantPartidos + 1;
  writeln('cantidad de partidos con mas de 30000 entradas vendidas = ' , cantPartidos);
End;

Procedure MaximoNombre (var paisMax : string; cantiEntradas : integer; unPais : string; var max : integer);
Begin
  if (cantiEntradas > max) then begin
    max := cantiEntradas;
    paisMax := unPais;
  end;
End;

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos);
var
  auxPaisOrigen : string;
  vecCon : vectorContador;
  paisMax : string;
  max : integer;
  entradasAdquiridas : integer;
Begin
  max := -1;
  paisMax := ' ';
  InicializarVectorContador (vecCon);
  while (L <> nil) do begin
    auxPaisOrigen := L^.dato.paisOrigen;
    entradasAdquiridas := 0;
    while (L <> nil) and (auxPaisOrigen = L^.dato.paisOrigen) do begin
      vecCon[L^.dato.numPartido] := vecCon[L^.dato.numPartido] + 1;
      if (L^.dato.paisOrigen <> vecP[L^.dato.numPartido].equipo1) and (L^.dato.paisOrigen <> vecP[L^.dato.numPartido].equipo2) then
        entradasAdquiridas := entradasAdquiridas + 1;
      L := L^.sig;
    end;
    MaximoNombre (paisMax,entradasAdquiridas,auxPaisOrigen, max)
  end;
  PartidosMas30milEntradasV (vecCon); // inciso a
  writeln('nombre del pais con mayor cantidad de entradasAdquiridas para partidos en los que no juega su equipo : ' , paisMax);  // inciso b
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
BEGIN
  L := nil;
 // CargarListaEntradas(L);  // se dispone
  CargarVectorPartidos (vecP);
  ProcesarInformacion (L,vecP)
END.