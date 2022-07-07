{2. Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.    }

Program Vectores;
const
  cant_datos = 150;
type
  vdatos = array[1..cant_datos] of real;
Procedure cargarVector(var v:vdatos; var dimL : integer);
var
  numR : real; { completar }
Begin
  writeln('ingrese un numero real');
  readln(numR);
  while (dimL < cant_datos) and (numR <> 0) do begin 
    dimL := dimL + 1;
    v[dimL] := numR;
    writeln('vuelva a ingresar un numero real');
    readln(numR);
  end;{ completar }
End;
Procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
  i : integer; { completar }
Begin
  for i := 1 to dimL do begin 
    v[i] := v[i] + n;
    suma := suma + v[i]{ completar }
  end;
End;

// P.P
VAR
  datos : vdatos;
  i, dimL : integer;
  num, suma : real;
BEGIN
  dimL := 0;
  suma := 0;
  cargarVector(datos,dimL); { completar }
  writeln('Ingrese un valor a sumar');
  readln(num);
  modificarVectorySumar(datos,dimL,num,suma);  {completar}
  writeln('La suma de los valores es: ' , suma:2:2);
  writeln('Se procesaron: ' , dimL , ' números');
END.
