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

{4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio. }
{program punteros;   // a)
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena;          // Memoria Estatica = 55 bytes
begin
  pc^:= 'un nuevo texto';
  new(pc);  // Reservo memoria dinamica = 4 bytes o 55 bytes (?)
  writeln(pc^);  // imprime un error de impresion, ya que no le puedo dar valor al puntero sin antes haber creado un espacio para guardar un valor
  // lo correcto seria 1. new(pc) ; 2. pc^ := 'valor'  ; 3. impresion 
end.  }

{program punteros;   // b)
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena;           // Memoria Estatica = 55 bytes
begin
  new(pc);  // Reservo Memoria dinamica = 51 bytes
  pc^:= 'un nuevo nombre';  // le doy valor al puntero
  writeln(sizeof(pc^), ' bytes');  // imprimiria 51 bytes de memoria dinamica
  writeln(pc^);  // imprimiria el valor asignado anteriormente , osea = 'un nuevo nombre'
  dispose(pc);  // borro el contenido y su direccion de memoria de la variable dinamica pc
  pc^:= 'otro nuevo nombre';  // se considera un error asignar un valor al puntero ya que  luego de haber borrado la dir. de memoria y su contenido, el puntero estaria apuntando a la nada misma.
end. }

{program punteros;     // c)
type
  cadena = string[50];
  puntero_cadena = ^cadena;
  
// Procesos-Funciones
procedure cambiarTexto(pun: puntero_cadena);
begin
  pun^:= 'Otro texto'; // modifico el valor de lo que apunta la variable dinamica
end;
// P.P
VAR
  pc: puntero_cadena;  // Memoria Estatica = 55 bytes
BEGIN
  new(pc);  // Reservo Memoria dinamica = 51 bytes
  pc^:= 'Un texto';  // le doy un valor a lo que apunta la variable dinamica
  writeln(pc^);  // imprime = 'un texto'
  cambiarTexto(pc);  // llama al procedure pasando la variable dinamica pc como parametro x valor
  writeln(pc^);  // imprime = 'otro texto'
  // Esto de cambiar el valor de lo que apunta la variable dinamica se puede hacer sabiendo que la variable dinamica pc se 
  // pasa x valor , ya que el valor se modifica dentro de una direccion de memoria que desconocemos, y no altera memoria estatica alguna 
END. }

program punteros;  // d)
type
  cadena = string[50];
  puntero_cadena = ^cadena;

//Procesos-Funciones
procedure cambiarTexto(pun: puntero_cadena);
begin
  new(pun);  // Reservo memoria dinamica (esto es otra dir de memoria en donde se guardan los valores)
  pun^:= 'Otro texto';  // guardo el valor en lo que apunta la variable dinamica pun
end;
// P.P
VAR
  pc: puntero_cadena;
begin
  new(pc);  // Reservo memoria dinamica
  pc^:= 'Un texto';  // guardo un valor en lo que apunta la variable dinamica pc
  writeln(pc^);  // imprime = 'un texto'
  cambiarTexto(pc);  // llama al procedure pasando a la variable pc como parametro x valor
  writeln(pc^);  // imprime = 'un texto'
  // ya que la instruccion = pun^ := 'otro texto' se hace en otra dir de memoria se pierde ese valor 
  //o no tengo manera de imprimir ese valor(deberia imprimir en su modulo) y en consecuencia termina imprimiendo el valor original
END.