{  4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R^2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)
 }

program uno;
const
  pi = 3.1415926535;
var
  diametro,radio,area,perimetro : real;
BEGIN
  writeln('ingrese diametro del circulo');
  readln(diametro);
  radio := diametro /2;
  area := pi*(radio*radio);
  perimetro := (pi*radio*2);
  writeln('----------------Resultados----------------');
  writeln('RADIO = ' , radio:2:2);
  writeln('AREA = ' , area:2:2);
  writeln('PERIMETRO = ' , perimetro:2:2);
END.