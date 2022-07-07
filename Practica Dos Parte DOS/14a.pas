{ 14. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
    Tipo de zona                        Rendimiento por ha
        1                                6 toneladas por ha
        2                                2,6 toneladas por h
        3                                1,4 toneladas por ha           }
Program uno;
const
  fin = 0;
type
  rango = 1..3;
// PROCESOS
Procedure LeerPlantacion (var cantHect : real; var tipoZona : rango; var precio : real);
Begin
  writeln('ingrese la cantidad de hectareas');
  readln(cantHect);
  writeln('ingrese el tipo de zona (1..3)');
  readln(tipoZona);
  writeln('ingrese precio en dolares de la tonelada de zoja');
  readln(precio);
End;

Function calcularRendimiento (cantHect : real; tipoZona : rango; precio : real) : real;  // devuelve un precio en dolares 
Begin
  if (tipoZona = 1) then
	calcularRendimiento:=(cantHect*6*precio)
  else 
    if (tipoZona = 2) then
	  calcularRendimiento:=(cantHect*2.6*precio)
    else
      if (tipoZona = 3) then
	    calcularRendimiento:=(cantHect*1.4*precio)
End;
// P.P
var
  cantHect : real;
  tipoZona : rango;
  precio : real;
BEGIN
  LeerPlantacion(cantHect,tipoZona,precio);
  writeln('Rendimiento economico de la plantacion = ' , calcularRendimiento(cantHect,tipoZona,precio):2:2);
  
END.