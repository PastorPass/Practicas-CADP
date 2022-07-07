{ 6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%)
 }

program uno;
const
  fin = -1;
var
  numLeg,cantAlumnos,cantAlumnosXcondicion,cantAlumnosDestacados : integer;
  prom : real;
BEGIN
  cantAlumnosDestacados  := 0;
  cantAlumnosXcondicion := 0;
  cantAlumnos := 0;
  writeln('ingrese un numero de legajo');
  readln(numLeg);
  while (numLeg <> fin) do begin
    cantAlumnos := cantAlumnos + 1;
    writeln('ingrese un promedio');
    readln(prom);
    if (prom > 6.5) then
        cantAlumnosXcondicion := cantAlumnosXcondicion + 1;
    if(prom > 8.5) and (numLeg < 2500) then
      cantAlumnosDestacados := cantAlumnosDestacados + 1;  // de esta cantidad se pasa a porcentaje
    writeln('vuelva a ingresar un numero de legajo');
    readln(numLeg);
  end;
  writeln('---------RESULTADOS---------');
  writeln('cantidad de alumnos leidos ' , cantAlumnos);
  writeln('cantidad de alumnos cuyo promedio supera 6.5 = ' , cantAlumnosXcondicion);
  writeln('El porcentaje de alumnos destacados ' , (cantAlumnosDestacados *100) / cantAlumnos:2:2, ' por ciento');
END.