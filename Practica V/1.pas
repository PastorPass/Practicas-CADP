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

{1) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.   }

Program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
VAR
  pc: puntero_cadena;  
BEGIN
  writeln(sizeof(pc), ' bytes');  // Imprime "4" bytes del tipo puntero  ; Memoria Dinamica = 0 bytes ;  Memoria Estatica = 55 bytes
  new(pc);   // Reservo memoria dinamica = "4" bytes del tipo puntero 
  writeln(sizeof(pc), ' bytes');  // imprime "4" bytes del tipo puntero
  pc^:= 'un nuevo nombre';    // se le asigna valor a la variable puntero, pero sigue valiendo 4 bytes, ya que no modifica el espacio, sino su contenido
  writeln(sizeof(pc), ' bytes');   // imprime 4 bytes de la variable pc que es tipo de dato que apunta a un puntero cadena
  writeln(sizeof(pc^), ' bytes');   // imprime la cantidad de bytes por la que fue reservada en la memoria estatica = 51 bytes
  pc^:= 'otro nuevo nombre distinto al anterior';  //  ↑ lo mismo
  writeln(sizeof(pc^), ' bytes');  // ↑ lo mismo
END.
