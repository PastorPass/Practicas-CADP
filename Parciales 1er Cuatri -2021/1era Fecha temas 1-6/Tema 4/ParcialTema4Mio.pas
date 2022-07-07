{ TEMA 4 -PARCIAL PRIMERA FECHA
 Una empresa de telefonia celular desea analizar las ventas de 120 modelos de telefonos durante la ultima edicion del cybermonday.
De cada telefono vendido se conoce su codigo (entre 1..130), codigo de cliente, marca del telefono y el medio de pago utilizado
(1. Credito;  2. Debito;  3. Transferencia;  4. Mercado Pago;  5. Bitcoin;  6. Otro)

Ademas el servicio dispone de una tabla con el valor de venta de cada uno de los telefonos. // me indica un vector dispuesto

a) Realizar un modulo que retorne la informacion de las ventas de telefonos en una estructura de datos adecuada . La informacion
se ingresa por teclado y debe almacenarse en el orden en que fue leida.  La lectura finaliza cuando se ingresa
el codigo de cliente 11111, que debe procesarse.

b) Realizar un modulo que reciba la informacion cargada en el inciso anterior y retorne :
- Los dos medios de pago que generaron el mayor monto total en ventas       // solicita un vector contador

-Cantidad de telefonos de marca 'motorola' vendidos a clientes cuyo codigo de cliente no termine ni en 0 ni en digito 1     }

program uno;
type
  rango = 1..130;
  subrango = 1..6;
  telefono = record
                cod : rango;
                codCliente : 1..11111;
                marca : string[20];
                medioPago : subrango;
             end;
  Lista =^nodo;         // pensandolo como Lista 
  nodo = record         // pensandolo como Lista
            dato : telefono;
            sig : Lista;
         end;
  VectorPrecios = array[rango] of real;
  VectorMediosDePago = array[subrango] of real;
  
// PROCESOS

Procedure InicializarVectorMediosDePago ( var vecCon : VectorMediosDePago);
var
  i : subrango;
Begin
  for i := 1 to 6 do
    vecCon[i] := 0;
End;

Procedure CargarPreciosVector (var vec : VectorPrecios);        // se dispone
var
  i : rango;
Begin
  for i := 1 to 130 do
    vec[i] := i;
End;

Procedure ImprimirLista ( L : Lista);
Begin
  while ( L <> nil) do begin
    writeln('codigo telefono  ',L^.dato.cod);
    writeln('codigo cliente ',L^.dato.codCliente);
    writeln('marca = ' ,L^.dato.marca);
    writeln('medio de pago numero ' ,L^.dato.medioPago);
    L := L^.sig;
  end;
End;

Procedure LeerTelefono (var t : telefono);
Begin
  with t do begin
    writeln('ingrese codigo de telefono (1..130)');
    readln(cod);
    writeln('ingrese codigo de cliente');
    readln(codCliente);
    writeln('ingrese marca');
    readln(marca);
    writeln('ingrese medio de pago(1..6)');
    readln(medioPago);
  end;
End;

Procedure AgregarAtras ( var L : Lista; t : telefono);
var
  ant,act,aux : Lista;
Begin
  new(aux);
  aux^.dato := t;
  aux^.sig := nil;
  if (L = nil) then
    L := aux
  else begin
    act := L;
    ant := L;
    while (act <> nil) do begin
      ant := act;
      act := act^.sig;
    end;
    ant^.sig := aux;
  end;
End;

Procedure CargarLista (var L : Lista);
var 
  t : telefono;
Begin
  repeat 
    LeerTelefono (t);
    AgregarAtras(L,t);
  until (t.codCliente = 11111);
End;

Function NotieneDigitoceroNiuno (uncodigo : integer) : boolean;     
var
  aux : boolean;
  resto : integer;
Begin
  aux := true;
  resto := uncodigo MOD 10;
  if ((resto = 0) or (resto = 1)) then
      aux := false;
  NotieneDigitoceroNiuno := aux;
End;

Procedure RecorrerLista (L : Lista; var total : integer; var vecCon : VectorMediosDePago; vecDis : VectorPrecios);
Begin
  total := 0;
  while (L <> nil) do begin
    if (L^.dato.marca = 'motorola') and ( NotieneDigitoceroNiuno(L^.dato.codCliente)) then      // la funcion FUNCIONA
      total := total + 1;
    vecCon[L^.dato.medioPago] := vecCon[L^.dato.medioPago] + vecDis[L^.dato.cod];
    L := L^.sig;
  end;
End;

Procedure DosMediosDePagoMaximos (var pos1, pos2 : integer; vecCon : VectorMediosDePago);
var
  max1, max2 : real;
  i : integer;
Begin
  pos1 := -1;  pos2 := -1;
  max1 := -999;  max2 := -999;
  for i := 1 to 6 do begin
    if (vecCon[i] > max1) then begin
        max2 := max1;
        pos2 := pos1;
        max1 := vecCon[i];
        pos1 := i;
    end
    else
      if (vecCon[i] > max2) then begin
        max2 := vecCon[i];
        pos2 := i;
      end;
  end;
End;

// P.P
VAR
  L : Lista;
  vecDis : VectorPrecios;
  total : integer;
  vecCon : VectorMediosDePago;
  pos1,pos2 : integer;
BEGIN
  CargarPreciosVector (vecDis);      // se dispone
  InicializarVectorMediosDePago(vecCon);
  CargarLista (L);
  RecorrerLista (L,total,vecCon,vecDis);
  DosMediosDePagoMaximos (pos1,pos2,vecCon);
  writeln('el 1er medio de pago que genero mayor monto en ventas fue el medio de pago numero = ' , pos1);
  writeln('el 2do medio de pago que genero mayor monto en ventas fue el medio de pago numero = ' , pos2);
  writeln('la cantidad de telefonos de marca motorola vendidos a clientes cuyo codigo de cliente no termine ni en 0 ni en digito 1 es : ' , total);
  //ImprimirLista (L);
END.
