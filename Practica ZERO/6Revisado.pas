{6. Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
189,32 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)  }

Program uno;
var
  montotalDolares,dolarHoy,porcentajeComision,calculoPorcentaje : real;
BEGIN
  writeln('ingrese monto total en dolares de la transacción');
  readln(montotalDolares);
  writeln('ingrese el valor del dolar al dia de la fecha');
  readln(dolarHoy);
  writeln('ingrese porcentaje (en pesos)');
  readln(porcentajeComision);
  calculoPorcentaje := dolarHoy*(porcentajeComision/10);
  writeln('La transacción sera de = ' , montotalDolares*dolarHoy+calculoPorcentaje:2:2 , ' pesos argentnos');
   
END.