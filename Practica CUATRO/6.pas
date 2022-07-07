{ 6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones. }

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

END.