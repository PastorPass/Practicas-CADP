{ 5.Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X

 }

program uno;
var
  num1,num2 : real;
  contador : integer;
BEGIN
  contador := 0;
  writeln('ingrese un 1er numero');
  readln(num1);
  while (num1*2 <> num2) and (contador < 10)do begin
    contador := contador +1;
    writeln('vuelva a ingresar un numero');
    readln(num2);
  end;
  if (num1*2 <> num2) then
    writeln('no se ah ingresado el doble de ' , num1:2:2);
    
END.