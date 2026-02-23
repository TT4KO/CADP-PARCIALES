{un comercio dispone en una estrucuta de datos con la facturas(como maximo 2000 facturas) realizadas durante marzode 2023.
De cada factuyra se conoce el numero de factura, codigo de cliente, codigo de sucursal y monto total. Las facturas se encuentras
ordenada por codiugo de sucursal. Se pide implemetar un programa con un modulo que reciba la estructura que se dispone y devuelva
el codigo de sucursal con mayor cantida de facturas. El programa debe informar el alor retornado por el modulo}

program ias;
const
max = 2000;
type
factura = record
	numero: integer;
	codigo_cliente: integer;
	codigo_sucursal: integer;
	monto: real;
end;

vector = array [1..2000] of factura;

procedure procesar(v: vector; diml: integer;);
var
	i: integer;
	cant, maximo, actual, actmaximo: integer;
begin
	i:=1;
	maximo:=-1;
	while(i <= diml) do
	begin
		actual:=v[i].codigo_sucursal;
		cant:=0;
		while(i <= diml) and (v[i].codigo_sucursal = actual) do
		begin
			cant:=cant + 1;
			i:= i + 1;
		end;
		if(cant > maximo) then
		begin
			maximo:=cant;
			actmaximo:=actual;
		end;
	end;
	write(actmaximo);
end;


var
	v: vector;
	diml: integer;
begin
	iniciar(v);
	cargar(v, diml);{se dispone}
	procesar(v, diml);
end.
