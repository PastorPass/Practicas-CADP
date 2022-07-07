{ 14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1
y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más
de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.  }
Program uno;
const
  totAlum = 1300;
  fin = -1;  // condicion de corte para el codigo de alumno
type
  rango = fin..totAlum;  // rango=  debe contener el valor de fin,sino no corta nunca
  ranMedTransp = 1..5;
  rangoDias = 1..31;
  viaje = record
            codAlumno :rango;
            diaMes : rangoDias;  //corte de control (?)
            facPert : string[30];
            medTransp : ranMedTransp;  //  un alumno puede utilizar más de un medio de transporte en un mismo día.
          end;
  
  Lista= ^nodo;
  nodo = record
            dato : viaje;
            sig : Lista;
         end;
  vectorTabla = array[ranMedTransp] of real;  // Se dispone
  vectorMedTransportes = array[ranMedTransp] of integer;  // vector contador para identificar 2 medios de transporte mas utilizados
//Procesos-Funciones

Procedure LeerViaje(var v : viaje);
Begin
  with v do begin
    writeln('ingrese un codigo de alumno(1..1300)');
    readln(codAlumno);
    if (codAlumno <> fin) then begin
      writeln('ingrese un dia del mes(1..31)');
      readln(diaMes);
      writeln('ingrese el nombre de la Facultad a la que pertenece');
      readln(facPert);
      writeln('ingrese el medio de transporte(1..5)');
      readln(medTransp);
    end;
  end;
End;

Procedure AgregarAdelante(var L : Lista; v : viaje);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := v;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarLista(var L : Lista);
var
  v : viaje;
Begin
  LeerViaje(v);
  while (v.codAlumno <> fin) do begin
    AgregarAdelante(L,v);
    LeerViaje(v);
  end;
End;

Procedure InicializarVectorTablayCargarPrecios(var vecT : vectorTabla);
var
  i : ranMedTransp;
Begin
  for i := 1 to 5 do
    vecT[i] := 0;
  for i := 1 to 5 do
    vecT[i] := vecT[i] + (i*20);
End;

Procedure ImprimirVectorTabla(vecT : vectorTabla);
var
  i : ranMedTransp;
Begin
  for i := 1 to 5 do
    writeln(vecT[i]:2:2);
End;

Procedure InicializarVectorContador(var vecCon : vectorMedTransportes);
var
  i : ranMedTransp;
Begin
  for i := 1 to 5 do
    vecCon[i] := 0;
End;

Procedure DosMaximos(vecCon : vectorMedTransportes; var medMax1,medMax2: integer);
var
  max1,max2,i : integer;
Begin
  max1 := -1; max2 := -1;
  for i := 1 to 5 do begin
    if (vecCon[i] > max1) then begin
      max2 := max1;
      medMax2 := medMax1;
      max1 := vecCon[i];
      medMax1 := i;
    end
    else
      if (vecCon[i] > max2) then begin
        max2 := vecCon[i];
        medMax2 := i;
      end;
  end;
  writeln('1er. medio de transporte mas utilizado Nro de transporte = ' , medMax1 , ' ,veces utilizado = ' , max1);  // informe inciso c)
  writeln('2do. medio de transporte mas utilizado Nro de transporte = ' , medMax2 , ' ,veces utilizado = ' , max2);  // informe inciso c)
End;

Procedure RecorrerListaeInformar(L : Lista; vecT : vectorTabla);
var
  auxDiaMes,medMax1,medMax2 : integer;
  cantViajes,cantAlumViajeSix ,cantAlumTransp,cantAlumMixtos: integer;
  gastoTransporte : real;
  vecCon : vectorMedTransportes;
  UsoBike , noBike : boolean;
Begin
  cantAlumViajeSix := 0;  cantAlumTransp := 0;  cantAlumMixtos := 0;
  InicializarVectorContador(vecCon);
  medMax1 := 0;  medMax2 := 0;  
  UsoBike := false;  noBike := false;
  while (L <> nil) do begin
    auxDiaMes := L^.dato.diaMes;
    cantViajes := 0;
    gastoTransporte := 0;
    while(L <> nil) and (auxDiaMes = L^.dato.diaMes) do begin  // mientras no llegue a nil y siga en el mismo dia
      cantViajes := cantViajes + 1;  // previo al inciso a)
      gastoTransporte := gastoTransporte + vecT[L^.dato.medTransp]; // previo al inciso b)
      vecCon[L^.dato.medTransp] := vecCon[L^.dato.medTransp] + 1;  // inciso c)
      if(L^.dato.medTransp = 5) then 
        UsoBike := true
      else
        noBike := true;
      L:= L^.sig;
    end;
    if(cantViajes > 6) then
      cantAlumViajeSix := cantAlumViajeSix + 1;  //inciso a)
    if (gastoTransporte > 80) then
      cantAlumTransp := cantAlumTransp + 1;  // inciso b)
    if (UsoBike = true) AND (noBike = true) then
      cantAlumMixtos := cantAlumMixtos + 1;  // inciso d)
  end;
  writeln('cantidad de alumnos que realizan más de 6 viajes por día = ' , cantAlumViajeSix);  // informe inciso a)
  writeln('cantidad de alumnos que gastan en transporte más de $80 por día = ' , cantAlumTransp);  // informe inciso b)
  DosMaximos(vecCon,medMax1,medMax2);  // inciso c)
  writeln('cantidad de alumnos que combinan bicicleta con algún otro medio de transporte = ' , cantAlumMixtos);  // informe inciso d)
End;

// P.P
VAR
  L : Lista;
  vecT : vectorTabla;
BEGIN
  L := nil;
  CargarLista(L);
  InicializarVectorTablayCargarPrecios (vecT);  // SE DISPONE
  ImprimirVectorTabla(vecT);
  RecorrerListaeInformar(L,vecT);
END.