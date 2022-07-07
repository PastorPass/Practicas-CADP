// 5. Dado el siguiente programa, indicar cuál es el error.
Program alcance4;
Function cuatro: integer;
Begin
  cuatro:= 4;  // se le asigna un valor a la funcion
End;
var
  a: integer;  // variable local del programa principal
BEGIN
  cuatro;  // se llama a la funcion guardando el valor 4, pero no hay manera de expresar lo que tiene si no hay un writeln(cuatro) u otra variable de asignacion a := cuatro, luego writeln(a);
  writeln(a);  // como a la variable a no se le asigna ningun valor, imprime basura
END.