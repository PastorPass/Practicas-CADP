{ TEMA 8 (REDUCIDO)
ENUNCIADO :
Un establecimiento canino dispone de informacion sobre los partos registrados .
De cada parto se conoce : nro de identificacion, año, codigo de la madre, ( entre 100 y 499) y cantidad de crias nacidas. 
Una madre puede parir mas de una vez. La estructura se encuentra ordenada por año de manera ascendente.

a) Realice un modulo que lea informacion de las 400 madres y la almacene en una estructura adecuada.
De cada madre se lee : codigo y raza.
La informacion se ingresa sin orden

b) Realice un modulo que reciba la informacion de los partos y la informacion de las madres
y retorne una nueva estructura con los nro de identificacion de los partos de madres de raza 'doberman'
que se produjeron antes del año 2000.  }

program uno;
const
  min = 100;
  max = 499;
type
  rango = min..max;
  parto = record
             nroIdent : integer;
             anio : integer;
             codMadre : rango;
             cantCrias : integer;
          end;
          
  ListaD = ^nodoD;
  nodoD = record
             dato : parto;
             sig : ListaD;
          end;
          
  madre = record
             cod : integer;
             raza : string;
          end;
  vectorMadres = array[rango] of madre;
  
// PROCESOS

Procedure CargarListaPartos (var Ldis : ListaD);  // se dispone y esta ordenada de manera ascendente

Procedure LeerMadre (var m : madre);
Begin
  with m do begin
    readln(cod);
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

Function Cumple (m : madre) : boolean;
Begin
  Cumple := (m.raza = 'doberman'); 
End;

Procedure AgregarAdelante (var L : ListaD; unNro : integer);
var
  aux : ListaD;
Begin
  new(aux);
  aux^.dato.nroIdent := unNro;
  aux^.sig := L;
  L := aux;
End;

Procedure GenerarNuevaLista (Ldis : ListaD; vec : vectorMadres; var L : ListaD);
Begin
  while (Ldis <> nil) and (Ldis^.dato.anio < 2000) do begin
    if (Cumple(vec[Ldis^.dato.codMadre])) then
      AgregarAdelante(L,Ldis^.dato.nroIdent);
    Ldis := Ldis^.sig;
  end;
End;

// P.P
VAR
  Ldis, L : ListaD;
  vec : vectorMadres;
BEGIN
  Ldis := nil;  L := nil;
  CargarListaPartos (Ldis); // se dispone
  CargarVectorMadres (vec);
  GenerarNuevaLista(Ldis,vec,L);
END.