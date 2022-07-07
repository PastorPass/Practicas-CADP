// 4. Dado los siguientes programas, explicar la diferencia
Program alcance4a;
var 
  a,b: integer;  // variables globales
Procedure uno;
Begin
  a := 1;
  writeln(a);  // imprime 1
End;
BEGIN
  a:= 1;
  b:= 2;
  uno;
  writeln(b, a);  // imprime 2,1 (la asignacion de a := 1 fue el mismo tanto en el p.p como en el Procedure uno)
END.

Program alcance4b;
Procedure uno;
Begin
  a := 1;  // imposible asignar un valor a una variable que desconoce el modulo (*)
  writeln(a);  // En esta linea hay un error (*)
End;
//P.P
var 
  a,b: integer;  // variables locales del p.p
BEGIN
  a:= 1;
  b:= 2;
  uno;
  writeln(b, a);  // imprime 2,1 (todo normal)
END.
{La diferencia es que en el primer programa se utilizan solo variables globales para trabajar en todo el cuerpo del programa 
En el programa dos hay un error en el modulo uno, ya que se le asigna un valor a una variable que desconoce dicho modulo, 
tampoco hay variables locales del modulo, ni variables globales para trabajar con el modulo.