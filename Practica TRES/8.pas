{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.  }
Program uno;
const
  fin = -1;
  D = 'dai';
type
  docente = record
                dni : integer;
                apeYnom : string;
                email : string;
            end;
  Proyecto = record
                 codUnico :  integer;
                 Untitulo : string;
                 //docenteCord : docente;
                 cantAlumParti : integer;
                 nomEscuela : string;
                 localidad : string;
              end;
//Procesos-Funciones

Procedure LeerProyecto(var p : Proyecto);
Begin
  with p do begin
    writeln('ingrese codigo unico');
    readln(codUnico);
    if (codUnico <> fin) then begin
      writeln('ingrese titulo');
      readln(Untitulo);
      writeln('ingrese cantidad de alumnos que participaron del Proyecto');
      readln(cantAlumParti);
      writeln('ingrese nombre de la escuela');
      readln(nomEscuela);
      writeln('ingrese localidad');
      readln(localidad);
     { writeln('------Datos del docente coordinador------');
      writeln('ingrese dni del docente a cargo');
      readln(docenteCord.dni);
      writeln('ingrese apellido y nombre');
      readln(docenteCord.apeYnom);
      writeln('ingrese email');
      readln(docenteCord.email);  }
    end;
  end;
End;

Procedure DosMaximos (UnNombreEsc : string; UnaCantAlum : integer; var e1,e2 : string; var max1,max2 : integer);
Begin
  if (UnaCantAlum > max1) then begin
    max2 := max1;
    e2 := e1;
    max1 := UnaCantAlum;
    e1 := UnNombreEsc;
  end
  else
    if (UnaCantAlum > max2) then begin
      max2 := UnaCantAlum;
      e2 := UnNombreEsc;
    end;
End;

Function IgualParesEImpares (Uncod : integer) : boolean;
var
  resto,pares,impares : integer;
Begin
  pares := 0;  impares := 0;
  while (Uncod <> 0) do begin
    resto := Uncod MOD 10;
    if (resto MOD 2 = 0) then
      pares := pares + 1
    else
      impares := impares + 1;
    Uncod := Uncod DIV 10;
  end;
  IgualParesEImpares := (pares = impares);
End;

// P.P
VAR
  p : Proyecto;
  auxLocalidad,auxNomEscuela,e1,e2 : string;
  cantEscTotal,cantEscXLocalidad,max1,max2,cantAlum : integer;
BEGIN
  cantEscTotal := 0;
  e1 := ' ';  e2 := ' ';
  max1 := -1;  max2 := -1;
  LeerProyecto (p);
  while (p.codUnico <> fin) do begin
    auxLocalidad := p.localidad;
    cantEscXLocalidad := 0;
    while (p.codUnico <> fin) and (auxLocalidad = p.localidad) do begin
      auxNomEscuela := p.nomEscuela;
      cantEscXLocalidad := cantEscXLocalidad + 1;
      cantAlum := 0;
      while (p.codUnico <> fin) and (auxLocalidad = p.localidad) and (auxNomEscuela = p.nomEscuela) do begin
        cantAlum := cantAlum + p.cantAlumParti
        if (auxLocalidad = D ) and (IgualParesEImpares (p.codUnico)) then
          writeln(p.Untitulo)
        LeerProyecto(p);
      end;
      DosMaximos (auxNomEscuela,cantAlum,e1,e2,max1,max2);
    end;
    cantEscTotal := cantEscTotal + cantEscXLocalidad;
    writeln('cantidad de escuelas x Localidad ' , auxLocalidad ,' = ' , cantEscXLocalidad);
  end;
  writeln('cantidad de escuelas que participaron en la convocatoria 2018 = ' , cantEscTotal);
  writeln(' 1er Nombre de la escuela: ', e1 , ' ,con mayor cantidad de alumnos participantes = ' , max1);
  writeln(' 2do Nombre de la escuela: ', e2 , ' ,con mayor cantidad de alumnos participantes = ' , max2);
END.

{begin
    TotalEscuelas:= 0;
    LeerProyecto(p);
    While(p.codigo<>-1)do begin
        LocActual:= p.localidad;
        cantEscuelasXLocalidad:= 0;
        While (p.codigo<>-1) and (LocActual= p.localidad) do begin
            EscuelaActual:= p.escuela;
            cantEscuelasXLocalidad:= cantEscuelasXLocalidad + 1;
            cantidadAlumnos:= 0
            While (p.codigo<>-1) and (LocActual= p.localidad) and (EscuelaActual= p.escuela) do begin
                cantidadAlumnos:= cantidadAlumnos + p.cantAlumnos;
                if (IgualesParesImpares(p.codigo) and p.localidad = 'Daireaux') then
                    Writeln(p.titulo);
                LeerProyecto(p);
            end;
            Maximo(max1, max2, escMax1, escMax2,cantidadAlumnos, EscuelaActual);
        end;
        TotalEscuelas:= TotalEscuelas + cantEscuelasXLocalidad;
        Writeln('La cantidad de escuelas de la localidad ',LocActual, p, ' es ', cantEscuelasXLocalidad); 
    end;
    Writeln('La cantidad de escuelas que participan es ', TotalEscuelas);
    Writeln('Las dos escuelas con mayor cantidad de alumnos participantes son: ', escMax1, e}