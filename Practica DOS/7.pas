//7. Dado el siguiente programa:
Program alcanceYFunciones;
var
  suma, cant : integer;
//PROCESOS
Function calcularPromedio : real;
var
  prom : real;
Begin
  if (cant <> 0) then
    prom := suma / cant  // (prom := -1) (inciso a*)
  else
    prom := -1;  // instruccion al reves* (prom := suma / cant;)
  calcularPromedio := prom;  // se le suma la instruccion de asignacion final de la función*.
End;
BEGIN { programa principal }
  readln(suma);
  readln(cant);
  if (cant <> 0) then                                   // modificacion para inciso b
    writeln('El promedio es: ' , calcularPromedio:2:2)   // modificacion para inciso b
  else                                                      // modificacion para inciso b
    writeln('Dividir por cero no parece ser una buena idea');  // modificacion para inciso b
  if (calcularPromedio <> -1) then begin
    //cant := 0;  // quitar esta instruccion, ya que altera el resultado de la función calcularPromedio*
    writeln('El promedio es: ' , calcularPromedio:2:2)
  end
  else
    writeln('Dividir por cero no parece ser una buena idea');
END.

{a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
parece incompleta. ¿qué debería agregarle para que funcione correctamente?
b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?
c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el programa?
Considere las tres posibilidades:
i) El programa original    Rta --> No imprime nada, hay varios errores
ii) El programa luego de realizar la modificación del inciso a)   Rta --> imprime lo mismo que en iii.
iii) El programa luego de realizar las modificaciones de los incisos a) y b) Rta --> La operacion de la funcion no se ve alterada, solo se llama una sola vez a la funcion }