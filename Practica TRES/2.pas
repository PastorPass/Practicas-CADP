{ 2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.

a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.   }
Program uno;
const
  fin = 2020;
type
  Fecha = record  // inciso a) tipo de dato registro para almacenar la fecha
            dia : 1..31;
            mes : 1..12;
            anio : integer;
          end;
// PROCESOS-FUNCIONES

Procedure LeerFecha(var f : Fecha);  // inciso b) modulo para leer fecha, pasando al parametro 'f' como referencia
Begin
  with f do begin
    writeln('ingrese anio (2020 para terminar)');
    readln(anio);
    if (anio <> fin) then begin
      writeln('ingrese dia');
      readln(dia);
      writeln('ingrese mes');
      readln(mes);
    end;
  end;
End;

// P.P
VAR
  f : Fecha;
  casVerano : integer;
  casDiez : integer;
BEGIN
  casVerano := 0;  casDiez := 0;
  LeerFecha (f);
  while (f.anio <> fin) do begin  // inciso c
    if (f.mes = 1) or (f.mes = 2) or (f.mes = 3) then   
      casVerano := casVerano + 1;
    if (f.dia >= 1) and (f.dia <= 10) then
      casDiez := casDiez + 1;
    LeerFecha(f);
  end;
  writeln('la cantidad de casamientos realizados durante los meses de verano = ' , casVerano);
  writeln('la cantidad de casamientos realizados en los primeros 10 días de cada mes = ' , casDiez);
END.