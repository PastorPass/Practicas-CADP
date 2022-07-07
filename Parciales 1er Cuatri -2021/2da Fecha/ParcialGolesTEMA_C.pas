{PARCIAL -- GOLES
TEMA C 
ENUNCIADO :
La UEFA está analizando la informacion de resultados en los 51 partidos del campeonato de futbol EUROCOPA 2021.
Para ello, dispone de una estructura de datos con informacion de los goles realizados en todos los partidos.
De cada gol se conoce : el numero de partido (1..51) y el equipo que lo realizó.
La informacion se encuentra ordenada por equipo.
Realizar un programa que :

1. Invoque a un modulo que retorne informacion de los 51 partidos almacenada en una estructura adecuada.
De cada partido se conoce : su numero (1..51) , nombre del estadio donde se jugó 
y nombre de los dos equipos o paises que participaron.
Esta informacion se ingresa por teclado y se ingresa sin ningun orden en particular.

2. Invoque a un modulo que reciba la informacion de los goles y la informacion de los partidos
e informe el nombre del equipo con mayor cantidad de goles realizados en el estadio San pablo.  }

program uno;
const
  tope = 52;
type 
  rango = 1..tope;
  gol = record
            numPartido : rango;
            equipoRe : string;  // la informacion se encuentra ordenada x equipo
        end;
  Lista =^nodo;
  nodo = record
             dato : gol;
             sig : Lista;
         end;
  partido = record
                numP : rango;  // se ingresa sin ningun orden en particular
                nomEstadio : string;
                equipo1 : string;
                equipo2 : string;
            end;
  vectorPartidos = array[rango] of partido;


// PROCESOS

//Procedure LeerGol(var g : gol);  // se dispone
//Procedure InsertarOrdenado (var L : Lista; g : gol);  // se dispone
//Procedure CargarListaGol (var L : Lista);  // se dispone

Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    writeln('ingrese numero de partido(1..51)');
    readln(numP);
    writeln('ingrese nombre de estadio');
    readln(nomEstadio);
    writeln('ingrese equipo1');
    readln(equipo1);
    writeln('ingrese equipo2');
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
    vecP[p.numP] := p;    // esta informacion se ingresa sin ningun orden en particular
  end;
End;

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos);
var
  auxEquipoRE : string;
  goles : integer;
  equipoMax : string;
  max : integer;
Begin
  max := -1;
  equipoMax := ' ';
  while (L <> nil) do begin
    auxEquipoRE := L^.dato.equipoRe;
    goles := 0;
    while (L <> nil) and (auxEquipoRE = L^.dato.equipoRe) do begin
      if (vecP[L^.dato.numPartido].nomEstadio = 'san pablo') then
        goles := goles + 1;
      L := L^.sig;
    end;
    if (goles > max) then begin
      max := goles;
      equipoMax := auxEquipoRE;
    end;
  end;
  writeln('el nom. del equipo con mayor cant. de goles realizados en el estadio San pablo  = ' , equipoMax);{informe punto 2}
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
BEGIN
  L := nil;
  //CargarListaGol(L);  // se dispone
  CargarVectorPartidos(vecP);
  ProcesarInformacion (L,vecP);
END.