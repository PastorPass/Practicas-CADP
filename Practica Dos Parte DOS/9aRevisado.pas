{9. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.  }

Program uno;

//PROCESOS 
Procedure AnalizarNumero(num : integer; var cantDigitos,SumaDigitos : integer);
var
  resto,aux,suma : integer;
Begin
  aux := 0;
  while (num <> 0) do begin
    resto := num MOD 10;
    suma := suma + resto;
    aux := aux + 1;
    num := num DIV 10;
  end;
  cantDigitos := aux;
  SumaDigitos := suma;
End;

//P.P
var
  num,cantDigitos,SumaDigitos : integer;
BEGIN
  writeln('ingrese numero');
  readln(num);
  AnalizarNumero(num,cantDigitos,SumaDigitos);
  writeln('la cantidad de dígitos que posee el numero ' , num , ' = ' ,cantDigitos);
  writeln('suma de los digitos del numero ' , num , ' = ' , SumaDigitos);
END.