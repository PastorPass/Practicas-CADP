{ 3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota

 }

program uno;
const
  fin = 'zinedine';
type
  rango = 1..10;
var
  nom : string[20];
  nota : rango;
  cantAlumnos, siete : integer;
BEGIN
  siete := 0;  cantAlumnos := 0;
  repeat
    writeln('ingrese nombre');
    readln(nom);
    writeln('ingrese nota');
    readln(nota);
    if (nota >= 8) then
      cantAlumnos := cantAlumnos + 1
    else
      if (nota = 7) then
        siete := siete + 1;
  until (nom = fin);
  writeln('cantidad de alumnos aprobados (nota 8 o mayor) = ' , cantAlumnos);
  writeln('la cantidad de alumnos que obtuvieron un 7 como nota = ' , siete);
END.