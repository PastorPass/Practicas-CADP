{9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.  }

Program uno;
const
  fin = 'zarate';
type
  candidato = record
                localidad : string;
                apellido : string;
                cantVotosObt : integer;
                cantVotantes : integer;
              end;

//Procesos
Procedure LeerCandidato(var c : candidato);
Begin
  with c do begin
    writeln('ingrese localidad');
    readln(localidad);
    writeln('ingrese apellido del candidato');
    readln(apellido);
    writeln('ingrese la cantidad de votos obtenidos');
    readln(cantVotosObt);
    writeln('ingrese la cantidad de votantes de la localidad');
    readln(cantVotantes);
  end;
End;

Procedure UnMaximo(var apeMax : string; unApe : string; var max : integer; unaCantVotos : integer);
Begin
  if(unaCantVotos > max) then begin
    max := unaCantVotos;
    apeMax := unApe;
  end;
End;

Procedure MaximoPorcentaje(var apeMaxPorcentaje : string; UnApe : string; var maxP : real; unosVotos,unosVotantes : integer);
var
  aux : real;
Begin
  aux := (unosVotos*100)/unosVotantes;
  if(aux > maxP) then begin
    maxP := aux;
    apeMaxPorcentaje := UnApe;
  end;
End;

//P.P
VAR
  c : candidato;
  apeMax,apeMaxPorcentaje : string;
  max : integer;
  maxP : real;
BEGIN
  max := -1;  maxP := -1;
  apeMax := ' ';  apeMaxPorcentaje := ' ';
  repeat 
    LeerCandidato(c);
    UnMaximo(apeMax,c.apellido,max,c.cantVotosObt);
    MaximoPorcentaje(apeMaxPorcentaje,c.apellido,maxP,c.cantVotosObt,c.cantVotantes)
  until(c.localidad = fin);
  writeln('El intendente que obtuvo la mayor cantidad de votos en la elección = ' , apeMax, ' con ' , max , ' votos');
  writeln('El intendente que obtuvo el mayor porcentaje de votos de la elección = ' , apeMaxPorcentaje, ' con el ' , maxP:2:2);
END.