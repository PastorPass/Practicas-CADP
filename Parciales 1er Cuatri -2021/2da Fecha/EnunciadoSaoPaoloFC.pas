{ENUNCIADO      -- no se si esta bien--
La fifa esta analizando la informacion de resultados en los 52 partidos del mundial de futbol italia 90.
Para ello, dispone de una estructura de datos con informacion de los goles realizados en todos los partidos.
De cada gol se conoce : el numero de partido (entre 1 y 52); el equipo o pais; y el numero de camiseta del jugador que lo realizo. 
La informacion se encuentra ordenada por pais.
Realizar un programa que :
1. Invoque a un modulo que retorne informacion de los 52 partidos almacenada en una estructura adecuada.
De cada partido se conoce su numero (entre 1 y 52) ; nombre del estadio donde se jugó, y nombre de los 2 paises que participaron.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

2. Invoque a un modulo que reciba la informacion de los goles y la informacion de los partidos, e informe :

a) Cantidad de partidos con mas de 5 goles

b) Nombre del pais con mayor cantidad de goles realizados en el estadio San Paolo por el jugador con camiseta numero 9 o 7. }

program uno;
type
  rango = 1..52;
  subrango = 1..99;
  gol = record
            numPartido : rango;
            pais : string[20];
            camiseta : subrango;
        end;
  Lista =^nodo;
  nodo = record
             dato : gol;
             sig : Lista;
         end;
//----------------------------------------------------------------------------
  partido = record
                 numP : rango;
                 nomEstadio : string[20];
                 nomDosPaises : string[20];
            end;

  vectorPartidos = array[rango] of partido;

// PROCESOS

Procedure InsertarOrdenado (var L :Lista; g : gol);
var
  ant,act,aux : Lista;
Begin
  new(aux);
  aux^.dato := g;
  ant := L;
  act := L;
  while (act <> nil) and (act^.dato.pais < g.pais) do begin
    ant := act;
    act := act^.sig;
  end;
  if  (ant = act) then
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

{Procedure CargarListaGoles ( var L : Lista);        // se dispone
Begin
  LeerGol(g);       // se dispone
  while (...) do begin
    InsertarOrdenado(L,g)       // se dispone
    LeerGol(g);     // se dispone
  end;
End;        }

Procedure LeerPartido ( var p : partido);
Begin
  with p do begin
    readln(numP);
    readln(nomEstadio);
    readln(nomDosPaises);
  end;
End;

Procedure CargarVectorPartidos  ( var vec : vectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to 52 do begin
    LeerPartido (p);
    vec[i] := p;
  end;
End;

Procedure ImprimirVectorPartidos (vec : vectorPartidos);
var
  i : rango;
Begin
  for i := 1 to 52 do begin
    writeln(vec[i].numP);
    writeln(vec[i].nomEstadio);
    writeln(vec[i].nomDosPaises);
  end;
End;

Procedure PaisMaximo (auxPais : string; var nomMax : string; goles : integer);
var
  max : integer;
Begin
  max := -1;
  if (goles > max) then begin
    max := goles;
    nomMax := auxPais;
  end;
End;

Procedure ProcesarInformacion ( L : Lista; vec : vectorPartidos);
var
  auxPais : string;
  goles : integer;
  cantPartidos : integer;
  nomMax : string;
Begin
  nomMax := ' ';
  cantPartidos := 0;
  while (L <> nil) do begin
    goles := 0;
    auxPais := L^.dato.pais;
    while (L <> nil) and (auxPais = L^.dato.pais) do begin
      goles := goles + 1;
      if (goles > 5) then
        cantPartidos := cantPartidos + 1;
      L := L^.sig;
    end;
    if (vec[L^.dato.numPartido].nomEstadio = 'paolo') and ((L^.dato.camiseta = 9) or (L^.dato.camiseta = 7)) then
      PaisMaximo(auxPais,nomMax,goles);
  end;
  writeln('el Nombre del pais con mayor cantidad de goles realizados ... es = ' , nomMax);
End;

// P.P
VAR
  L : Lista;
  vec : vectorPartidos;
BEGIN
  L := nil;
  //CargarListaGoles(L)       // se dispone junto al LeerGol , InsertarOrdenado y la condicion de corte del while
  CargarVectorPartidos (vec);
  ImprimirVectorPartidos (vec);
  ProcesarInformacion (L,vec);
END.