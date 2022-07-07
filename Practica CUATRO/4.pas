{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector   }

Program uno;
const
  dimF = 100; // se dispone 100
type
  vector = array[1..dimF] of integer;  // se dispone
  
// Procesos- Funciones
Procedure CargarVector (var vec : vector; var dimL : integer);  // se dispone
var
  num : integer;
Begin
  dimL := 0;
  writeln('ingrese un numero');
  readln(num);
  while (dimL < dimF) and (num <> -1) do begin
    dimL := dimL + 1;
    vec[dimL] := num;
    writeln('vuelva a ingresar un numero');
    readln(num);
  end;
End;

Function BuscarNumEnVector (vec : vector; dimL,x : integer) : integer;  // inciso a)
var
  pos : integer;
  ok : boolean;
Begin
  ok := false;
  pos := 1;
  while (pos <= dimL) and (not ok) do begin // mientras que la posicion deseada no supere la dimL y mientras no sea encontrado el elemento
    if (x = vec[pos]) then 
      ok := true
    else
      pos := pos + 1;
  end;
  if (ok = false) then
    pos := -1;
  BuscarNumEnVector := pos;
End;

Function cumpleRango (pos1,pos2 : integer) : boolean;
Begin
  cumpleRango := ((pos1 <= dimF) and (pos2 <= dimF)) and ((pos1 >= 1) and (pos2 >=1));
End;

Procedure Intercambio (var vec : vector; pos1,pos2 : integer);  // inciso b)
var
  aux : integer;  // auxiliar que sirve para copiar el valor de una posicion (para no sobreescribir los valores)
Begin
  aux := vec[pos2];  // hago una copia del valor de una posicion y lo guardo en aux (para no perder una posicion)
  vec[pos2] := vec[pos1];  // guardo el valor de vec [pos1]  a vec[pos2], como perdi el valor de vec[pos2], porque se sobreescribio, uso una copia : aux
  vec[pos1] := aux;
End;

Procedure ImprimirIntercambio (vec : vector; dimL : integer);
var
  i : integer;
Begin
  writeln('---------VECTOR---------');
  for i := 1 to dimL do
    writeln(vec[i]);
End;

Function sumaVector (vec : vector; dimL : integer) : integer;  // inciso c)
var
  i,suma : integer;
Begin
  suma := 0;
  for i := 1 to dimL do 
    suma := suma + vec[i];
  sumaVector := suma;
End;

Function promedio (vec : vector; dimL,sumaTotal : integer) : real;  // inciso d)  --> Un promedio siempre debe ser un real
Begin
  promedio := sumaTotal / dimL; // el valor promedio de los elementos del vector
End

Function ElementoMaximo(vec : vector) : integer;  // inciso e)
var
  posMax,max,i : integer;
Begin
  max := -1;  posMax := -1;
  for i := 1 to dimF do begin
    if (vec[i] > max) then begin
      max := vec[i];
      posMax := i;
    end;
  end;
  ElementoMaximo := posMax; //retorna la posición del mayor elemento del vector
End;

Function elementoMinimo(vec : vector; dimL : integer) : integer;  // inciso f)
var
  posMin,min,i : integer;
Begin
  min := 999;  posMin := -1;
  for i := 1 to dimF do begin
    if (vec[i] > min) then begin
      min := vec[i];
      posMin := i;
    end;
  end;
  elementoMinimo := posMin; //retorna la posicion del menor elemento del vector
End;