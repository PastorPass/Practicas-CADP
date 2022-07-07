{b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio 
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
    Tipo de zona                        Rendimiento por ha
        1                                6 toneladas por ha
        2                                2,6 toneladas por h
        3                                1,4 toneladas por ha           }
Program uno;
type
  rango = 1..3;
// PROCESOS
Procedure LeerPlantacion(var cantHa : real ;var  tipo:rango;var localidad:string);
Begin
  writeln('Ingrese localidad: ');
  readln(localidad);  
  writeln('Ingrese cantidad de Ha sembradas: ');
  readln(cantHa);
  writeln('Ingrese tipo de zona: ');
  readln(tipo);
End;       

Function calcularRendimiento (cantHect : real; tipoZona : rango; precio : real) : real;  // devuelve un precio en dolares 
Begin
  if (tipoZona = 1) then
	calcularRendimiento:=(cantHect*6*precio)
  else 
    if (tipoZona = 2) then
	  calcularRendimiento:= (cantHect*2.6*precio)
    else
      if (tipoZona = 3) then
	    calcularRendimiento:= (cantHect*1.4*precio)
End;

Procedure MaximosMinimos (localidad:string; rendimiento:real;var max,min:real; var campMin,campMax:string);
Begin
  if(rendimiento<min) then begin  // Calcula el minimo
    min:= rendimiento;
    campMin:= localidad;
  end;                    
  if (rendimiento>max) then begin  // calcula el maximo
     max:= rendimiento;
     campMax:= localidad;
  end;                  
End;
// P.P
var
  cantHect,aux,max,min,rendimientoTotal : real;
  tipoZona : rango;
  cantCampos,campTresFeb : integer;
  localidad,campMax,campMin : string;
BEGIN
  cantCampos := 0;  campTresFeb := 0;  rendimientoTotal:=0;
  max := -1;  min := 999;
  campMax:=' ';  campMin := ' ';
  repeat
    LeerPlantacion(cantHect,tipoZona,localidad);
    cantCampos:= cantCampos + 1;
    aux:= calcularRendimiento(cantHect,tipoZona,320);  // le paso un valor constante al precio
    writeln('Esta campo gana $ ', aux:2:2);
    if((localidad= 'Tres de Febrero') and (aux>10000)) then
      campTresFeb:= campTresFeb + 1;
    MaximosMinimos (localidad,aux,max,min,campMin,campMax);
    rendimientoTotal:= rendimientoTotal + aux;
  until((localidad = 'saladillo') and (cantHect = 900));
  writeln('La cant.de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es: ',campTresFeb);
  writeln('La localidad del campo con mayor rendimiento económico esperado es: ' , campMax);
  writeln('La localidad del campo con menor rendimiento económico esperado es: ' , campMin);
  writeln('El rendimiento económico promedio es $ ' , (rendimientoTotal/cantCampos):2:2);
END.