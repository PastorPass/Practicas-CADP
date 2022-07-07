{ 5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.  }

Program uno;
const
  fin = 'ZZZ';
type
  auto = record
             marca : string;
             modelo : string;
             precio : real;
         end;

// PROCESOS-FUNCIONES

Procedure LeerAuto(var a : auto);
Begin
  with a do begin
    writeln('ingrese marca');
    readln(marca);
    if (marca <> fin) then begin
      writeln('ingrese modelo');
      readln(modelo);
      writeln('ingrese precio');
      readln(precio);
    end;
  end;
End;

Procedure Maximos (unaMarca,unModelo : string; unPrecio : real; var max : real; var marcaMax, modeloMax : string );
Begin
  marcaMax := ' ';  modeloMax := ' ';
  max := -1;
  if (unPrecio > max) then begin
    max := unPrecio;
    marcaMax := unaMarca;
    modeloMax := unModelo;
  end;
End;
//P.P
VAR
  a : auto;
  auxMarca,marcaMax,modeloMax : string;
  sumaPrecios,cantMismaMarca,max : real;
BEGIN
  LeerAuto (a);
  while (a.marca <> fin) do begin
    auxMarca := a.marca;
    cantMismaMarca := 0;  sumaPrecios := 0;
    while {(a.marca <> fin) and }(auxMarca = a.marca) do begin
      cantMismaMarca := cantMismaMarca + 1;
      sumaPrecios := sumaPrecios + a.precio;
      Maximos(auxMarca,a.modelo,a.precio,max,marcaMax,modeloMax);
      LeerAuto(a);  // hace falta leer solo una vez dentro del 2do while
    end;
    writeln('El precio promedio por marca : ', auxMarca , ' = ', sumaPrecios / cantMismaMarca:2:2); 
  end;
  writeln('marca del auto mas caro = ' , marcaMax);
  writeln('modelo del auto mas caro = ' , modeloMax);
END.