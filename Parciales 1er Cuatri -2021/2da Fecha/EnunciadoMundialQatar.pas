{ENUNCIADO 
El comite organizador del mundial Qatar 2022 , esta analizando la informacion de las entradas vendidas para los 48 partidos del torneo.
Para ello, dispone de una estructura de datos con informacion de todas las ventas de entradas.
De cada venta se conoce el codigo de partido ( entre 1 y 48) , codigo de cliente y la cantidad de entradas vendidas.
Esta informacion no se encuentra ordenada por ningun criterio
Realizar un programa que :
a) Invoque a un modulo que lea la informacion de los 48 partidos y la almacene en una estructura de datos adecuada.

De cada partido se conoce su codigo ( entre 1 y 48); nombre del estadio donde se juega, la capacidad maxima del estadio y la hora de inicio.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

b) Invoque a un modulo que reciba la informacion de las ventas de entradas y la informacion de los partidos y retorne :
i) Una lista con los codigos de partidos ya tienen todas las entradas vendidas

ii) Cantidad de ventas de mas de 5 entradas cuyo codigo del cliente termina en 10 o en 20       }

program uno;
type
  rango = 1..48;
  venta = record
             codPartido : rango;
             codCliente : integer;
             cantVendidas : integer;
          end;
  Lista = ^nodo;        // COMO NO SE CUANTAS VENTAS SE REALIZARON SE DISPONE UNA LISTA 
  nodo = record
            dato : venta;
            sig : Lista;
         end;
//--------------------------registro para el vector---------------------------------------------------------       
  partido = record
                codP : rango;
                nomEstadio : string[20];
                capMax : integer;
                hora : string[20];
            end;
  VectorPartidos = array[rango] of partido;
// --------------------------implementando nueva lista para el inciso b)-----------------------------------------  
  ListaNue = ^nodoNue;
  nodoNue = record
                dato : integer;
                sig : ListaNue;
            end;
// PROCESOS

{Procedure CargarListaVentas ( var L : Lista);       // se DISPONE
Begin
  Leerventa (v);
  while (...)
    AgregarAdelante(L,v);
    Leerventa(v);
  end;
End;}

Procedure LeerPartido ( var p : partido);
Begin
  with p do begin
    writeln('ingrese codigo de partido (1..48)');
    readln(codP);
    writeln('ingrese estadio');
    readln(nomEstadio);
    writeln('ingrese capacidad maxima');
    readln (capMax);
    writeln('ingrese hora');
    readln(hora);
  end;
End;

Procedure CargarVectorPartidos ( var vec : VectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to 48 do begin
    LeerPartido (p);
    vec[i] := p;
  end;
End;

Procedure ListaNuevaAgregarAdelante ( var pri : ListaNue; unCod : integer);
var
  aux : ListaNue;
Begin
  new(aux);
  aux^.dato := unCod;
  aux^.sig := pri;
  pri := aux;
End;

Function cumpleCodCliente (Uncod : integer) : boolean;
Begin
  cumpleCodCliente := (Uncod MOD 100 = 10) or (Uncod MOD 100 = 20)
End;

Procedure ProcesarInformacion (L : Lista; vec : VectorPartidos; var cantVentas : integer; var pri : ListaNue);
Begin
  while ( L <> nil) do begin
    if(L^.dato.cantVendidas = vec[L^.dato.codPartido].capMax) then
      ListaNuevaAgregarAdelante (pri,L^.dato.codPartido);
    if (L^.dato.cantVendidas > 5 ) and (cumpleCodCliente(L^.dato.codCliente)) then
      cantVentas := cantVentas + 1;
    L := L^.sig;
  end;
End;

Procedure ImprimirListaCreada (pri : ListaNue);
Begin
  while (pri <> nil) do begin
    writeln('codigo de partido = ' , pri^.dato);
    pri := pri^.sig;
  end;
End;

// P.P
VAR
  L : Lista;
  vec : VectorPartidos;
  pri : ListaNue;
  cantVentas : integer;
BEGIN
  cantVentas := 0;
  L := nil;
  pri := nil;
  //CargarListaVentas (L); // se dispone junto con los otros dos modulos, el AgregarAdelante y el leerventa, tambien la condicion de corte
  CargarVectorPartidos (vec);
  ProcesarInformacion (L,vec,cantVentas,pri);
  ImprimirListaCreada(pri);
  writeln('Cantidad de ventas de mas de 5 entradas cuyo codigo del cliente termina en 10 o en 20 : ' , cantVentas);
END.