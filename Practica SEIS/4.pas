{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A  }
program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
            num : integer;
            sig : lista;
         end;

procedure AgregarAtras(var L: lista; n: integer);  
var
 act,aux : lista;
begin
  new(aux);
  aux^.num := n;
  aux^.sig := nil;
  if (L <> nil) then begin
    act := L;
    while (act^.sig <> nil) do 
      act := act^.sig;
    act^.sig := aux;
  end
  else
    L := aux;
end;

Procedure ImprimirLista(L : Lista);
Begin
  writeln('------Impresion de la lista------');
  while (L <> nil) do begin
    writeln(L^.num);
    L := L^.sig;
  end;
End;

Procedure Maximo (L : lista; var max : integer);
Begin
  while (L <> nil) do begin
    if (L^.num > max) then
      max := L^.num;
    L := L^.sig;
  end;
  writeln('el numero maximo ingresado fue : ' , max);
End;

Procedure Minimo (L : lista; var min : integer);
Begin
  while (L <> nil) do begin
    if (L^.num < min) then
      min := L^.num;
    L := L^.sig;
  end;
  writeln('el numero minimo ingresado fue : ' , min);
End;

Function Multiplos(L :lista; A : integer) : integer;
var
  auxCant : integer;
Begin
  auxCant := 0;
  while (L <> nil) do begin
    if (L^.num MOD A = 0) then
      auxCant := auxCant + 1;
    L := L^.sig;
  end;
  Multiplos := auxCant;
End;

// P.P
VAR
  L : lista;
  valor,max,min,A,cant : integer;
BEGIN
  cant := 0;
  L := nil;
  max := -1;  min := 999;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do begin 
    AgregarAtras(L, valor);
    writeln('Ingrese un numero');
    readln(valor);
  end;
  ImprimirLista(L);  // modulo que imprime los numeros guardados en la lista generada
  Maximo(L,max);
  Minimo(L,min);
  writeln('ingrese un valor A');
  readln(A);
  writeln('la cantidad de elementos de la lista que son múltiplos de ' , A , ' es = ' , Multiplos(L,A));
END.