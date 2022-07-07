{ TEMA 2 -PARCIAL PRIMERA FECHA
Una empresa de fletes de larga distancia desea analizar los servicios realizados por sus camiones .  De cada servicio se conoce el codigo de
camion (entre 200 y 255), nombre de la provincia de origen , nombre de la provincia de destino, cantidad de kilometros recorridos y dni del 
cliente.
La informacion de los servicios se encuentra disponible en una estructura de datos adecuada, y esta ordenada por provincia de origen    // se dispone el proceso de cargarLista , el proceso de LeerServicio, y el de AgregarAdelante o atras, (no importa como se agrege) 

Realizar un programa que procese la informacion de los servicios e informe :
a) Cantidad de camiones que recorrieron mas de 5000 kilometros entre todos sus viajes.

b) Nombre de la provincia desde donde partieron mas viajes 

c) Cantidad de clientes con dni impar cuyos viajes fueron de la misma provincia.        }

program uno;
type
  rango = 200..255;
  servicio = record
                codCamion : rango;
                provOrigen : string[20];
                provDestino : string[20];
                kmRecorridos : integer;
                dniCliente : integer;
             end;
             
  Lista =^nodo;
  nodo = record
            dato : servicio;
            sig : Lista;
         end;
         
  VectorViajes = array[rango] of real;      // inciso a) vector Contador que contiene en cada posicion un viaje realizado medido en km,( real)
  
// PROCESOS

Procedure InicializarVectorContadorDeViajes ( var vecCon : VectorViajes);
var
  i : integer;
Begin
  for i := 200 to 255 do
    vecCon[i] := 0;
End;

Procedure RecorrerLista(L : Lista);
var
  cantCamiones : integer;
  AuxProvOrigen : string;
  vecCon : VectorViajes;
Begin
  InicializarVectorContadorDeViajes(vecCon);
  while (L <> nil)
    AuxProvOrigen := L^.dato.provOrigen;
    while (L <> nil) and (AuxProvOrigen = L^.dato.provOrigen) do begin
      vecCon[L^.dato.codCamion] := vecCon[L^.dato.codCamion] + L^.dato.kmRecorridos;    // guarda en el vector contador de viajes, en cada posicion guarda los km recorridos por cada camion que viaja en el mismo pais de destino y origen
      
      L := L^.sig;
    end;
End;

//P.P
VAR
  L :Lista;
BEGIN
  L := nil;
  CargarServicios(L);  // se dispone
  RecorrerLista(L);
END.