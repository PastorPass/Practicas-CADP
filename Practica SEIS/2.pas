{ 2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.  }

Program ejercicio2;
type
  lista = ^nodo;
  persona = record
                dni: integer;
                nombre: string;
                apellido: string;
            end;
  nodo = record
            dato: persona;
            sig: lista;
         end;
        
// Procesos - Funciones
Procedure leerPersona(var p: persona);  // #5 p debe pasarse x ref
Begin
  readln(p.dni);
  if (p.dni <> 0)then begin
    readln(p.nombre);
    readln(p.apellido);
  end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(var L:lista ; p:persona);  //#6 (L : lista) debe pasarse x referencia
var
 aux: lista;
Begin  
  new(aux);  // #1 faltaba esta instruccion
  aux^.dato:= p;
  aux^.sig:= L;
  L:= aux;
End;

Procedure generarLista(var L:lista);
var
  p:persona;  // #2    p:nodo ERROR,  debe ser p : persona
Begin
  leerPersona(p);
  while (p.dni <> 0) do begin
   agregarAdelante(L,p);
   leerPersona(p);  // #7 faltaba leerPersona de nuevo
  end;
End; 

Procedure imprimirInformacion(L:lista);  // #3 cuando se imprime no es necesario(y no se debe hacer) pasar la lista x ref
Begin
  while (L <> nil) do begin
    writeln('DNI: ', L^.dato.dni, 'Nombre:', L^.dato.nombre, 'Apellido:', L^.dato.apellido);  // #4 falta aclarar el L^.dato a los campos nombre y apellido
    L:= L^.sig;
  end;
End;

{Programa principal}
VAR
  L:lista;
BEGIN
  generarLista(L);
  imprimirInformacion(L);
END.  
// ENCONTRE 7/9 errores y los corregi, no encuentro algun otro