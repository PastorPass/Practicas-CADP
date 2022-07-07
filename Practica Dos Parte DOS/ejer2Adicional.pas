{2. Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de
números, la suma y el producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)  }

Program uno;

type
  rango = 1..10;

// FUNCIONES
Function SumaNumeros (num1,num2 : integer) : integer;
var
  i,suma : integer;
Begin
  suma := 0;
  if(num1 < num2) then
    for i := num1 to num2 do
      suma := suma + i
  else
    for i := num1 downto num2 do
      suma := suma + i;
  SumaNumeros := suma;
End;

Function ProductoNumeros(num1,num2 : integer) : integer;
var
  prod,i : integer;
Begin
  prod := 1;
  if(num1 < num2) then
    for i := num1 to num2 do
      prod := prod * i
  else
    for i := num1 downto num2 do
      prod := prod * i;
  {if(prod > 27767) OR (prod <= 0) then
    writeln('FUERA DE RANGO'); }
  ProductoNumeros := prod;
End;

var
  i : rango;
  num1,num2 : integer;
BEGIN
  for i := 1 to 10 do begin
    readln(num1);
    readln(num2);
    writeln('La suma es  : ' ,SumaNumeros(num1,num2));
    writeln('el producto es :  ' , ProductoNumeros(num1,num2));
  end;
END.