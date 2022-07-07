{12. Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patron 
A$B# donde :
A : es una secuencia de vocales
B : es una secuencia de sólo caracteres alfabéticos sin letras vocales
-Los caracteres '$' y '#' seguro existen   
NOTA : en caso de no cumplir, informar que parte del patron no se cumplio   }
Program uno;
// PROCESOS-FUNCIONES
Function EsVocal (c : char) : boolean;
Begin
  EsVocal := (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u') OR (c = 'A') or (c = 'E') or (c = 'I') or (c = 'O') or (c = 'U');
End;

Procedure CumpleA (var cumple : boolean);
var
  c : char;
Begin
  writeln('ingrese la secuencia A');
  readln(c);
  while (c <> '$') and (cumple) do begin
    if (not EsVocal(c)) then
      cumple := false
    else
      readln(c);
  end;
End;

Function EsCaracterAlfabeticoSinVocales (c : char) : boolean;
Begin
  EsCaracterAlfabeticoSinVocales := (c <> 'a') or (c <> 'e') or (c <> 'i') or (c <> 'o') or (c <> 'u') OR (c <> 'A') or (c <> 'E') or (c <> 'I') or (c <> 'O') or (c <> 'U');
End;

Procedure CumpleB (var cumple : boolean);
var
  c : char;
Begin
  writeln('ingrese la secuencia B');
  readln(c);
  while (c <> '#') and (cumple) do begin
    if ({not EsCaracterAlfabeticoSinVocales} EsVocal (c)) then
      cumple := false
    else 
      readln(c);
  end;
End;

// P.P
VAR
  cumple : boolean;
BEGIN
  cumple := true;
  CumpleA(cumple);
  if (cumple) then  begin   
    CumpleB (cumple);
    if (cumple) then
      writeln('cumple con la secuencia')                
    else
       writeln ('no cumple con B');
  end
  else
    writeln('no se cumplio la secuencia de A')
END.