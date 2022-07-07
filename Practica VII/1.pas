{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.  }
Program uno;
const
  corte = 33555444;
type  
  rango = 1..5;
  rangoEdad = 0..128;
  persona = record
                dni : 0..corte;
                apeyNom : string[30];
                edad : rangoEdad;
                codGenero : rango;
            end;
  Lista = ^nodo;
  nodo = record
            dato : persona;
            sig : Lista;
         end;
  vectorGeneros = array[rango] of integer;  // vector contador x cada eleccion de un codigo de genero de actuacion

// Procesos-Funciones

Procedure LeerPersona(var p : persona);
Begin
  with p do begin
    writeln('ingrese dni');
    readln(dni);
    writeln('ingrese apellido y nombre');
    readln(apeyNom);
    writeln('ingrese edad');
    readln(edad);
    writeln('ingrese codigo de genero de actuacion');
    readln(codGenero);
  end;
End;

Procedure AgregarAdelante(var L : Lista; p : persona);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarListaPersonas(var L : Lista);
var
  p : persona;
Begin
  repeat
    LeerPersona(p);
    AgregarAdelante(L,p);
  until(p.dni = corte);
End;

Function MasPares (unDni : integer) : boolean;
var
  pares,impares,resto : integer;
Begin
  pares := 0;  impares := 0;
  while (unDni <> 0) do begin
    resto := unDni MOD 10;
    if (resto MOD 2 = 0) then
      pares := pares + 1
    else
      impares := impares + 1;
    unDni := unDni DIV 10;
  end;
  MasPares := (pares > impares);
End;

Procedure InicializarVectorContador(var vecCon : vectorGeneros);
var
  i : rango;
Begin
  for i := 1 to 5 do 
    vecCon[i] := 0;
End;

Procedure DosMaximos(vecCon : vectorGeneros; var c1,c2,max1,max2 : integer);
var
  i : rango;
Begin
  for i := 1 to 5 do begin
    if (vecCon[i] > max1) then begin
      max2 := max1;
      c2 := c1;
      max1 := vecCon[i];
      c1 := i;
    end
    else
      if (vecCon[i] > max2) then begin
        max2 := vecCon[i];
        c2 := i;
      end;
  end;
End;

Procedure ImprimirVectorCodigos(vecCon : vectorGeneros);
var
  i : rango;
Begin
  for i := 1 to 5 do 
    writeln('nro de codigo de actuacion : ' , i , ' cantidad de veces elegido = ' , vecCon[i]);
End;

Procedure RecorrerListaeInformar(L : Lista);
var
  cantPersMasPares : integer;
  vecCon : vectorGeneros;
  c1,c2,max1,max2 : integer;
Begin
  cantPersMasPares := 0;
  InicializarVectorContador(vecCon);
  max1 := -1;  max2 := -1;  c1 := 0;  c2 := 0; 
  while (L <> nil) do begin
    if (MasPares(L^.dato.dni)) then
      cantPersMasPares := cantPersMasPares + 1;  // inciso a)
    vecCon[L^.dato.codGenero] := vecCon[L^.dato.codGenero] + 1;  // inciso b)
    L := L^.sig;
  end;
  writeln('la cantidad de personas cuyo DNI contiene más dígitos pares que impares = ' , cantPersMasPares);  // informe inciso a)
  DosMaximos(vecCon,c1,c2,max1,max2);
  writeln('los dos códigos de género más elegidos = ' , c1 , ' y ' , c2);  // informe inciso b) 
  ImprimirVectorCodigos (vecCon);  // opcional
End;

Procedure EliminarElemEnLista(var L : Lista; nuevoDni : integer; var ok : boolean);
var
  ant,act : Lista;
Begin
  ok := false;
  act := L;
  while (act <> nil) and (act^.dato.dni <> nuevoDni) do begin
    ant := act;
    act := act^.sig;
  end;
  if (act <> nil) then begin
    ok := true;
    if (act = L) then
      L := act^.sig
    else
      ant^.sig := act^.sig;
    dispose(act);
  end;
End;

// P.P
VAR
  L : Lista;
  nuevoDni : integer;
  ok : boolean;
BEGIN
  L := NIL;
  CargarListaPersonas(L);
  RecorrerListaeInformar(L);
  writeln('agregue un dni a eliminar de la lista');
  readln(nuevoDni);
  EliminarElemEnLista(L,nuevoDni,ok);
  if (ok) then
    writeln('se elimino el dni ' , nuevoDni , ' de la lista')
  else
    writeln('no se elimino');
END.