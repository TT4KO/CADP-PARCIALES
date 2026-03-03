{El indec dispone de una estructura de datos donde guarda la informacion de la canasta basica de cada familia. 
La canasta basica esta compuesta por items y cada item tiene: codigo de categoria (1..300), precio y dni. 
Esta estructura esta ordenada por codigo de categoria y puede haber mas de 1 item con igual categoria. 
Ademas se dispone de una estructura de datos donde para cada categoria se tiene su peso (un valor real entre 0 y 1).
Hacer un programa que:
A) procese la informacion e informe para cada canasta basica de la familia el monto total gastado
(esto se hace sumando el costo de cada item multiplicado por el valor de el peso de la categoria del item)
B) Informe los codigos de categoria de los 15 items que representan el mayor gasto en esa canasta basica}

program aski;
const
max = 300;
top = 15;
type
rango = 1..max;
items = record
	codigo: rango;
	precio: real;
	dni: integer;
end;

lista =  ^nodo;
	nodo = record
	dato: items;
	sig: lista;
end;

vector = array [rango] of real;

procedure insertar(var topgasto: array of real; topcod: array of integer; gasto:real; codigo: integer);
var
	i, j: integer;
begin
	i:=1;
	while(l <= top) do
	begin
		if(gasto > topgasto[i]) then
		begin
			for j:=top downto i+1 do
			begin
				topgasto[j]:=topgasto[j-1];
				topcod[j]:=topcod[j-1];
			end;
		topgasto[i]:=gasto;
		topcod[i]:=codigo;
	end;
	i:=i + 1;
	end;
end;

procedure procesar(l: lista; v: vector);
var
	total: real;
	gasto: real;
	actual: integer;
	topgasto: array[1..top] of real;
	topcod: array [1..top] of integer;
	i: integer;
begin
	total:=0;
	for i:=1 to top do
	begin
		topgasto[i]:=-1;
		topcod[i]:=0;
	end;
	while(l <> nil) do
	begin
		gasto:=0;
		actual:= l^.dato.codigo;
		while(l <> nil) and (l^.dato.codigo = actual) do
		begin
			gasto:=gasto + l^.dato.precio * v[l^.dato.codigo];
			
			total:=total + gasto;
			
			insertar(topgasto, topcod, gasto, l^.dato.codigo);
			
			l:=l^.sig;
		end;
		write('el total es: ', total);
		for i:=1 to top do
		begin
			writeln(i, topcod[i], topgasto[i]);
		end;
	end;
end;

var
	l: lista;
	v: vector;
begin
	l:=nil;
	iniciar(v);{se dispone}
	cargar(v);{se dispone}
	agregar(l);{se dispone}
	procesar(l, v);
end.
