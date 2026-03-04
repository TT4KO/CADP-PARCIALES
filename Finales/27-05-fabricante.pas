{Una empresa dispone de una estructura de datos con información de los productos que vende. De cada producto conoce el código de producto, precio de venta, cantidad en stock y código de fabricante.
Cuando la empresa realiza una compra de productos, recibe del proveedor a quien le compró, 
una estructura de datos con información de los productos comprados (código de producto, precio de venta, cantidad adquirida y código de fabricante), ordenada por código de fabricante.
Realizar un módulo que procese la información recibida de una compra, y actualice la estructura de datos de la empresa. 
 módulo debe retornar el porcentaje de productos comprados que aumentaron de precio, y la cantidad de productos comprados a cada fabricante. 
 Asuma que no se compran productos que no se encuentran previamente en la lista de productos de la empresa}
 
program odas;
type
producto = record
	codigo: integer;
	precio: real;
	stock: integer;
	codfabricante: integer;
end;

fabricante = record
	codigo2: integer;
	precio2: real;
	cantidad: integer;
	codfabricante2: integer;
end;

lista2 = ^nodo2;
	nodo2 = record
	dato: fabricante;
	sig: lista2;
end;

lista = ^nodo;
	nodo = record
	dato: producto;
	sig: lista;
end;

procedure procesar(var l: lista; l2: lista2);
var
	codactual: integer;
	cant: integer;
	porcentaje: real;
	totalcomprados: integer;
	aumentaron: integer;
begin
	porcentaje:=0;
	aumentaron:=0;
	totalcomprados:=0;
	while(l <> nil) do
	begin
		codactual:=l^.dato.codfabricante;
		cant:=0;
		while(l <> nil) and (l^.dato.fabricante = codactual) do
		begin
			cant:= cant + 1;
			totalcomprados:=totalcomprados + 1;
			if(l^.dato.precio < l2^.dato.precio2) then
				aumentaron:=aumentaron + 1;
				l^.dato.precio:= l2^.dato.precio2;
				l^.dato.stock:=l2^.dato.precio2 + totalcomprados;
			l:=l^.sig;
		end;
		write(cant);
	end;
	if(cant > 0) then
		porcentaje:=(aumentaron * 100)/cant;
end;


var
	l:lista;
	l2: lista2;
begin
	l:=nil;
	l2:=nil;
	cargar(l, l2){se dispone}
	procesar(l, l2);
end.
