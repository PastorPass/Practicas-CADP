{ 13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.  }
program ejercicio13p4;
Const
	ANI = 1971;
	ANF = 2021;
	PUN = 100;
Type
	rango = ANI..ANF;
	subrango = 1..PUN;

	temp = array [rango , subrango] of real;

procedure cargarVector(var temperatura:temp);
Var
	i:rango;
	j:subrango;
	num:real;
Begin
	for i:=ANI to ANF do Begin
		writeln('año: ',i);
		for j:=1 to PUN do Begin
			write('Temperatura punto geografico ',j,': ');
			readln(num);
			temperatura[i,j]:=num;
		end;
	end;
end;

//el anio con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años
procedure anioMax (anio:rango; punto:subrango; var max:real; var maxAnio:rango; temperatura:temp);
Begin
	if (temperatura[anio,punto]>max) then Begin
		max:= temperatura[anio,punto];
		maxAnio:=anio;
	end;
end;

//el año con mayor temperatura promedio a nivel mundial.
procedure anioMaxProm (prom:real; anio:rango; var maxAnioProm:rango; var maxProm:real);
Begin
	if (prom>maxProm) then Begin
		maxProm:=prom;
		maxAnioProm:=anio;
	end;
end;    

procedure procesar (var maxAnio,maxAnioProm:rango; temperatura:temp);
Var
	i:rango;
	j:subrango;
	max,maxProm,prom,suma:real;
Begin
	max:=-1;
	maxProm:=-1;
	for i:= ANI to ANF do Begin
		suma:=0;
		prom:=0;
		for j:=1 to PUN do Begin
				suma:=temperatura[i,j]+suma;
				anioMax(i,j, max, maxAnio,temperatura);
		end;
		prom:=suma/PUN;
		anioMaxProm(prom, i, maxAnioProm, maxProm);
	end;
end;

// P.P
VAR
	maxAnio, maxAnioProm:rango;
	temperatura:temp;
BEGIN
	cargarVector(temperatura);
	procesar(maxAnio,maxAnioProm,temperatura);
	writeln('El año con mayor temperatura promedio fue el ',maxAnioProm);
	writeln('El año con mayor temperaatura detectada en algun punto del plante fue el: ',maxAnio);
END.