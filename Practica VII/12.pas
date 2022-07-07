{12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
a) La ganancia total de Fortaco’s
b) Las 2 suscripciones con más clientes.
c) Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.  }
Program uno;
const
  fin = 0;  // condicion de corte para el cliente con dni 0
  tope = 4;
type
  rango = 1..tope;
  cad30 = string[30];
  vectorTabla = array[rango] of real;  // vector tabla que dispone los precios de cada suscripción(1..4)
  cliente = record
                nombre : cad30;
                dni : integer;
                edad : 0..128;
                tipoSubs : rango;
            end;

  Lista=^nodo;
  nodo = record
            dato : cliente;
            sig : Lista;
         end;
  
  nueCli = record
                nombre : cad30;
                dni : integer;  //Esta lista debe estar ordenada por DNI.
          end;
// c) Genere una lista con nombre y DNI
  ListaNue = ^nodoNue;
  nodoNue = record
            dato : nueCli;
            sig : ListaNue;
         end;
  vectorSubscripciones = array[rango] of integer;  // vector contador x cada seleccion de un tipo de subscripcion(1..4)
//Procesos-Funciones

Procedure CargarVectorTablaPrecios(var vecT : vectorTabla);
    Procedure InicializarVectorPrecios(var vecT : vectorTabla);
    var
      i : rango;
    Begin
      for i := 1 to tope do
        vecT[i] := 0;
    End;
var
  i : rango;
Begin
  InicializarVectorPrecios(vecT);
  for i := 1 to tope do
    vecT[i] := i+ 100;
End;

Procedure LeerCliente(var c : cliente);
Begin
  with c do begin
    writeln('ingrese dni del cliente');
    readln(dni);
    if (dni <> fin) then begin
      writeln('ingrese nombre del cliente');
      readln(nombre);
      writeln('ingrese edad del cliente');
      readln(edad);
      writeln('ingrese tipo de suscripción contratada(1..4)');  // cada cliente elige una sola suscripcion
      readln(tipoSubs);
    end;
  end;
End;

Procedure AgregarAdelante(var L : Lista; c : cliente);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := c;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarListaClientes(var L : Lista);
var
  c : cliente;
Begin
  LeerCliente(c);
  while(c.dni <> fin) do begin
    AgregarAdelante(L,c);
    LeerCliente(c);
  end;
End;

Procedure InicializarVectorContador(var vecCon : vectorSubscripciones);
var
  i : rango;
Begin
  for i := 1 to tope do 
    vecCon[i] := 0;
End;

Procedure DosMaximos(vecCon : vectorSubscripciones; var max1,max2,posMax1,posMax2 : integer);
var
  i : rango;
Begin
  for i := 1 to tope do begin
    if(vecCon[i] > max1) then begin
      max2 := max1;
      posMax2 := posMax1;
      max1 := vecCon[i];
      posMax1 := i;
    end
    else
      if(vecCon[i] > max2) then begin
        max2 := vecCon[i];
        posMax2 := i;
      end;
  end;
End;

Procedure Asignado(var c2 : nueCli; unDni : integer; unNombre : cad30);
Begin
  c2.dni := unDni;
  c2.nombre := unNombre;
End;

Procedure AgregarOrdenado(var L2 : ListaNue; c2 : nueCli);
var
  act,ant,aux : ListaNue;
Begin
  new(aux);
  aux^.dato := c2;
  act := L2;
  ant := L2;
  while (act <> nil) and (act^.dato.dni < c2.dni) do begin
    ant := act;
    act := act^.sig;
  end;
  if(ant = act) then 
    L2 := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
    
End;

Procedure ImprimirListaNueva (L2 : ListaNue);
Begin
  while (L2 <> nil) do begin
    writeln('ORDEN DE LOS DNI DE LA LISTA NUEVA : ' , L2^.dato.dni);
    L2 := L2^.sig;
  end;
End;

Procedure RecorrerListaeInformar(L : Lista;vecT : vectorTabla; var L2 : ListaNue);
var
  GananciaTotal : real;
  vecCon : vectorSubscripciones;
  max1,max2,posMax1,posMax2 : integer;
  c2 : nueCli;
Begin
  max1 := -1;  max2 := -1;  posMax1 := -1;  posMax2 := -1;
  GananciaTotal := 0;
  InicializarVectorContador(vecCon);  
  while (L <> nil) do begin
    GananciaTotal := GananciaTotal + vecT[L^.dato.tipoSubs]; // inciso a)
    vecCon[L^.dato.tipoSubs] := vecCon[L^.dato.tipoSubs] + 1;  // inciso b)
    if(L^.dato.edad > 40) and ((L^.dato.tipoSubs = 3) OR (L^.dato.tipoSubs = 4)) then begin
      Asignado(c2,L^.dato.dni,L^.dato.nombre);  // pasarle L para luego L : Lista o pasarle L^.dato para luego convertirlo a c : cliente   o pasarle solo los campos que necesito de L// inciso c
      AgregarOrdenado(L2,c2);     // inciso c)
      //AgregarOrdenado(L2,L^.dato);   // falta recrear este modulo sin el uso del modulo Asignado
    end;
    L := L^.sig;
  end;
  DosMaximos(vecCon,max1,max2,posMax1,posMax2); // inciso b)
  writeln('La ganancia total de Fortaco’s = ' , GananciaTotal:2:2);  // informe inciso a)
  writeln('1er NRO de subscripcion con mas clientes = ' , posMax1 , ' ,cantidad de subscripciones = ' , max1);  //Informe inciso b)
  writeln('2do NRO de subscripcion con mas clientes = ' , posMax2 , ' ,cantidad de subscripciones = ' , max2);  //informe inciso b)
  ImprimirListaNueva(L2); // Para verificar el orden x dni de la nueva lista 
End;

// P.P
VAR 
  L : Lista;
  vecT : vectorTabla;
  L2 : ListaNue;
BEGIN
  L := nil;  L2 := nil;
  CargarVectorTablaPrecios(vecT);  // se dispone
  CargarListaClientes(L);
  RecorrerListaeInformar(L,vecT,L2);
END.