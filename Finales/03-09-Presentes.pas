{Una empresa dispone de la información de las asistencias de sus empleados durante un período de tiempo. 
De cada empleado conoce: DNI, apellido y nombre, código de departamento en el que trabaja (entre 1 y 100), 
fecha y si estuvo presente o no ese día (no todos los días se pasa asistencia y los empleados pueden haber estado trabajando o haber faltado). 
Esta estructura se encuentra ordenada por código de departamento. Se pide realizar un programa que informe el 
departamento con más empleados presentes durante el período evaluado por la empresa.}


program iasd;
const
max = 1000;
type
rango = 1..1000;
empleado = record
	dni: integer;
	ayn: string;
	codigo: rango;;
	presente: string;
end;


lista = ^nodo;
	nodo = record
	dato: empleado;
	sig: lista;
end;

procedure procesar(l: lista);
var
	i: integer;
	total: integer;
	actual: integer;
	max, actualmax, maximo: integer;
begin
	max:=-1;
	while(l <> nil) do
	begin
		actual:=l^.dato.codigo;
		total:=0;
		while(l <> nil) and (l^.dato.codigo = actual) do
		begin
			if(l^.dato.presente) then
			begin
				total:=total + 1;
		l:=l^.sig;
	end;
	if(total > max) then
	begin
		max:=total;
		actualmax:=actual;
	end;
end;

var
	l: lista;
begin
	l:=nil;
	cargar(l);{se dispone}
	procesar(l);
end.
