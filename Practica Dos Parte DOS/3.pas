Program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c } 
Procedure sumar(a, b : integer; var  c : integer);  // #1 falta declarar a c como un parametro x referencia
var
  suma,i : integer;       // #2 falta declarar variable de iteracion 'i'
Begin
  suma := 0;  // extra : Falta inicializar la variable suma;
  for i := a to b do
    suma := suma + i;
  c := c + suma;
End;
var
  result,a,b : integer;     // # 3-4 falta declarar variables a y b
  ok : boolean;
BEGIN
  ok := false;
  result := 0;
  readln(a); readln(b);
  sumar(a, b, result); // #5 hay que pasar result como parametro por referencia
  writeln('La suma total es ' , result);  // # 5.a No se usa  (‘) se usa ('')  
  { averigua si el resultado final estuvo entre 10 y 30}
  ok := (result >= 10) and (result <= 30);  // #6 falta declarar varible booleana ok e inicializarla en false;  cambiar el OR POR UN AND
  if (ok = false) then  // #5-6 cambiar not ok por --> ok = false
    writeln('La suma no quedó entre 10 y 30');  // # 5.b No se usa  (‘) se usa ('')  
END.
{ 3. Dado el siguiente programa, encontrar los 6 errores. Utilizar los comentarios entre llaves como guía, indicar
en qué línea se encuentra cada error y en qué consiste:   }
 