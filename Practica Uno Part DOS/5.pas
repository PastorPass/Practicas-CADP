{ 5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos   }
program uno;
const
  fin = 100;
var
  max,min,suma,num : integer;
BEGIN
  max := -1;
  min := 999;
  suma := 0;
  repeat
    writeln('ingrese un numero');
    readln(num);
    if (num > max) then
      max := num;
    if (num < min) then
      min := num;
    suma := suma + num;
  until (num = fin);
  writeln('el numero minimo = ' , min);
  writeln('el numero maximo = ' , max);
  writeln('la suma total de los numeros ingresados ' , suma);
END.