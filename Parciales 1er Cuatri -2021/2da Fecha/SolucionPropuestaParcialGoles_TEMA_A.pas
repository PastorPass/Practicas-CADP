{               PARCIAL --- GOLES---
SOLUCION PROPUESTA 
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
  MaxPartidos = 18;
type
  rangoPartidos = 1..MaxPartidos;
  registroGol = record
                    partido : rangoPartidos;
                    equipo : string;
                end;
  Lista =^nodo;
  nodo = record
             dato : registroGol;
             sig : Lista;
         end;
  registroPartido = record
                        partido : rangoPartidos;
                        estadio : string;
                        equipo1 : string;
                        equipo2 : string;
                    end;
  vectorPartidos = array[rangoPartidos] of registroPartido;
  vectorContador = array[rangoPartidos] of integer;  // inciso 2.a)

// PROCESOS

Procedure LeerPartido (var p : registroPartido);
Begin
  with p do begin
    writeln('ingrese numero de partido (1..18)');
    readln(partido);
    writeln('ingrese nombre estadio');
    readln(estadio);
    writeln('equipo1');
    readln(equipo1);
    writeln('equipo2');
    readln(equipo2);
  end;
End;

Procedure CargarPartidos (var v : vectorPartidos);
var
  i : rangoPartidos;
  p : registroPartido;
Begin
  for i := 1 to MaxPartidos do begin
    LeerPartido(p);
    v[p.partido] := p;
  end;
End;

Function PocosGoles (v : vectorContador) : integer;
var
  i : rangoPartidos;
  cant : integer;
Begin
  cant := 0;
  for i := 1 to MaxPartidos do 
    if (v[i] < 5) then
      cant := cant + 1;
  PocosGoles := cant;
End;

Procedure ProcesarInformacion (L : Lista; v : vectorPartidos);
var
  goles : vectorContador;
  equipoActual, equipoMax : string;
  golesActual, golesMax : integer;
  i : rangoPartidos;
Begin
  for i := 1 to MaxPartidos do
    goles[i] := 0;
  
  golesMax := -1;
  while (L <> nil) do begin
    equipoActual := L^.dato.equipo;
    golesActual := 0;
    while (L <> nil) and (equipoActual = L^.dato.equipo) do begin
      goles[L^.dato.partido] := goles[L^.dato.partido] + 1;
      if (v[L^.dato.partido].estadio = 'centenario') then
        golesActual := golesActual + 1;
      L := L^.sig;
    end;
    if (golesActual > golesMax) then begin
      golesMax := golesActual;
      equipoMax := equipoActual;
    end;
  end;
  writeln('Cantidad de partidos con menos de 5 goles = ' , PocosGoles(goles));
  writeln('Nombre del equipo con mayor cantidad de goles realizados en el estadio centenario = ' , equipoMax);
End;

// P.P
VAR
  L : Lista;
  v : vectorPartidos;
BEGIN
  L := nil;
  //CargarGoles (L); // se dispone
  CargarPartidos (v);
  ProcesarInformacion (L,v);
END.