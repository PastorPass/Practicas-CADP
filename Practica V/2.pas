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

{ 2) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.    }

program punteros;
type
  cadena = string[9];
  producto = record
                codigo: integer;
                descripcion: cadena;
                precio: real;
             end;
  puntero_producto = ^producto;
//P.P
VAR
  p: puntero_producto;
  prod: producto;                                     // Memoria Estatica = 20 bytes  
BEGIN
  writeln(sizeof(p), ' bytes');  // imprime  4 bytes de memoria Estatica 
  writeln(sizeof(prod), ' bytes');  // imprime 16 bytes de memoria Estatica
  new(p);  // reservo memoria Dinamica = 16 bytes
  writeln(sizeof(p), ' bytes');  // imprime 4 bytes
  p^.codigo := 1;  // le asigno valor a uno de los campos del registro 
  p^.descripcion := 'nuevo producto';  // le asigno valor a uno de los campos del registro 
  writeln(sizeof(p^), ' bytes');  // imprime la memoria dinamica reservada = 16 bytes
  p^.precio := 200;  // le asigno valor a uno de los campos del registro 
  writeln(sizeof(p^), ' bytes');  // imprime la memoria dinamica reservada = 16 bytes
  prod.codigo := 2;  // le asigno valor a uno de los campos del registro pero ese registro no esta asociado con ningun tipo puntero
  prod.descripcion := 'otro nuevo producto';  // le asigno valor a uno de los campos del registro pero ese registro no esta asociado con ningun tipo puntero
  writeln(sizeof(prod), ' bytes');   // imprime 16 bytes de memoria Estatica
  // las modificaciones de valores a los campos no alteran las memorias, tanto dinamica como estatica, si se quisiera liberar memoria 
  // solo se podria hacer a traves de la operacion dispose solo con variables dinamicas que esten asociadas a tipos de datos punteros
END.