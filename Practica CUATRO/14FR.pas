{ 14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo: 
CÓDIGO          ROL DEL DESARROLLADOR               VALOR/HORA (USD)
1               Analista Funcional                      35,20
2               Programador                             27,45
3               Administrador de bases de datos         31,03
4               Arquitecto de software                  44,28
5               Administrador de redes y seguridad      39,87
                                                                        Nota: los valores/hora se incluyen a modo de ejemplo
                                                                        
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto   }

program Ej14;
const
	dimF=1000;

type
	codigoP=1..dimF;
	role=1..5;

	programador=record
	pais:string;
	cod: codigosP;
	nomP:string;
	rol:role;
	horas:real;
	
	tablaRol= array[role] of real;
	contador1000=array[codigoP] of real;

procedure cargarTablaRolPorHora(var tRol:tablaRol);//se dispone;
//
procedure InicializarContador(var cont:contador1000);
var
	i:integer;
begin
	for i:=1 to dimF do
		cont[i]:=0;
end;
//
procedure leerProgramador(p);
begin
	writeln('Ingrese pais de residencia');readln(p.pais);
	writeln('Ingrese codigo del proyecto');readln(p.cod);
	writeln('Ingrese nombre del proyecto');readln(p.nomP);
	writeln('Ingrese el rol cumplido en el proyecto');readln(p.rol);
	writeln('Ingrese la cantidad de horas trabajadas');readln(p.horas);
end;
//
function EstaEnArg(pais:string):boolean;
begin
	EstaEnArg:= (pais='Argentina');
end;
function CumplioElRol(rol,n:roles):boolean;
begin
	CumplioElRol:= (rol=n);
end;
//
procedure SumarAlTotal(cant :real; var cant_total:real);
begin
		cant_total:=cant_total + cant;
end;
//
function montoProgramador(rol:role; horas:real; tRol:tablaRol):real;
begin
	montoP:= tRol[rol]*horas;
end;
procedure MontoPorProyecto(montoP:real; codigo: integer; var montos:contador1000);
begin
	montos[codigo]:=montos[codigo] + montoP;
end;
//
function Minimo(montos:contador1000):real;
var
	min:real;
	cod,codMin:codigos;
begin
	min:=9999;
	for cod:=1 to dimF do
		if montos[cod]< min then begin
			min:=montos[cod];
			codMin:=cod;
	Minimo:=codMin;
end;
procedure ImprimirMontosPorProyecto( montos:contador1000);
begin
	for proyecto:=1 to dimF do
	writeln('Monto invertido en el proyecto ',proyecto,' : ',montos[proyecto]);
end;

var
	montos:contador1000;
	contADSoft:contador1000;
	p:programador;
	montoTotalArg:real;
	horasABD:real;
	codigoMin:codigos;
	tRol:	tablaRol;
	montoP:real;
begin
	cargarTablaRolPorHora(tRol);//se dispone;
	montoTotalArg:=0;
	horasABD:=0;
	InicializarContador(montos);
	InicializarContador(contADSoft);
	leerProgramador(p);
	while (p.cod<>-1) do begin
		montoP:=montoProgramador(p.rol,p.horas,tRol);

		if EstaEnArg (p.pais) then
			SumarAlTotal(montoP,montoTotalArg);// suma lo invertido en desarroll. q estan en Argentina
		if CumplioElRol(p.rol,3) then //si es admin de bases de satos
			SumarAlTotal(p.horas,horasABD)//suma sus hrs al total de hrs de admins de bdd
		else 
			if CumplioElRol(p.rol,4) then //si es admin de software
				contADSoft[p.cod]:=contADSoft[p.cod] + 1; // adsoft = admin de software 
		MontoPorProyecto(montoP, p.cod, montos);//montos por codigo(proyecto)
		leerProgramador(p);
	end;
	codigoMin:=Minimo(montos);
	writeln('El monto total invertido en programadores en Argentina: ',monoTotalArg);
	writeln('Cantidad total de horas trabajadas por Administradores de bases de datos: ',horasABD);
	writeln('Código del proyecto con menor monto invertido: ',codigoMin);
	ImprimirMontosPorProyecto(montos);
end.