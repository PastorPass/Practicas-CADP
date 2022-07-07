// 1. Dado el siguiente programa:
Program Registros;
type
  str20 = string[20];
  alumno = record
     codigo : integer;
     nombre : str20;
     promedio : real;
  end;
Procedure leer(var alu : alumno);
Begin
  writeln('Ingrese el código del alumno');
  readln(alu.codigo);
  if (alu.codigo <> 0) then begin
    writeln('Ingrese el nombre del alumno');
    readln(alu.nombre);
    writeln('Ingrese el promedio del alumno'); 
    readln(alu.promedio);
  end;
End;
{ declaración de variables del programa principal }
VAR
  a : alumno;
  alumLeidos : integer;
  nomMax : string;
  max : real;
{ cuerpo del programa principal }
BEGIN
  alumLeidos := 0;  // inciso b
  nomMax := ' ';  max := -1;  // inicializo el max en un valor muy bajo y el nomMax en un espacio en blanco
  leer(a);  // leo los datos de un alumno
  while (a.codigo <> 0) do begin
    alumLeidos := alumLeidos + 1;  // cuento la cantidad de alumnos que se van leyendo
    if (a.promedio > max) then begin  // inciso a 
      max := a.promedio;  // asigno el promedio de un alumno al maximo
      nomMax := a.nombre;  // asigno el nombre de un alumno al nombre de maximo promedio
    end;
    leer(a);
  end;
  writeln('la cantidad de alumnos leidos = ' , alumLeidos);  // inciso a)
  writeln('el nombre del alumno = ' , nomMax , ' con mejor promedio = ' , max:2:2);  // inciso b)
END.
{a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio  }