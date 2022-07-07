// 8 Dado el siguiente programa:
Program anidamientos;
Function analizarLetra(letra : char) : boolean;
Begin
  if (letra >= 'a') and (letra <= 'z') then
    analizarLetra := true
  else
    if (letra >= 'A') and (letra <= 'Z') then
      analizarletra := false;
End; { fin de la funcion analizarLetra }
Procedure leer(var ok : boolean);  // se pasa a ok como parametro x referencia para luego ejecutar las instrucciones del p.p (!)
var
  letra : char;
Begin
  readln(letra);
  if (analizarLetra(letra)) and ((letra >= 'a') and (letra <= 'z')) then begin  // le asigno un area de condicion de la letra  (2)
    writeln('Se trata de una minúscula');
    ok := true;   //encontro una letra minuscula  (1)
  end
  else begin
    if ((letra >= 'A') and (letra <='Z')) then begin  // le asigno un area de condicion de la  letra  (2)
      writeln('Se trata de una mayúscula');
      ok:= false;  // encontro una mayuscula (1)
    end
    else
      writeln('ES CARACTER ESPECIAL');  // (2)
  end;
End; { fin del procedure leer}
VAR
  ok : boolean;
BEGIN { programa principal }
  leer(ok);  // se pasa ok como referencia para determinar si es letra o no  (1)
  //ok := analizarLetra;   se borra ok := analizarLetra;  (1)
  if (ok) then  // si ok fue verdadero, osea si encontro una letra minúscula se ejecutara la siguiente impresion  (1)
    writeln('Gracias, vuelva prontosss');
END.


{a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto puede
traer problemas en el código del programa principal.
i) ¿qué clase de problema encuentra?  Rta --> La funcion no es conocida por el p.p sino por el modulo leer, por lo tanto no es posible darle una operacion de asignacion
ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
  Rta --> Declarar la funcion como un modulo aparte y hacer las modificaciones corespondientes (1)
b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?
  Rta --> Caracteres Especiales por ej : ·$"$%&&()
ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
  Rta --> Imprime segun el orden ASCII;
iii) ¿Cómo se puede resolver este problema?  
Rta --> Con las modificaciones correspondientes (2)}