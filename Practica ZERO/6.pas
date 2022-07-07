{ 6. Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del 
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 213,61 pesos argentinos
(resultado de multiplicar 10*20,54 y adicionarle el 4%)
 }

program uno;
var
  montoDolar,DolarDia,porcentaje : real;
BEGIN
  writeln('ingrese el monto de la transacción total en dolares');
  readln(montoDolar);
  writeln('ingrese el valor del dolar a la fecha');
  readln(DolarDia);
  writeln('ingrese el porcentaje de la comision que cobra el banco por la transaccion');
  readln(porcentaje);
  writeln('El valor total en PESOS de La transacción en dólares es : ');
  writeln(montoDolar*DolarDia + (porcentaje / 100):2:2)
END.