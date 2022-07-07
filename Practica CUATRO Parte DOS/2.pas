{ 2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias  }
Program uno;
const
  dimF = 500;
  fin = 'zzz';  // condicion de corte para el vector
type
  rango = 1..dimF;
  vectorNombres = array[rango] of string;

// Procesos-Funciones

Procedure CargarVectorNombres (var vec : vectorNombres; var dimL : integer); 
var
  unNombre : string;
Begin
  dimL := 0;
  writeln('ingrese un nombre');
  readln(unNombre);
  while (dimL < dimF) and (unNombre <> fin) do begin
    dimL := dimL + 1;
    vec[dimL] := unNombre;
    writeln('vuelva a ingresar un nombre');
    readln(unNombre);
  end;
End;

Procedure BuscaryEliminarElemEnVector (var vec : vectorNombres; var dimL : integer; elem : string; var ok : boolean);
  Function BuscarElemEnVector (vec : vectorNombres; dimL : integer; elem : string) : integer;
  var
    pos : integer;
    exito : boolean;
  Begin
    exito := false;
    pos := 1;
    while (pos <= dimL) and (NOT exito) do begin
      if (vec[pos] = elem) then
        exito := true
      else
        pos := pos + 1;
    end;
    if (exito = false) then
      pos := 0;  // si la posición es 0 , es porque no se encontro el elemento en el vector
    BuscarElemEnVector := pos;  // la funcion va a devolver la posición del vector en donde se encontro el elemento
  End;
  
  Procedure BorrarPosModif (var vec : vectorNombres; var dimL : integer; pos : integer);
  var
    i : integer;
  Begin
    for i := pos+1 to dimL do
      vec[i-1] := vec[i];
    dimL := dimL - 1;
  End;
  
var
  pos : integer;
Begin
  ok := false;
  pos := BuscarElemEnVector(vec,dimL,elem);
  if (pos <> 0) then begin
    BorrarPosModif(vec,dimL,pos);
    ok := true;
  end;
End;

Procedure InsertarElemPosDetVector(var vec : vectorNombres; var dimL : integer; elem : string; posCuatro: integer; var ok2 : boolean);
var
  i : integer;
Begin
  ok2 := false;
  if (dimL < dimF) and ((posCuatro >= 1) and (posCuatro <= dimL)) then begin  // verificar espacio y posicion valida
    ok2 := true;
    for i := dimL downto posCuatro do   // abrir el arreglo
      vec[i+1] := vec[i];
    vec[posCuatro] := elem;  // asignar el valor
    dimL := dimL + 1;  // aumentar la dimL
  end;
End;

Procedure AgregarUnElementoAlFinalDelVector(var vec : vectorNombres; var dimL : integer; elem : string; var ok3 : boolean);
Begin
  ok3 := false;
  if (dimL < dimF) then begin  // solo verificar espacio suficiente , ya que se agrega al final de la dimL del vector + 1 y no debe superar la dimF
    ok3 := true;
    dimL := dimL + 1;  // actualizar cantidad de elementos
    vec[dimL] := elem;
  end;
End;

// P.P
VAR
  vec : vectorNombres;
  dimL,posCuatro : integer;
  elem : string;
  ok1,ok2,ok3 : boolean;
BEGIN
  CargarVectorNombres(vec,dimL);  // inciso a)
  {writeln('ingrese un nombre a eliminar (1era ocurrencia) en el vector'); }  // inciso b)
  {writeln('ingrese un nombre para insertar en la poscicion 4');}  // inciso c)
  writeln('Ingrese un nombre que sera agregado al vector');
  readln(elem);
  {BuscaryEliminarElemEnVector(vec,dimL,elem,ok1);  // inciso b)
  if (ok1) then  // se usa la variable booleana que se uso en el modulo eliminar para verificar si dicho nombre se encontraba en el vector
    writeln('se elimino el nombre ' , elem, ' en el vector')  // informe inciso b)
  else
    writeln('no se encontro el nombre en el vector');  // informe inciso b)}
  {posCuatro := 4 ;  // para que el nombre leido sea insertado en la posición cuatro del vector (INCISO C)
  InsertarElemPosDetVector(vec,dimL,elem,posCuatro,ok2);  // inciso c)
  if (ok2) then
    writeln('el nombre ' , elem , ' se inserto en la posicion ' , posCuatro , ' del vector')
  else
    writeln('NO se inserto el nombre ' , elem , ' en la posicion cuatro');}
  AgregarUnElementoAlFinalDelVector(vec,dimL,elem,ok3);
  if (ok3) then
    writeln('se inserto el nombre ' , elem , ' al final del vector')
  else
    writeln('N0 se inserto el nombre ' , elem);
END.
  