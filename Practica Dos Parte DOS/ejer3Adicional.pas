{3. Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par. }

Program uno;
const
  tope = 4;  // 200
type
  rango = 1..200;  // iria tope, pero para confundir el rango..

//PROCESOS- FUNCIONES

Procedure LeerProducto(var cod : rango; var precio : real);
Begin
  writeln('ingrese codigo del producto');
  readln(cod);
  writeln('ingrese precio del producto');
  readln(precio);
End;

Procedure DosCodsProdBaratos(var c1,c2 : integer; cod : rango; var min1,min2 : real; precio : real);
Begin
  if(precio < min1) then begin
    min2 := min1;
    c2 := c1;
    min1 := precio;
    c1 := cod;
  end
  else
    if(precio < min2) then begin
      min2 := precio;
      c2 := cod;
    end;
End;

Function EsCodigoPar(cod : rango) : boolean;
Begin
  EsCodigoPar := (cod MOD 2 = 0);
End;

var
  i,cantProductos,c1,c2 : integer;
  cod : rango;
  precio,min1,min2 : real;
BEGIN
  cantProductos := 0;  
  c1 := 0;  c2 := 0;  
  min1 := 999;  min2 := 999;
  for i := 1 to tope do begin
    LeerProducto(cod,precio);
    DosCodsProdBaratos(c1,c2,cod,min1,min2,precio);
    if(EsCodigoPar(cod)) and (precio > 16) then
      cantProductos := cantProductos + 1;
  end;
  writeln('Los códigos de los dos productos más baratos = ' , c1 , ' y ' , c2);
  writeln('La cantidad de productos de más de 16 pesos con código par = ' , cantProductos);
END.