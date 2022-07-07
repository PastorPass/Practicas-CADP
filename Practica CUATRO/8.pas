{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.  }
Program uno;
const
  dimF = 4; // 400 (valor original)
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
    writeln('ingrese numero de inscripción');
    readln(nroInscripcion);
    writeln('ingrese dni');
    readln(dni);
    writeln('ingrese apellido');
    readln(apellido);
    writeln('ingrese nombre');
    readln(nombre);
    writeln('ingrese año de nacimiento');
    readln(anioNac);
  end;
End;

Procedure CargarVectorAlumnos(var vec : vectorAlumnos);
var
  i : rango;
  a : alumno;
Begin
  for i := 1 to dimF do begin 
    LeerAlumno(a);
    vec[i] := a;
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

Procedure RecorrerVectoreInformar(vec : vectorAlumnos);
var
  i : rango;
  cantAlumns,min1,min2 : integer;
  n1,n2,ap1,ap2 : string;
Begin
  n1 := ' ';  n2 := ' ';  ap1 := ' ';  ap2 := ' ';
  min1 := 9999;  min2 := 9999;
  cantAlumns := 0;
  for i := 1 to dimF do begin
    if (DniTodoPar(vec[i].dni)) then
      cantAlumns := cantAlumns + 1;
    DosMinimos(vec[i].apellido,vec[i].nombre,vec[i].anioNac,min1,min2,n1,n2,ap1,ap2);
  end;
  writeln('---------INFORME---------');
  writeln('el porcentaje de alumnos con DNI compuesto sólo por dígitos pares = ' , (cantAlumns*100)/dimF:2:2,' % ');
  writeln('1er. alumno de mayor edad, ' , ' Apellido : ' , ap1 , ' ; nombre : ' , n1);
  writeln('2do. alumno de mayor edad, ' , ' Apellido : ' , ap2 , ' ; nombre : ' , n2);
End;

// P.P
VAR
  vec : vectorAlumnos;
BEGIN
  CargarVectorAlumnos(vec);
  RecorrerVectoreInformar(vec);
END.