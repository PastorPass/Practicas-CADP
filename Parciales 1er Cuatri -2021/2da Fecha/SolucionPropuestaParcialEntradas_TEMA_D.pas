{ PARCIAL--- VENTA DE ENTRADAS---
TEMA D  --> SOLUCION PROPUESTA
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

b) Nombre del pais con mayor cantidad de entradas adquiridas para partidos en los que no juega su equipo.  }

program uno;
const
  maxPartidos = 52;
type
  rangoPartidos = 1..maxPartidos;
  tventa = record
                partido : rangoPartidos;
                Pais : string;
           end;
  Lista =^nodo;
  nodo = record
             dato : tventa;
             sig : Lista;
         end;
  tpartido = record
                 codigo : rangoPartidos;
                 estadio : string;
                 equipo1 : string;
                 equipo2 : string;
             end;
  vectorPartidos = array[rangoPartidos] of tpartido;
  vectorContador = array[rangoPartidos] of integer;

// PROCESOS

Procedure LeerVenta (var t : tventa);  // se dispone
Begin
  with t do begin
    writeln('ingrese el pais de origen del comprador');
    readln (Pais);
    if (Pais <> 'z') then begin
      writeln('ingrese el numero de partido (1..52');
      readln(partido);
    end;
  end;
End;

Procedure AgregarAdelante (var L : Lista; t : tventa);  // se dispone
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := t;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarVentas (var L : Lista);   // se dispone
var
  t : tventa;
Begin
  LeerVenta (t);
  while (t.Pais <> 'z') do begin
    AgregarAdelante (L,t);
    LeerVenta(t);
  end;
End;

Procedure LeerPartido (var p : tpartido);  // punto a)
Begin
  with p do begin
    writeln('ingrese codigo(1..38)');
    readln(codigo);
    writeln('nombre del estadio');
    readln(estadio);
    writeln('ingrese equipo1');
    readln(equipo1);
    writeln('ingrese equipo2');
    readln(equipo2);
  end;
End;

Procedure CargarPartidos (var v : vectorPartidos);
var
  i : rangoPartidos;
  p : tpartido;
Begin
  for i := 1 to maxPartidos do begin
    LeerPartido(p);
    v[p.codigo] := p;  // esta informacion se ingresa sin ningun orden en particular
  end;
End;

Procedure ActualizarMaximos (paisActual : string; cant : integer; var paisMax : string; var max : integer);
Begin
  if (cant > max) then begin
    max := cant;
    paisMax := paisActual;
  end;
End;

Function pocasVentas (v2 : vectorContador) : integer;
var
  i : rangoPartidos;
  cantMas30mil : integer;
Begin
  cantMas30mil := 0;
  for i := 1 to maxPartidos do 
    if (v2[i] > 30000) then
      cantMas30mil := cantMas30mil + 1;
  pocasVentas := cantMas30mil;
End;

Procedure ProcesarVentas (L : Lista; v : vectorPartidos);
var
  i : rangoPartidos;
  v2 : vectorContador;
  paisActual,paisMaximo : string;
  EntradasPaisActual,EntradasPaisMax : integer;
Begin
  for i := 1 to maxPartidos do 
    v2[i] := 0;
  EntradasPaisMax := -1;
  while (L <> nil) do begin
    paisActual := L^.dato.Pais;
    EntradasPaisActual := 0;
    while (L <> nil) and (paisActual = L^.dato.Pais) do begin
      v2[L^.dato.partido] := v2[L^.dato.partido] + 1;
      if (L^.dato.pais <> v[L^.dato.partido].equipo1) and (L^.dato.pais <> v[L^.dato.partido].equipo2) then
        EntradasPaisActual := EntradasPaisActual + 1;
      L := L^.sig;
    end;
    ActualizarMaximos (paisActual,EntradasPaisActual,paisMaximo,EntradasPaisMax);
  end;
  writeln('Cantidad de partidos con mas de 30.000 entradas vendidas ' , pocasVentas(v2));
  writeln(' Nombre del pais con mayor cantidad de entradas adquiridas para partidos en los que no juega su equipo = ' , paisMaximo);
End;

//P.P
VAR
  L : Lista;
  v : vectorPartidos;
BEGIN
  L := nil;
  CargarVentas(L);  // se dispone
  CargarPartidos (v);
  ProcesarVentas (L,v);
END.