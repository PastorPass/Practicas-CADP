{ 1. Dado el siguiente programa: }
program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
            num : integer;
            sig : lista;
         end;
         
procedure armarNodo(var L: lista; v: integer);
var
 aux : lista;
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

Procedure IncrementarValorEnLista (pri : lista; unValor : integer);
Begin
  while (pri <> nil) do begin
    pri^.num := pri^.num + unValor;
    pri := pri^.sig;
  end;
End;

// P.P
VAR
  pri : lista;
  valor, unValor : integer;
BEGIN
  pri := nil;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do begin  // then begin?? 
    armarNodo(pri, valor);
    writeln('Ingrese un numero');
    readln(valor);
  end;
  ImprimirLista(pri);  // modulo que imprime los numeros guardados en la lista generada
  writeln('ingrese un valor a incrementar en la lista');
  readln(unValor);  // en este caso unValor es un dato que se lee de teclado, pero puede ser una constante ,ej : 200
  IncrementarValorEnLista(pri,unValor);
  ImprimirLista(pri);  // imprimir para chequear que la lista este actualizada
END.

{ a. Indicar qué hace el programa.
  Rta : El programa va creando una lista de numeros enteros y finaliza la carga cuando lee un numero que sea 0,
  esta lista se va cargando con un  procedure agregarAdelante 
  
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
  Rta : la lista se va cargando dejando el ultimo numero leido adelante , por ejemplo : primero imprime el 48 - 13 - 21 - 10 

c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
  Rta : a la orden capitan
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista. 
  Rta : hecho}