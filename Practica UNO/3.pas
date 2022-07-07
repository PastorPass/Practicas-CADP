{3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10

 }

program uno;
var
  num1,num2,num3 : integer;
BEGIN
    write('ingrese un numero: ');
	readln(num1);
	write('ingrese otro numero: ');
	readln(num2);
	write('ingrese otro numero: ');
	readln(num3);
	writeln(' los numeros ordenados de mayor a menor quedan asi: ');
	if (num1>=num2) and (num1>=num3) and (num2>=num3) then
		writeln(num1,'  ',num2,'  ',num3)
	else
		if (num1>=num2) and (num1>=num3) and (num3>=num2) then
			writeln(num1,'  ',num3,'  ',num2)
		else
			if (num2>=num1) and (num2>=num3) and (num1>=num3) then
				writeln(num2,'  ',num1,'  ',num3)
			else	
				if (num2>=num1) and (num2>=num3) and (num3>=num1) then
					writeln(num2,'  ',num3,'  ',num1)
				else	
					if (num3>=num2) and (num3>=num1) and (num1>=num2) then
						writeln(num3,'  ',num1,'  ',num2)
					else
						if (num3>=num2) and (num3>=num1) and (num2>=num1) then
							writeln(num3,'  ',num2,'  ',num1)
END.