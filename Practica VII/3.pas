{ 3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.  }
Program uno;
type
  viaje = record
                numViaje : integer;
                codAuto : string[30];  // ordenada x codigo de auto, corte de control
                dirOrigen : string[30];
                dirDestino : string[30];
                kmRecorridos : real;
          end;
  Lista = ^nodo;
  nodo = record
            dato : viaje;
            sig : Lista;
         end;

//Procesos-Funciones

Procedure LeerViaje(var v : viaje);
Begin
  with v do begin
    writeln('ingrese cantidad de km recorridos');
    readln(kmRecorridos);
    if (kmRecorridos <> 0) then begin
      writeln('ingrese numero de viaje');
      readln(numViaje);
      writeln('ingrese codigo de auto');
      readln(codAuto);
      writeln('ingrese direccion origen');
      readln(dirOrigen);
      writeln('ingrese direccion destino');
      readln(dirDestino);
    end;
  end;
End;

Procedure AgregarOrdenado(var L : Lista; v : viaje);
var
  act,ant,nue : Lista;
Begin
  new(nue);
  nue^.dato := v;
  act := L;
  ant := L;
  while (act <> nil) and (act^.dato.codAuto < v.codAuto) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then
    L := nue
  else
    ant^.sig := nue;
  nue^.sig := act;
End;

Procedure CargarListaViajes(var L : Lista);  // se dispone
var
  v : viaje;
Begin
  LeerViaje(v);
  while(v.kmRecorridos <> 0) do begin
    LeerViaje(v);  // se dispone
    AgregarOrdenado(L,v);  // se dispone
  end;
End;

Procedure DosMaximos(unosKM : real;unCodAuto : string; var cod1,cod2 : string; var max1,max2 : real);
Begin
  if (unosKM > max1) then begin
    max2 := max1;
    cod2 := cod1;
    max1 := unosKM;
    cod1 := unCodAuto;
  end
  else
    if (unosKM > max2) then begin
      max2 := unosKM;
      cod2 := unCodAuto;
    end;
End;

Procedure AgregarOrdenado2(var L2 : Lista; v : viaje);
var
  act,ant,nue : Lista;
Begin
  new(nue);
  nue^.dato := v;
  act := L2;
  ant := L2;
  while (act <> nil) and (act^.dato.numViaje < v.numViaje) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then
    L2 := nue
  else
    ant^.sig := nue;
  nue^.sig := act;
End;

Procedure RecorrerListaeInformar(L : Lista;var L2 : Lista);
var
  auxCodAuto : string;
  sumaTotKM,max1,max2 : real;
  cod1,cod2 : string;
Begin
  max1 := -1;  max2 := -1;  cod1 := 'zzz' ;  cod2 := 'zzz';
  while (L <> nil) do begin
    auxCodAuto := L^.dato.codAuto;
    sumaTotKM := 0;
    while (L <> nil) AND (auxCodAuto = L^.dato.codAuto) do begin
      sumaTotKM := sumaTotKM + L^.dato.kmRecorridos;
      if(L^.dato.kmRecorridos > 5000) then
        AgregarOrdenado2(L2,L^.dato);
      L := L^.sig;
    end;
    DosMaximos(sumaTotKM,auxCodAuto,cod1,cod2,max1,max2);
  end;
  writeln('los dos códigos de auto que más kilómetros recorrieron : ' , cod1, ' y ' , cod2);
End;

// P.P
VAR
  L,L2 : Lista;
BEGIN
  L := nil;  L2 := nil;
  CargarListaViajes(L);  // Se dispone
  RecorrerListaeInformar(L,L2);
END.