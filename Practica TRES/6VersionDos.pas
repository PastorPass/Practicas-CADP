{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
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
al menos 2 Ghz.  }

Program uno;
const
  fin = 0;
type
  microprocesador = record
                        marca : string;
                        linea : string;
                        cantCores : integer;
                        velReloj : real;
                        tamTransistores : integer;
                    end;

//Procesos

Procedure LeerMicroprocesador(var m : microprocesador);
Begin
  with m do begin
    writeln('Ingrese cantidad de cores');
    readln(cantCores);
    if (cantCores <> fin) then begin
      writeln('ingrese marca');
      readln(marca);
      writeln('ingrese linea');
      readln(linea);
      writeln('ingrese velocidad del reloj');
      readln(velReloj);
      writeln('ingrese tamaño de los tamTransistores');
      readln(tamTransistores);
    end;
  end;
End;

Procedure DosMaximos(var marcaMax1,marcaMax2 : string; unaMarca : string; var max1,max2 : integer; unosCores :  integer);
Begin
  if(unosCores > max1) then begin
    max2 := max1;
    marcaMax2 := marcaMax1;
    max1 := unosCores;
    marcaMax1 := unaMarca;
  end
  else
    if(unosCores > max2) then begin
      max2 := unosCores;
      marcaMax2 := unaMarca;
    end;
End;

Function CumpleMarcayVelocidad (unaMarca : string; unaVelocidad : real) : boolean;
Begin
  CumpleMarcayVelocidad := ((unaMarca = 'intel') OR (unaMarca = 'amd')) and (unaVelocidad >= 2);
End;

//P.P
VAR
  m : microprocesador;
  auxMarca,marcaMax1,marcaMax2 : string;
  max1,max2,ProcesadoresMulticore : integer;
BEGIN
  max1 := -1;  max2 := -1;  
  marcaMax1 := ' ';  marcaMax2 :=  ' ';
  ProcesadoresMulticore := 0;
  LeerMicroprocesador(m);
  while (m.cantCores <> fin) do begin
    auxMarca := m.marca;
    while(m.cantCores <> fin) and (auxMarca = m.marca) do begin
      if(m.cantCores >2) and (m.tamTransistores <= 22) then begin
        writeln('marca = ' , m.marca);
        writeln('Linea =  ' , m.linea);
      end;
      if(m.cantCores >1) and (CumpleMarcayVelocidad(m.marca,m.velReloj)) then  // m.marca o auxMarca?
        ProcesadoresMulticore := ProcesadoresMulticore + 1;
      LeerMicroprocesador(m);
    end;
    if(m.tamTransistores = 14) then
      DosMaximos(marcaMax1,marcaMax2,auxMarca,max1,max2,m.cantCores);
  end;
  writeln('Las 2 marcas con mayor cantidad de procesadores con transistores de 14 nm : ' , marcaMax1 , ' y ' , marcaMax2);
  writeln('Cant de procs mult de Intel o AMD, cuyos rejs alcancen velds de al menos 2 Ghz = ' , ProcesadoresMulticore);
END.