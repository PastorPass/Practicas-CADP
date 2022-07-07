{ 4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse

 }

program uno;
const
  tope = 5;  // no voy a poner 1000 ni loco
  //fin = 0;  // para inciso a y b
type
  rango = 1..tope;
var
  num,min1,min2,i : integer;
BEGIN
  min1 := 999;  min2 := 999;
  for i := 1 to tope do begin  //Modif. del inciso a) es cambiar el for por un repeat until con la condicion leyendo el 0   // (until = 0)
    readln(num);                // Modif del inciso b) es cambiar el for por un while con la condicion de corte sin leer el 0  // (while <> 0)
    if (num < min1) then begin
      min2 := min1;
      min1 := num;
    end
    else
      if (num < min2) then
        min2 := num;
  end;
  writeln('1er minimo = ' , min1);
  writeln('2do minimo = ' , min2);
END.