{               PARCIAL --- GOLES---
TEMA A 
ENUNCIADO :
La fifa está analizando la informacion de resultados en los 18 partidos del mundial de futbol uruguay 30.
Para ello, dispone de una estructura de datos con informacion de los goles realizados en todos los partidos.
De cada gol se conoce : el numero de partido (entre 1 y 18) y el equipo que lo realizó.
La informacion se encuentra ordenada por equipo.
Realizar un programa que :

1. Invoque a un moudulo que retorne informacion de los 18 partidos almacenada en una estructura adecuada.
De cada partido se conoce : su numero (entre 1 y 18), nombre del estadio donde se jugó 
y nombre de los equipos o paises que participaron.
Esta informacion se ingresa por teclado y se ingresa sin ningun orden en particular.

2. Invoque a un modulo que reciba la infomacion de los goles y la informacion de los partidos e informe :

a) Cantidad de partidos con menos de 5 goles.

b) Nombre del equipo con mayor cantidad de goles realizados en el estadio centenario.       }

program uno;
const
  tope = 18;
type
  rango = 1..tope;
  gol = record
            numPartido : rango;
            EquipoRe : string;
        end;
  Lista =^nodo;
  nodo = record
             dato : gol;
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

Procedure LeerGol (var g : gol);
Begin
  with g do begin
    writeln('ingrese el equipo que realizo el gol');
    readln(EquipoRe);
    if(EquipoRe <> 'z') then begin
      writeln('ingrese el numero de partido(1..18)');
      readln(numPartido);
    end;
  end;
End;
Procedure InsertarOrdenado (var L : Lista; g : gol);
var
  ant,act,aux : Lista;
Begin
  new(aux);
  aux^.dato := g;
  ant := L;
  act := L;
  while (act <> nil) and (act^.dato.EquipoRe < g.EquipoRe) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;
Procedure CargarListaGol (var L : Lista);
var
  g : gol;
Begin
  LeerGol(g);
  while (g.EquipoRe <> 'z') do begin        // se dispone la condicion de corte
    InsertarOrdenado(L,g);
    LeerGol(g);
  end;
End;
//-------------------------------------------------------------------------------
Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    writeln('ingrese numero de partido (1..18)');
    readln(numP);
    writeln('ingrese nombre de estadio');
    readln(nomEstadio);
    writeln('equipo 1');
    readln(equipo1);
    writeln('equipo2');
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

Procedure MaximoEquipoGoles (var equipoMax : string; UnEquipo : string; goles : integer; max : integer);
Begin
  if (goles > max) then begin
    max := goles;
    equipoMax := UnEquipo;
  end;
End;

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos);
var
  i : rango;
  auxEquipoRe : string;
  vecCon : vectorContador;
  cantPartidos : integer;
  goles : integer;
  equipoMax : string;
  max : integer;
Begin
  max := -1;
  equipoMax := ' ';
  cantPartidos := 0;
  InicializarVectorContador (vecCon);
  while (L <> nil) do begin
    auxEquipoRe := L^.dato.EquipoRe;
    goles := 0;
    while (L <> nil) and (auxEquipoRe = L^.dato.EquipoRe) do begin
      vecCon[L^.dato.numPartido] := vecCon[L^.dato.numPartido] + 1;
      if (vecP[L^.dato.numPartido].nomEstadio = 'centenario') then 
        goles := goles + 1;
      L := L^.sig;
    end;
    MaximoEquipoGoles (equipoMax,auxEquipoRe,goles,max);
  end;
  writeln('Nombre del equipo con mayor cantidad de goles realizados en el estadio centenario = ' , equipoMax);
  for i := 1 to tope do
    if (vecCon[i] < 5) then
      cantPartidos := cantPartidos + 1;
  writeln('Cantidad de partidos con menos de 5 goles = ' , cantPartidos);
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
BEGIN
  L := nil;
  //CargarListaGol (L);  // se dispone
  CargarVectorPartidos (vecP);
  ProcesarInformacion (L,vecP);
END.