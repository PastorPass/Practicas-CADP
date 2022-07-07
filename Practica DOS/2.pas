{ 2. Dado el siguiente programa, indicar qué imprime.  }
Program alcance2;
var 
  a,b: integer;  // variables globales
// PROCESOS
Procedure uno;
Begin
  b := 3;
  writeln(b);  // imprime 3 ya que es la ultima instruccion de asignacion que se le dió a la variable 'b' global y solamente trabaja con esa variable.
End;
//P.P
BEGIN
  a:= 1;
  b:= 2;
  uno;  // se llama al proceso
  writeln(b, a);  // imprime 3,1 en consecuencia de la ultima instruccion de asignacion que se le dio a 'b' en el procedure uno (b :=3), modificando-pisando su valor anterior que era b:= 2
END.