{ TEMA 3 -PARCIAL PRIMERA FECHA
Un sevicio de comercio electronico desea analizar las ventas de notebooks durante la ultima edicion del hot sale.
De cada notebook vendida se conoce : codigo del cliente ;  codigo de modelo (1..200); marca y el medio de pago 
utilizado (1. credito;  2. debito;  3. Transferencia;  4. MercadoPago;  5. Bitcoin;  6. Otro)

Ademas , el servicio dispone de una tabla con el valor de venta de cada uno de los modelos de notebooks // <-- vector con precios ya cargado
-se trata de un vector = array [1..200] (de todos los modelos de netbooks) en donde en cada pos. guarda un precio ya cargado,osea dispuesto-

a) Realizar un modulo que retorne la informacion de las ventas de notebooks en una estructura de datos adecuada.
La informacion se ingresa por teclado y debe almacenarse en el orden en que fue leida, la lectura finaliza cuando se 
ingresa el codigo de cliente -1 

b) Realizar un modulo que reciba la informacion obtenida en el inciso anterior y retorne :
- Los dos medios de pago que generaron el mayor monto total en ventas   // me indica crear un vector contador de los medios de pago y sacar 2 maximos
++++++ El mayor monto total en ventas me indica que sea de tipo real, ya que guarda precios de las ventas ++++++

- Cantidad de notebooks de marca lenovo vendidas a clientes cuyo codigo de cliente termina con un digito par        }

program uno;
type
  rango = 1..200;
  subrango = 1..6;
  notebook = record
                codCliente : integer;
                codModelo : rango;
                marca : string[20];
                medioPago : subrango;
             end;
  
  Lista =^nodo;
  nodo = record
            dato : notebook;
            sig : Lista;
         end;
  VectorDePreciosNotebooks = array[rango] of real;        // VECTOR QUE SE DISPONE de tipo real porque contiene el valor de venta de cada notebook de 1..200
  VectorMedioDePago = array[subrango] of real; // inciso b)
  
// PROCESOS

Procedure CargarVectorConPrecios ( var vecDis : VectorDePreciosNotebooks);
var 
  i : integer;
Begin
  for i := 1 to 200 do
    vecDis[i] := i;
End;

Procedure InicializarVectorContadorDeMediosDePago (var vecCon : VectorMedioDePago);
var
  i : integer;
Begin
  for i := 1 to 6 do
    vecCon[i] := 0;
End;

Procedure ImprimirLista (L : Lista);
var 
  pos : integer;
Begin
  pos := 1;
  while (L <> nil) do begin
    writeln('posicion ' , pos , ' y el codigo de cliente = ' , L^.dato.codCliente);
    writeln('posicion ' , pos , ' y el codigo del modelo es = ' , L^.dato.codModelo);
    writeln('posicion ' , pos , ' y la marca es = ',L^.dato.marca);
    writeln('posicion ' , pos , ' y numero del medio de pago es = ' , L^.dato.medioPago);
    pos := pos + 1;
    L := L^.sig;
  end;
End;

Procedure InicializarVectorContador ( var vec : VectorMedioDePago);
var
  i : rango;
Begin
  for i:= 1 to 200 do
    vec[i] := 0;
End;

Procedure LeerVenta ( var v : notebook);
Begin
  with v do begin
    writeln('ingrese un codigo de cliente');
    readln(codCliente);
    if ( codCliente <> -1) then begin
      writeln('ingrese un codigo de modelo de netbook (1..200)');
      readln(codModelo);
      writeln('ingrese una marca');
      readln(marca);
      writeln('ingrese un medio de pago(1..6)');
      readln(medioPago);
    end;
  end;
End;

Procedure AgregarAtras (var L : Lista; n : notebook);
var
  aux,act,ant : Lista;
Begin
  new (aux);
  aux^.dato := n;
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

Procedure CargarLista ( var L : Lista);
var
  n : notebook;
Begin
  LeerVenta (n);
  while (n.codCliente <> -1) do begin
    AgregarAtras(L,n);
    LeerVenta(n);
  end;
End;

Procedure RecorrerLista (L : Lista; var total : integer; VAR vecCon : VectorMedioDePago; vecDis : VectorDePreciosNotebooks);
Begin
  total := 0;
  while (L <> nil) do begin
    if ((L^.dato.marca = 'lenovo') and (L^.dato.codCliente MOD 2 = 0)) then
      total := total + 1;
    vecCon[L^.dato.medioPago] := vecCon[L^.dato.medioPago] + vecDis[L^.dato.codModelo]; // se suma el medio de pago seleccionado(1..6) + el codigo de modelo de la netbook (1..200) // no se entiende muy bien la cuenta
    L := L^.sig;
  end;
End;

Procedure DosMediosDePagoMaximos (vecCon : VectorMedioDePago; var pos1,pos2 : integer);
var
  i : integer;
  MedioDePagoMax1, MedioDePagoMax2 : real;
Begin
  MedioDePagoMax1 := -1;  MedioDePagoMax2 := -1;
  for i := 1 to 6 do begin
    if (vecCon[i] > MedioDePagoMax1) then begin
      MedioDePagoMax2:= MedioDePagoMax1;
      pos2 := pos1;
      MedioDePagoMax1 := vecCon[i];
      pos1 := i;
    end
    else
      if (vecCon[i] > MedioDePagoMax2) then begin
        MedioDePagoMax2 := vecCon[i];
        pos2 := i;
      end;
  end;
End;

//P.P
VAR
  L : Lista;
  vecPreciosDispuesto : VectorDePreciosNotebooks;       // se dispone este vector,no se llega a inicializar ni a cargar los precios en el p.p
  total : integer;      // calcula el
  vecCon : VectorMedioDePago; // inciso b)
  pos1,pos2 : integer;
BEGIN
  CargarVectorConPrecios (vecPreciosDispuesto); // se dispone
  
  InicializarVectorContadorDeMediosDePago (vecCon);
  CargarLista (L);
  RecorrerLista (L,total,vecCon,vecPreciosDispuesto);// se lleva una copia del vector dispuesto y hacer la cuenta con el otro vector contador
  DosMediosDePagoMaximos (vecCon,pos1,pos2);        // retorna las 2 posiciones(pos1 y pos2 se pasan por referencia) en donde estan los medios de pago(1..6) que generaron el mayor monto total en ventas
  writeln('el 1er medio de pago que genero mayor monto en ventas fue el medio de pago numero : ' , pos1);
  writeln('el 2do medio de pago que genero mayor monto en ventas fue el medio de pago numero : ' , pos2);
  writeln('la cantidad total de notebooks de marca lenovo vendidas a clientes cuyo codigo de cliente termina con un digito par : ', total);
  //ImprimirLista (L);
END.