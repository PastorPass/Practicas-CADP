{ 5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos. }
Program uno;
const
  fin = -1;  
type
  producto = record
                cod : integer;
                desc : string[30];
                stockAct : integer;
                stockMin : integer;
                precio : real;
             end;
  Lista =^nodo;
  nodo = record
            dato : producto;
            sig : Lista;
         end;

// Procesos-Funciones

Procedure LeerProducto(var p : producto);
Begin
  with p do begin
    writeln('ingrese codigo del producto');
    readln(cod);
    if (cod <> fin) then begin
      writeln('ingrese descripción del producto');
      readln(desc);
      writeln('ingrese stock actual del producto');
      readln(stockAct);
      writeln('ingrese stock minimo del producto');
      readln(stockMin);
      writeln('ingrese precio del producto del producto');
      readln(precio);
    end;
  end;
End;

Procedure AgregarAtras(var L : Lista; p : producto);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarLista(var L : Lista);
var 
  p : producto;
Begin
  LeerProducto(p);
  while (p.cod <> fin) do begin
    AgregarAtras(L,p);
    LeerProducto(p);
  end;
End;

Function AlMenos3Pares(unCod : integer) : boolean;
var
  resto,pares : integer;
Begin
  pares := 0; 
  while (unCod <> 0) do begin
    resto := unCod MOD 10;
    if (resto MOD 2 = 0) then
      pares := pares + 1;
    unCod := unCod DIV 10;
  end;
  AlMenos3Pares := (pares >= 3);
End;

Procedure DosMinimos(unCod : integer; unPrecio : real; var c1,c2 : integer; var min1,min2 : real);
Begin
  if(unPrecio < min1) then begin
    min2 := min1;
    c2 := c1;
    min1 := unPrecio;
    c1 := unCod;
  end
  else
    if (unPrecio < min2) then begin
      min2 := unPrecio;
      c2 := unCod;
    end;
End;


Procedure RecorrerLista(L : Lista);
var
  productos,cantProd,c1,c2 : integer;
  min1, min2 : real;
Begin
  productos := 0;  cantProd := 0;
  c1 := 0;  c2 := 0;  min1 := 9999;  min2 := 9999;
  while (L <> nil) do begin
    productos := productos + 1;  // cuenta la cantidad de productos que se leen en total
    if(L^.dato.stockAct < L^.dato.stockMin) then
      cantProd := cantProd + 1;  // cuenta la cantidad de productos que cumplen con la condicion
    if(AlMenos3Pares(L^.dato.cod)) then
      writeln('Descripcion : ' , L^.dato.desc , ' ,codigo = ' , L^.dato.cod);
    DosMinimos(L^.dato.cod,L^.dato.precio,c1,c2,min1,min2);
    L := L^.sig;
  end;
  writeln('----------INFORME GENERAL---------');
  writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo = ' , cantProd*100 / productos:2:2 , ' % ');
  writeln('1er producto mas economico , codigo : ' , c1 , ' y precio = ' , min1:2:2);
  writeln('2do producto mas economico , codigo : ' , c2 , ' y precio = ' , min2:2:2);
End;

// P.P
VAR 
  L : Lista;
BEGIN
  L := nil;
  CargarLista(L);
  RecorrerLista(L);
END.