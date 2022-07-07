{ TEMA 3 
ENUNCIADO :
Un criadero de conejos está analizando ciclos de reproduccion ,
El criadero cuenta con conejas reproductoras y dispone de una estructura que contiene,
para cada coneja , nro de identificacion, año de nacimiento, raza, cantidad de partos (entre 1 y 20)
y cantidad de crias que tuvo en cada parto.

a) Realice un modulo que reciba la informacion de las conejas y retorne en una estructura adecuada,
el nro de identificacion, la raza, y el año de nacimiento de las conejas que tuvieron algun parto con mas de 8 crias.

b) Realice un modulo que reciba la estructura generada en a) e imprima la cantidad de conejas,
nacidas en el año 2018, cuyo codigo termina en 0.

c) Realice una funcion que reciba la informacion de las conejas y un codigo de coneja y
retorne el promedio de crias por parto que tuvo dicha coneja o -1 si la coneja no se encuentra en la estructura.  }

program uno;
const
  tope = 20;
type
  rango = 1..tope;
  vectorCriasXPartos = array[rango] of integer;
  coneja = record
             nroIdent : integer;
             anioNac : integer;
             raza : string;
             cantPartos : rango;
             cantCriasxParto : vectorCriasXPartos;
           end;
  
  ListaD = ^nodoD;
  nodoD = record
             dato : coneja;
             sig : ListaD;
          end;
//------------------------------------------------------------------------------
  coneja2 = record
                nroIdent : integer;
                raza : string;
                anioNac : integer;
            end;
  Lista = ^nodo;
  nodo = record
             dato : coneja2;
             sig : Lista;
         end;

// PROCESOS

Function AlgunParto (c : coneja) : boolean;
var
  i : integer;
  ok : boolean;
Begin
  ok := false;
  for i := 1 to c.cantPartos do
    if (c.cantCriasxParto[i] > 8) then
      ok := true;
  AlgunParto := ok;
End;

Procedure AgregarAdelante (var L : Lista; UnNro : integer; unaRaza : string; unAnio : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato.nroIdent := UnNro;
  aux^.dato.anioNac := unAnio;
  aux^.dato.raza := unaRaza;
  aux^.sig := L;
  L := aux;
End;

Procedure GenerarNuevaLista (Ldis : ListaD; var L : Lista);
Begin
  while (Ldis <> nil) do begin
    if (AlgunParto(Ldis^.dato)) then
      AgregarAdelante(L,Ldis^.dato.nroIdent,Ldis^.dato.raza, Ldis^.dato.anioNac);
    Ldis := Ldis^.sig;
  end;
End;

Function TerminaEnZero (unNum : integer) : boolean;
Begin
  TerminaEnZero := (unNum MOD 10 = 0);
End;

Procedure ImprimirXCondicion (L : Lista);
var
  cantConejas : integer;
Begin
  cantConejas := 0;
  while (L <> nil) do begin
    if (TerminaEnZero(L^.dato.nroIdent)) and (L^.dato.anioNac = 2018) then
      cantConejas := cantConejas + 1;
    L := L^.sig;
  end;
  writeln('la cantidad de conejas que cumplen las 2 condiciones son de un total de = ' , cantConejas);
End;

Function Promedio (Ldis : ListaD; nueCod : integer) : real;
var
  i, suma : integer;
  aux : real;
Begin
  suma := 0;
  while (Ldis <> nil) and (Ldis^.dato.nroIdent <> nueCod) do
    Ldis := Ldis^.sig;
  aux := -1;
  if(Ldis <> nil) then begin
    for i := 1 to tope do
      suma := suma + Ldis^.dato.cantCriasxParto[i];
    Promedio := suma;
  end
  else
    Promedio := aux;
End;

// P.P
VAR
  Ldis : ListaD;
  L : Lista;
  nueCod : integer;
BEGIN
  Ldis := nil;
  L := nil;
  //CargarListaConejas(Ldis);  // se dispone
  GenerarNuevaLista(Ldis,L);
  ImprimirXCondicion (L);
  writeln('ingrese un cod de coneja a buscar en lista');
  readln(nueCod);
  writeln(Promedio(Ldis,nueCod))
END.