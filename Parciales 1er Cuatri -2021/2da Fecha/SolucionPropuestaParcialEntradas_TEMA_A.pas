{ PARCIAL--- VENTA DE ENTRADAS---
TEMA A --> SOLUCION PROPUESTA
ENUNCIADO :
El comite organizador del torneo de futbol Copa America 2021 , esta analizando la informacion 
de las entradas vendidas para los 38 partidos del torneo.
Para ello, dispone de una estructura de datos con informacion de todas las ventas de entradas.
De cada venta se conoce el codigo de partido ( entre 1 y 38) , codigo de cliente y la cantidad de entradas vendidas.
Esta informacion no se encuentra ordenada por ningun criterio
Realizar un programa que :
a) Invoque a un modulo que lea la informacion de los 38 partidos y la almacene en una estructura de datos adecuada. 
De cada partido se conoce su codigo ( entre 1 y 38); nombre del estadio donde se juega, 
la capacidad maxima del estadio y la hora de inicio.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

b) Invoque a un modulo que reciba la informacion de las ventas de entradas y la informacion de los partidos y retorne :
i) Una lista con los codigos de partidos que superan el 50 % de la capacidad del estadio

ii) Cantidad de ventas de menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39.        }

program uno;
const
  maxPartidos = 38;
type
  rangoPartidos = 1..maxPartidos;
  tventa = record
                partido : rangoPartidos;
                cliente : integer;
                cantEntradas : integer;
           end;
  Lista =^nodo;
  nodo = record
             dato : tventa;
             sig : Lista;
         end;
  tpartido = record
                 codigo : rangoPartidos;
                 estadio : string;
                 capacidad : integer;
                 horaInicio : string;
             end;
  vectorPartidos = array[rangoPartidos] of tpartido;
  vectorContador = array[rangoPartidos] of integer;
  
  ListaCodigos = ^registroCodigos;
  registroCodigos = record
                        num : rangoPartidos;
                        sig : ListaCodigos;
                    end;

// PROCESOS

Procedure LeerVenta (var t : tventa);  // se dispone
Begin
  with t do begin
    writeln('ingrese un numero de cliente');
    readln(cliente);
    if (cliente <> -1) then begin
      writeln('ingrese la cantidad de entradas compradas');
      readln(cantEntradas);
      writeln('ingrese el numero de partido (1..38');
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
  while (t.cliente <> -1) do begin
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
    writeln('capacidad');
    readln(capacidad);
    writeln('hora de inicio');
    readln(horaInicio);
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

Procedure AgregarAdelante (var L2 : ListaCodigos; num : rangoPartidos); // punto b
var
  aux : ListaCodigos;
Begin
  new(aux);
  aux^.num := num;
  aux^.sig := L2;
  L2 := aux;
End;

Procedure ProcesarVentas (L : Lista; v : vectorPartidos; var codigos : ListaCodigos; var cantVentas : integer);//inciso b
var
  i : rangoPartidos;
  fin  : integer;
  v2 : vectorContador;
Begin
  for i := 1 to maxPartidos do 
    v2[i] := 0;
  cantVentas := 0;
  while ( L <> nil) do begin
    v2[L^.dato.partido] := v2[L^.dato.partido] + L^.dato.cantEntradas;
    fin := L^.dato.cliente MOD 100;
    if (fin >= 30) and (fin <= 39) and (L^.dato.cantEntradas < 5) then
      cantVentas := cantVentas + 1;
    L := L^.sig;
  end;
  for i := 1 to maxPartidos do  // vamos a ver cuantos partidos superan el 50% de la capacidad
    if (v2[i] > (v[i].capacidad/2)) then
      AgregarAdelante(codigos,i);
End;


//P.P
VAR
  L : Lista;
  v : vectorPartidos;
  L2 : ListaCodigos;
  cantVentas : integer;
BEGIN
  L := nil;
  L2 := nil;
  CargarVentas(L);  // se dispone
  CargarPartidos (v);
  ProcesarVentas (L,v,L2,cantVentas);
  writeln('Cantidad de ventas de menos de 5 entradas cuyo codigo del cliente termina entre 30 y 39 = ' , cantVentas);
END.