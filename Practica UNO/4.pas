{4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)

 }

program uno;
var
  num1,num2 : real;
BEGIN
  readln(num1);
  while (num1*2 <> num2) do begin 
    writeln('vuelva a ingresar un numero');
    readln(num2);
  end;
END.