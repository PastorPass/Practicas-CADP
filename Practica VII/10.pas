{10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.  }
Program uno;
const
  finE = -1;  // condicion de corte para cod de la empresa del registro empresa
  finC = 0;  // condicion de corte para la hectárea del registro cultivo 
  dimF = 20;
type
  Decision = 1..2;  // 1 = ESTATAL ; 2 = PRIVADA
  rango = 1..dimF;
  cad30 = string[30];
  cultivo = record
                tipoCult : cad30;
                cantHect : real;
                cantMesesCicloCult : integer;
            end;
  vectorCultivos = array[rango] of cultivo;
  empresa = record
                cod : integer;
                nombre : cad30;
                EstatOPriv : Decision;
                nomCiudadRadica : cad30;
                cantCult : rango;  // actua como la dimL
                vec : vectorCultivos;
            end;
            
  Lista = ^nodo;
  nodo = record
            dato : empresa;
            sig : Lista;
         end;


// Procesos-Funciones

Procedure LeerCultivo(var c : cultivo);
Begin
  with c do begin
    writeln('ingrese la cantidad de hectareas dedicadas al cultivo');
    readln(cantHect);
    if (cantHect <> finC) then begin
      writeln('ingrese el tipo de cultivo');
      readln(tipoCult);
      writeln('ingrese la cantidad de meses que lleva el ciclo de cultivo');
      readln(cantMesesCicloCult);
    end;
  end;
End;

Procedure CargarVectorCultivo(var vec : vectorCultivos; var dimL : rango);
var
  c : cultivo;
Begin
  dimL := 0;
  LeerCultivo(c);
  while (c.cantHect <> finC) and (dimL < dimF)  do begin
    writeln('--Se lee otro cultivo, (hectarea = 0 para terminar)--');
    writeln();
    dimL := dimL + 1;
    vec[dimL] := c;
    LeerCultivo(c);
  end;
End;

Procedure LeerEmpresa(var e : empresa);
var 
  dimL : rango;
Begin
  with e do begin
    writeln('ingrese codigo de la empresa');
    readln(cod);
    if (cod <> finE) then begin
      writeln('ingrese nombre de la empresa');
      readln(nombre);
      writeln('empresa estatal = 1; empresa privada = 2');
      readln(EstatOPriv);
      writeln('ingrese nombre de la ciudad donde está radicada la empresa');
      readln(nomCiudadRadica);
      CargarVectorCultivo(vec,dimL);
      cantCult := dimL;
    end;
  end;
End;

Procedure AgregarAdelante(var L : Lista; e : empresa);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := e;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarListaEmpresas(var L : Lista);
var
  e : empresa;
Begin
  LeerEmpresa(e);
  while(e.cod <> finE) do begin
    AgregarAdelante(L,e);
    LeerEmpresa(e);
  end;
End;

Function HayTrigo(vec : vectorCultivos; unaCantCult : rango) : boolean;
var
  i : rango;
  AlmenosUnTrigo : integer;
Begin
  AlmenosUnTrigo := 0;
  for i := 1 to unaCantCult do 
    if(vec[i].tipoCult = 'trigo') then
      AlmenosUnTrigo := AlmenosUnTrigo + 1;
  HayTrigo := (AlmenosUnTrigo > 0);
End;

Function AlMenosDosZeros(unCod : integer) : boolean;
var
  cuentaCeros,resto : integer;
Begin
  cuentaCeros := 0;
  while (unCod <> 0) do begin
    resto := unCod MOD 10;
    if(resto = 0) then
      cuentaCeros := cuentaCeros + 1;
    unCod := unCod DIV 10;
  end;
  AlMenosDosZeros := (cuentaCeros >= 2);
End;

Function SiHaySojaSumarHect(vec : vectorCultivos; unaCantCult : rango) : real;
var
  i : rango;
  aux : real;
Begin
  aux := 0;
  for i := 1 to unaCantCult do
    if(vec[i].tipoCult = 'soja') then
      aux := aux + vec[i].cantHect;
  SiHaySojaSumarHect := aux;
End;

Procedure UnMaximo(unNombre : cad30; unTiempo : integer; var nomMax : cad30; var max : integer);
Begin
  if(unTiempo > max) then begin
    max := unTiempo;
    nomMax := unNombre;
  end;
End;

Procedure IncrementarMes(var vec : vectorCultivos; unaCantCult : integer);
var
  i : rango;
Begin
  
  for i := 1 to unaCantCult do 
    if(vec[i].tipoCult = 'girasol') AND (vec[i].cantHect < 5) then
      vec[i].cantMesesCicloCult := vec[i].cantMesesCicloCult + 1; 
End;

Procedure ImprimirLista(L : Lista);
var
  i : rango;
Begin
  while (L <> nil) do begin
    for i := 1 to L^.dato.cantCult do
      if(L^.dato.vec[i].tipoCult = 'girasol') then
        writeln('CULTIVO NRO : ' , i , ' ,NRO DE MESES : ' , L^.dato.vec[i].cantMesesCicloCult);
    L := L^.sig;
  end;
End;

Procedure RecorrerListaEInformar(L : Lista);
var
  auxcantHectXSoja,HectareasTotal : real;
  i,tiempo,max : integer;
  cumpleMaiz : boolean;
  nomMax : cad30;
Begin
  auxcantHectXSoja := 0;  HectareasTotal := 0;  tiempo := 0;  max := -1;
  nomMax := ' ';
  while (L <> nil) do begin
    tiempo := 0;  // para reiniciar el tiempo x cada empresa leida  // inciso d)
    cumpleMaiz := false;
    if(L^.dato.nomCiudadRadica = 'san miguel del monte') AND (HayTrigo(L^.dato.vec,L^.dato.cantCult)) AND (AlMenosDosZeros(L^.dato.cod)) then  // inciso b)
      writeln('Nom de la empsa radicada en "SMDM" que cultiva trigo y cuyo cod de empsa posee al menos 2 ceros : ' , L^.dato.nombre);  // informe inciso b)
    for i := 1 to (L^.dato.cantCult) do begin // sumo la cantidad de hectareas en cada cultivo leido  //inciso c)
      HectareasTotal := HectareasTotal + L^.dato.vec[i].cantHect; 
      
      if(L^.dato.vec[i].tipoCult = 'maiz') then begin  // inciso d)
        tiempo := tiempo + L^.dato.vec[i].cantMesesCicloCult;
        cumpleMaiz := true;
      end;
    end;
    auxcantHectXSoja := SiHaySojaSumarHect(L^.dato.vec,L^.dato.cantCult);  // funcion que devuelve la cantidad de hectareas de la soja inciso c)
    if(cumpleMaiz) then  // inciso d)
      UnMaximo(L^.dato.nombre,tiempo,nomMax,max);
      
    if(L^.dato.EstatOPriv = 2) then
      IncrementarMes(L^.dato.vec,L^.dato.cantCult);  // inciso e)
    L := L^.sig;
  end;
  writeln('cant de hects dedicadas al cultivo de soja : ', auxcantHectXSoja:2:2 ,'hcts,   % que reprst con rspct al tot de hects de tds los tips de cltvs: ' , (auxcantHectXSoja*100)/HectareasTotal:2:2, ' %'); // informe inciso c)
  writeln('La empresa(nombre) que dedica más tiempo al cultivo de maíz es : ' , nomMax , ',su tiempo maximo empleado = ' , max , ' meses');
End;

{Segunda forma para incrementar el nro de meses
Procedure IncrementarGirasoles (L : Lista);
var
  i : integer;
Begin
  while (L <> nil) do begin
    if (L^.dato.EstatOPriv = 2) then begin
      for i := 1 to (L^.dato.cantCult) do 
        if (L^.dato.vec[i].tipoCult = 'girasol') and (L^.dato.vec[i].cantHect < 5) then 
          L^.dato.vec[i].cantMesesCicloCult := L^.dato.vec[i].cantMesesCicloCult + 1;
    end;
    L := L^.sig;
  end;
End;}

// P.P
VAR 
  L : Lista;
BEGIN
  L := nil;
  CargarListaEmpresas(L);  //carga tanto para el reg empresa como para el reg cultivo
  RecorrerListaEInformar(L);
 // IncrementarGirasoles(L);  //2da forma
  ImprimirLista(L);
END.