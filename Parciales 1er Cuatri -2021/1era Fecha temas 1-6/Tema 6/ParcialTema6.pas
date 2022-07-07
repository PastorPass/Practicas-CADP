{ Un servicio de comercio electronico desea analizar las ventas de notebooks durante la ultima edicion del cybermonday.  De cada notebook
vendida se conoce su codigo de modelo ( entre 1 y 150), marca , codigo del cliente, y codigo de sistema operativo instalado 
(1. win10 ; 2. win7 ; 3. ubuntu Linux ; 4. Red Hat ; 5. Mac Os ; 6. sin Sistema operativo)
Ademas, el servicio dispone de una tabla con el valor de la licencia de cada sistema operativo

- Realizar un modulo que retorne la informacion de las ventas de notebooks en una estructura de datos adecuada.  La informacion se ingresa 
por teclado y debe almacenarse en el orden en que fue leida. La lectura finaliza cuando se ingresa el codigo de cliente  -1 

- Realizar un modulo que reciba la informacion obtenida en el inciso anterior y retorne : 
    - Los dos sistemas operativos que generaron el mayor monto de ventas 
    - Cantidad de notebooks de marca lenovo vendidas a clientes cuyo codigo de cliente termina con un digito par    }
program uno;
const
  MaxFP = 6;
  MaxNotebook = 200;
type
  tCodigoNetbook = 1..MaxNotebook;
  tFP = 1..MaxFP;
  stMarca = string[20];
  rVenta = record
             codCliente : integer;
             codigoNotebook : tCodigoNetbook;
             marca : stMarca;
             fp : tFP;
           end;
  ListaVentas = ^nodo;
  nodo = record
            dato : rVenta;
            sig : ListaVentas;
         end;
  VectorPrecio = array [tCodigoNetbook] of real;
  VectorFP = array [tFP] of real;

//PROCESOS 
Procedure LeerVenta (var v : rVenta);
Begin
  with  v do begin
    readln(codCliente);
    if (codCliente <> -1) then begin
      readln(codigoNotebook);
      readln(marca);
      readln(fp);
    end;
  end;
End;

Procedure AgregarAtrasEnLaLista ( var L, ULT : ListaVentas; v : rVenta);
var
  nue : ListaVentas;
Begin
  new(nue);
  nue^.dato := v;
  nue^.sig := nil;
  if ( L = nil) then
    L := nue
  else
    ult^.sig := nue;
  ult := nue;
End;

Procedure cargarInfoVentas (var L : ListaVentas);
var
  v : rVenta;
  ult : ListaVentas;
Begin
  LeerVenta(v);
  while (v.codCliente <> -1 ) do begin
    AgregarAtrasEnLaLista (L,ult,v);
    LeerVenta(v);
  end;
End;

Procedure inicializar ( var FP : VectorFP);
var
  i : integer;
Begin
  for i := 1 to MaxFP do
    FP[i]:= 0;
End;

Procedure procesarVentas ( L : ListaVentas; Precios : VectorPrecio; var FP : VectorFP; var cant : integer);
Begin
  cant := 0;
  while ( L <> nil) do begin
    FP [L^.dato.fp] :=  FP[L^.dato.fp] + Precios[L^.dato.codigoNotebook];
    if (L^.dato.marca = 'lenovo') and (L^.dato.codCliente MOD 2 = 0) then
      cant := cant + 1;
    L := L^.sig;
  end;
End;

Procedure CalcularDosMaximos (FP : VectorFP ; var FPmax1,FPmax2 : integer);
var
  FPcantMax1, FPcantMax2 : real;
  i : integer;
Begin
  FPcantMax1 := -1 ;  FPcantMax2 := -1;
  for i := 1 to MaxFP do begin
    if (FP[i] > FPcantMax1) then begin
      FPcantMax2 := FPcantMax1;
      FPmax2 := FPmax1;
      FPcantMax1 :=FP[i];
      FPmax1 := i;
    end
    else
      if (FP[i] > FPcantMax2 ) then begin
        FPcantMax2 := FP[i];
        FPmax2 := i;
      end;
  end;
End;

// P.P
VAR
  L : ListaVentas;
  Precios : VectorPrecio;
  FP : VectorFP;
  FPmax1, FPmax2, cant : integer;
BEGIN
  cargarInfoVentas (L);
  inicializar (FP);
  //CargarPrecios (Precios);      // se dispone 
  procesarVentas (L,Precios,FP,cant);
  CalcularDosMaximos (FP,FPmax1, FPmax2);
  writeln('las 2 FP que mas ganancia generaron fueron : ' , FPmax1 , FPmax2);
  writeln('la cantidad de PC lenovo con cliente con dni par fue : ' , cant);
END.