{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse)  }
Program uno;
const
  dimF = 400;
  fin = -1;  // condicion de corte
type
  rango = 1..dimF;
  alumno = record
             nroInscripcion : integer;
             dni : integer;
             apellido : string;
             nombre : string;
             anioNac : integer;
           end;
  vectorAlumnos = array[rango] of alumno;

// Procesos-Funciones

Procedure LeerAlumno(var a : alumno);
Begin
  with a do begin
    writeln('ingrese dni');
    readln(dni);
    if (dni <> fin) then begin
      writeln('ingrese apellido');
      readln(apellido);
      writeln('ingrese nombre');
      readln(nombre);
      writeln('ingrese numero de inscripción');
      readln(nroInscripcion);
      writeln('ingrese año de nacimiento');
      readln(anioNac);
    end;
  end;
End;

Procedure CargarVectorAlumnos(var vec : vectorAlumnos; var dimL : integer);
var
  i : rango;
  a : alumno;
Begin
  dimL := 0;
  LeerAlumno(a);
  while (dimF < dimL) or (a.dni <> fin) do begin
    dimL := dimL + 1;
    vec[dimL] := a;
    LeerAlumno(a);
  end;
End;

Function DniTodoPar (UnDni : integer) : boolean;
var
  resto,pares,impares : integer;
Begin
  pares := 0;  impares := 0;
  while (UnDni <> 0) do begin
    resto := UnDni MOD 10;
    if (resto MOD 2 = 0) then
      pares := pares + 1
    else
      impares := impares + 1;
    UnDni := UnDni DIV 10;
  end;
  DniTodoPar := (pares >=1) and (impares = 0);
End;

Procedure DosMinimos (unApe,unNom : string; unAnio : integer; var min1,min2 : integer; var  n1,n2,ap1,ap2 : string);
Begin
  if (unAnio < min1) then begin
    min2 := min1;
    ap2 := ap1;
    n2 := n1;
    min1 := unAnio;
    ap1 := unApe;
    n1 := unNom;
  end
  else
    if (unAnio < min2) then begin
      min2 := unAnio;
      ap2 := unApe;
      n2 := unNom;
    end;
End;

Procedure RecorrerVectoreInformar(vec : vectorAlumnos; dimL : integer);
var
  i : rango;
  cantAlumns,min1,min2 : integer;
  n1,n2,ap1,ap2 : string;
Begin
  n1 := ' ';  n2 := ' ';  ap1 := ' ';  ap2 := ' ';
  min1 := 9999;  min2 := 9999;
  cantAlumns := 0;
  for i := 1 to dimL do begin
    if (DniTodoPar(vec[i].dni)) then
      cantAlumns := cantAlumns + 1;
    DosMinimos(vec[i].apellido,vec[i].nombre,vec[i].anioNac,min1,min2,n1,n2,ap1,ap2);
  end;
  writeln('---------INFORME---------');
  writeln('el porcentaje de alumnos con DNI compuesto sólo por dígitos pares = ' , (cantAlumns*100)/dimF:2:2,' % ');
  writeln('1er. alumno de mayor edad, ' , ' Apellido : ' , ap1 , ' Y   Nombre : ' , n1);
  writeln('2do. alumno de mayor edad, ' , ' Apellido : ' , ap2 , ' Y   Nombre : ' , n2);
End;

// P.P
VAR
  vec : vectorAlumnos;
  dimL : integer;
BEGIN
  CargarVectorAlumnos(vec,dimL);
  RecorrerVectoreInformar(vec,dimL);
END.