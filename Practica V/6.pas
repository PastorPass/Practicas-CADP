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

{6) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá
tener una longitud máxima de 50 caracteres.

a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura. }

//a)
type
str = String[50];
arrCiudades = array[1..2500]of str; // REQUIERE 51 * 2500 Bytes

{b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:  }

Type Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros;            
  
{b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa. }

4*2500 = 10000 bytes

{b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica? }

Procedure crearNombre (arrP : ArrPunteros );
var
  i : integer;
Begin
  for i:=1 to 2500
    new(arrP[i]);
End;
//Corresponde a memoria Dinamica

{b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros. }

Procedure leerNombre(arrP : ArrPunteros);
var
  i : integer;
Begin
  for i:=1 to 2500 do
    readln(arrP[i]^);
End;