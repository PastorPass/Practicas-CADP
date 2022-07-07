{ 9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
descendente  }

program JugamosConListas;
type
  Lista = ^nodo;
  nodo = record
            num : integer;
            sig : Lista;
         end;
         
procedure armarNodo(var L: Lista; v: integer);
var
 aux : Lista;
begin
  new(aux);
  aux^.num := v;
  aux^.sig := L;
  L := aux;
end;

Procedure ImprimirLista(pri : Lista);
Begin
  while (pri <> nil) do begin
    writeln(pri^.num);
    pri := pri^.sig;
  end;
End;

Function EstaOrdenado(L:Lista): boolean;
var
  aux:Lista;
Begin
  aux :=L;
  while (L <> nil) and (aux^.num <= L^.num) do begin  // VERIFICA QUE EL ORDEN SEA DESCENDENTE(DE MAYOR A MENOR)
    aux:= L;
	L:= L^.sig;
  end;
  EstaOrdenado:= (L = nil);  //si corto porque L llego a nil es porque estaba la lista ordenada
End;

Procedure Eliminar(var L : Lista; unValor : integer; var exito : boolean);
var
  ant,act : Lista;
Begin
  exito := false;
  act := L;
  while (act <> nil) and (act^.num <> unValor) do begin
    ant := act;
    act := act^.sig;
  end;
  if (act <> nil) then begin  
    exito := true;
    if (act = L) then  // el dato a borrar es el 1ero
      L := act^.sig
    else  // el dato a borrar es uno cualquiera
      ant^.sig := act^.sig;
    DISPOSE(act);
  end;
End;

Procedure armarNodo2(var L2 : Lista; dato : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.num := dato;
  aux^.sig := L2;
  L2 := aux;
End;

Procedure Sublista (L:Lista; valorA,valorB:integer ;var L2:Lista);
Begin
  while(L <> nil) do begin
    if (L^.num > valorA) and (L^.num < valorB) then
      armarNodo2(L2,L^.num);  // L^.num es un numero entero
    L:= L^.sig;
  end;
End;

Procedure SubListaV1 (L:Lista; valorA,valorB:integer;var L2:Lista);
Begin
  while(L <> nil) and (L^.num < valorB) do begin //si ya es mayor al valor B significa que no hay mas numeros que cumplan la condicion
    if(L^.num > valorA) then
      armarNodo2(L2,L^.num);
    L:= L^.sig;
  end;
End;

Procedure SubListaV2 (L:Lista; valorA,valorB:integer;var L2:Lista);
Begin
  while(L <> nil) and (L^.num > valorA) do begin//si ya es menor al valor A significa que no hay mas numeros que cumplan la condicion
    if(L^.num < valorB) then
      armarNodo2(L2,L^.num);
    L:=L^.sig;
  end;
End;

Procedure ImprimirNuevaLista(L2 : Lista);
Begin
  while (L2 <> nil) do begin
    writeln(L2^.num);
    L2:= L2^.sig;
  end;
End;

// P.P
VAR
  L,L2 : Lista;
  valor,unValor,A,B : integer;
  exito : boolean;
BEGIN
  L := nil;  L2 := nil;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do begin 
    armarNodo(L, valor);  // en este caso armarNodo es un agregarAdelante
    writeln('Ingrese un numero');
    readln(valor);
  end;
  ImprimirLista(L);  // modulo que imprime los numeros guardados en la lista generada
  writeln(EstaOrdenado(L));  //EN ESTE CASO VERIFICA QUE ESTE ORDENADO DE MANERA DESCENDENTE(DE MAYOR A MENOR) inciso a)
  writeln('ingrese un valor a eliminar de la lista');
  readln(unValor);
  Eliminar(L,unValor,exito);  // inciso b)
  if (exito) then
    writeln('se elimino el valor ' , unValor , ' de la lista')
  else
    writeln('no existe el valor : ' , unValor , ' en la lista'); 
  writeln('ingrese un valor entero A');
  readln(A);
  writeln('ingrese un valor entero B');
  readln(B);
  SubLista(L,A,B,L2);  // inciso c)
  SubListaV1(L,A,B,L2);  // inciso d)
  SubListaV2(L,A,B,L2);  // inciso e)
  ImprimirNuevaLista(L2);
END.