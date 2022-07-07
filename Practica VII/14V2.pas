{14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par. }
Program uno;
const
  fin = -1;  //condicion de corte para el ISBN -1
  tope = 31;
type
  rangoDia = 1..tope;
//--Solo se lee la informacion, no se guarda en ninguna estructura,por lo que no se declara el tipo lista, es leer al aire
  prestamo = record
                nroPrestamo : integer;
                ISBN : integer;  // La información de los préstamos se lee de manera ordenada por ISBN
                nroSocio : integer;
                diaPrestamo : rangoDia;
             end;

//Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado
  nuePrestamo = record
                    vecesPrestado : integer;
                    ISBN : integer;  //Esta estructura debe quedar ordenada por ISBN de libro.
                end;
  Lista =^nodo;
  nodo = record
                dato : nuePrestamo;
                sig : Lista;
            end;
            
  vectorDias = array[rangoDia] of integer;
// Procesos-Funciones

Procedure LeerPrestamo(var p : prestamo);
Begin
  with p do begin
    writeln('ingrese ISBN del libro prestado');
    readln(ISBN);
    if (ISBN <> fin) then begin
      writeln('ingrese el numero de prestamo');
      readln(nroPrestamo);
      writeln('ingrese el numero de socio al que se le presto el libro');
      readln(nroSocio);
      writeln('ingrese el dia del prestamo (1..31)');
      readln(diaPrestamo);
    end;
  end;
End;

Procedure Asignado(var p2 : nuePrestamo; unIsbn,vecesPrestado : integer);
Begin
  p2.vecesPrestado := vecesPrestado;
  p2.ISBN := unIsbn;
End;

Procedure AgregarOrdenado(var L : Lista; p2 : nuePrestamo);
var
  act,ant,aux : Lista;
Begin
  new(aux);
  aux^.dato := p2;
  act := L;
  ant := L;
  while(act <> nil) and (act^.dato.ISBN < p2.ISBN) do begin
    ant := act;
    act := act^.sig;
  end;
  if(ant = act) then
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

Procedure ImprimirLista(L : Lista);
Begin
  while (L <> nil) do begin
    writeln('ORDEN DE ISBN : ' , L^.dato.ISBN , ' ,veces prestado = ' , L^.dato.vecesPrestado);
    L := L^.sig;
  end;
End;

Procedure InicializarVectorContadorDias(var vecCon : vectorDias);
var
  i : rangoDia;
Begin
  for i := 1 to tope do 
    vecCon[i] := 0;
End;

Procedure ImprimirVectorContador(vecCon : vectorDias);
var
  i : rangoDia;
Begin
  for i := 1 to tope do
    writeln('DIA NRO ' , i , '       CANTIDAD DE VECES SELECCIONADO = ' , vecCon[i]);
End;

Procedure UnMinimo(vecCon : vectorDias;var min,posMin : integer);
var
  i : rangoDia;
Begin
  for i := 1 to tope do begin
    if(vecCon[i] < min) then begin
      min := vecCon[i];
      posMin := i;
    end;
  end;
End;

Procedure LeerInfoRegistroyGenerarLista(var L : Lista);
var
  p : prestamo;
  auxISBN,vecPrestado,min,posMin,cantPrestamosXcondicion,prestamosTotal : integer;
  p2 : nuePrestamo;
  vecCon : vectorDias;
Begin
  InicializarVectorContadorDias(vecCon);
  min := 27000;  posMin := -1;
  cantPrestamosXcondicion := 0;  prestamosTotal := 0;
  LeerPrestamo(p);
  while (p.ISBN <> fin) do begin
    auxISBN := p.ISBN;
    vecPrestado := 0;
    
    //la información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se ingresa el ISBN -1
    while (p.ISBN <> fin) and (auxISBN = p.ISBN) {and (auxISBN > p.ISBN) }do begin
      vecPrestado:= vecPrestado + 1; // inciso a)
      vecCon[p.diaPrestamo] := vecCon[p.diaPrestamo] + 1;  // inciso b)
      if(p.nroPrestamo MOD 2 <> 0) AND (p.nroSocio MOD 2 = 0) then
        cantPrestamosXcondicion := cantPrestamosXcondicion + 1;
      LeerPrestamo(p);
    end;
    Asignado(p2,auxISBN,vecPrestado);  // inciso a)
    AgregarOrdenado(L,p2);  // inciso a)
    prestamosTotal := prestamosTotal + vecPrestado;
  end;
  ImprimirLista(L);  // opcional
  ImprimirVectorContador(vecCon);  // opcional
  UnMinimo(vecCon,min,posMin);
  writeln('el día del mes en que se realizaron menos préstamos : ' , posMin , '     cantidad de prestamos = ' , min); // informe inciso b)
  writeln('porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par = ' , (cantPrestamosXcondicion*100)/prestamosTotal:2:2, ' %');
End;

//P.P
VAR
  L : Lista;
BEGIN
  L := nil; 
  LeerInfoRegistroyGenerarLista(L);
END.