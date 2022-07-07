{ 8. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio   }
Program uno;
const
  tope = 3;
type
  rango = 1..tope;
// PROCESOS
Procedure LeerProducto( var precio : real;  var cod : integer; var tipo : string);
Begin
  writeln('ingrese precio del producto');
  readln(precio);
  writeln('ingrese codigo del producto');
  readln(cod);
  writeln('ingrese tipo del producto');
  readln(tipo);
End;

Procedure DosCodsMinimos (cod : integer; precio : real; var min1,min2 : real; var c1,c2 : integer);
Begin
  if (precio < min1) then begin
    min2 := min1;
    c2 := c1;
    min1 := precio;
    c1 := cod;
  end
  else
    if (precio < min2) then begin
      min2 := precio;
      c2 := cod;
    end;
End;

Procedure CodigoMaximo (precio : real; cod : integer; var max : real; var codPants :integer);
Begin
  if (precio > max) then begin
    max := precio;
    codPants := cod;
  end;
End;

//P.P
var
  precio,min1,min2,prom,max : real;
  cod,c1,c2,codPants : integer;
  tipo : string;
  i : rango;
BEGIN
  max := -1;
  c1 := 0;  c2 := 0;  codPants := 0;
  min1 := 999;  min2 := 999;
  prom := 0;
  for i := 1 to tope do begin
    LeerProducto(precio,cod,tipo);
    DosCodsMinimos (cod,precio,min1,min2,c1,c2);
    CodigoMaximo(precio,cod,max,codPants);
    
    prom := prom + precio;
  end;
  writeln('codigo del 1er producto mas barato ' , c1);
  writeln('codigo del 2do producto mas barato ' , c2);
  writeln('Código del producto de tipo “pantalón” más caro = ' , codPants);
  writeln('Precio Promedio = ' , prom / tope:2:2);
END.