{5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).  }

Program uno;
// PROCESOS
Function numBDobleANumA (numB, numA : integer) : boolean;
Begin
  numBDobleANumA := (numB = numA*2);
End;
var
  numA, numB,cantPares,cantParesDoble : integer;
BEGIN
  cantParesDoble := 0;
  cantPares := 0;
  writeln('ingrese numA');
  readln(numA);
  writeln('ingrese numB');
  readln(numB);
  while (numA <> 0) or (numB <> 0) do begin
    if (numA MOD 2 = 0) then
      cantPares := cantPares + 1;
    if (numB MOD 2 = 0) then
      cantPares := cantPares + 1;
    if(numBDobleANumA(numB,numA)) then begin
      cantParesDoble := cantParesDoble + 1;
      writeln(numB,' ES EL DOBLE DE ' , numA);
    end;
    writeln('vuelva a ingresar numA');
    readln(numA);
    writeln('vuelva a ingresar numB');
    readln(numB);
  end;
  writeln('la cantidad total de pares de numeros leidos = ' , cantPares);  // como lo pide el enunciado es indistinto, ya que no toma los valores (0,0) como numeros pares(en total son 3 numeros pares)
  writeln('la cantidad de pares en las que numB es el doble de numA = ' , cantParesDoble);
END.