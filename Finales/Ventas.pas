{Una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce número de venta, cantidad de productos y tipo de pago (efectivo o tarjeta). 
Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga más dígitos pares q impares. 
En la estructura generada deben quedar almacenadas las ventas de tipo de pago efectivo antes que de tipo de pago con tarjeta.}

program iansd;
type
venta = record
	numero: integer;
	cantidad: integer;
	tipo: real;
end;

lista = ^nodo;
	nodo = record
	dato: venta;
	sig: lista;
end;

function pares(numero: integer):boolean;
var
	num, cantp, canti: integer;
begin
	cantp:=0;
	canti:=0;
	while(numero <> 0) do
	begin
		num:=numero mod 10;
		if(numero mod 2 = 0) then
			cantp:=cantp + 1 
		else
			canti:=cant + 1;
		num:= num div 10;
	end;
	pares:=cantp > canti;
end;

procedure adelante(var l2: lista; v: venta);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:=v;
	nue^.sig: l2;
	l:= nue;
end;

procedure atras(var l, ult: lista; v: venta);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= v;
	nue^.sig:=nil;
	if(l = nil) then
		l:=nue
	else
		ult^.sig:=nue;
		ult:=nue;
end;

var
	nue: lista;
begin
	new(nue);
	nue^.dato:=v;
	nue^.sig:= nil;
	if(l = nil)
		l:=nue
	else
	ult^.sig:=nue;
	ult:=nue;
procedure busqueda(l: lista; var l2: lista);
var
	ult: lista;
begin
	while(l <> nil) do
	begin
		if(pares(l^.dato.cantidad) then
		if (l^.dato.tipo = 'efectivo') then
			adelante(l2, l^.dato);
			l:=l^.sig
		else
			atras(l2, ult, l^.dato);		
			l:=l^.sig;
	end;
end;

var 
	l, l2: lista;
begin
	l:=nil;
	l2:=nil;
	agregar(l);{dispone}
	busqueda(l, l2);
end.
