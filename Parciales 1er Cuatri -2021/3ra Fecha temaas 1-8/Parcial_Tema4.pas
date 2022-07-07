{ TEMA 4
ENUNCIADO :
La asociacion de criadores de conejos analiza ciclos de reproduccion .
Para ello, dispone de una estructura con informacion de conejas de distintos criaderos.
De cada coneja se conoce : codigo, año de nacimiento, nombre, cantidad de partos (entre 1 y 15)
y cantidad de crias que tuvo en cada parto.

a) Realice un modulo que reciba la informacion de conejas y retorne en una estructura adecuada, 
el codigo, el nombre y el año de nacimiento de las conejas que tuvieron mas de 30 crias entre todos sus partos.

b) Realice un modulo que reciba la estructura generada en a) e imprima el nombre de las conejas
nacidas entre 2014 y 2019 con codigo impar.

c) Realice una funcion que reciba la informacion de conejas y un codigo de coneja, 
y retorne el promedio de crias por parto de dicha coneja (retorne -1 si la coneja no se encuentra en la estructura)  }

program uno;
const
  tope = 15;
type
  rango = 1..tope;
  vectorCriasXParto = array[rango] of integer;
  coneja = record
                cod : integer;
                anioNac : integer;
                nom : string;
                cantPartos : rango;
                cantCriasXParto : vectorCriasXParto;
           end;
  
  ListaD = ^nodoD;
  nodoD = record
             dato : coneja;
             sig : ListaD;
          end;
//------------------------------------------------------------------------------
  coneja2 = record
                cod : integer;
                nom : string;
                anioNac : integer;
            end;
  Lista = ^nodo;
  nodo = record
             dato : coneja2;
             sig : Lista;
         end;

// PROCESOS

Function AllCrias (c : coneja) : integer;
var
  i,suma : integer;
Begin
  suma := 0;
  for i := 1 to c.cantPartos do 
    suma := suma + c.cantCriasXParto[i];
  AllCrias := suma;
End;

Procedure AgregarAdelante (var L : Lista; UnCod : integer; unNom : string; unAnio : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato.cod := UnCod;
  aux^.dato.nom := unNom;
  aux^.dato.anioNac := unAnio;
  aux^.sig := L;
  L := aux;
End;

Procedure GenerarListaNueva (Ldis : ListaD; var L : Lista);
Begin
  while (Ldis <> nil) do begin
    if (AllCrias(Ldis^.dato) > 30) then
      AgregarAdelante (L,Ldis^.dato.cod,Ldis^.dato.nom, Ldis^.dato.anioNac);
    Ldis := Ldis^.sig;
  end;
End;

Procedure ImprimirXCondicion (L : Lista);
Begin
  while (L <> nil) do begin
    if (L^.dato.anioNac >= 2014) and (L^.dato.anioNac <= 2019) and (L^.dato.cod MOD 2 <> 0) then
      writeln('nombre de la coneja que cumple las 2 condiciones : ' , L^.dato.nom);
    L := L^.sig;
  end;
End;

Function Promedio (c : coneja) : real;
var
  i, suma : integer;
Begin
  suma := 0;
  for i := 1 to c.cantPartos do
    suma := suma + c.cantCriasXParto[i];
  Promedio := suma;
End;
Function BuscarPromedio (Ldis : ListaD; NueCod : integer) : real;
var
  max : real;
Begin
  while (Ldis <> nil) and (Ldis^.dato.cod <> NueCod) do begin
    Ldis := Ldis^.sig;
  max := -1;
  if (Ldis <> nil) then
    max := Promedio(Ldis^.dato);
  BuscarPromedio := max;
End;

//P.P

VAR
  Ldis : ListaD;
  L : Lista;
  NueCod : integer;
BEGIN
  Ldis := nil;
  L := nil;
  CargarListaConejas (Ldis);  // se dispone
  GenerarListaNueva (Ldis,L);
  ImprimirXCondicion (L);
  writeln('ingrese un nuevo codigo de coneja a buscar en lista');
  readln(NueCod);
  writeln(Promedio(L,NueCod))
END.