{TEMA B
ENUNCIADO : 
La fifa esta analizando la informacion de resultados en los 52 partidos del mundial de futbol italia 90.
Para ello, dispone de una estructura de datos con informacion de los goles realizados en todos los partidos.
De cada gol se conoce : el numero de partido (entre 1 y 52); el equipo o pais;
y el numero de camiseta del jugador que lo realizo. 
La informacion se encuentra ordenada por pais.
Realizar un programa que :

1. Invoque a un modulo que retorne informacion de los 52 partidos almacenada en una estructura adecuada.
De cada partido se conoce su numero (entre 1 y 52) ; nombre del estadio donde se jugó,
y nombre de los 2 paises que participaron.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

2. Invoque a un modulo que reciba la informacion de los goles y la informacion de los partidos, e informe :

a) Cantidad de partidos con mas de 5 goles

b) Nombre del pais con mayor cantidad de goles realizados en el estadio San Paolo por el jugador con camiseta numero 9.
/ Nombre del pais con mayor cantidad de goles realizados por el jugador con camiseta numero 9 o 7.  }

program uno;
const
  tope = 52;
type
  rango = 1..tope;
  gol = record
            numPartido : rango;
            Pais : string;
            numCamiseta : integer;
        end;
  Lista =^nodo;
  nodo = record
             dato : gol;
             sig : Lista;
         end;
  partido = record
                numP : rango;
                nomEstadio : string;
                pais1 : string;
                pais2 : string;
            end;
  vectorPartidos = array[rango] of partido;
  vectorContador = array[rango] of integer;

// PROCESOS

//Procedure LeerGol (var g : gol);                        // se dispone
//Procedure InsertarOrdenado (var L : Lista; g : gol);  // se dispone
//Procedure CargarListaGoles (var L : Lista);         // se dispone

Procedure LeerPartido (var p : partido);
Begin
  with p do begin
    writeln('ingrese numero de partido(1..18)');
    readln(numP);
    writeln('ingrese nombre de estadio');
    readln(nomEstadio);
    writeln('ingrese pais1');
    readln(pais1);
    writeln('ingrese pais2');
    readln(pais2);
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

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos);
var
  auxPais : string;
  i : rango;
  vecCon : vectorContador;  // vector contador para contar los goles x partido
  cantPartidos : integer;
  goles : integer;
  paisMax : string;
  max : integer;
Begin
  max := -1;
  paisMax := ' ';
  cantPartidos := 0;
  for i := 1 to tope do  // se inicializa el vector contador para empezar a contar en el 2do while
    vecCon[i] := 0;
  
  
  while (L <> nil) do begin
    auxPais := L^.dato.Pais;
    goles := 0;  // inicializo en cero la variable que va a sumar en el 2do while.
    while (L <> nil) and (auxPais = L^.dato.Pais) do begin
      vecCon[L^.dato.numPartido] := vecCon[L^.dato.numPartido] + 1;  // x cada numPartido elegido, sumo un partido jugado
      if (L^.dato.numCamiseta = 9) and (vecP[L^.dato.numPartido].nomEstadio = 'san pablo') then  {condiciones}
        goles := goles + 1; //suma los goles que cumplen ambas condiciones de arriba
      L := L^.sig;
    end;
    if (goles > max) then begin  // Proceso MaximoPaisGoles (sin modularizar)
      max := goles;         // se le asigna a max la cantidad de goles hasta el momento
      paisMax := auxPais;  // se le asigna a paisMax el pais que obtuvo mas goles hasta el momento 
    end;
  end;
  for i := 1 to tope do  // se evaluan todos los partidos para saber que partido tiene mas de 5 goles
    if(vecCon[i] > 5) then
      cantPartidos := cantPartidos + 1;
  writeln('cantidad de partidos con mas de 5 goles = ' , cantPartidos);  {informe inciso a}
  writeln('nom del pais con mayor cant.de goles realizados en el est. San Paolo por el jug. con camiseta num 9 = ' , paisMax); {informe inciso b}
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
BEGIN
  L := nil;
  //CargarListaGoles (L);  // se dispone
  CargarVectorPartidos (vecP);
  ProcesarInformacion (L,vecP);
END.