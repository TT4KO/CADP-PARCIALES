{Una empresa dispone de una estructura de datos con información de sus empleados. 
De cada empleado conoce su nombre, año de nacimiento y salario, y la información se encuentra ordenada por año de nacimiento. 
Realizar un programa que informe los 10 años en los que nacieron más empleados, y el monto total destinado al pago de salarios de 
dichos empleados nacidos en esos 10 años}
program iasd;
const 
	dimF = 10;
type
empleado = record
	nombre: string;
	anio: integer;
	salario: real;
end;
lista = ^nodo;
	nodo = record
	dato: empleado;
	sig: lista;
end;

info = record
	anio: integer;
	cant: integer;
	total: real;
end;
vector = array [1..10] of info;

procedure iniciar(var v: vector);
var
	i: integer;
begin
	for i:=1 to 10 do
	v[i].anio:=0;
	v[i].cant:=-1;
	v[i].total:=0;
end;

procedure ordenado(var L: lista; d: empleado);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= d;
  nue^.sig := nil;
  ant:= L;
  act:= L;
  While(act <> nil)and(d.anio > act^.dato.anio) do  // > ascendente | < descendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act = ant) then //al principio o vacio
      L:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
	
end;

procedure leer(var e: empleado);
begin
	writeln('ingrese salario');
	readln(e.salario);
	if(e.salario <> -1) then
	begin
		writeln('ingrese el anio');
		readln(e.anio);
		writeln('ingrese el nombre');
		readln(e.nombre);
	end;
end;

procedure cargar(var l: lista);
var
	e: empleado;
begin
	leer(e);
	while(e.salario <> -1) do
	begin
		ordenado(l, e);
		leer(e);
	end;
end;

procedure actualizar(var v: vector; anio, cant: integer; total: real);
var
  i, posMin: integer;
begin
  posMin := 1;

  for i := 2 to dimF do
    if v[i].cant < v[posMin].cant then
      posMin := i;

  if cant > v[posMin].cant then
  begin
    v[posMin].anio := anio;
    v[posMin].cant := cant;
    v[posMin].total := total;
  end;
end;
		

procedure buscar(l: lista);
var
	total: real;
	i: integer;
	actual: integer;
	cant:=0;
begin
	
	while(l <> nil) do
	begin
		actual:=l^.dato.anio;
		total:= 0;
		cant:=0;	
		while(l <> nil) and (l^.dato.anio = actual) do
		begin
			cant:=cant + 1;
		
			total:=total + l^.dato.salario;
			l:=l^.sig;
		end;
		actualizar(v, actual, cant, total);
	end;
	write(total);
end;

procedure imprimir(v: vector);
var
  i: integer;
begin
  writeln('--- TOP 10 años con más empleados ---');
  for i := 1 to dimF do
    if v[i].cant <> -1 then
      writeln('Año: ', v[i].anio,
              ' | Cantidad: ', v[i].cant,
              ' | Total salarios: ', v[i].total:0:2);
end;

var
	l: lista;
	v: vector;
begin
	l:=nil;
	iniciar(v);
	cargar(l);{se dispone igual}
	buscar(l);
	imprimir(v);
end.
