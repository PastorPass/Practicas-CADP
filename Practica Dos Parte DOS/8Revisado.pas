{8. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio  }

Program uno;
const
  tope = 5;
type
  rango = 1..tope;
  
//modulos

Procedure LecturaProducto(var precio : real; var codigo : integer; var tipo : string);
Begin
  writeln('ingrese precio');
  readln(precio);
  writeln('ingrese codigo del producto');
  readln(codigo);
  writeln('ingrese tipo del producto');
  readln(tipo);
End;

Procedure DoscodsProdBaratos(var c1,c2 : integer; cod : integer; var min1,min2 : real; precio : real);
Begin
  if(precio < min1) then begin
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

var
  i : rango;
  precio, sumaPrecios, min1, min2,max : real;
  codigo, c1, c2,c3 : integer;
  tipo : string;
BEGIN
  sumaPrecios := 0;
  c1 := 0;  c2 := 0;  c3 := 0;
  min1 := 999;  min2 := 999;
  max := -1;
  for i := 1 to tope do begin
    LecturaProducto(precio,codigo,tipo);
    DoscodsProdBaratos(c1,c2,codigo,min1,min2,precio);
    if(tipo = 'pantalon') and (precio > max) then begin
      max := precio;
      c3 := codigo;
    end;
    sumaPrecios := sumaPrecios + precio;
  end;
  writeln('Código de los dos productos más baratos = ' , c1 , ' y ' ,c2);
  writeln('Código del producto de tipo “pantalón” más caro = ' , c3);
  writeln('el precio promedio es : ' , sumaPrecios/tope:2:2);
END.