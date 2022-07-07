Program programadores;
Procedure leerDatos( legajo: integer; var salario : real);  // el salario debe estar pasado por referencia para que sume en el p.p
Begin
  writeln('Ingrese el nro de legajo y el salario');  // #1 caracteres ilegales 
  readln(legajo);
  readln(salario);
End;
Procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer; var maxSalario : real);  // pasar como referencia a maxSalario
{var
  maxSalario : real;    Inutilizable } 
Begin
  if (nuevoLegajo > maxLegajo) then begin
    maxLegajo:= nuevoLegajo;
    maxSalario := nuevoSalario
  end;
End;
var
  legajo, maxLegajo, i : integer;
  salario, maxSalario,sumaSalarios : real;
BEGIN
  maxLegajo := -1;  // inicializar en un valor minimo el maximo legajo
  maxSalario := -1;  // inicializar en un valor minimo
  sumaSalarios := 0;    // # 2 falta declarar esta variable
  for i := 1 to 3 do begin
    leerDatos(legajo,salario);  // #3 estan al reves los parametros
    actualizarMaximo(legajo, salario, maxLegajo, maxSalario);  // pasar como parametro a maxSalario
    sumaSalarios := sumaSalarios + salario;
  end;
  writeln('En todo el mes se gastan ' , sumaSalarios:2:2 , ' pesos');  // # caracteres ilegales  (‘) 
  writeln('El salario del empleado más nuevo es ' , maxSalario:2:2);  // # caracteres ilegales  (‘) 
END.

{ 4. El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo  }