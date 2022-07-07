{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.  }
program uno;
const
  fin = 0;
  tope = 5;  // aca iria 31
type
  rango = 1..tope;
var 
  i : rango;
  montoVenta,montoTotal : real;
  ventasxDia,max,numDia : integer;
BEGIN
  montoTotal := 0;  max := -1;  numDia := 0;
  for i := 1 to tope do begin
    writeln('INGRESE MONTO DE VENTAS DEL DIA ' , i);
    readln(montoVenta);
    ventasxDia := 0;
    while (montoVenta <> fin) do begin
      ventasxDia := ventasxDia + 1;
      montoTotal := montoTotal + montoVenta;
      writeln('vuelva a ingresar monto de venta');
      readln(montoVenta);
    end;
    if (ventasxDia > max) then begin  // inciso a.
        max := ventasxDia;
        numDia := i;  
    end;
    writeln('cantidad de ventas por dia = ' , ventasxDia , ' DEL DIA  ' , i);
  end;
  writeln('monto total acumulado en ventas del todo el mes ' , montoTotal:2:2);
  writeln('el dia en que se realizo la mayor cantidad de ventas ' , numDia);
END.