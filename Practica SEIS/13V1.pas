{ 13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario
se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de
días desde el último acceso.
a. Imprimir el nombre de usuario (email?)y la cantidad de días desde el último acceso de todos los usuarios de la revista
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.  }
Program uno;
const
  tope = 5;
type
  rango = 1..tope;
  subrango = 1..4;
  usuario = record
                email : string[50];
                rol : subrango;
                revParticipa : string[30];
                cantDiasUltAcceso : integer; 
            end;
  vectorUsuarios = array[rango] of usuario;
  vectorRoles = array[subrango] of integer;  // vector contador que cuenta la cantidad de usuarios x rol que eligen
//PROCESOS-FUNCIONES

Procedure LeerUsuario(var u : usuario);
Begin
  with u do begin
    writeln('ingrese email del usuario');
    readln(email);
    writeln('ingrese rol del usuario(1..4)');
    readln(rol);
    writeln('ingrese la revista en la que participa');
    readln(revParticipa);
    writeln('ingrese la cantidad de dias desde su ultimo acceso');
    readln(cantDiasUltAcceso);
  end;
End;

Procedure OrdenarVector(var vec : vectorUsuarios; max : integer);
var
  j,p,i,item : integer;
Begin
  for i := 1 to max-1 do begin
    p := i;
    for j:= i+1 to max do 
      if(vec[j].cantDiasUltAcceso < vec[p].cantDiasUltAcceso) then
        p := j;
    item := vec[p].cantDiasUltAcceso;
    vec[p].cantDiasUltAcceso := vec[i].cantDiasUltAcceso;
    vec[i].cantDiasUltAcceso := item;
  end;
End;

Procedure InicializarVectorContador(var vecCon : vectorRoles);
var
  i : subrango;
Begin
  for i := 1 to 4 do
    vecCon[i] := 0;
End;

Procedure DosMaximos(unEmail : string; unosDiasAcceso : integer; var em1,em2 : string; var max1,max2 : integer);
Begin
  if (unosDiasAcceso > max1) then begin
    max2 := max1;
    em2 := em1;
    max1 := unosDiasAcceso;
    em1 := unEmail;
  end
  else
    if (unosDiasAcceso > max2) then begin
      max2 := unosDiasAcceso;
      em2 := unEmail;
    end;
End;

Procedure CargarVector(var vec : vectorUsuarios);
var
  i : rango;
  u : usuario;
  max,max1,max2 : integer;
  vecCon : vectorRoles;
  em1,em2 : string[40];
Begin
  max := tope;
  InicializarVectorContador(vecCon);
  max1 := -1;  max2 := -1;  em1 := ' ';  em2 := ' ';
  for i := 1 to tope do begin
    LeerUsuario(u);
    vec[i] := u;  // 1. cargo el vector
    vecCon[vec[i].rol] := vecCon[vec[i].rol] + 1;  // inciso b)
    DosMaximos(vec[i].email,vec[i].cantDiasUltAcceso,em1,em2,max1,max2);  // inciso c)
  end;
  for i := 1 to tope do
    OrdenarVector(vec,max);  // 2. luego lo ordeno
  for i := 1 to 4 do   // informe inciso b)
    writeln('ROL NRO : ' , i , '| cant de usuarios por cada rol para todas las revistas del portal = ' , vecCon[i]);
  writeln('---------los dos usuarios que hace más tiempo que no ingresan al portal----------');
  writeln('1er usuario. tiempo que no ingresa al portal = ' , max1 , ' dias | email : ' , em1);  // informe inciso c)
  writeln('2do usuario. tiempo que no ingresa al portal = ' , max2 , ' dias | email : ' , em2);  // informe inciso c)
End;

Procedure RecorrerVectoreInformar(vec : vectorUsuarios);
var
  i : rango;
Begin
  writeln('---------todos los usuarios de la revista Economica---------');
  for i := 1 to tope do
    if (vec[i].revParticipa = 'economica') then
      writeln('USUARIO : ' , vec[i].email , ' ,cantidad de dias del cantDiasUltAcceso : ' , vec[i].cantDiasUltAcceso);
End;

//P.P
VAR
  vec : vectorUsuarios;
BEGIN
  CargarVector(vec);  // SE DISPONE
  RecorrerVectoreInformar(vec);
  //ImprimirVector(vec);  // inciso a)
END.