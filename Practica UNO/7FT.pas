{ 7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leido, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”
 }

program uno;
const
  fin = 32767;
var
  cod : integer;
  precioAct,nuePrecio : real;
BEGIN
  repeat
    writeln('ingrese codigo del producto');
    readln(cod);
    writeln('ingrese precio actual');
    readln(precioAct);
    writeln('ingrese nuevo precio');
    readln(nuePrecio);
    if (nuePrecio < precioAct * 0.1) then  // hacer una variable que guarde la diferencia del porcentaje
      writeln('El aumento del precio del producto ' , cod , ' no supera el 10%')
    else
      writeln('El aumento del precio del producto ' , cod , ' supera el 10 % ');
  until (cod = fin);
END.