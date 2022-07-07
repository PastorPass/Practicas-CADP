{ 7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8  }

Program uno;
const
  fin = -1;
type
  vectorOcurrencias = array[0..9] of integer;
// P.P

Procedure InicializarVector(var vec : vectorOcurrencias);
var
  i : integer;
Begin
  for i := 0 to 9 do
    vec[i] := 0;
End;

Procedure ProcesarNumero (num : integer; var vec: vectorOcurrencias);
var
  resto : integer;
Begin
  while (num <> 0) do begin
    resto := num MOD 10;
    vec[resto] := vec[resto] + 1;
    num := num DIV 10;
  end;
End;

Procedure DigMasLeido(vec : vectorOcurrencias);
var
  i,max,pos : integer;
Begin
  max := -1;
  pos := 0;
  for i := 0 to 9 do begin
    if (vec[i] > max) then begin
      max := vec[i];
      pos := i;
    end;
  end;
  writeln('el digito mas leido fue el digito ' , pos , ' , con : ' , max , ' ocurrencias');
End;

Procedure ImprimirVector(vec : vectorOcurrencias);
var
  i : integer;
Begin
  for i := 0 to 9 do
    writeln('numero ', i ,' : ', vec[i] , ' veces');
End;

Procedure SinOcurrencias (vec : vectorOcurrencias);
var
  i : integer;
Begin
  for i := 0 to 9 do
    if (vec[i] = 0) then
      writeln('numero ' , i , ' : sin ocurrencias');
End;

VAR
  num : integer;
  vec : vectorOcurrencias;
BEGIN
  InicializarVector(vec);
  writeln('ingrese un numero');
  readln(num);
  while (num <> fin) do begin
    ProcesarNumero(num,vec);
    writeln('vuelva a ingresar un numero');
    readln(num);
  end;
  ImprimirVector(vec);  // se puede hacer un solo recorrido e informar (*) 
  DigMasLeido(vec);  // *
  SinOcurrencias(vec);  // *
END.