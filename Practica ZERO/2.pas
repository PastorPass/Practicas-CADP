{  2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional }

program uno;
var
  num1,num2,suma : integer;  //suma es la variable adicional
BEGIN
  readln(num1);
  readln(num2);
  //suma := num1 + num2;
  //writeln(suma);
  writeln(num1 + num2);  // sin variable adicional
END.