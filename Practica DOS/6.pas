{ 6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.   }

Program uno;  // sin modulo
var
  num,max : integer;
BEGIN
  max := -1;
  writeln('ingrese un numero entero');
  readln(num);
  while (num >= 0) do begin
    if (num > max) and (num MOD 2 = 0) then
      max := num;
    writeln('vuelva a ingresar un numero entero');
    readln(num); 
  end;
  writeln('el numero par mas alto = ' , max);
END.

//------------------------------------------------------------------------------

Program uno;  // con modulo
// PROCESOS
Function MaxPar (number : integer) : integer;  // devuelve un entero
var
  max : integer;  // variable local del modulo
Begin
  max := -1;
  while (number >= 0) do begin
    if (number > max) and (number MOD 2 = 0) then
      max := number;
    writeln('vuelva a ingresar un numero entero');
    readln(number);  
  end;
  MaxPar := max;  // una vez terminado el while, se le asigna el numero par maximo encontrado a la funcion MaxPar
End;
//P.P
var
  num : integer;  // variable local del p.p
BEGIN
  writeln('ingrese un numero entero');
  readln(num);  // se lee un numero entero, por lo que no es necesario leer antes del while de la funcion MaxPar
  writeln(MaxPar(num));  //se pasa el numero leido al modulo, adicionando la operacion de writeln una vez terminada la funcion
END.  