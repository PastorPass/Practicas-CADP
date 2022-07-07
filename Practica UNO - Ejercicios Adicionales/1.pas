{ Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000
Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000  }

program uno;
const
  fin = 100;
type
  empresa = record
                cod : integer;
                cantInversiones : integer;
                monto : real;
            end;
var
  e : empresa;
  i,c1,cantEmpresas : integer;
  sumaMontos,prom,max : real;
BEGIN
  sumaMontos := 0; 
  max := -1;  cantEmpresas := 0;
  repeat
    sumaMontos := 0;
    writeln('ingrese codigo de empresa');
    readln(e.cod);
    writeln('ingrese cantidad de inversiones que tiene la empresa');
    readln(e.cantInversiones);
    for i := 1 to e.cantInversiones do begin
      writeln('ingrese el monto dedicado a cada una de las inversiones, INVERSION NRO  ' , i);
      readln(e.monto);
      sumaMontos := sumaMontos + e.monto;
    end;
    if (sumaMontos > max) then begin
      max := sumaMontos;
      c1 := e.cod;
    end;
    if (sumaMontos > 50000) then
      cantEmpresas := cantEmpresas + 1;
    writeln('------INFORME EMPRESA CODIGO NRO ' , e.cod , '--------');
    prom := sumaMontos / e.cantInversiones;
    writeln('monto promedio de sus inversiones = ' , prom:2:2);
  until (e.cod = fin);
  writeln('--------INFORME GENERAL-------');
  writeln('codigo de la empresa con mayor monto total invertido = ' , c1);
  writeln('cantidad de empresas con inversiones de mas de $50.000 = ' , cantEmpresas);
END.