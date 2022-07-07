{ 12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.  }
Program uno;
const
  dimF = 5;  // valor original 53
type
  rango = 1..dimF;
  subrango = 1..4;
  galaxia = record
                nombre : string;
                tipo :subrango;
                masa : real;
                distanciaPC : real;
            end;
  vectorGalaxias = array[rango] of galaxia;
  vectorTipos = array[subrango] of integer; // vector Contador
// Procesos-Funciones

Procedure LeerGalaxia(var g : galaxia);
Begin
  with g do begin
    writeln('ingrese nombre de la galaxia');
    readln(nombre);
    writeln('ingrese tipo de galaxia(1..4)');
    readln(tipo);
    writeln('ingrese masa');
    readln(masa);
    writeln('ingrese la distancia en parsecs medida desde la tierra');
    readln(distanciaPC);
  end;
End;

Procedure CargarVectorGalaxias(var vec : vectorGalaxias);
var
  i : rango;
  g : galaxia;
Begin
  for i := 1 to dimF do begin
    LeerGalaxia(g);
    vec[i] := g;
  end;
End;

Procedure InicializarVectorContador (var vec : vectorTipos);
var
  i : subrango;
Begin
  for i := 1 to 4 do
    vec[i] := 0;
End;

Procedure ImprimirVectorContador(vecCon : vectorTipos);
var
  i : subrango;
Begin
  for i := 1 to 4 do
    writeln('tipo de galaxia nro ' , i , ' cantidad de galaxias de este tipo = ' , vecCon[i]);
End;

Function GalaxiaPrincipal (unNombre : string) : boolean;
Begin
  GalaxiaPrincipal := (unNombre = 'via lactea') OR (unNombre = 'andromeda' ) OR (unNombre = 'triangulo');
End;

Function NoEsIrregular (Untipo : integer) : boolean;
Begin
  NoEsIrregular := (Untipo = 1) OR (Untipo = 2) OR (Untipo = 3);
End;

Procedure DosMaximos (UnNom : string; unaMasa : real; var max1,max2 : real; var nMax1,nMax2 : string);
Begin
  if (unaMasa > max1) then begin
    max1 := max2;
    nMax1 := nMax2;
    max1 := unaMasa;
    nMax1 := UnNom;
  end
  else
    if (unaMasa > max2) then begin
      max2 := unaMasa;
      nMax2 := UnNom;
    end;
End;

Procedure DosMinimos (UnNom : string; unaMasa : real; var min1,min2 : real; var nMin1,nMin2 : string);
Begin
  if (unaMasa < min1) then begin
    min1 := min2;
    nMin1 := nMin2;
    min1 := unaMasa;
    nMin1 := UnNom;
  end
  else
    if (unaMasa < min2) then begin
      min2 := unaMasa;
      nMin2 := UnNom;
    end;
End;

Procedure RecorrerVectoreInformar(vec : vectorGalaxias);
var
  vecCon : vectorTipos;
  i : rango;
  Masa,masaTotal,max1,max2,min1,min2 : real;
  cantGalaxias : integer;
  nMax1,nMax2, nMin1,nMin2 : string;
Begin
  Masa := 0;  masaTotal := 0;
  cantGalaxias := 0;
  max1 := -1;  max2 := -1;  min1 := 999;  min2 := 999;
  nMax1 := '';  nMax2 := ' ';  nMin1 := ' ';  nMin2 := ' ';
  InicializarVectorContador (vecCon);
  for i := 1 to dimF do begin
    vecCon[vec[i].tipo] := vecCon[vec[i].tipo] + 1;  // suma +1 por cada tipo elegido del vector de galaxias (ya cargado)
    if (GalaxiaPrincipal(vec[i].nombre)) then  // inciso b)
      Masa := Masa + vec[i].masa;  // masa = guarda la masa solo de las 3 galaxias principales
    masaTotal := masaTotal + vec[i].masa;  // masaTotal = guarda la masa de todas las galaxias   //inciso b)
    if (NoEsIrregular (vec[i].tipo)) and (vec[i].distanciaPC < 1000) then  // inciso c)
      cantGalaxias := cantGalaxias + 1; // cantGalaxias =cantidad de galaxias no irregulares que se encuentran a < 1000 pc.
    DosMaximos(vec[i].nombre,vec[i].masa,max1,max2,nMax1,nMax2);
    DosMinimos(vec[i].nombre,vec[i].masa,min1,min2,nMin1,nMin2);
  end;
  ImprimirVectorContador(vecCon);  // informe inciso a)
  writeln('-------------INFORME GENERAL------------');
  writeln('masa total acumulada de las 3 galaxias principales = ' , Masa:2:2);    // informe inciso b)
  writeln('porcentaje que ',masa:2:2,' representa respecto a la masa de todas las galaxias ' , masaTotal:2:2 , ' ,es  = ' , ((Masa / masaTotal) *100):2:2, ' %'); // informe inciso b)
  writeln('cantidad de galaxias no irregulares que se encuentran a < 1000 pc = ' , cantGalaxias);  // informe inciso c)
  writeln('----------DOS GALAXIAS CON MAYOR MASA---------');
  writeln('1er nombre de la galaxia : ' , nMax1 , ' | con mayor masa : ' , max1:2:2);
  writeln('2do nombre de la galaxia : ' , nMax2 , ' | con mayor masa : ' , max2:2:2);
  writeln('----------DOS GALAXIAS CON MENOR MASA---------');
  writeln('1er nombre de la galaxia : ' , nMin1 , ' | con menor masa : ' , min1:2:2);
  writeln('2do nombre de la galaxia : ' , nMin2 , ' | con menor masa : ' , min2:2:2);
End;

// P.P
VAR
  vec : vectorGalaxias;
BEGIN
  CargarVectorGalaxias (vec);
  RecorrerVectoreInformar(vec);
END.