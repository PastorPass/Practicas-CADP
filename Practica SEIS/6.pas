{ 6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad
de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del
espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.  }
Program uno;
type
  categorias = 1..7;
  sonda = record
                nom : string[30];
                cantMeses : integer;
                costoConst : real;
                costoMensual : real;
                rangoEspectro : categorias;
          end;
  Lista = ^nodo;
  nodo = record
            dato : sonda;
            sig : Lista;
         end;
  vectorCategorias = array[categorias] of integer;  // vector contador para el inciso b)
//Procesos-Funciones

Procedure LeerSonda(var s : sonda);
Begin
  with s do begin
    writeln('ingrese nombre de la sonda espacial');
    readln(nom);
    writeln('ingrese duración estimada de la misión (cantidad de meses que permanecerá activa)');
    readln(cantMeses);
    writeln('ingrese el costo de construcción');
    readln(costoConst);
    writeln('ingrese el costo de mantenimiento mensual');
    readln(costoMensual);
    writeln('ingrese rango del espectro electromagnético sobre el que realizará estudios(1..7)');
    readln(rangoEspectro);
  end;
End;

Procedure AgregarAdelante(var L : Lista; s : sonda);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := s;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarLista(var L : Lista; var cantMesesTotal,sondasTotal : integer; var costoConstTotal : real);
var
  s : sonda;
Begin
  repeat
    LeerSonda(s);
    cantMesesTotal := cantMesesTotal + s.cantMeses;  // cantidad total de meses leidos entre todas las sondas inciso c)
    sondasTotal := sondasTotal + 1;  // cantidad total de sondas leidas  inciso c)
    costoConstTotal := costoConstTotal + s.costoConst;  // cantidad total de costo de construcción leidos entre todas las sondas  inciso d)
    AgregarAdelante(L,s);
  until (s.nom = 'gaia');
End;

Procedure UnMaximo (unCostoConst,unCostoMensual : real; unNombre : string; var nomMax : string; var max : real);
var
  sumoCostos : real;
Begin
  sumoCostos := unCostoMensual + unCostoConst;
  if (sumoCostos > max) then begin
    max := sumoCostos;
    nomMax := unNombre;
  end;
  sumoCostos := 0;
End;

Procedure InicializarVectorContador(var vecCon : vectorCategorias);
var
  i : categorias;
Begin
  for i := 1 to 7 do 
    vecCon[i] := 0;
End;

Procedure ImprimirVectorContador(vecCon : vectorCategorias);
var
  i : categorias;
Begin
  writeln('-------------------------------------------------------------------');
  for i := 1 to 7 do 
    writeln('CATEGORIA NRO ' , i , ',cantidad de sondas que realizarán estudios = ' , vecCon[i]);
  writeln('-------------------------------------------------------------------');
End;

Procedure RecorrerListaeInformar(L : Lista; cantMesesTotal,sondasTotal : integer; costoConstTotal : real);
var
  max,promDuracion,promCosto : real;
  nomMax : string;
  vecCon : vectorCategorias;
  cantSondas : integer;
Begin
  cantSondas := 0;
  promDuracion := cantMesesTotal / sondasTotal;  // promDuracion = la duración promedio de todas las sondas inciso c)
  promCosto := costoConstTotal / sondasTotal;  // promCosto = el costo de construcción promedio de todas las sondas inciso d)
  InicializarVectorContador(vecCon);
  max := -1;  nomMax := ' ';
  while (L <> nil) do begin
    UnMaximo(L^.dato.costoConst,L^.dato.costoMensual,L^.dato.nom,nomMax,max);  // inciso a) // se debe tener en cuenta la cantidad de meses (L^.dato.cantMeses) y multiplicarlo al costoMensual
    vecCon[L^.dato.rangoEspectro] := vecCon[L^.dato.rangoEspectro] + 1;  // inciso b)
    if (L^.dato.cantMeses > promDuracion) then  // inciso c)
      cantSondas := cantSondas + 1;
    if (L^.dato.costoConst > promCosto) then  // inciso d)
      writeln('nombre de la sonda : ' , L^.dato.nom);  // informe inciso d)
    L := L^.sig;
  end;
  writeln('----------INFORME GENERAL----------');
  writeln('nombre de la sonda más costosa : ' , nomMax , ' ,costo (considerando su costo de construcción y de mantenimiento) = ' , max:2:2);
  ImprimirVectorContador(vecCon);  // informe inciso b)
  writeln('cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas = ' ,cantSondas); // informe inciso c)
  writeln('la duración promedio de todas las sondas = ' , promDuracion:2:2);  // informe inciso c) extra
End;

//P.P
VAR
  L : Lista;
  cantMesesTotal,sondasTotal : integer;
  costoConstTotal : real;
BEGIN
  L := nil;  cantMesesTotal := 0;  sondasTotal := 0;  costoConstTotal := 0;
  CargarLista(L,cantMesesTotal,sondasTotal,costoConstTotal);
  RecorrerListaeInformar(L,cantMesesTotal,sondasTotal,costoConstTotal);
END.