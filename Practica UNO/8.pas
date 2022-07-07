{ 8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.
 }

program uno;
type
  rango = 'a'..'z';
var
  car1,car2,car3 : rango;
  ok1,ok2,ok3 : boolean;
BEGIN
  ok1 := false;
  ok2 := false;
  ok3 := false;
  readln(car1);
  readln(car2);
  readln(car3);
  ok1 := (car1 ='a') or (car1 = 'e') or (car1 = 'i') or (car1 = 'o') or (car1 ='u');
  ok2 := (car2 ='a') or (car2 = 'e') or (car2 = 'i') or (car2 = 'o') or (car2 ='u');
  ok3 := (car3 ='a') or (car3 = 'e') or (car3 = 'i') or (car3 = 'o') or (car3 ='u');
  if (ok1) and (ok2) and (ok3) then 
    writeln('todos los digitos son vocales')
  else
    if (ok1) or (ok2) or (ok3) then
      writeln('al menos un caracter no era vocal')
    else
      writeln('ninguno es vocal');
END.