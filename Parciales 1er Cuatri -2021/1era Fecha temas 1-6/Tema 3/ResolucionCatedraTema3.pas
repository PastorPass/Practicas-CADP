{ PARCIAL TEMA 3 : RESOLUCION CATEDRA 
Un servicio de comercio electronico desea analizar las ventas de notebooks durante la ultima edicion del hot sale.

De cada notebook vendida se conoce : codigo del cliente;  codigo de modelo (entre 1 y 200);  marca y el medio de pago
utlizado (1.Credito;  2.Debito;  3.Transferencia;  4.MercadoPago;  5.Bitcoin;  6.Otro)

Ademas, el servicio dispone de una tabla con el valor de venta de cada uno de los modelos de notebooks.

a) Realizar un modulo que retorne la informacion de las ventas de notebooks en una estructura de datos adecuada.
La informacion se ingresa por teclado y debe almacenarse en el orden en que fue leida, la lectura finaliza cuando
se ingresa el codigo de cliente -1.

b) Realizar un modulo que reciba la informacion obtenida en el inciso anterior y retorne :

i) Los dos medios de pago que generaron el mayor monto total en ventas 

ii) Cantidad de notebooks de marca 'lenovo' vendidas a clientes cuyo codigo de cliente termina con un digito par.   }

program uno;
const
  MaxFP = 6;
  MaxNotebook = 200;
type
  tcodigoNotebook = 1..MaxNotebook;
  tFP = 1..MaxFP;
  rventa = record
             codCliente : integer;
             codNotebook : tcodigoNotebook;
             marca : string[20];
             FP : tFP;      // FP : forma de pago
           end;
  ListaVentas = ^nodo;
  nodo = record
             dato : rventa;
             sig : ListaVentas;
         end;
  vectorPrecio = array[tcodigoNotebook] of real;
  vectorFP = array[tFP] of real;

// PROCESOS

Procedure InicializarPrecios ( var vec : vectorPrecio);
var
  i : tcodigoNotebook;
Begin
  for i := 1 to MaxNotebook do
    vec[i] := 0;
End;

Procedure CargarPrecios( var vec : vectorPrecio);        // tabla que se dispone
var 
  i : tcodigoNotebook;
Begin
  for i := 1 to MaxNotebook do
    vec[i] := i+100;
End;

Procedure LeerVenta (var v : rventa);
Begin
  with v do begin
    writeln('ingrese un codigo de cliente');
    readln(codCliente);
    if ( codCliente <> -1 ) then begin
      writeln('ingrese un codigo de netbook(1..200)');
      readln(codNotebook);
      writeln('ingrese una marca');
      readln(marca);
      writeln('ingrese una forma de pago (1..6)');
      readln(fp);
    end;
  end;
End;

Procedure AgregarAtras ( var L, Ult : ListaVentas; v : rventa);
var
  aux : ListaVentas;
Begin
  new(aux);
  aux^.dato := v;
  aux^.sig := nil;
  if (L = nil) then
    L := aux
  else
    Ult^.sig := aux;
  Ult := aux;
End;

Procedure CargarInfoVentas ( var L : ListaVentas);
var
  v : rventa;
  ult : ListaVentas;
Begin
  LeerVenta(v);
  while (v.codCliente <> -1) do begin
    AgregarAtras (L,ult,v);     // carga la lista de las ventas agregando atras
    LeerVenta(v);
  end;
End;

Procedure Inicializar (var fp : vectorFP);
var 
  i : tFP;
Begin
  for i := 1 to MaxFP do
    fp[i] := 0;
End;

Procedure ProcesarVentas ( L : ListaVentas; precios : vectorPrecio; var fp : vectorFP; var cant : integer);
Begin
  cant := 0;
  while ( L <> nil) do begin
    fp[L^.dato.FP] := fp[L^.dato.FP] + precios[L^.dato.codNotebook];
    if (L^.dato.marca = 'lenovo') and (L^.dato.codCliente MOD 2 = 0) then
      cant := cant + 1;
    L := L^.sig;
  end;
End;

Procedure CalcularDosMaximos ( fp : vectorFP; var fpMax1,fpMax2 : integer);
var
  fpcantMax1, fpcantMax2 : real;
  i : integer;
Begin
  fpcantMax1 := -1 ;  fpcantMax2 := -1;
  for i := 1 to MaxFP do begin
    if (fp[i] > fpcantMax1) then begin
      fpcantMax2 := fpcantMax1;
      fpMax2 := fpMax1;
      fpcantMax1 := fp[i];
      fpMax1 := i;
    end
    else
      if (fp[i] > fpcantMax2) then begin
        fpcantMax2 := fp[i];
        fpMax2 := i;
      end;
  end;
End;

// P.P
VAR
  L :ListaVentas;
  precios : vectorPrecio; // se dispone 
  fp : vectorFP;
  fpMax1, fpMax2, cant : integer;
BEGIN
  InicializarPrecios (precios);         // se dispone
  CargarPrecios (precios);     // tabla de precios que se dispone
  Inicializar (fp);     // se inicializa el vector contador de medios de pago (1..6)
  CargarInfoVentas (L);     // un cargar lista
  ProcesarVentas(L,precios,fp,cant);        // es un recorrerLista
  CalcularDosMaximos (fp,fpMax1,fpMax2);
  writeln('las 2 formas de pago que mas ganancia generaron fueron : ' , fpMax1 , ' y ' , fpMax2);
  writeln('la cantidad de pc lenovo con cliente con dni par fue de : ' , cant);
END.