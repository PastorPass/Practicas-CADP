{ PARTE CONCEPTUAL
1) ¿Qué se define como memoria estática?

La memoria estática es aquella que no varia su tamaño durante la ejecución del programa,
Las variables y tipos reservan memoria en su declaración y se mantienen durante todo el programa.
El lenguaje puede validar previo a la ejecución

2) ¿Qué se define como memoria dinámica?

Aquella que permite modificar en tiempo de ejecución la memoria utilizada.

3) ¿Qué es una variable de tipo puntero?

La variable tipo puntero, como lo dice su nombre, es un señalador  a una dirección en memoria. 
Es de tipo simple y definido por el programador.
Sin embargo el puntero puede señalar a cualquier
tipo de dato que conocemos(char, boolean, integer, real, string, registro, arreglo u otro puntero ). 

4) ¿Qué hace la operación “NEW” aplicada en una variable del tipo puntero?

La operación "NEW" implica reservar una dirección memoria dinámica libre para poder asignarle 
contenidos a la dirección que contiene la variable de tipo puntero.

Se aplica de la forma new(VariableTipoPuntero);

5) ¿Qué hace la operación “DISPOSE” aplicada en una variable del tipo puntero? 

Implica liberar la memoria dinámica que contenía la variable de tipo puntero.

Se aplica de la forma dispose(VariableTipoPuntero);}

