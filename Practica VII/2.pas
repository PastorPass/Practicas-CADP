{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura. }

program uno;
const
  corte = 1122;
type
  rango = 1..6;
  cliente = record
                codCliente : integer;
                dni : integer;
                apellido : string[30];
                nombre : string[30];
                codPoliza : rango;
                montoBasic : real;
            end;
  Lista = ^nodo;
  nodo = record
            dato : cliente;
            sig : Lista;
         end;
  
  vectorTabla = array[rango] of real;  // vector que dispone de precios x cada codigo de poliza

// Procesos-Funciones

Procedure CargarPreciosVectorTabla(var vecT : vectorTabla);
var
  i : rango;
Begin
  for i := 1 to 6 do 
    vecT[i] := 100 + i;
End;

Procedure LeerCliente(var c : cliente);
Begin
  with c do begin
    writeln('ingrese codigo de cliente');
    readln(codCliente);
    writeln('ingrese dni');
    readln(dni);
    writeln('ingrese apellido');
    readln(apellido);
    writeln('ingrese nombre');
    readln(nombre);
    writeln('ingrese codigo de poliza (1..6)');
    readln(codPoliza);
    writeln('ingrese monto basico que abona mensualmente');
    readln(montoBasic);
  end;
End;

Procedure AgregarAdelante(var L : Lista; c : cliente);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := c;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarListaClientes(var L : Lista);
var
  c : cliente;
Begin
  repeat
    LeerCliente(c);
    AgregarAdelante(L,c);
  until(c.codCliente = corte);
End;


Function DosDigNueve(unDni : integer) : boolean;
var
  resto,ContNine : integer;
Begin
  ContNine := 0;
  while (unDni <> 0) do begin
    resto := unDni MOD 10;
    if (resto = 9) then
      ContNine := ContNine + 1;
    unDni := unDni DIV 10;
  end;
  DosDigNueve := (ContNine >= 2);
End;

Procedure RecorrerListaeInformar(L : Lista; vecT : vectorTabla);
Begin
  while (L <> nil) do begin
    writeln('------------INFORME X CLIENTE------------');  // informe inciso a)
    writeln('Dni del cliente : ' , L^.dato.dni , ' , nombre : ' , L^.dato.nombre , ', apellido : ', L^.dato.apellido); //a)
    writeln('monto completo que paga mensualmente por su seguro automotriz = ' , L^.dato.montoBasic+vecT[L^.dato.codPoliza]:2:2);//a)
    if(DosDigNueve(L^.dato.dni))then begin // inciso b)
      writeln('---------Informe de clientes con al menos 2 digitos 9 en su dni---------');
      writeln('apellido : ' , L^.dato.apellido , ' nombre : ' L^.dato.nombre);  // informe inciso b)
    end;
    L := L^.sig;
  end;
End;

Procedure BorrarElemEnLista(var L : Lista; nueCodCliente : integer);
var
  act,ant : Lista;
Begin
  act := L;
  while (act <> nil) and (act^.dato.codCliente <> nueCodCliente) do begin
    ant := act;
    act := act^.sig;
  end;
  if(act <> nil) then begin
    if(act = L) then
      L := act^.sig
    else
      ant^.sig := act^.sig;
    dispose(act);
  end;
End;

// P.P
VAR
  L : Lista;
  vecT : vectorTabla;  
  nueCodCliente : integer;
BEGIN
  L := nil;
  CargarListaClientes(L);
  CargarPreciosVectorTabla (vecT); // se dispone
  RecorrerListaeInformar(L,vecT);
  writeln('ingrese un nuevo codigo de cliente a eliminar');
  readln(nueCodCliente);
  BorrarElemEnLista(L,nueCodCliente);
  writeln('Se elimino el codigo de cliente ' , nueCodCliente , ' en la lista');
END.