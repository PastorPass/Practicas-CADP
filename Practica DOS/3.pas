{ 3. Dado el siguiente programa, indicar cuál es el error y su causa  }
Program alcance3;
var 
  a: integer;  // variable global que puede ser utilizada en todo el cuerpo del programa
//PROCESOS
Procedure uno;
var 
  b: integer;  // variable local del modulo, unicamente se trabaja con esa variable en el modulo
Begin
  b:= 2;
  writeln(b);  // imprime 2 (todo normal hasta aca)
End;
//P.P
BEGIN
  a:= 1;
  uno;  // se llama al proceso 
  writeln(a, b);  // El error se presenta aca, ya que es imposible imprimir una variable 'b' que desconoce el programa principal(p.p), ya que no existe para el p.p
END.  
// La correcion seria declarar una nueva variable 'b' dentro del cuerpo del p.p y darle un valor