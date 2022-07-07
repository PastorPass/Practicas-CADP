{ TEMA 7 
ENUNCIADO :
Un criadero de cerdos dispone de informacion sobre los partos registrados . 
De cada parto se conoce : año ,codigo de la madre (entre 100 y 499) y cantidad de crias nacidas. 
Una madre puede parir mas de una vez.

a) Realice un modulo que lea la informacion de las 400 madres y la almacene en una estructura adecuada. 
De cada madre se lee : codigo, año de nacimiento y raza.
La informacion se ingresa sin orden.

b) Realice un modulo que reciba la informacion de partos, la informacion de madres y un codigo de madre, 
y retorne en una estructura adecuada la informacion de los partos de dicha madre, 
en los que la madre tenia a lo sumo 3 años al momento del parto. 
La estructura debe quedar ordenada por cantidad de crias del parto.

c) Realice un modulo que reciba la informacion de los partos generada en b) e informe 
la cantidad de partos en los que nacieron mas de 8 crias.  }

program uno;
const
  min = 100;
  max = 499;
type 
  rango = min..max;
  parto = record
             anio : integer;
             codMadre : rango;
             cantCrias : integer;
          end;
  ListaD = ^nodoD;
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
Procedure CargarListaPartos (var Ldis : ListaD);

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
  CumpleEdad := (p.anio - m.anioNac >= 3);
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

Procedure GenerarNuevaLista (Ldis : ListaD; vec : vectorMadres; nueCod : integer; var L : ListaD);
Begin
  while (Ldis <> nil) do begin
    if (CumpleEdad(Ldis^.dato,vec[Ldis^.dato.codMadre])) then
      InsertarOrdenado(L,Ldis^.dato);
    Ldis := Ldis^.sig;
  end;
End;

Function InformePartos (L : ListaD) : integer;
var
  cantPartos : integer;
Begin
  cantPartos := 0;
  while (L <> nil) do begin
    if (L^.dato.cantCrias > 8) then
      cantPartos := cantPartos + 1;
    L := L^.sig;
  end;
  InformePartos := cantPartos;
End;

// P.P
VAR
  Ldis : ListaD;
  vec : vectorMadres;
  L : ListaD;
  nueCod : integer;
BEGIN
  Ldis := nil;
  L := nil;
  CargarListaPartos(Ldis);  // se dispone
  CargarVectorMadres (vec);
  writeln('ingrese un nuevo cod de parto');
  readln(nueCod);
  GenerarNuevaLista(Ldis,vec,nueCod,L);
  writeln(InformePartos(L));
END.