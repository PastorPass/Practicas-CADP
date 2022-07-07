{ TEMA 5 
ENUNCIADO :
Un criadero de cerdos dispone de informacion sobre los partos registrados. 
De cada parto se conoce : año, codigo de la madre (entre 200 y 599) y cantidad de crias paridas.  
Una madre puede parir mas de una vez.

a) Realice un modulo que lea la informacion de las 400 madres y la almacene en una estructura adecuada.
De cada madre se lee : codigo, año de nacimiento y raza. La informacion se ingresa sin orden.

b) Realice un modulo que reciba la informacion de partos, la informacion de madres y un codigo de madre,
y retorne en una estructura adecuada la informacion de todos los partos de dicha madre, 
en los que hayan parido al menos 4 crias y en los que la madre tenia al menos 2 años al momento del parto.  
La estructura debe quedar ordenada por cantidad de crias del parto.

c) Realice un modulo que reciba la informacion de partos generada en b) e informe el promedio 
de crias por parto de dicha madre.  }

program uno;
const
  min = 200;
  max = 599;
type
  rango = min..max;
  parto = record
             anio : integer;
             codMadre : rango;
             cantCrias : integer;
          end;
  
  ListaD =^nodoD;
  nodoD = record
             dato : parto;
             sig : ListaD;
          end;
          
  madre = record
             codigo : rango;
             anioNac : integer;
             raza : string;
          end;
  vectorMadres = array[rango] of madre;
  
  
// PROCESOS
Procedure CargarListaPartos (var Ldis : ListaD);  // se dispone

Procedure LeerMadre (var m : madre);
Begin
  with m do begin
    readln(codigo);
    readln(anioNac);
    readln(raza);
  end;
End;

Procedure CargarVectorMadres (var vec : vectorMadres);
var
  i : integer;
  m : madre;
Begin
  for i := min to max do  begin
    LeerMadre(m);
    vec[m.codigo] := m;
  end;
End;

Function cumpleEdad (UnAnioNac,UnAnio : integer) : boolean;
var
  resto : integer;
Begin
  resto := (UnAnio - UnAnioNac);
  if (resto >= 2) then
    cumpleEdad := true
  else
    cumpleEdad := false;
End;

Procedure InsertarOrdenado (var L : ListaD; p : parto);
var
  ant,act,aux : ListaD;
Begin
  new(aux);
  aux^.dato := p;
  act := L;
  while (act <> nil) and (act^.dato.cantCrias > p.cantCrias) do begin
    ant := act;
    act := act^.sig;
  end;
  if (act = L) then begin
    aux^.sig := L;
    L := aux;
  end
  else begin
    ant^.sig := aux;
    aux^.sig := act;
  end;
End;

Procedure GenerarNuevaLista(Ldis : ListaD; vec : vectorMadres; var L : ListaD ; nueCod : integer);
Begin
  while (Ldis <> nil) do begin
    if (Ldis^.dato.cantCrias >=4) and (cumpleEdad(vec[Ldis^.dato.codMadre].anioNac, Ldis^.dato.anio)) then
      InsertarOrdenado (L,Ldis^.dato);
    Ldis := Ldis^.sig;
  end;
End;

Function Promedio (L : ListaD) : real;
var
  cantCrias,cantPartos : integer;
Begin
  cantCrias := 0;  cantPartos := 0;
  while (L <> nil) do begin
    cantPartos := cantPartos + 1;
    cantCrias := cantCrias + L^.dato.cantCrias;
  end;
  Promedio := cantCrias / cantPartos;
End;

// P.P
VAR
  Ldis : ListaD;
  L : ListaD;
  vec : vectorMadres;
  nueCod : integer;
BEGIN
  Ldis := nil;
  L := nil;
  CargarListaPartos (Ldis);  // se dispone
  CargarVectorMadres(vec);
  writeln('ingrese un codigo de madre');
  readln(nueCod);
  GenerarNuevaLista(Ldis,vec,L,nueCod);
  writeln(Promedio(L));
END.