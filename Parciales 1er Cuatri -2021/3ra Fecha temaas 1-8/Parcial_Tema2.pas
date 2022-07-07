{ TEMA 2 
ENUNCIADO :
Un criadero de conejos está analizando ciclos de reproduccion , El criadero cuenta con conejas reproductoras 
y dispone de una estructura que contiene, para cada coneja , su codigo, año de nacimiento, nombre,
cantidad de partos (entre 1 y 10) y cantidad de crias que tuvo en cada parto.

a) Realice un modulo que reciba la informacion de las conejas y retorne en una estructura adecuada, 
el codigo , el nombre, y el año de nacimiento de las conejas que tuvieron en promedio mas de 5 crias por parto.

b) Realice un modulo que reciba la estructura generada en a) e imprima los nombres de las conejas con codigo par, 
nacidas antes del año 2016.

c) Realice una funcion que reciba la informacion de las conejas y un codigo de coneja,
y retorne la cantidad maxima de crias que tuvo la coneja con dicho codigo en alguno de sus partos.
(Retornar -1 si la coneja no se encuentra en la estructura).  }

program uno;
const
  tope = 10;
type
  rango = 1..tope;
  vectorCriasXParto = array[rango] of integer;
  coneja = record
             cod : integer;
             anioNac : integer;
             nom : string;
             cantPartos : rango;
             cantCriasXparto : vectorCriasXParto;
           end;
  
  ListaD = ^nodoD;
  nodoD = record
             dato : coneja;
             sig : ListaD;
          end;
//------------------------------------------------------------------------------
  coneja2 = record
                cod : integer;
                nombre : string;
                anioNac : integer;
            end;
  
  ListaNue = ^nodo;     // LISTA NUEVA EN LA QUE GUARDA DATOS X CONDICION (inciso a)
  nodo = record
            dato : coneja2;
            sig : ListaNue;
         end;

// PROCESOS
Procedure CargarListaConejas (var Ldis : ListaD);  // se dispone

Procedure Asignado (var c : coneja2; Ldis : ListaD);
Begin
  c.cod := Ldis^.dato.cod;
  c.nombre := Ldis^.dato.nom;
  c.anioNac := Ldis^.dato.anioNac;
End;

Procedure AgregarAdelante(var L2 : ListaNue; c : coneja2);
var
  aux : ListaNue;
Begin
  new(aux);
  aux^.dato := c;
  aux^.sig := L2;
  L2 := aux;
End;

Function CalcularPromedio (c : coneja) : real;  // un promedio siempre debe ser un calculo con numeros reales
var
  i : rango;
  suma : integer;
Begin
  suma := 0;
  for i := 1 to c.cantPartos do  // cantPartos tiene el numero exacto de la cantidad de partos x coneja 
    suma := suma + c.cantCriasXparto[i];
  CalcularPromedio := suma / c.cantPartos;
End;

Procedure GenerarListaNueva (Ldis : ListaD; var L2 : ListaNue);
var
  c : coneja2;
Begin
  while (Ldis <> nil) do begin
    if (CalcularPromedio(Ldis^.dato) > 5) then begin
      Asignado (c,Ldis);
      AgregarAdelante (L2,c);
    end;
    Ldis := Ldis^.sig;
  end;
End;

Function EsPar (unCod : integer) : boolean;
Begin
  EsPar := (unCod MOD 2 = 0);
End;

Procedure ImprimirPorCondicion (L2 : ListaNue);
Begin
  while (L2 <> nil) do begin
    if (EsPar(L2^.dato.cod)) and (L2^.dato.anioNac < 2016) then
      writeln('el nombre de la coneja es ' , L2^.dato.nombre);
    L2 := L2^.sig;
  end;
End;

{Procedure BuscarElementoEnLista (Ldis : ListaD; NueCod : integer) : boolean;
var
  act : ListaD;
  encontre : boolean;
Begin
  act := Ldis;
  encontre := false;
  while (Ldis <> nil) and (not encontre) do begin
    if (act^.dato.cod = NueCod) then
      encontre := true
    else
      act := act^.sig;
  end;
  BuscarElementoEnLista := encontre;
End;

Procedure MaximoTotalCrias (c : coneja);
var
  max : integer;
  i : rango;
Begin
  max := -1;
  for i := 1 to tope do 
    if (c.cantCriasXparto[i] > max) then
      max := c.cantCriasXparto[i];
  writeln('la cantidad maxima que tuvo en todos sus partos fue de ' , max , ' crias');
End;}

Function Maximo (v : vectorCriasXParto; DimL : integer) : integer;
var
  i,max : integer;
Begin
  max := 0;  // se inicializa porque se utiliza de maximo
  for i := 1 to DimL do
    if (v[i] > max) then
      max := v[i];
  Maximo := max;
End;

Function MaxCrias (Ldis : ListaD; NueCod : integer) : integer;
var
  max : integer;
Begin
  while (Ldis <> nil) and (Ldis^.dato.cod <> NueCod) do begin
    Ldis := Ldis^.sig;
  max := -1;
  if (Ldis <> nil) then
    max := Maximo (Ldis^.dato.cantCriasXparto, Ldis^.dato.cantPartos);  // le paso un vector con una DimL
  MaxCrias := max;
End;

// P.P
VAR
  Ldis:ListaD; 
  L2 : ListaNue;
  NueCod : integer;
BEGIN
  Ldis := nil;
  L2 := nil;
  CargarListaConejas (Ldis);  // se dispone
  GenerarListaNueva(Ldis,L2);
  ImprimirPorCondicion (L2);
  writeln('ingrese un nuevo codigo de coneja a buscar');
  readln(NueCod);
  writeln (MaxCrias(Ldis,NueCod));
END.
