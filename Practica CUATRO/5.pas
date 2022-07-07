{ 5. Utilizando los módulos implementados en el ejercicio 3, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.  }

Program uno;
const
  dimF = 100;
  fin = 0;
type
  vectorNumeros = array[1..dimF] of integer;

// Procesos - Funciones

Procedure CargarVector(var vec : vectorNumeros; var dimL : integer);
var
  num : integer;
Begin
  dimL := 0;
  writeln('ingrese numero');
  readln(num);
  while (dimL < dimF) and (num <> fin) do begin
    dimL := dimL + 1;
    vec[dimL] := num;
    writeln('vuelva a ingresar un numero');
    readln(num);
  end;
End;

Procedure SacarMaximoyMinimoVector(vec : vectorNumeros; dimL : integer; var max,min,posMax,posMin : integer);
var
  i : integer;
Begin
  max := -1;
  min := 999;
  posMax := 0 ;  posMin := 0;
  for i := 1 to dimL do begin
    if (vec[i] > max) then begin
      max := vec[i];
      posMax := i;
    end;
    if (vec[i] < min) then begin
      min := vec[i];
      posMin := i;
    end;
  end;
End;

Procedure Intercambiar(var vec : vectorNumeros; posMax,posMin : integer);
var
  aux : integer;
Begin
  aux := vec[posMax];  // tengo que intercambiar las posiciones del vector, no los valores de las posiciones (?)
  vec[posMax] := vec[posMin]; //(?)
  vec[posMin] := vec[aux];  //(?)
End;

Procedure ImprimirVector(vec : vectorNumeros; dimL,max,min,posMax,posMin : integer);
var
  i : integer;
Begin
  writeln('“El elemento máximo ' , max , ' que se encontraba en la posición : ' , posMax); 
  writeln(' fue intercambiado con el elemento mínimo ' , min , ' que se encontraba en la posición : ' , posMin);
  for i := 1 to dimL do begin
    writeln('Posicion = ' , i);
    writeln(vec[i]);
  end;
End;

// P.P
VAR
  vec : vectorNumeros;
  dimL,max,min,posMax,posMin: integer;
BEGIN
  CargarVector(vec,dimL);
  SacarMaximoyMinimoVector(vec,dimL,max,min,posMax,posMin);
  Intercambiar(vec,posMax,posMin);
  ImprimirVector(vec,dimL,max,min,posMax,posMin);
END.