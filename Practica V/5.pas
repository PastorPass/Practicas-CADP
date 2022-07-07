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

{5) De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio. }

Program Alocacion_Dinamica;
Type
  TEmpleado = record
                sucursal: char;
                apellido: string[25];
                correoElectronico: string[40];
                sueldo: real;
              end;
Str50 = string[50];
Var
  alguien: TEmpleado;
  PtrEmpleado: ^TEmpleado;  // memoria Estatica = 72 bytes + 4 bytes
Begin
{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}  // rta = se le asigna un valor al campo de un registro 400K - 72 
  Readln(alguien.apellido ); 
{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)} // no cambia, sigue siendo 400k - 72 - 4
  New(PtrEmpleado); // se reserva memoria dinamica = 72 bytes
{¿Cuánta memoria disponible hay ahora? (III)}  // 400k - 72 - 4 - 72
  Readln(PtrEmpleado^.Sucursal);
  Readln(PtrEmpleado^.apellido);
  Readln(PtrEmpleado^.correoElectronico);
  Readln(PtrEmpleado^.sueldo);
{¿Cuánta memoria disponible hay ahora? (IV)}  // lo mismo, 400k - 72 -4 - 72
  Dispose( PtrEmpleado );
{¿Cuánta memoria disponible hay ahora? (V)}  // en memoria dinamica NADA, en memoria estatica = 400k - 72
end.