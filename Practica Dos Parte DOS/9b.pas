{ 9. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.   }
Program uno;
// PROCESOS
Procedure ProcesarNumero (num : integer; var cantDigitos,suma : integer);
var
  dig: integer;
Begin
  suma := 0;  cantDigitos := 0;  dig := 0;
  while (num <> 0) do begin
    dig := num MOD 10;
    suma := suma + dig;
    num := num DIV 10;
    cantDigitos := cantDigitos + 1;
  end;
End;
var
  num,cantDigitos,suma,cantDigitosTotal : integer;
BEGIN
  cantDigitosTotal := 0;
  repeat
    writeln('ingrese un numero');
    readln(num);
    ProcesarNumero(num,cantDigitos,suma);
    writeln('la cantidad de digitos que posee el numero ' , num, ' es de : ' , cantDigitos , ' DIGITOS ');
    writeln('la suma de sus digitos del numero ' , num , ' es de : ' , suma);
    cantDigitosTotal := cantDigitosTotal + cantDigitos;
  until (suma = 10);
  writeln('la cantidad total de digitos leidos es = ' , cantDigitosTotal);
END.