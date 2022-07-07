{ Aclaración importante: Si bien en esta práctica se presentan soluciones utilizando variables globales, el objetivo de
las mismas es comprender su funcionamiento y mostrar algunos de los problemas asociados con su uso.
A la hora de resolver ejercicios en las siguientes prácticas, no se deberán utilizar variables globales en ninguna
circunstancia.
1. Dado el siguiente programa, indicar qué imprime.     }

Program alcance1;
var
  a,b: integer;  // variables globales que se utilizan en todo el cuerpo del programa
//PROCESOS
Procedure uno;
var 
  b: integer;  // es una variable local del modulo que solo se utiliza en el modulo <> variable 'b' global
Begin
  b := 3;
  writeln(b);  // Imprime 3 ya que usa la varible mas cercana para trabajar, en este caso la variable local del procedure uno.
End;
//P.P
BEGIN
  a:= 1;
  b:= 2;
  uno;  // se llama al proceso 
  writeln(b,a);  // imprime 2,1 ya que las 2 variables globales fueron asignadas con esos resultados y no se difieren del llamado al proceso
END.