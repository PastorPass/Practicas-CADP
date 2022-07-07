{ 12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados.
De cada dispositivo se conoce la versión de Android instalada, el tamaño de la pantalla (en pulgadas) 
y la cantidad de memoria RAM que posee (medida en GB). 

La información disponible se encuentra ordenada por versión de Android. 
Realizar un programa que procese la información disponible de todos los dispositivos e informe:

a. La cantidad de dispositivos para cada versión de Android.  <-- tomo solo valores enteros para las versiones
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.  }
Program uno;
const
  fin = -1; // condicion de corte inventado para la cantidad de memoria RAM
  ultVerAndroid = 12;
type 
  rango = 1..ultVerAndroid;
  dispositivo = record
                    verAndroid : integer;  // ordenada x version de Android
                    tamPantalla : real;  // en pulgadas
                    memRam : integer;  // medida en GB
                end;
  Lista = ^nodo;
  nodo = record
            dato : dispositivo;
            sig : Lista;
         end;

  vectorAndroids = array[rango] of integer;  // vector contador para contar la cant de dispositivos x version de Android

//PROCESOS-FUNCIONES

Procedure LeerDispositivo(var d : dispositivo);  // MODULO QUE SE DISPONE
Begin
  with d do begin
    writeln('ingrese la cantidad de memoria RAM que posee el dispositivo');
    readln(memRam);
    if (memRam <> fin) then begin
      writeln('ingrese la version de android del dispositivo');
      readln(verAndroid);
      writeln('ingrese el tamaño en pulgadas de la pantalla del dispositivo');
      readln(tamPantalla);
    end;
  end;
End;

Procedure AgregarOrdenado(var L : Lista; d : dispositivo);  // MODULO QUE SE DISPONE
var
  ant,act,nue : Lista;
Begin
  new(nue);
  nue^.dato := d;
  act := L;
  ant := L;
  while (act <> nil) AND (act^.dato.verAndroid < d.verAndroid) do begin
    ant:= act;
    act := act^.sig;
  end;
  if (ant = act) then
    L := nue
  else
    ant^.sig := nue;
  nue^.sig := act;
End;

Procedure CargarLista(var L : Lista);  // MODULO QUE SE DISPONE
var
  d : dispositivo;
Begin
  LeerDispositivo(d);
  while (d.memRam <> fin) do begin 
    AgregarOrdenado(L,d);
    LeerDispositivo(d);
  end;
End;

Procedure InicializarVectorContador(var vecCon : vectorAndroids);
var
  i : rango;
Begin
  for i := 1 to ultVerAndroid do
    vecCon[i] := 0;
End;

Procedure ImprimirVectorContador(vecCon : vectorAndroids);
var
  i : rango;
Begin
  for i := 1 to ultVerAndroid do 
    writeln('VERSION DE ANDROID NRO : ' , i , ',CANTIDAD DE DISPOSITIVOS = ' , vecCon[i]);
End;

Procedure RecorrerListaeInformar(L : Lista);
var
  vecCon : vectorAndroids;
  cantDisp,totalDisp : integer;
  sumaTamPantallas : real;
Begin
  cantDisp := 0;  totalDisp := 0;
  sumaTamPantallas := 0;
  InicializarVectorContador(vecCon);  // para el inciso a)
  while (L <> nil) do begin
    vecCon[L^.dato.verAndroid] := vecCon[L^.dato.verAndroid] + 1;  // inciso a)
    if (L^.dato.memRam > 3) AND ((L^.dato.tamPantalla >= 0) and (L^.dato.tamPantalla <= 5)) then  // inciso b)
      cantDisp := cantDisp + 1;
    totalDisp := totalDisp + 1;  // totalDisp = cantidad total de dispositivos leidos  --> inciso c)
    sumaTamPantallas := sumaTamPantallas + L^.dato.tamPantalla;  // sumaTamPantallas = suma todos los tamaños de la pantalla de todos los dispositivos --> inciso c)
    L := L^.sig;
  end;
  writeln('----------INFORME GENERAL----------');
  ImprimirVectorContador(vecCon);  // informe inciso a)
  writeln('cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas = ' , cantDisp);  //informe inciso b)
  writeln('El tamaño promedio de las pantallas de todos los dispositivos = ' , sumaTamPantallas / totalDisp:2:2);  // informe inciso c)
End;

//P.P
VAR
  L : Lista;
BEGIN
  L := nil;
  CargarLista(L); // SE DISPONE
  RecorrerListaeInformar(L);
END.