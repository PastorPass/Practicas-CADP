{11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda. }

Program uno;
const
  fin = 44;
type
  {ocupacion = record
                cantAsientosDisponibles : integer;
                cantAsientosComprados : integer;
              end;}
  rangoOcupacion = 0..100;
  vuelo = record
            codAvion : integer;  // ordenada x codigo de avion
            paisSalida : string;  //x codigo de avion >> x pais de salida
            paisLlegada : string;
            cantKmRecorridos : real;
            ocupacionAvion : rangoOcupacion;
          end;

//Procesos

Procedure LeerAvion(var a : vuelo);
Begin
  with a do begin
    writeln('ingrese codigo de avion');
    if(codAvion <> fin) then begin
      writeln('ingrese pais de salida');
      readln(paisSalida);
      writeln('ingrese pais de llegada');
      readln(paisLlegada);
      writeln('ingrese la cantidad de km recorridos');
      readln(cantKmRecorridos);
      writeln('ingrese la ocupacion de avion (0..100)');
      readln(ocupacionAvion);
    end;
  end;
End;

//P.P
VAR
  v : vuelo;
BEGIN
  LeerAvion(v);
  while (v.codAvion <> fin) do begin
    auxcodAvion := v.codAvion;
    while (v.codAvion <> fin) and (auxcodAvion = v.codAvion) do begin
      auxPaisSalida := v.paisSalida;
      sumaKmRecorridos := 0;
      while (v.codAvion <> fin) and (auxcodAvion = v.codAvion) and (auxPaisSalida = v.paisSalida) do begin
        LeerAvion(v);
      end;
      sumaKmRecorridos := sumaKmRecorridos + v.cantKmRecorridos;
      
    end;
    DosMaximos(sumaKmRecorridos,max1,max2,c1,c2,auxcodAvion);
    DosMinimos(sumaKmRecorridos,min1,min2,c3,c4,auxcodAvion);
  end;
END.