Program sumador;
type
  vnums = array [1..10] of integer;
var
  numeros : vnums;
  i : integer;
Begin
  for i:=1 to 10 do {primer bloque for}
    numeros[i] := i;
    
  //for i := 2 to 10 do {segundo bloque for}
  //  numeros[i] := numeros[i] + numeros [i-1];
  for i:=1 to 9 do
    numeros[i+1] := numeros[i];
  for i := 1 to 9 do
    writeln(numeros[i]);
End.

{ a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
Rta : toma los valores de la iteracion de i, del 1 al 10

b) Al terminar el programa, ¿con qué valores finaliza la variable números?
RTA :  toma los valores de la iteracion de i pero adicionandose + el valor anterior de cada iteracion que
tenia i, por ejemplo, empieza desde 2 hasta 10, en la iteracion i := 2, se le suma el anterior, i := 1;
osea numeros[2] := 2 + 1;  ---> =3, se reescriben los valores.

c) Si se desea cambiar la línea 11 por la sentencia: for i:=1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)?

for i := 1 to 9 do // INCISO C)
    numeros[i] := numeros[i]-1 + numeros[i-1] + 1;//Modificacion para que imprima igual que el 2do for
for i := 1 to 9 do // impresion del vector
    writeln(numeros[i]);

d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:
for i:=1 to 9 do
numeros[i+1] := numeros[i]; 

Rta : son todos uno, ya que asigna el 1er valor del vector ( que es 1) a las posiciones siguientes de 
la iteracion de i;
por ejemplo, numero[posicion 1 + 1] := numero[1];  se le da valor uno a las posiciones +1 que se van 
iterando.

    
}
