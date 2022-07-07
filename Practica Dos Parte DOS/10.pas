{ 10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee  }
Program uno;
const
  fin = 123456;
type
  rango = 0..fin;
// PROCESOS
Procedure ProcesarNumero ( num : integer; var suma,DigitosImp : integer);
var
  dig : integer;
Begin
  suma := 0;  DigitosImp := 0;
  while (num <> 0) do begin
    dig := num MOD 10;
    if ( dig MOD 2 = 0) then
      suma := suma + dig
    else
      DigitosImp := DigitosImp + 1;
    num := num DIV 10;
  end;
End;
// P.P
var
  num : rango;
  suma, DigitosImp : integer;
BEGIN
  writeln('ingrese un numero entero');
  readln(num);
  while (num <> fin) do begin
    ProcesarNumero (num,suma,DigitosImp);
    writeln('la suma de sus digitos pares del numero ' , num , ' es = ' , suma);
    writeln('la cantidad de digitos impares que posee el numero ' , num , ' es = ' , DigitosImp);
    writeln('------------------------------------------------------------------');
    writeln('vuelva a ingresar un numero');
    readln(num);
  end;
END.