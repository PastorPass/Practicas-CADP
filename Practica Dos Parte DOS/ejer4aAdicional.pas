{4. a. Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su
perímetro.
b. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenida del
Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia
(medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.
Informar:
● Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700
km) y mayor o igual que el de Marte (6.780 km).
● Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).  }

Program uno;
const
  pi = 3.1416926535;
//PROCESOS
Procedure RetornarDiamYPerimetro(radio : real; var diam,per : real);
Begin
  diam := radio *2;
  per := pi*radio*2;
End;

var
  radio,diam,per : real;
BEGIN
  writeln('ingrese radio del circulo');
  readln(radio);
  RetornarDiamYPerimetro (radio,diam,per);
  writeln('diametro = ' , diam:2:2);
  writeln('perímetro = ' , per:2:2);
END.