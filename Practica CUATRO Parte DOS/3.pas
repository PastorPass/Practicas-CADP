{ 3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida
sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez  }
Program uno;
const
  dimF = 200;
  fin = 0;  // condicion de corte
type
  rango = 1..dimF;
  rangoDias = 1..31;
  viaje =  record
               dia : rangoDias;
               montoDinero : real;
               distanciaRecorrida : real;
           end;
  VectorViajes = array[rango] of viaje;
 // VectorDistanciasR = array[rangoDias] of real;  // vector que acumula las distancias de los dias 1 al 31 (vector contador)
  VectorViajesXdia = array[rangoDias] of integer;  // vector que acumula la cantidad de viajes realizados x cada dia del mes (vector contador)

// Procesos-Funciones

Procedure LeerViaje(var j : viaje);
Begin
  with j do begin
    writeln('ingrese la distancia recorrida por el camion');
    readln(distanciaRecorrida);
    if (distanciaRecorrida <> fin) then begin
      writeln('ingrese dia');
      readln(dia);
      writeln('ingrese monto de dinero transportado');
      readln(montoDinero);
    end;
  end;
End;

Procedure CargarVectorViajes( var vec : VectorViajes; var dimL : integer);
var
  j : viaje;
Begin
  dimL := 0;
  LeerViaje(j);
  while (dimL < dimF) and (j.distanciaRecorrida <> fin) do begin
    dimL := dimL + 1;
    vec[dimL] := j;
    LeerViaje(j);
  end;
End;

Procedure InicializarVectorContador(var vecCon : VectorViajesXdia);
var
  i : rangoDias;
Begin
  for i := 1 to 31 do 
    vecCon[i] := 0;
End;

Procedure UnMinimo(Undia : integer; unaDist,unMonto : real; var min,distanciaMin : real; var posDiaMin : integer);
Begin
  if (unMonto < min) then begin
    min := unMonto;
    distanciaMin := unaDist;
    posDiaMin := Undia;
  end;
End;

Procedure ImprimirVectorContadorDias(vecCon : VectorViajesXdia);
var
  i : rangoDias;
Begin
  writeln('----------CANTIDAD DE VIAJES REALIZADOS CADA DIA DEL MES---------');
  for i := 1 to 31 do
    writeln('dia : ' , i , ' ,cantidad de viajes = ' , vecCon[i]);
End;

Procedure RecorrerVectoreInformar(vec : VectorViajes; dimL : integer);
var
  i : rango;
  sumaMontos,min,distanciaMin : real;
  vecCon : VectorViajesXdia;
  posDiaMin : integer;
Begin
  sumaMontos := 0;
  min := 999; distanciaMin := 9999;  posDiaMin := 0;  // min = guarda el monto minimo de dinero recaudado x cada viaje (hasta el momento)
  InicializarVectorContador(vecCon);
  for i := 1 to dimL do begin
    sumaMontos := sumaMontos + vec[i].montoDinero; // inciso b.1
    //vecCon[vec[i].dia] := vecCon[vec[i].dia] + vec[i].distanciaRecorrida;
    UnMinimo(vec[i].dia,vec[i].distanciaRecorrida,vec[i].montoDinero,min,distanciaMin,posDiaMin);  // inciso b.2
    vecCon[vec[i].dia] := vecCon[vec[i].dia] + 1;  // inciso b.3
  end;
  //UnMinimoEnVectorContador(vecCon,min,);
  writeln('Monto promedio transportado de los viajes realizados = ' , sumaMontos / dimL:2:2); // informe inciso b.1
  writeln('----------INFORME VIAJE QUE TRANSPORTO MENOS DINERO---------');  // informe inciso b.2
  writeln('DINERO = ' , min:2:2);  // informe inciso b.2
  writeln('DISTANCIA RECORRIDA = ' , distanciaMin:2:2);  // informe inciso b.2
  writeln('El día del mes en que se realizó el viaje que transportó menos dinero = ' , posDiaMin); // informe inciso b.2
  writeln();
  ImprimirVectorContadorDias(vecCon);  // informe inciso b.3
End;

Procedure RecorrerVectoryEliminar (var vec : VectorViajes; var dimL : integer; cienKM : real; var exito : boolean);
  Function BuscarPosElem(vec : VectorViajes; dimL : integer; cienKM : real) : integer;
  var
    pos : integer;
    ok : boolean;
  Begin
    ok := false;
    pos := 1;_
    while (pos <= dimL) and (NOT ok) do begin
      if (vec[pos].distanciaRecorrida = cienKM) then
        ok := true
      else
        pos := pos + 1;
    end;
    if (ok = false) then
      pos := 0;
    BuscarPosElem := pos;
  End;
  
  Procedure BorrarPosModif (var vec : VectorViajes; var dimL : integer; pos : integer);
  var
    i : integer;
  Begin
    for i := pos+1 to dimL do
      vec[i-1] := vec[i];
    dimL := dimL - 1;
  End;
  
var
  pos : integer;
Begin
  exito := false;
  pos := BuscarPosElem(vec,dimL,cienKM);
  while (pos <> 0) do begin  // no es un if, ya que debe iterar x cada posicion del vector en donde vec[pos].km = 100;
    BorrarPosModif(vec,dimL,pos);
    exito := true;
    pos := BuscarPosElem(vec,dimL,cienKM);  // vuelve a 'leer' con una nueva busqueda de la posicion en el vector(hasta que sea 0)
  end;
End;

// P.P
VAR
  vec : VectorViajes;
  dimL,i : integer;
  exito : boolean;
BEGIN
  CargarVectorViajes(vec,dimL); // inciso a)
  RecorrerVectoreInformar(vec,dimL); // inciso b)
  RecorrerVectoryEliminar(vec,dimL,100,exito);  // inciso c)
  if(exito) then  
    writeln('Se borraron todos los viajes con 100km recorridos')
  else 
    writeln ('No habia viajes con 100km');
  for i:=1 to dimL do begin {imprime vector, era para verificar si elimino los viajes}
      writeln('distancia Recorrida ' , vec[i].distanciaRecorrida:2:2);
      writeln('montoDinero ' ,vec[i].montoDinero:2:2);
      writeln('dia ',vec[i].dia);
  end;
END.  