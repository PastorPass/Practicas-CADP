//1. Dado el siguiente programa:
Program Ejercicio3;
// PROCESOS
Procedure suma(num1: integer; var num2:integer);
//             i = num1    ;       x = num2
Begin
  num2 := num1 + num2;
  num1 := 0;
End;
var
  i, x : integer;
// P.P
BEGIN
  read(x); { leo la variable x }
  for i:= 1 to 5 do
    suma(i,x);
  write(x); { imprimo las variable x }
END.
{a. ¿Qué imprime si se lee el valor 10 en la variable x ?
Rta --> Imprime 25, ya que va sumando en cada iteracion el numero leido +1 , mas el valor de i, por ejemplo :
           num1          num2            i       x
for 1       0             11             1      10
for 2       0             13             2      11
....
for 5       0             25             5      20
b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
Rta --> en este caso, la suma que se guarda en num2, se pierde, ya que num2 no es un parametro pasado por referencia (num2 : integer) 
y pierde el valor almacenado una vez terminado el proceso x iteracion
c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
Rta --> Daria un error de compilacion, ya que hay una Asignación ilegal a la variable de bucle for-i "i", debido a que 
    se modifica i, como variable num1 pasada por referencia , (num1 = i) en las intrucciones del proceso suma, esta la 
    instruccion num1 := 0; con lo que nunca se debe modificar una variable de iteracion
}
