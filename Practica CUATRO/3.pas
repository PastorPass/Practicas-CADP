{ 3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.  }
Program uno;
const
  dimF = 100;  // asumo la dimF en 100
  corte = -1;  // asumo una condicion de corte
type
  vector = array[1..dimF] of integer;
//Procesos - Funciones
Procedure CargarVector (var vec : vector; var dimL : integer);
var
  num : integer;
Begin
  dimL := 0;
  writeln('ingrese un numero');
  readln(num);
  while (dimL < dimF) and (num <> corte) do begin
    dimL := dimL + 1;
    vec[dimL] := num;
    writeln('vuelva a ingresar un numero');
    readln(num);
  end;
End;

Procedure ImprimirVectorV1 (vec : vector; dimL : integer);  // inciso a)
var
  i : integer;
Begin
  writeln('------impresion del vector desde la primera posición hasta la última------');
  for i := 1 to dimL do 
    writeln(vec[i]);
End;

Procedure ImprimirVectorV2 (vec : vector; dimL : integer);  // inciso b)
var
  i : integer;
Begin
  writeln('------impresion del vector desde la última posición hasta la primera------');
  for i := dimL downto 1 do 
    writeln(vec[i]);
End;

Procedure ImprimirVectorV3 (vec : vector; dimL : integer);  // inciso c)
var
  i : integer;
Begin
  writeln('impresion del vector desde la mitad (dimL DIV 2) hacia la primera posición');
  writeln('y desde la mitad más uno hacia la última posición.');
  dimL := dimL DIV 2;  // divido la dimL en 2
  for i := dimL downto 1 do   // recorro desde la mitad de la dimL hasta la 1er posicion del vector
    writeln(vec[i]);
  for i := dimL + 1 to (dimL*2) do  // recorro desde la mitad de la dimL +1 hasta la dimL originalmente cargada (ultima posicion)
    writeln(vec[i]);
End;

Function cumpleRango (x,y,dimL : integer) : boolean;
Begin
  cumpleRango := (x <= dimL) and (y <= dimL);
End;

Procedure ImprimirVectorV4 (vec : vector; x, y : integer);  // inciso d)
var
  i : integer;
Begin
  if (x < y) then  // si x es menor que y
    for i := x to y do  // se imprime desde la posicion mas baja (x), hasta la posicion alta (y) --TO--
      writeln(vec[i])
  else              // sino
    for i := x downto y do  // se imprime desde la posicion mas alta (x), hasta la posicion mas baja (y) --DOWNTO--
      writeln(vec[i]);
End;

Procedure ImprimirVectorV1Q1 (vec : vector; pos1,pos2 : integer);
var
  i : integer;
Begin
  if (pos1 < pos2) then  // va a imprimir solo si la 1er posicion es menor que la 2da posicion 
    for i := pos1 to pos2 do 
      writeln(vec[i]);
End;

Procedure ImprimirVectorV2Q2 (vec : vector; pos1,pos2 : integer);
var
  i : integer;
Begin
  if (pos1 > pos2) then  //  va a imprimir solo si la 1er posicion es mayor que la 2da posicion
    for i := pos1 downto pos2 do 
      writeln(vec[i]);
End;

Procedure ImprimirVectorV3Q1 (vec : vector; pos1,pos2 : integer);  // inciso c)
var
  i : integer;
Begin
  if (pos1 > pos2) then begin
    pos1 := pos1 DIV 2;
    for i := pos1 downto pos2 do   // recorro desde la mitad de la dimL hasta la 1er posicion del vector
      writeln(vec[i]);
    for i := pos1 + 1 to (pos1*2) do // recorro desde la mitad de la dimL +1 hasta la dimL originalmente cargada (ultima posicion)
      writeln(vec[i]);
  end
  else
    if (pos2 > pos1) then begin
      pos2 := pos2 DIV 2; // divido la posicion maxima leida en 2
      for i := pos2 downto pos1 do   // recorro desde la mitad de la posMax hasta la posMin leida del vector
        writeln(vec[i]);
      for i := pos2 + 1 to (pos2*2) do  // recorro desde la mitad de la posMax +1 hasta la posMax originalmente leida (ultima posicion)
        writeln(vec[i]);
    end;
End;

//P.P
VAR
  dimL,pos1,pos2 : integer;
  vec : vector;
BEGIN
  CargarVector(vec,dimL);
  ImprimirVectorV1(vec,dimL);
  ImprimirVectorV2(vec,dimL);
  ImprimirVectorV3(vec,dimL);
  writeln('ingrese posicion uno');
  readln(pos1);
  writeln('ingrese posicion dos');
  readln(pos2);
  
  if(cumpleRango(pos1,pos2,dimL)) then begin
    writeln('-------impresion del vector V4-------');
    ImprimirVectorV4 (vec,pos1,pos2);
    {ImprimirVectorV1Q1 (vec,pos1,pos2);  // inciso D
    ImprimirVectorV2Q1 (vec,pos1,pos2);  // inciso D
    ImprimirVectorV3Q1 (vec,pos1,pos2);  // inciso D    }
  end;
END.