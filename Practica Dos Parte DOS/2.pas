// 2. Dado el siguiente programa:
Program ejercicio4;
// PROCESOS
Procedure digParesImpares(num : integer; var par, impar : integer);
var
  dig: integer;
Begin
  while (num <> 0) do begin
    dig:= num mod 10;
    if((dig mod 2)= 0) then
      par := par + 1
    else
      impar:= impar +1;
    num := num DIV 10;
  end;
End;
//P.P
var
  dato, par, impar, total, cant : integer;
BEGIN
  par := 0;
  impar := 0;
  repeat
    read(dato);
    digParesImpares(dato,par,impar);
  until (dato = 100);
  writeln('Pares: ',par, 'Ímpares:', impar);
END.
{ a. ¿Qué imprime si se lee la siguiente secuencia de valores? 250, 35, 100   
Rta --> Imprime la cantidad de digitos pares e impares que tiene cada cifra, en este caso los pares e impares son :
2-0-0-0  = 4 pares
5-3-5-1  = 4 impares
las variables total y cant no son utilizadas*
}

 