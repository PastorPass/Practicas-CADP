{ 1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”

 }

program uno;
var
  num1,num2 : integer;
BEGIN
  writeln('ingrese un 1er numero');
  readln(num1);
  writeln('ingrese un 2do numero');
  readln(num2);
  if (num1 > num2) and (num1 <> num2) then
    writeln('el 1er numero ingresado ' , num1 , ' es mayor que el 2do numero ingresado ' , num2)
  else begin
    if (num1 = num2) then
      writeln('los dos numeros son iguales')
    else
      writeln('el 2do. numero ingresado ' , num2 , ' es mayor que el 1er. numero ingresado ' , num1);
  end;
END.