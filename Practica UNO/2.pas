{2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero
 }

program uno;
var
  num1 : real;
BEGIN
  readln(num1);
  if (num1 >= 0) then
    writeln('en valor absoluto |' , num1:2:2,'|')
  else
    writeln('en valor absoluto ' , num1 * -1:2:2);
END.