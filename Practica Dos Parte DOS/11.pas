{ 11. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: nro de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con nro de inscripción
1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con nro de inscripción más chico.
● Nombre de los dos alumnos con nro de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par. }
Program uno;
const
  fin = 1200;
// PROCESOS
Procedure LeerAlumno( var nroIns : integer; var apellido,nombre : string);
Begin
  writeln('ingrese nro de inscripción');
  readln(nroIns);
  writeln('ingrese Apellido ');
  readln(apellido);
  writeln('ingrese nombre');
  readln(nombre);
End;

Procedure DosApeMinimos (nroIns : integer; apellido : string; var min1,min2 : integer; var ap1,ap2 : string);
Begin
  if (nroIns < min1) then begin
    min2 := min1;
    ap2 := ap1;
    min1 := nroIns;
    ap1 := apellido;
    end
    else
      if (nroIns < min2) then begin
        min2 := nroIns;
        ap2 := apellido;
      end;
End;

Procedure DosNomMaximos (nroIns : integer; nombre : string; var max1,max2 : integer; var n1,n2 : string);
Begin
  if (nroIns > max1) then begin
    max2 := max1;
    n2 := n1;
    max1 := nroIns;
    n1 := nombre;
    end
    else
      if (nroIns > max2) then begin
        max2 := nroIns;
        n2 := nombre;
      end;
End;

var
  nroIns,min1,min2,max1,max2 : integer;
  apellido,nombre,ap1,ap2,n1,n2 : string;
  par, alumnos,porcentaje : real;
BEGIN
  min1 := 999;  min2 := 999;  max1 := -1;  max2 := -1;
  ap1 := ' ';  ap2 := ' ';  n1 := ' ';  n2 := ' ';
  par := 0;  alumnos := 0;
  repeat
    LeerAlumno(nroIns,apellido,nombre);
    if (nroIns MOD 2 = 0) then
      par := par + 1;
    DosApeMinimos (nroIns,apellido,min1,min2,ap1,ap2);
    DosNomMaximos (nroIns,nombre,max1,max2,n1,n2);
    alumnos := alumnos + 1;
  until (nroIns = fin);
  writeln('----------------INFORME-----------------');
  writeln('Apellido del alumno con 1er.nro de inscripcion más chico = ' , ap1);
  writeln('Apellido del alumno con 2do.nro de inscripcion más chico = ' , ap2);
  writeln('Nombre del alumno con 1er.nro de inscripcion más grande = ' , n1);
  writeln('Nombre del alumno con 2do.nro de inscripcion más grande = ' , n2);
  porcentaje := par / alumnos;
  writeln('porcentaje de alum con nro de insc par = ' , porcentaje*100:2:2 , ' %  de los ' , alumnos:2:2 , ' alum leidos');
END.