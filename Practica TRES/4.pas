{ 4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35  }
Program uno;
const
  tope = 3;  // 9300 clientes
  Xminuto = 3.40;
  XMB = 1.35;
type
  rango = 1..tope;
  Linea = record
                NumTel : integer;
                minConsumidos : real;
                MBConsumidos : real;
          end;
  cliente = record
                codCliente : integer;
                cantLineasPropias : integer;
            end;
// PROCESOS Y FUNCIONES

Procedure LeerLinea (var n : Linea);
Begin
  with n do begin
    writeln('ingrese numero de telefono');
    readln(NumTel);
    writeln('cantidad de minutos consumidos');
    readln(minConsumidos);
    writeln('cantidad de MB consumidos');
    readln(MBConsumidos);
  end;
End;

Procedure LeerCliente (var c : cliente);
var
  n : Linea;
  i : integer;
  sumaMin,sumaMB : real;  // variables para sumar los minutos y mbs x cliente y sus respectivas lineas
Begin
  with c do begin
    writeln('ingrese codigo de cliente');
    readln(codCliente);
    writeln('ingrese la cantidad de lineas a disposicion');
    readln(cantLineasPropias);
    sumaMB := 0; sumaMin := 0;  // inicializo en 0 , ya que despues de cada lectura se reinician las variables de suma 
    for i := 1 to cantLineasPropias do begin  // con el for voy desde 1 hasta la cantidad determinada x cantLineasPropias
      writeln('----------linea numero ',i,'-----------');
      LeerLinea(n);  // leo otro registro 
      sumaMin := sumaMin + n.minConsumidos;
      sumaMB := sumaMB + n.MBConsumidos;
    end;
    writeln('----------------INFORME X CLIENTE---------------');
    writeln('la cant. total de minutos = ' , sumaMin:2:2 , ', a facturar = ' , sumaMin* Xminuto:2:2 , ' pesos');
    writeln('la cant. total de MB consumidos = ' , sumaMB:2:2 , ', a facturar = ' , sumaMB*XMB:2:2 , ' pesos');
  end;
End;
// P.P
VAR
  i : rango;
  c : cliente;
BEGIN
  for i := 1 to tope do
    LeerCliente (c);
END.