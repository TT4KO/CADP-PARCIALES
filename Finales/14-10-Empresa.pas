{Una empresa mantiene la información de sus empleados (a lo sumo 1000). De cada empleado conoce apellido dni y sueldo.
 La estructura se encuentra ordenada por dni. Se pide realizar un programa que lea dni hasta leer el dn O y 
elimine de la estructura de empleados aquel o aquellos empleado/s cuyo dni es mayor igual al leído.}

program aismd;
const
max = 1000;
type
empleado = record
	apellido: string;
	dni: integer;
	sueldo: real;
end;

vector = array [1..max] of empleado;

procedure busqueda(dni: integer; var v: vector; var diml: integer);
var
	i: integer;
begin
	i:=1;
	while(i <= diml) and (v[i].dni < dni) do
	begin
		i:=1 + 1;
	if(i <= diml) then
		diml:=i - 1;
	end;
end;

procedure procesar(var v: vector; diml: integer);
var
	dni: integer;
begin
	read(dni);
	while(dni <> 0) do
	begin
		busqueda(dni, v, diml);
		read(dni);
	end;
end; 
			

var
	v: vector;
	diml: integer;
begin
	iniciar(v);{se dispone}
	cargar(v, diml);
	procesar(v, diml);
end.
