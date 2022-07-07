{ 6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.    }
Program uno;
const
  fin = 0;
type
  microP = record
                marca : string;
                linea : string;
                cantCores : integer;
                velReloj : real;
                tamTransistores : integer;
           end;
// Procesos - Funciones

Procedure LeerMicroprocesador (var m : microP);
Begin
  with m do begin
    writeln('ingrese cantidad de cores');
    readln(cantCores);
    if (cantCores <> fin) then begin
      writeln('ingrese marca');
      readln(marca);
      writeln('ingrese linea');
      readln(linea);
      writeln('ingrese velocidad del reloj');
      readln(velReloj);
      writeln('ingrese tamaño de los transistores');
      readln(tamTransistores);
    end;
  end;
End;

Function CumpleDosCondiciones (unosCores : integer; tamTrans : integer ) : boolean;
Begin
  CumpleDosCondiciones := (unosCores >2) and ((tamTrans >= 0) and (tamTrans <= 22))
End;

Procedure DosMaximos (UnaMarca : string; unosCores : integer; var marc1,marc2 : string; var max1,max2 : integer);
Begin
  if (unosCores > max1) then begin
    max2 := max1;
    marc2 := marc1;
    max1 := unosCores;
    marc1 := UnaMarca;
  end
  else
    if (unosCores > max2) then begin
      max2 := unosCores;
      marc2 := UnaMarca;
    end;
End;

Function CumpleTresCondiciones (unosCores : integer; UnaMarca : string; unaVelocidad : real) : boolean;
Begin
  CumpleTresCondiciones := (unosCores >1) and ((UnaMarca = 'amd') or (UnaMarca = 'intel')) and (unaVelocidad <= 2);
End;

// P.P
VAR
  m : microP;
  auxMarca,marc1,marc2 : string;
  max1,max2,cantMulticores  : integer;
BEGIN
  marc1 :=  ' ';  marc2 := ' ';
  max1 := -1;  max2 := -1;
  cantMulticores := 0;
  LeerMicroprocesador (m);
  while (m.cantCores <> fin) do begin
    auxMarca := m.marca;
    while (m.cantCores <> fin) and (auxMarca = m.marca) do begin
      if (CumpleDosCondiciones(m.cantCores,m.tamTransistores)) then begin
        writeln('Informe de los procesadores de más de 2 cores con transistores de a lo sumo 22 nm :');
        writeln('marca = ' , m.marca);
        writeln('linea = ' , m.linea);
      end;
      if (m.tamTransistores = 14) then  // declararlo en el 1er while (?)
        DosMaximos (auxMarca,m.cantCores,marc1,marc2,max1,max2);  // declararlo en el primer while (?)
      if (CumpleTresCondiciones(m.cantCores,auxMarca,m.velReloj)) then
        cantMulticores := cantMulticores + 1;
      LeerMicroprocesador(m);
    end;
  end;
  writeln('1er marca : ' , marc1 , ', con mayor cantidad de procesadores = ' , max1 , ' ,con transistores de 14 nm');
  writeln('2da marca : ' , marc2 , ', con mayor cantidad de procesadores = ' , max2 , ' ,con transistores de 14 nm');
  writeln('Cant de procs multicore de Intel o AMD, cuyos relojes alcancen velcs de al menos 2 Ghz = ' , cantMulticores);
END.