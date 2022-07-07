{ 3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).  }

Program uno;
const
  tope = 3;
  doc = 1;
  alu = 23.435;
type
  rango = 1..tope;
  escuela = record
                CUE : integer;
                nomEstab : string;
                cantDocentes : integer;
                cantAlumnos : real;
                localidad : string;
            end;
// PROCESOS Y FUNCIONES 

Procedure LeerEscuela (var e : escuela);
Begin
  with e do begin
    writeln('cue');
    readln(CUE);
    writeln('nombre del establecimiento');
    readln(nomEstab);
    writeln('cantidad de docentes');
    readln(cantDocentes);
    writeln('cantidad de alumnos');
    readln(cantAlumnos);
    writeln('localidad');
    readln(localidad);
  end;
End;

Function ObtenerRelacion (alumns : real; docents : integer) : real;
Begin
  ObtenerRelacion := alumns / docents;
End;

// P.P
VAR
  i : rango;
  e : escuela;
  aux : real;
  cantEscSupUnesco : integer; 
  cue1,cue2 : integer;
  esc1,esc2 : string;
BEGIN
  cantEscSupUnesco := 0;
  cue1 := -8;  cue2 := -8;
  esc1 := ' ';  esc2 := ' ';
  for i := 1 to tope do begin
    LeerEscuela(e);
    aux := ObtenerRelacion(e.cantAlumnos,e.cantDocentes);
    if (e.localidad = 'la plata') {and (e.cantDocentes > doc)} and (e.cantAlumnos > alu) then
      cantEscSupUnesco := cantEscSupUnesco + 1;
    if (aux < alu) {(e.doc = 1) and (e.alu >= 23) and (e.alu <= 24)} then begin // se saca el aprox. mas cerca entre 23,425
      cue2 := cue1;
      esc2 := esc1;
      cue1 := e.CUE;
      esc2 := e.nomEstab;
    end
    else
      if (aux < alu) then begin
        cue2 := e.CUE;
        esc2 := e.nomEstab;
      end;
  end;
  writeln('Cant de esc de La Plata con una relación de alums x docente sup a la sugerida x UNESCO = ' , cantEscSupUnesco);
  writeln('CUE y nombre de las dos esc con mejor relación entre docs y alums = ' ,cue1,cue2);
  writeln('escuela uno = ' , esc1 , ' escuela dos = ' , esc2);
END.