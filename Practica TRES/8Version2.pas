{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares }

Program uno;
const
  fin = -1;  // condicion de corte para el codigo del proyecto
  d = 'dai';
type
  docente = record
                dni : integer;
                apeYnom : string;
                email : string;
            end;
  
  proyecto = record
                cod : integer;
                titulo : string;
                docenteCoor : docente;
                cantAlumnospp : integer;
                nomEscuela : string;  //'' ordenada para cada localidad >> por escuela
                localidad : string;   // La información se ingresa ordenada consecutivamente por localidad
             end;


//Procesos

Procedure LeerDocente(var d : docente);
Begin
  with d do begin
    writeln('ingrese dni');
    readln(dni);
    writeln('ingrese apellido y Nombre');
    readln(apeYnom);
    writeln('ingrese email');
    readln(email);
  end;
End;

Procedure LeerProyecto(var p : proyecto);
{var
  d : docente;}
Begin
  with p do begin
    writeln('ingrese codigo del proyecto');
    readln(cod);
    if(cod <> fin) then begin
      writeln('ingrese titulo del proyecto');
      readln(titulo);
      writeln('ingrese datos del docente coordinador');
      LeerDocente(docenteCoor);
      writeln('cantidad de alumnos que participan del proyecto');
      readln(cantAlumnospp);
      writeln('ingrese localidad');
      readln(localidad);
      writeln('ingrese nombre de la escuela');
      readln(nomEscuela);
    end;
  end;
End;

Procedure DosMaximos(var n1,n2 : string; unNombreEscuela :string; var max1,max2 : integer;UnaSumaAlumns:integer);
Begin
  if(UnaSumaAlumns > max1) then begin
    max2 := max1;
    n2 := n1;
    max1 := UnaSumaAlumns;
    n1 := unNombreEscuela;
  end
  else
    if(UnaSumaAlumns > max2) then begin
      max2 := UnaSumaAlumns;
      n2 := unNombreEscuela;
    end;
End;

Function IgualParesEImpares(Uncod : integer) : boolean;
var
  resto,pares,impares : integer;
Begin
  pares := 0;  impares := 0;
  while (Uncod <> 0) do begin
    resto := Uncod MOD 10;
    if(resto MOD 2 = 0 ) then
      pares := pares + 1
    else
      impares := impares  + 1;
    Uncod := Uncod DIV 10;
  end;
  IgualParesEImpares := (pares = impares);
End;

//P.P
VAR
  p : proyecto;
  cantTotalEscuelaspp,cantEscuelasXLocalidad,max1,max2,sumaAlumnospp : integer;
  n1,n2,auxLocalidad,auxNomEscuela : string;
BEGIN
  max1 := -1;  max2 := -1;
  n1 := ' ';  n2 := ' ';
  cantTotalEscuelaspp := 0;
  LeerProyecto(p);
  while (p.cod <> fin) do begin
    auxLocalidad := p.localidad;
    cantEscuelasXLocalidad := 0;
    while (p.cod <> fin) and (auxLocalidad = p.localidad) do begin
      auxNomEscuela := p.nomEscuela;
      sumaAlumnospp := 0;
      while(p.cod <> fin) and (auxLocalidad = p.localidad) and (auxNomEscuela = p.nomEscuela) do begin
        sumaAlumnospp := sumaAlumnospp + p.cantAlumnospp;
        LeerProyecto(p);
      end;
      DosMaximos(n1,n2,auxNomEscuela,max1,max2,sumaAlumnospp);
      cantEscuelasXLocalidad := cantEscuelasXLocalidad + 1;
    end;
    cantTotalEscuelaspp := cantTotalEscuelaspp + cantEscuelasXLocalidad;
    if(auxLocalidad = d) and (IgualParesEImpares(p.cod)) then
      writeln('titulo = ' , p.titulo);
    writeln('Localidad : ' , auxLocalidad , ' ,cantidad de escuelas = ' , cantEscuelasXLocalidad);
  end;
  writeln('Cantidad total de escuelas que participan en la convocatoria 2018 = ' , cantTotalEscuelaspp);
  writeln('nombres de las dos escuelas con mayor cantidad de alumnos participantes : ' , n1 , ' y ' , n2);
END.