{ PARTE PRÁCTICA
Para algunos ejercicios de la parte práctica, se utilizará la función de Pascal “sizeof”, que recibe como
parámetro una variable de cualquier tipo y retorna la cantidad de bytes que dicha variable ocupa en la
memoria principal. Para realizar estos ejercicios, considerar la siguiente tabla, que indica la cantidad de bytes
que ocupa la representación interna de distintos tipos de datos en un compilador de Pascal típico. Se
recomienda graficar cada una de las situaciones planteadas a partir de una prueba de escritorio.

    TIPO                                CANTIDAD DE BYTES
   Entero                                  2 bytes
    Real                                    4 bytes
    Char                                    1 byte 
   String                      Tantos bytes como indique la longitud del String + 1
   Record                      La suma de las longitudes de los campos del registro
   Puntero                                 4 bytes
   Boolean                                 1 byte                               }

{3) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.  }
program punteros;
type
  numeros = array[1..10000] of integer;
  puntero_numeros = ^numeros;
var
  n: puntero_numeros;
  num: numeros;
  i:integer;                  // Memoria Estatica =  40000 bytes + 10000 + 2 
BEGIN
  writeln(sizeof(n), ' bytes');  // imprime 4 bytes
  writeln(sizeof(num), ' bytes');  // imprime 20000 bytes
  new(n);  // reservo memoria dinamica = 20000 bytes
  writeln(sizeof(n^), ' bytes'); // imprime 20000 bytes de memoria dinamica
  for i:= 1 to 5000 do
    n^[i]:= i;  // le asigno valor a la variable dinamica
  writeln(sizeof(n^), ' bytes');  // impirme 20000 bytes de memoria dinamica
END.