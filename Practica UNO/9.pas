{ 9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
. Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
. Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )
 }

program uno;
var
  car : char;  
  num,suma,resta : integer;
BEGIN
  suma := 0;  resta := 0;
  writeln('ingrese un caracter');
  readln(car);
  while (car = '+') or (car = '-') do begin
    writeln('ingrese un numero');
    readln(num);
    suma := 0;
    resta := 0;
    while (num <> 0) do begin
      if(car = '+') then  begin
        writeln('Entre en operacion suma');
        suma := suma + num;
      end
      else begin
        writeln('entre en operacion resta');
        resta := resta - num;  // falta corregir la resta
      end;
      writeln('vuelva a ingresar un numero');
      readln(num);
    end;
    writeln('las suma  con el signo positivo = ' , suma);
    writeln('la suma con el signo negativo = ' , resta);
    writeln('vuelva a ingresar un caracter');
    readln(car);
  end;
  if (car <> '+') and (car <> '-') then
    writeln('ERROR');
END.