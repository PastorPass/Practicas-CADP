{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.  }
program uno;
const
  tope = 5;  // irian 100 autos
type
  rango = 1..tope;
var
  nMax1,nMax2,nMin1,nMin2,nom : string[15];
  max1,max2,min1,min2,tiempo : real;
  i : rango;
BEGIN
  max1 := -1;  max2 := -1;  min1 := 999;  min2 := 999;
  nMax1 := ' ';  nMax2 := ' ';  nMin1 := ' ';  nMin2 := ' ';
  for i := 1 to tope do begin
    writeln('ingrese nombre del piloto');
    readln(nom);
    writeln('ingrese tiempo al finalizar la carrera');
    readln(tiempo);
//------calculo los dos maximos-----
    if (tiempo > max1) then begin
      nMax2 := nMax1;
      nMax1 := nom;
      max2 := max1;
      max1 := tiempo;
    end
    else
      if (tiempo > max2) then begin
        max2 := tiempo;
        nMax2 := nom;
      end;
//↓------calculo los dos minimos------↓
    if (tiempo < min1) then begin
      nMin2 := nMin1;
      nMin1 := nom;
      min2 := min1;
      min1 := tiempo;
    end
    else
      if (tiempo < min2) then begin
        nMin2 := nom;
        min2 := tiempo;
      end;
  end;  // << el end del for
  writeln('-------INFORME-------');
  writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos ');
  writeln('1er nombre ' , nMin1);
  writeln('2do nombre ' , nMin2);
  writeln('Los nombres de los dos pilotos que finalizaron en los dos últimos puestos');
  writeln('1er nombre ' , nMax1);
  writeln('2do nombre ' , nMax2);
END.