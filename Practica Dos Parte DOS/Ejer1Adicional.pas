program Ejercicio1_ad;

procedure intercambio(var num1,num2 : integer);
var
  aux : integer;
begin
  aux := num1;
  num1 := num2;
  num2 := aux;
end;

procedure sumar(num1 : integer; var num2 : integer);
begin
  num2 := num1 + num2;
end;

var
  i, num1, num2 : integer;
BEGIN
  read(num1);
  read(num2);
  for i := 1 to 3 do begin
    intercambio(num1,num2);
    sumar(i,num1);
  end;
  writeln(num1);
END.

{a. ¿Qué imprime si se leen los valores num1=10 y num2=5 ?
Rta : imprime 9 ya que el valor de num1 aumenta iniciando en 5 , luego en 7 y finalmente en 9
se va sumando con la variable de iteracion del for.

b. ¿Qué imprime si se leen los valores num1=5 y num2=10 ? 
Rta : imprime 14 , seria el caso anterior pero al reves, osea suma a num2 := 10 con la variable de
iteracion del for (3 veces)
}