{ 3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.  }
program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
            num : integer;
            sig : lista;
         end;

procedure AgregarAtras(var L: lista; n: integer);  // inciso a)
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
  while (L <> nil) do begin
    writeln(L^.num);
    L := L^.sig;
  end;
End;

procedure AgregarAtras2(var L,ult: lista; n: integer);  // con puntero al ultimo nodo, inciso b)
var
 aux : lista;
begin
  new(aux);
  aux^.num := n;
  aux^.sig := nil;
  if (L <> nil) then  // si la lista tiene elementos
    ult^.sig := aux
  else  // si la lista esta vacia
    L := aux;
  ult := aux;
end;

// P.P
VAR
  L,ult : lista;
  valor : integer;
BEGIN
  L := nil;
  ult := nil;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do begin 
    //AgregarAtras(L, valor);
    AgregarAtras2(L,ult,valor);
    writeln('Ingrese un numero');
    readln(valor);
  end;
  ImprimirLista(L);  // modulo que imprime los numeros guardados en la lista generada
END.