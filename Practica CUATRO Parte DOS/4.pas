{ 4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con
datos leídos de teclado  }
Program uno;
const
  dimF = 1000;
  fin = -1;  // condicion de corte
type
  rango = 1..dimF;
  alumno = record
                nroAlumno : integer;  // ordenada x nro de alumno de manera ascendente
                apeyNom : string;
                cantAsistencias : integer;
           end;
  vectorAlumnos = array[rango] of alumno;

// Procesos-Funciones

Procedure LeerAlumno(var a : alumno);
Begin
  with a do begin
    writeln('ingrese nro de alumno');
    readln(nroAlumno);
    if (nroAlumno <> fin) then begin
      writeln('ingrese apellido y nombre');
      readln(apeyNom);
      writeln('ingrese cantidad de asistencias');
      readln(cantAsistencias);
    end;
  end;
End;

Procedure CargarVectorAlumnos(var vec : vectorAlumnos; var dimL : integer);
var
  a : alumno;
Begin
  LeerAlumno(a);
  dimL := 0;
  while (dimL < dimF) and (a.nroAlumno <> fin) do begin // la información se encuentra ordenada por nro de alumno de manera ascendente
    dimL := dimL + 1;
    vec[dimL] := a; 
    LeerAlumno(a);
  end;
End;

Function BuscarPosElem (vec : vectorAlumnos; unNroAlumno : integer) : integer;  // inciso a)
var
  pos : integer;
Begin
  pos := 1;
  while (vec[pos].nroAlumno < unNroAlumno)  do 
    pos := pos + 1;  // no es necesario el if si seguro el nroAlumno existe, solo se busca la posicion
  BuscarPosElem := pos;
End;

Procedure InsertarElemEnVectorOrd (var vec : vectorAlumnos; var dimL : integer; unNroAlumno : integer; var exito : boolean);

  Function BuscarPosicion (vec : vectorAlumnos; dimL,unNroAlumno : integer) : integer;
  var
    pos : integer;
  Begin
    pos := 1;
    while (pos <= dimL) and (unNroAlumno > vec[pos].nroAlumno) do 
      pos := pos + 1;
    BuscarPosicion := pos;
  End;

  Procedure Insertar(var vec : vectorAlumnos; var dimL : integer; pos,unNroAlumno : integer);
  var
    j : integer;
  Begin
    for j := dimL downto pos do 
      vec[j+1].nroAlumno := vec[j].nroAlumno;
    vec[pos].nroAlumno := unNroAlumno;
    dimL := dimL + 1;
  End;
  
var
  pos : integer;
Begin
  exito := false;
  if (dimL < dimF) then begin
    pos := BuscarPosicion(vec,dimL,unNroAlumno);
    Insertar(vec,dimL,pos,unNroAlumno);
    exito := true;
  end;
End;

Procedure BorrarPosicion (var vec : vectorAlumnos; var dimL : integer; PosElim : integer; var ok : boolean);
var
  i : integer;
Begin
  ok := false;
  if (PosElim >= 1) and (PosElim <= dimL) then begin
    ok := true;
    for i := PosElim+1 to dimL do 
      vec[i-1].nroAlumno := vec[i].nroAlumno;
    dimL := dimL - 1;
  end;
End;

Procedure BorrarElemDetEnVector (var vec : vectorAlumnos; var dimL : integer; unNroAlumno : integer; var ok1 : boolean);
  
  Function BuscarPosElemVecOrd (vec : vectorAlumnos; dimL,unNroAlumno : integer) : integer;  // tengo que aprovechar que el vector esta ordenado
  var
    pos : integer;
  Begin
    pos := 1;
    while (pos <= dimL) and (unNroAlumno > vec[pos].nroAlumno) do  // vector ordenado de menor a mayor bajo criterio del nro de alumno
      pos := pos + 1;
    if (pos > dimL) OR (unNroAlumno < vec[pos].nroAlumno) then
      pos := 0;
    BuscarPosElemVecOrd := pos;
  End;
  
  Procedure BorrarPosModif (var vec : vectorAlumnos; var dimL : integer; pos : integer);
  var
    i : integer;
  Begin
    for i := pos+1 to dimL do
      vec[i-1].nroAlumno := vec[i].nroAlumno;
    dimL := dimL - 1;
  End;
  
var
  pos : integer;
Begin
  ok1 := false;
  pos := BuscarPosElemVecOrd (vec,dimL,unNroAlumno);
  if (pos <> 0) then begin
    BorrarPosModif (vec,dimL,pos);
    ok1 := true;
  end;
End;

Procedure RecorreryBorrarAlumnosEnVectorOrd (var vec : vectorAlumnos; var dimL : integer; EnZero : integer; var ok2 : boolean);
  
  Function BuscarPosElemVecOrd (vec : vectorAlumnos; dimL,EnZero : integer) : integer;  // tengo que aprovechar que el vector esta ordenado
  var
    pos : integer;
  Begin
    pos := 1;
    while (pos <= dimL) and (EnZero <> vec[pos].cantAsistencias) do  // vector ordenado de menor a mayor bajo criterio del nro de alumno
      pos := pos + 1;
    if (pos > dimL) OR (EnZero <> vec[pos].cantAsistencias) then
      pos := 0;
    BuscarPosElemVecOrd := pos;
  End;
  
  Procedure BorrarPosModif (var vec : vectorAlumnos; var dimL : integer; pos : integer);
  var
    i : integer;
  Begin
    for i := pos+1 to dimL do
      vec[i-1].cantAsistencias := vec[i].cantAsistencias;
    dimL := dimL - 1;
  End;
  
var
  pos : integer;
Begin
  ok2 := false;
  pos := BuscarPosElemVecOrd (vec,dimL,EnZero);
  while (pos <> 0) do begin // es un while ya que debo ir uno x uno en el vector a borrar con tal condicion 
    BorrarPosModif (vec,dimL,pos);
    ok2 := true;
    pos := BuscarPosElemVecOrd (vec,dimL,EnZero);  // vuelvo a 'leer'
  end;
End;

Procedure ImprimirVectorAlumnos (vec : vectorAlumnos; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do begin
    writeln('----------Informe para Nro : ' ,i,'-----------');
    writeln('nro de alumno : ' , vec[i].nroAlumno);
    writeln('apellido y nombre : ' , vec[i].apeyNom);
    writeln('cantAsistencias : ' , vec[i].cantAsistencias);
  end;
End;
// P.P
VAR
  vec : vectorAlumnos;
  dimL,unNroAlumno,PosElim : integer;
  exito,ok,ok1,ok2 : boolean;
BEGIN
  CargarVectorAlumnos (vec,dimL);
 { writeln('ingrese un nro de alumno y retornara su posicion en el vector'); // inciso a)}
  {writeln('ingrese un nro de alumno a insertar en el vector ordenado');  // inciso b)}
 { writeln('ingrese una Posicion a eliminar del vector');  // inciso c)}
  {readln(PosElim);}  // inciso c)
  {writeln('ingrese un nro de alumno a eliminar del vector');
  readln(unNroAlumno);}
  {writeln('Posicion del vector Nro : ' ,BuscarPosElem(vec,unNroAlumno));}
  {InsertarElemEnVectorOrd (vec,dimL,unNroAlumno,exito);  // inciso b)
  if (exito) then
    writeln('se inserto el nro de alumno ' , unNroAlumno , ' en el vector ordenado')  // informe inciso b)
  else
    writeln('no se inserto');  // informe inciso b) }
  {BorrarPosicion (vec,dimL,PosElim,ok);  // inciso c)}
 { if (ok) then
    writeln('se elimino el numero de alumno en la posicion : ' , PosElim , ' del vector ordenado')  // informe inciso c)
  else
    writeln('no se elimino');  // informe inciso c) }
  {BorrarElemDetEnVector(vec,dimL,unNroAlumno,ok1);  // inciso d)}
  {if (ok1) then
    writeln('se elimino el numero de alumno : ' , unNroAlumno , ' del vector ordenado')  // informe inciso d)
  else
    writeln('no se elimino');  // informe inciso d) }
  RecorreryBorrarAlumnosEnVectorOrd(vec,dimL,0,ok2);  // inciso e)  se borran los alumnos con cantidad de asistencias en 0
  if (ok2) then
    writeln('se eliminaron los alumnos con cantidad de asistencias en 0')  // informe inciso d)
  else
    writeln('no se eliminaron porque no habia');  // informe inciso d) }
  ImprimirVectorAlumnos (vec,dimL);
END.