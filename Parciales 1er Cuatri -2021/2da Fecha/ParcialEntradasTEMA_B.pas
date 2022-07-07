{ PARCIAL ---- VENTA DE ENTRADAS-----
TEMA B 
ENUNCIADO  : 		
El comite organizador del mundial Qatar 2022 , esta analizando la informacion de las entradas vendidas
para los 48 partidos del torneo.
Para ello, dispone de una estructura de datos con informacion de todas las ventas de entradas.
De cada venta se conoce el codigo de partido ( entre 1 y 48) , codigo de cliente y la cantidad de entradas vendidas.
Esta informacion no se encuentra ordenada por ningun criterio
Realizar un programa que :

a) Invoque a un modulo que lea la informacion de los 48 partidos y la almacene en una estructura de datos adecuada.
De cada partido se conoce su codigo ( entre 1 y 48); nombre del estadio donde se juega,
la capacidad maxima del estadio y la hora de inicio.
Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.

b) Invoque a un modulo que reciba la informacion de las ventas de entradas y la informacion de los partidos y retorne :
i) Una lista con los codigos de partidos ya tienen todas las entradas vendidas

ii) Cantidad de ventas de mas de 5 entradas cuyo codigo del cliente termina en 10 o en 20       }

program uno;
const
  tope = 48;
type
  rango = 1..tope;
  venta = record
             codPartido : rango;
             codCliente : integer;
             entradasV : integer;
          end;
          
  Lista =^nodo;
  nodo = record
             dato : venta;
             sig : Lista;
         end;
  partido = record
                 codP : rango;
                 nomEstadio : string;
                 capMax : integer;
                 horaInicio : integer;
            end;

  vectorPartidos = array[rango] of partido;
  vectorContador = array[rango] of integer;
  
  ListaNue = ^nodoNue;
  nodoNue = record 
             dato : rango;
             sig : ListaNue;
         end;
// PROCESOS

//Procedure LeerVenta(var t : venta);     // se dispone
//Procedure AgregarAdelante(var L : Lista; T : venta);    // se dispone
//Procedure CargarListaVentas(var L : Lista);     // se dispone

Procedure LeerPartido(var p : partido);
Begin
  with p do begin
    writeln('ingrese codigo de partido');
    readln(codP);
    writeln('ingrese nombre del estadio');
    readln(nomEstadio);
    writeln('ingrese capacidad maxima de personas en el estadio');
    readln(capMax);
    writeln('ingrese hora de inicio del partido');
    readln(horaInicio);
  end;
End;

Procedure CargarVectorPartidos(var vecP : vectorPartidos);
var
  i : rango;
  p : partido;
Begin
  for i := 1 to tope do begin
    LeerPartido(p);
    vecP[p.codP] := p;  // esta informacion se ingresa sin ningun orden en particular
  end;
End;

Procedure InicializarVectorContador (var vecCon : vectorContador);
var
  i : rango;
Begin
  for i := 1 to tope do
    vecCon[i] := 0;
End;

Procedure AgregarAdelante(var L2 : ListaNue; num : rango);
var
  aux : ListaNue;
Begin
  new(aux);
  aux^.dato := num;
  aux^.sig := L2;
  L2 := aux;
End;

Procedure ProcesarInformacion (L : Lista; vecP : vectorPartidos; var L2 : ListaNue;var cantVentas : integer);
var
  vecCon : vectorContador;
  i : rango;
Begin
  cantVentas := 0;
  InicializarVectorContador(vecCon);
  while(L <> nil) do begin
    vecCon[L^.dato.codPartido] := vecCon[L^.dato.codPartido] + L^.dato.entradasV;   // b.i)
    if((L^.dato.codCliente MOD 100 = 10) or (L^.dato.codCliente MOD 100 = 20)) and (L^.dato.entradasV > 5) then
      cantVentas := cantVentas + 1;
    L := L^.sig;
  end;
  for i := 1 to tope do
    if (vecCon[i] = (vecP[i].capMax)) then   // b.i)
      AgregarAdelante(L2,i);
End;

// P.P
VAR
  L : Lista;
  vecP : vectorPartidos;
  L2 : ListaNue;
  cantVentas : integer;
BEGIN
  L := nil;
  L2 := nil;
  //CargarListaVentas(L);  // se dispone
  CargarVectorPartidos(vecP);
  ProcesarInformacion(L,vecP,L2,cantVentas);
  writeln('Cantidad de ventas de mas de 5 entradas cuyo codigo del cliente termina en 10 o en 20 = ' , cantVentas);
END.