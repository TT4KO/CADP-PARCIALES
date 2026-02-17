{Se lee información de productos. De cada producto se lee código de producto, nombre del rubro y stock. 
Se pide realizar un programa que genere una estructura donde se almacenen, para cada rubro leido, su nombre, 
cantidad de productos del rubro y stock total, para los prorductos con stock distinto de cero. 
La lectura finaliza cuando se lee el código-1 y la lectura viene ordenada por nombre de rubro}

program iasdl;
type
producto = record;
	codigo: integer;
	nombre: string;
	stock: integer;
end;

rubro = record
	nombre: string;
	cantidad: integer;
	stock_total: integer;
end;

lista = ^nodo;
	nodo = record
	dato: rubro;
	sig: lista;
end;

procedure leer(var p: producto);
begin
	read(p.codigo);
	if(p.codigo <> -1) then
	begin
		read(p.nombre);
		read(p.stock);
	end;
end;

procedure atras(var l, ult: lista; r: rubro);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=nil;
	if(l = nil) then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;


procedure cargar(var l: lista);
var
	p: producto;
	r: rubro;
	actual: integer;
	cant, total: integer;
begin
	leer(p);
	while(p.codigo <> -1) do
	begin
		actaul:=p.nombre;
		cant:=0;
		total:=0;
		while(p.codigo <> -1) and (p.rubro = actaul) do
		begin
			if(p.stock <> 0) then
			begin
				cant:=cant + 1;
				total:= total + p.stock
			end;
		leer(p);
		end;
		if(cant > 0) then
		begin
			r.cantidad:=cant;
			r.stock_total:=total
			ordenado(r, l);	
		end;
	end;	
end;	

var
	l: lista;
begin
	l:=nil;
	cargar(l);
end.
