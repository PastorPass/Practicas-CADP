{ 11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0(se refiere al numero de alumno?), el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor
a menor).  }
Program uno;
const
  fin = 0;
type
  egresado = record
                 numAlumno : integer;
                 apellido : string[30];
                 promFinal : real;
             end;
  Lista=^nodo;
  nodo = record
             dato : egresado;
             sig : Lista;
         end;

// Procesos-Funciones

Procedure LeerAlumno(var a : egresado);
Begin
  with a do begin
    writeln('ingrese un numero de alumno');
    readln(numAlumno);
    if (numAlumno <> 0) then begin
      writeln('ingrese un apellido');
      readln(apellido);
      writeln('ingrese el promedio final');
      readln(promFinal);
    end;
  end;
End;

Procedure AgregarOrdenado(var L : Lista; a : egresado);
var
  ant,act,nue : Lista;
Begin
  new(nue);
  nue^.dato := a;
  act := L;
  ant := L;
  while (act <> nil) AND (act^.dato.promFinal > a.promFinal) do begin
    ant:= act;
    act := act^.sig;
  end;
  if (ant = act) then
    L := nue
  else
    ant^.sig := nue;
  nue^.sig := act;
End;

Procedure CargarLista(var L : Lista;var alumLeidos : integer; var sumaProm : real);
var
  a : egresado;
Begin
  LeerAlumno(a);
  while (a.numAlumno <> 0) do begin
    AgregarOrdenado(L,a);  // agrega en la Lista bajo el criterio de orden de los promedios (de menor a mayor)
    alumLeidos := alumLeidos + 1;  // alumLeidos = la cantidad de alumnos en total leidos
    sumaProm := sumaProm + a.promFinal;  // la suma de todos los promedios de los alumnos(para sacar un promedio general)
    LeerAlumno(a);
  end;
End;

Procedure ImprimirSiCumple(L : Lista; promGeneral : real);
var
  contador : integer;
  exito : boolean;
Begin
  exito := false;
  contador := 0;
  while (L <> nil) AND (NOT exito) do begin  // sale del while porque llego a nil 0 llego a completar los 10 egresados con mejor promedio
    if (L^.dato.promFinal > promGeneral) then begin
      writeln('apellido : ' , L^.dato.apellido , ' ,num de alum : ' , L^.dato.numAlumno , ' ,su prom fue : ' , L^.dato.promFinal:2:2);
      contador := contador + 1;
      if (contador = 10) then
        exito := true;
    end;
    L := L^.sig;
  end;
  writeln('en total fueron = ' , contador , ' egresados con mejor promedio ');  // podrian no llegar a 10 egresados
End;

// P.P
VAR
  L : Lista;
  alumLeidos : integer;
  sumaProm,promGeneral : real;
BEGIN
  alumLeidos := 0;  sumaProm := 0;
  L := nil;
  CargarLista(L,alumLeidos,sumaProm);  // inciso a)
  promGeneral := sumaProm /alumLeidos;  // promGeneral = guarda el promedio general de todos los alumnos, los que superen este promedio se considera un alumno con mejor promedio
  writeln('PROMEDIO GENERAL : ' , promGeneral:2:2);
  ImprimirSiCumple(L,promGeneral);
END.