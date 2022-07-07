{ 10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.  }

Program uno;
const
  dimF = 300;
  fin = 0;
  X = 0.15;  //constante que incrementa el salario en un 15%, ya que 15/100 = 0.15
type
  rango = 1..dimF;
  vectorSalarios = array[rango] of real;

// Procesos-Funciones

Procedure CargarVectorSalarios(var vec : vectorSalarios; var dimL : integer);
var
  Unsalario : real;
Begin
  writeln('ingrese un salario');
  readln(Unsalario);
  dimL := 0;
  while (dimL < dimF) and (Unsalario <> fin) do begin
    dimL := dimL + 1;
    vec[dimL] := Unsalario;
    writeln('vuelva a ingresar un salario');
    readln(Unsalario);
  end;
End;

Procedure IncrementarSalario (X : real; var vec : vectorSalarios; dimL : integer);  // inciso a)
var
  i : rango;
Begin
  for i := 1 to dimL do 
    vec[i] := vec[i] + (X*vec[i]); //Suma un porcentaje P al valor V. Para añadir porcentajes la fórmula es: V+((P/100)*V).
End;

Function SueldoPromedio (vec : vectorSalarios; dimL : integer) : real;  // inciso b)
var
  i : rango;
  sumaSalarios : real;
Begin
  sumaSalarios := 0;
  for i := 1 to dimL do
    sumaSalarios := sumaSalarios + vec[i];
  SueldoPromedio := sumaSalarios / dimL;
End;

Procedure ImprimirVector(vec : vectorSalarios; dimL : integer);
var
  i : rango;
Begin
  for i := 1 to dimL do
    writeln(vec[i]:2:2)
End;

// P.P
VAR
  vec : vectorSalarios;
  dimL : integer;
BEGIN
  CargarVectorSalarios(vec,dimL);
  IncrementarSalario(X,vec,dimL);
  ImprimirVector(vec,dimL);  // ADICIONAL PARA VERIFICAR EL INCREMENTO DEL MODULO ANTERIOR
  writeln('El sueldo promedio de los empleados de la empresa = ' ,SueldoPromedio(vec,dimL):2:2);
END.