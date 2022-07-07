{13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen }
Program uno;

// PROCESOS-FUNCIONES
Function NoExisteCaracterPeso (c : char) : boolean;
Begin
  NoExisteCaracterPeso := (c <> '$')
End;

Procedure CumpleA (var cumple : boolean; var long : integer);
var
  c : char;
Begin
  writeln('ingrese la secuencia A');
  readln(c);
  while (c <> '%') and (cumple) do begin
    if (not NoExisteCaracterPeso(c)) then
      cumple := false
    else begin
      long := long + 1;
      readln(c);
    end;
  end;
End;

Function HayArroba (c : char) : boolean;
Begin
  HayArroba := (c = '@');
End;

Procedure CumpleB (var cumple : boolean; long : integer);
var
  c : char;
  longB,cantArrobas : integer;
Begin
  longB := 0;  cantArrobas := 0;
  writeln('ingrese la secuencia B');
  readln(c);
  while (c <> '*') {and condicion para el arroba}  do begin
    longB := longB + 1;
    if (HayArroba(c)) then
      cantArrobas := cantArrobas + 1;
    readln(c);
  end;
  cumple := (long = longB) and (cantArrobas >= 3);
End;

// P.P
VAR
  cumple : boolean;
  long : integer;
BEGIN
  cumple := true;
  long := 0;
  CumpleA(cumple,long);
  if (cumple) then  begin   
    CumpleB (cumple,long);
    if (cumple) then
      writeln('cumple con la secuencia')                
    else
       writeln ('no cumple con B');
  end
  else
    writeln('no se cumplio la secuencia de A')
END.