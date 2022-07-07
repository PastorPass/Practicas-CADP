program practica42_5;

const
		dim=4;
type
	categ='A'..'F';
	codigoCiudad=1..2400;
	
	rFecha=record
		dia:integer;//subrangos
		mes:integer;
		ano:integer;
	end;
	{De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo (entre la A y la F), 
		el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual acordado en el contrato.}
	rCliente=record
		fecha:rFecha;
		categoria:categ;
		codigo:codigoCiudad;
		monto:real;
	end;
	
	rCiudad=record
		codigo:integer;
		cantClientes:integer;
	end;
	
	aClientes= array [1..dim] of rCliente;

	aCategorias= array [categ] of integer;

	aCiudades=array [codigoCiudad] of rCiudad;
	
procedure leer(var r:rCliente);
	begin
		write('Ingrese fecha (dia,mes,ano): '); readln(r.fecha.dia);readln(r.fecha.mes);readln(r.fecha.ano);
		write('Ingrese categoria: '); readln(r.categoria);
		write('Ingrese codigo de ciudad: '); readln(r.codigo);
		write('Ingrese monto mensual: '); readln(r.monto);
	end;

procedure cargar (var c:aClientes);
	var
		i:integer;
	begin
		for i:=1 to dim do
			leer(c[i]);
	end;

procedure max(ano,contr:integer; var maxAno,maxContr:integer);
	begin
		if contr>=maxContr then begin
			maxContr:=contr;
			maxAno:=ano;
		end;
	end;

procedure inicializarCateg(var c:aCategorias); //Cantidad de clientes para cada categoría de monotribut
	var
		i:char;
	begin
		for i:='A' to 'F' do
			c[i]:=0;
	end;
	
procedure imprimirCat(c:aCategorias);
	var	
		i:char;
	begin
		for i:='A' to 'F' do
			writeln('La categoria ',i,' tiene ',c[i],' clientes');
	end;
	
procedure inicializarCiudades(var c:aCiudades);
	var
		i:integer;
	begin
		for i:=1 to 2400 do begin
			c[i].cantClientes:=0;
			c[i].codigo:=i;
		end;
	end;
	
procedure ordenar(var c:aCiudades);
	var
		//mem puede ser un registro para que sea mas rapida la asignacion
		i,j,p,mem,memC:integer;//p posicion del maximo, j es para comparar, i es lo que lleva ordenado del array
	begin
		for i:=1 to 2400-1 do begin 
			p:=i;
			for j:=i+1 to 2400 do  //busca maximo, almacena la posicion del minimo en p
				if c[j].cantClientes>c[p].cantClientes then
					p:=j;
			mem:=c[p].cantClientes;
			memC:=c[p].codigo;
			c[p].cantClientes:= c[i].cantClientes;
			c[p].codigo:=c[i].codigo;
			c[i].cantClientes:=mem;
			c[i].codigo:=memC;
		end;
	end;
	
procedure imprimirMaxCiudades(var c:aCiudades);
	var 
		i:integer;
	begin
		for i:=1 to 10 do
			writeln(i,' La ciudad codigo',c[i].codigo,'tiene ',c[i].cantClientes,' clientes');	
	end;
	
function promedio(suma:real;cant:integer):real;
	begin
		promedio:=suma/cant;
	end;

function cantSuperan(c:aClientes;suma:real):integer;
	var 	
		i,cant:integer;
		prom:real;
	begin
		prom:=promedio(suma,dim);
		cant:=0;
		for i:=1 to dim do
			if c[i].monto>prom then
				cant:=cant+1;
		cantSuperan:=cant;
	end;
	
var
	cl:aClientes;
	cat:aCategorias;
	ciudades:aCiudades;
	i,maxAno,maxContr,mesActual,anoActual,cantAno,cantMes:integer;
	suma:real;
{procesar dicha estructura para obtener:
		1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
		2) Cantidad de clientes para cada categoría de monotributo
		3) Código de las 10 ciudades con mayor cantidad de clientes
		4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}
BEGIN
	cargar(cl); maxContr:=-1; suma:=0;
	inicializarCateg(cat);
	inicializarCiudades(ciudades);
	i:=1;
	while i<=dim do begin
		anoActual:=cl[i].fecha.ano;
		cantAno:=0; //Cantidad de contratos por cada año
		while  (i<=dim) and (anoActual=cl[i].fecha.ano) do begin
			mesActual:=cl[i].fecha.mes;
			cantMes:=0; //Cantidad de contratos por cada mes
			while (i<=dim) and (anoActual=cl[i].fecha.ano) and (mesActual=cl[i].fecha.mes) do begin
				cantMes:=cantMes+1;
				cantAno:=cantAno+1;
				ciudades[cl[i].codigo].cantClientes:= ciudades[cl[i].codigo].cantClientes + 1;  //Código de las 10 ciudades con mayor cantidad de clientes
				cat[cl[i].categoria]:= cat[cl[i].categoria]+1; 		//Cantidad de clientes para cada categoría de monotributo
				suma:=suma + cl[i].monto;
				i:=i+1;
			end;
			writeln('La cantidad de contratos del mes ',mesActual,' es de: ',cantMes);
		end;
		writeln('La cantidad de contratos del ano ',anoActual,' es de: ',cantAno);
		max(anoActual,cantAno,maxAno,maxContr);
	end;
	ordenar(ciudades);
	imprimirMaxCiudades(ciudades); //Código de las 10 ciudades con mayor cantidad de clientes
	imprimirCat(cat);
	writeln('El año que se firmo la mayor cantidad de contratos es en ',maxAno,' con ',maxContr,' contratos.'); //año en que se firmó la mayor cantidad de contratos
	writeln('Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes: ',cantSuperan(cl,suma));
END.
