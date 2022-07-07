{ 7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios  }
Program uno;
const
  fin = 0;
type
  centro = record
                nomAbv : string;
                UniPert : string;
                cantInvest : integer;
                cantBecarios : integer;
           end;
// Procesos-Funciones

Procedure LeerCentro(var c : centro);
Begin
  with c do begin
    writeln('ingrese la cantidad de investigadores');
    readln(cantInvest);
    if (cantInvest <> fin) then begin
      writeln('ingrese la cantidad de becarios');
      readln(cantBecarios);
      writeln('ingrese nombre abreviado del centro');
      readln(nomAbv);
      writeln('ingrese la Universidad a la que pertenece');
      readln(UniPert);
    end;
  end;
End;

Procedure Maximo (unaCantInvest : integer; unaUniPert : string; var uniMax : string; var max : integer);
Begin
  if (unaCantInvest > max) then begin
    max := unaCantInvest;
    uniMax := unaUniPert;
  end;
End;

Procedure DosMinimos (unaCantBec : integer; unNombre : string; var c1,c2 : string; var min1,min2 : integer);
Begin
  if (unaCantBec < min1) then begin
    min2 := min1;
    c2 := c1;
    min1 := unaCantBec;
    c1 := unNombre;
  end
  else
    if (unaCantBec < min2) then begin
      min2 := unaCantBec;
      c2 := unNombre;
    end;
End;

// P.P
VAR
  c : centro;
  auxUniPert,uniMax,c1,c2  : string;
  cantCentrosXUni,max,min1,min2 : integer;
BEGIN
  uniMax := ' ';
  max := -1;
  min1 := 999;  min2 := 999;
  c1 := ' ';  c2 := ' ';
  LeerCentro (c);
  while (c.cantInvest <> fin) do begin
    auxUniPert := c.UniPert;
    cantCentrosXUni := 0;
    while (c.cantInvest <> fin) and (auxUniPert = c.UniPert) do begin
      cantCentrosXUni := cantCentrosXUni + 1;
      Maximo (c.cantInvest,auxUniPert,uniMax,max);  // declararlo en el 1er while (?)
      DosMinimos (c.cantBecarios,c.nomAbv,c1,c2,min1,min2);
      LeerCentro(c);
    end;
    writeln('Informe cantidad total de centros x Universidad : ' , auxUniPert , ' es = ' , cantCentrosXUni);
  end;
  writeln('Universidad con mayor cantidad de investigadores = ' , max ,', en sus centros , nombre : ' , uniMax);
  writeln('1er centro ' , c1 , ' ,con menor cantidad de becarios : ' , min1);
  writeln('2do centro ' , c2 , ' ,con menor cantidad de becarios : ' , min2);
END.