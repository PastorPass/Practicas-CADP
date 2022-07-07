{ 5) La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo
(entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual 
acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato (los más antiguos
primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una
vez almacenados los datos, procesar dicha estructura para obtener:
1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
2) Cantidad de clientes para cada categoría de monotributo
3) Código de las 10 ciudades con mayor cantidad de clientes
4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.  }
Program uno;
const
  dimF = 5;  // valor original 500
type
  rango = 1..dimF;
  rangoCat = 'a'..'z';
  rangoCodCiudad = 1..2400;
  RFecha = record
                dia : 1..31;
                mes : 1..12;  // creo que es corte de control unido
                anio : integer;  // creo que es corte de control unido
           end;
  cliente = record
                fechaFirma : RFecha;  // ordenada x fecha de firma de contrato (los mas antiguos pri, los mas recientes ulti)
                categoria : rangoCat;
                codCiudad : rangoCodCiudad;
                montoMensual : real;
            end;
  vectorClientes = array[rango] of cliente;

// Procesos-Funciones

Procedure LeerCliente(var c : cliente);
Begin
  with c do begin
    writeln('ingrese la fecha de firma del contrato con AWS');
    writeln('dia');
    readln(c.fechaFirma.dia);
    writeln('mes');
    readln(c.fechaFirma.mes);
    writeln('anio');
    readln(c.fechaFirma.anio);
    writeln('ingrese categoria del monotributo(a..z)');
    readln(categoria);
    writeln('ingrese codigo de la ciudad (1..2400)');
    readln(codCiudad);
    writeln('ingrese monto mensual');
    readln(montoMensual);
  end;
End;

Procedure CargarVectorClientes (var vec : vectorClientes);
var
  i : rango;
  c : cliente;
Begin
  for i := 1 to dimF do begin 
    LeerCliente(c);
    vec[i] := c;  // La información se ingresa ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos).
  end;
End;

Procedure RecorrerVectoreInformar (vec : vectorClientes);
var
  i,max,anioMax : integer;
Begin
  max := -1;  anioMax := 0;
  for i := 1 to dimF do begin
    auxcantContMes := vec[i].fechaFirma.mes;
    auxcantContAnio := vec[i].fechaFirma.anio;
    while (auxcantContMes = vec[i].fechaFirma.mes) OR (auxcantContAnio = vec[i].fechaFirma.anio) do begin
      auxcantContMes := auxcantContMes + 1
      auxcantContAnio := auxcantContMes + 1;
    end;
    writeln('Cantidad de contratos por cada mes = ')
    UnMaximo(auxcantContAnio,max,anioMax)
  end;
  writeln('')
End;

// P.P
VAR
  vec : vectorClientes;
BEGIN
  CargarVectorClientes(vec);
  RecorrerVectoreInformar(vec);
END.