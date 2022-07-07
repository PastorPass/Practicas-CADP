{ 10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número
(que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número,
en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos
los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por
vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.   }
Program uno;
const
  fin = 0;  // invento una condicion de corte para el dni
type
  cliente = record
                dni : integer;
                numero : integer;
            end;
  ListaEsp =^nodo;  // inciso a)
  nodo = record  
            dato : cliente;
            sig : ListaEsp;
         end;
         
// Procesos-Funciones

Procedure AgregarAlFinal2(var L,ult : ListaEsp; c : cliente);
var
  aux: ListaEsp;
Begin
  new(aux); 
  aux^.dato := c;
  aux^.sig := nil;
  if (L <> nil) then  // si la lista tiene elementos 
    ult^.sig := aux
  else     //si la lista esta vacia
    L := aux; 
  ult := aux;
End;

Procedure RecibirCliente(var L, ult : ListaEsp; unDni: integer; var unNumero : integer);
var
  c : cliente;
Begin
  unNumero := unNumero + 1;  
  c.dni := unDni;
  c.numero := unNumero;
  AgregarAlFinal2(L,ult,c);
End;

Procedure CargarLista(var L,ult : ListaEsp);
var
  num, dni : integer;
Begin
  num := 0;
  writeln('ingrese dni');
  readln(dni);
  while (dni <> fin) do begin
    RecibirCliente(L,ult,dni,num); // inciso b)
    writeln('vuelva a ingresar dni');
    readln(dni);
  end;
End;

Procedure AtenderCliente (var LEsp:ListaEsp; unDni:integer; var ok:boolean); 
var
  ant,act : ListaEsp;
Begin
  ok := false;
  act:= LEsp;
  while (act <> nil) and (act^.dato.dni <> unDni) do begin
		ant:= act;
		act:= act^.sig
  end;
  if (act <> nil) then begin
    ok := true;
	if (act = LEsp) then  // el dato a borrar es el 1ero
	  LEsp:= act^.sig
	else  // el dato a borrar es uno cualquiera
	  ant^.sig:= act^.sig;
	dispose (act);
  end;
End;

Procedure AtencionCliente (var LEsp:ListaEsp);
var
  DniAtendido :integer;
  exito:boolean;
Begin
  while (LEsp <> nil)  and (DniAtendido <> -1) do begin
    writeln ('Ingrese DNI del cliente atendido: ( -1 para dejar de atender)');
	readln(DniAtendido);
	AtenderCliente (LEsp,DniAtendido,exito);  // inciso c)
	if (exito) then
	  writeln ('------Cliente atendido------')
	else 
	  writeln ('-------No existe cliente con ese DNI-------');
  end;
End;

Function EstaVacio(L : ListaEsp) : boolean;
Begin
  EstaVacio := (L = nil);
End;

//P.P
VAR
  L,ult : ListaEsp;
BEGIN
  L := nil;  ult := nil;
  CargarLista(L,ult);
  AtencionCliente(L);  // INCISO d)  
  if (EstaVacio(L))then
    writeln('se atendieron todos los clientes')
  else
    writeln('no se atendieron todos los clientes');
END.
