{ 1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5
 }

program uno;
const
  tope = 10;
var
  i,suma,may5,num : integer;
BEGIN
  may5 := 0;  suma := 0;
  for i := 1 to tope do begin
    writeln('ingrese un numero');
    readln(num);
    suma := suma + num;
    if (num > 5) then
      may5 := may5 + 1;
  end;
  writeln('suma total de los 10 numeros = ' , suma);
  writeln('cantidad de nros mayores a cinco ' , may5);
END.