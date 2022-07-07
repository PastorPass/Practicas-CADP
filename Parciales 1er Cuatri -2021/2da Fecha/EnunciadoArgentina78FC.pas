{ ENUNCIADO 
La fifa esta analizando la informacion de las entradas vendidas para los 38 partidos del mundial de futbol ARGENTINA 78 
Para ello, dispone de una estructura de datos con informacion de todas las entradas vendidas.
De cada entrada, se conoce : el numero de partido (entre 1 y 38) y el pais de origen del comprador.
La informacion se encuentra ordenada por el pais de origen del comprador.
Realizar un programa que :
1. Invoque a un modulo que lea la informacion de los 38 partidos y la almacene en una estructura adecuada.
De cada partido se conoce : su numero( entre 1 y 38); nombre del estadio donde se jugó y nombre de los 2 equipos que participaron.
Esta informacion se ingresa por teclado y se ingresa sin ningun orden en particular.

2. Invoque a un modulo que reciba la informacion de las entradas y la informacion de los partidos , e informe :
a) Cantidad de partidos con menos de 30.000 entradas vendidas

b) Nombre del pais con mayor cantidad de entradas adquiridas para partidos en los que juega su equipo.  }

program uno;
type
  rango = 1..38;
  entrada = record
                numPartido : rango;
                paisOrigen : string[20];
            end;
  Lista =^nodo;
  nodo = record
             dato : entrada;
             sig : Lista;
         end;

  partido = record
                numP : rango;
                nomEstadio : string[20];
                nomDosEquipos : string[20];
            end;
  vectorPartidos = array[rango] of partido;
  vectorContador = array[rango] of integer;
// PROCESOS

{Procedure CargarListaEntradas (var L : Lista);      // se dispone
Begin       
  LeerEntrada(e);       // se dispone
  while (...) do begin
    InsertarOrdenado(L,e);      // se dispone
    LeerEntrada(e);             // se dispone
  end;
End;    }

Procedure InicializarVector ( var vecCon : vectorContador);
var
  i : rango;
Begin
  for i := 1 to 52 do
    vecCon := 0;
End;

Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    readln(numP);
    readln(nomEstadio);
    readln(nomDosEquipos);
  end;
End;

Procedure CargarVectorPartidos (var vec : vectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to 38 do begin
    LeerPartido(p);
    vec[i] := p;
  end;
End;

Procedure PaisMaximo (vendidas : integer; auxpaisOrigen : string; nomMax : string);
var
  max : integer;
Begin
  max := -1;
  if (vendidas > max) then begin
    max := vendidas;
    nomMax := auxpaisOrigen;
  end;
End;

Procedure Partidos30k (vecCon : vectorContador);
var
  cantPartidos : integer;
  i : rango;
Begin
  for i := 1 to 52 do 
    if (vecCon[i] < 30000) then
      cantPartidos := cantPartidos + 1;
  writeln('la cantidad de partidos con menos de 30000 entradas vendidas es de : ' , cantPartidos);
End;

Procedure ProcesarInformacion (L : Lista; vec : vectorPartidos; var vecCon : vectorContador);
var
  auxpaisOrigen : string;
  cantPartidos : integer;
  nomMax : string;
  vendidas : integer;
Begin
  nomMax := ' ';
  cantPartidos := 0;
  while (L <> nil) do begin
    auxpaisOrigen := L^.dato.paisOrigen;
    vendidas := 0;
    while (L <> nil) and (auxpaisOrigen = L^.dato.paisOrigen) do begin
      vecCon[L^.dato.numPartido] := vecCon[L^.dato.numPartido] + 1;
      vendidas := vendidas + 1;
      L := L^.sig;
    end;
    if (p.nomDosEquipos = vec[L^.dato.numPartido].nomDosEquipos) then
      PaisMaximo (vendidas,auxpaisOrigen,nomMax);
  end;
  Partidos30k(vecCon);
  writeln('Nombre del pais con mayor cantidad de entradas adquiridas para partidos en los que juega su equipo' , nomMax);
End;

// P.P
VAR
  L : Lista;
  vec : vectorPartidos;
  vecCon : vectorContador;
BEGIN
  L := nil;
 // CargarListaEntradas (L);      // se dispone
 InicializarVector ( vecCon);
  CargarVectorPartidos (vec);
  ProcesarInformacion(L,vec,vecCon);
END.