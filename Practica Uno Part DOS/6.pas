{ 6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.  }
program uno;
const
  tope = 5;  // aca iria el valor 200
type
  rango = 1..tope;
var
  cod,i : rango;
  precio,min1,min2 : real;
  c1,c2,cantProductos : integer;
BEGIN
  min1 := 999;  min2 := 999;
  c1 := 0;  c2 := 0;
  cantProductos := 0;
  for i := 1 to tope do begin
    writeln('ingrese codigo (entre 1 y 200)');
    readln(cod);  
    writeln('ingrese precio del producto');
    readln(precio);
    if (precio < min1) then begin
      c2 := c1;
      c1 := cod;
      min2 := min1;
      min1 := precio;
    end
    else
      if (precio < min2) then begin
        min2 := precio;
        c2 := cod;
      end;
    if (precio > 16) and (cod MOD 2 = 0) then
      cantProductos := cantProductos + 1;
  end;
  writeln('1er codigo = ' , c1 , ' del producto mas barato con precio = ' , min1:2:2);
  writeln('2do codigo = ' , c2 , ' del producto mas barato con precio = ' , min2:2:2);
  writeln('La cantidad de productos de más de 16 pesos con código par = ' , cantProductos);
END.