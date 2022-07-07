{ 1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un
valor n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente    }
Program uno;
const
  dimF = 500;
  fin = -1;  // Condicion de corte
type
  rango = 1..dimF;
  vectorValores = array[rango] of integer; // valores de numeros enteros

// Procesos-Funciones

Procedure CargarVector(var vec : vectorValores; var dimL : integer);
var
  num : integer;
Begin
  dimL := 0;
  writeln('ingrese num');
  readln(num);
  while (dimL < dimF) and (num <> fin) do begin
    dimL := dimL + 1;
    vec[dimL] := num;
    writeln('vuelva a ingresar numero');
    readln(num);
  end;
End;

Function BuscarElemEnVector(vec : vectorValores; dimL,elem : integer) : boolean;  // Tipo Vector : Operacion de Busqueda Lineal(elementos sin orden)
var
  pos : integer;
  ok : boolean;
Begin
  pos := 1;
  ok := false;
  while (pos <= dimL ) and (NOT ok) do begin
    if (vec[pos] = elem) then
      ok := true
    else
      pos := pos + 1;
  end;
  if (ok = false) then
    BuscarElemEnVector := false;
  BuscarElemEnVector := ok;
End;

Function BuscarElemEnVectorOrdenado (vec : vectorValores; dimL,elem : integer) :boolean;  // Tipo Vector : Operacion de Busqueda Lineal o secuencial(los elementos estan ordenados)
var
  pos : integer;
Begin
  pos := 1;
  while (pos <= dimL) and (elem > vec[pos]) do  // vector ordenado de menor a mayor (de manera ascendente)
    pos := pos + 1;
  if (pos > dimL) OR (elem < vec[pos]) then
    pos := 0;
  if (pos = 0) then
    BuscarElemEnVectorOrdenado := false
  else
    BuscarElemEnVectorOrdenado := true;
End;

// P.P
VAR
  vec : vectorValores;
  dimL,elem : integer;
  ok : boolean;
BEGIN
  CargarVector(vec,dimL);
  writeln('ingrese un valor a buscar en el vector');
  readln(elem);
  {if(BuscarElemEnVector(vec,dimL,elem)) then  //     INCISO a)
    writeln('se encontro el elemento ' , elem , ' en el vector')
  else
    writeln('no se encontro el elemento');  }
    
  if (BuscarElemEnVectorOrdenado(vec,dimL,elem)) then
    writeln('se encontro el elemento ' , elem , ' en el vector')
  else
    writeln('no se encontro el elemento');
END.