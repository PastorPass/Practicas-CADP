{ Tema 1 (Reducido)
ENUNCIADO : Un establecimiento canino analiza ciclos de reproduccion de sus hembras 
y dispone de una estructura que contiene para cada hembra , nombre , nro de identificacion,
año de nacimiento,cantidad de partos (entre 1 y 12) y cantidad de crias que tuvo en cada parto.

a) Realice un modulo que reciba la informacion de las hembras y retorne en una estructura adecuada,
nombre,nro de identificacion y año de nacimiento de las hembras que hayan tenido
a lo sumo 15 crias entre todos sus partos. La estructura resultante debe quedar ordenada por nombre.

b) Realice una funcion que reciba la estructura generada en a) y un nombre y devuelva
el nro de identificacion de la hembra correspondiente a ese nombre (retornar -1 en caso de que no se encuentre el nombre)  }

program uno;
const
  tope = 12;
type
  rango = 1..tope;
  vectorCriasXParto = array[rango] of integer;  // vector que cuenta la cantidad de crias que tuvo en cada parto 
  hembra = record
             nom : string;
             nroIdent : integer;
             anioNac : integer;
             cantPartos : rango;
             cantCrias : vectorCriasXParto;
           end;

  ListaD = ^nodoD;
  nodoD = record
             dato : hembra;
             sig : ListaD;
          end;
//---------------------------------------------------------
  hembra2 = record
                nombre : string;
                nroIdent : integer;
                anioNac : integer;
            end;
            
  ListaNue = ^nodo;
  nodo = record
            dato : hembra2;
            sig : ListaNue;
         end;

// PROCESOS 

//Procedure CargarListaHembras (var Ldis : ListaD);  // se dispone

Function SumaVector (h :hembra) : integer;
var
  i : rango;
  suma : integer;
Begin
  suma := 0;
  for i := 1 to tope do 
    suma := suma + h.cantCrias[i];
  SumaVector := suma;
End;

Procedure Asignado (Ldis : ListaD; var h : hembra2);
Begin
  h.nombre := Ldis^.dato.nom;
  h.nroIdent := Ldis^.dato.nroIdent;
  h.anioNac := Ldis^.dato.anioNac;
End;

Procedure InsertarOrdenado (var L2 : ListaNue; h : hembra2);
var
  ant,act,aux : ListaNue;
Begin
  new(aux);
  aux^.dato := h;
  act := L2;
  ant := L2;
  while (act <> nil) and (act^.dato.nombre < h.nombre) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then
    L2 := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

Procedure GenerarNuevaLista(Ldis : ListaD; var L2 : ListaNue);
var
  h : hembra2;
Begin
  while (Ldis <> nil) do begin
    if (SumaVector(Ldis^.dato) > 15) then begin
      Asignado(Ldis,h);
      InsertarOrdenado(L2,h);
    end;
    Ldis := Ldis^.sig;
  end;
End;

Function BuscarElemento (L2 : ListaNue; NueNom : string) : integer;
var
  act : ListaNue;
  nroI : integer;
Begin
  act := L2;
  while (act <> nil) and (act^.dato.nombre < NueNom) do begin
    act := act^.sig;
  nroI := -1;
  if (act <> nil) and (act^.dato.nombre = NueNom) then
    nroI := L2^.dato.nroIdent;
  BuscarElemento := nroI;
End;

// P.P

VAR
  Ldis: ListaD;
  L2 : ListaNue;
  NueNom : string;
BEGIN
  L2 := nil;
  Ldis := nil;
  CargarListaHembras (Ldis);  // se dispone
  GenerarNuevaLista(Ldis,L2);
  writeln('ingrese un nuevo nombre a buscar en la nueva lista');
  readln(NueNom);
  writeln(BuscarElemento (L2, NueNom));

END.
