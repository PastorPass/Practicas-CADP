{ 5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60,
 }

program uno;
const
  precioMelo = 1.60;
var
  x,y,resto : integer;
  division : real;
BEGIN
  writeln('cantidad de caramelos que posee el kiosquero');
  readln(x);
  writeln('cantidad de clientes');
  readln(y);
  division := x DIV y;  // el DIV saca el cociente de la division
  writeln('la cantidad de caramelos que le corresponden a cada cliente ' , division:2:2);
  resto := x MOD y;  // el MOD saca el resto de la division
  writeln('la cantidad de caramelos con los que se queda el kiosquero ' , resto);
  writeln('lo que deben pagar en total el/los clientes por los caramelos vendidos ' , y*precioMelo:2:2);  //inciso b
  
END.