{ TEMA 6 
ENUNCIADO :
Un criadero de cerdos dispone de informacion sobre todos los partos registrados. 
De cada parto se conoce : año, codigo de la madre (entre 200 y 499) y cantidad de crias paridas.
Una madre puede parir mas de una vez.

a) Realice un modulo que lea la informacion de las 300 madres y la almacene en una estructura adecuada.
De cada madre se lee : codigo, año de nacimiento y raza. La informacion se ingresa sin orden.

b) Realice un modulo que reciba la informacion de partos, la informacion de madres y un codigo de madre 
y retorne en una estructura adecuada la informacion de todos los partos de dicha madre, 
en los que la madre tenia al menos 1 año al momento del parto. 
La estructura debe quedar ordenada por cantidad de crias del parto.

c) Realice un modulo que reciba la informacion de partos generada en b) e informe la cantidad de 
partos en los que nacieron menos de 4 crias.  }

program uno;
const
  min = 200;
  max = 499;
type
  rango = min..max;
  parto = record
             Anio : integer;
             codMadre : rango;
             cantCrias : integer;
          end;
  ListaD = ^nodoD;  // esta lista dispone la carga de partos, (no se sabe cuantos partos)
  nodoD = record
             dato : parto;
             sig : ListaD;
          end;
//------------------------------------------------------------------------------
  madre = record
             cod : integer;
             anioNac : integer;
             raza : string;
          end;
  vectorMadres = array[rango] of madre;

// PROCESOS
Procedure CargarListaPartos (var Ldis : ListaD);  // se dispone

Procedure LeerMadre (var m : madre);
Begin
  with m do begin
    readln(cod);
    readln(anioNac);
    readln(raza);
  end;
End;

Procedure CargarVectorMadres (var vec : vectorMadres);
var
  i : integer;
  m : madre;
Begin
  for i := min to max do begin
    LeerMadre (m);
    vec[m.cod] := m;
  end;
End;

Function CumpleEdad (p : parto; m : madre) : boolean;
Begin
  CumpleEdad := (p.Anio - m.anioNac >= 1);
End;

Procedure InsertarOrdenado (var L : ListaD; p : parto);
var
  ant,act,aux : ListaD;
Begin
  new(aux);
  aux^.dato := p;
  act := L;
  ant := L;
  while (act <> nil) and (act^.dato.cantCrias > p.cantCrias) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

Procedure GenerarNuevaLista (Ldis : ListaD; vec : vectorMadres; NueCod : integer; var L : ListaD);
Begin
  while (Ldis <> nil) do begin
    if (CumpleEdad (Ldis^.dato,vec[Ldis^.dato.codMadre])) then
      InsertarOrdenado (L,Ldis^.dato);
    Ldis := Ldis^.sig;
  end;
End;

Function InformeXCondicion (L : ListaD) : integer;
var
  cantPartos : integer;
Begin
  cantPartos := 0;
  while (L <> nil) do begin
    if (L^.dato.cantCrias < 4) then
      cantPartos := cantPartos + 1;
    L := L^.sig;
  end;
  InformeXCondicion := cantPartos;
End;

// P.P
VAR
  Ldis : ListaD;
  vec : vectorMadres;
  NueCod : integer;
  L : ListaD;
BEGIN
  L := nil;
  Ldis := nil;
  CargarListaPartos(Ldis); // se dispone
  CargarVectorMadres (vec);
  writeln('ingrese un nuevo cod de madre');
  readln(NueCod);
  GenerarNuevaLista (Ldis,vec,NueCod,L);
  writeln(InformeXCondicion(L));
END.