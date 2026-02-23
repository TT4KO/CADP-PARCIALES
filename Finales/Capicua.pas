{Una empresa disponme de una estrucuta de datos con los cliente de su comercio(500 a lo sumo). De cada cliente
conoce el numero de cliente, numero de DNI y monto que paga. Se pide implmentar un programa que informe la cantidad
de cliente cuyo numero de DNI es capicua}

program iasd;
const 
max = 500;
type
cliente = record
	numero: integer;
	dni: integer;
	monto: real;
end;

vector = array [1..max] of cliente;

4229 1259

function escapi(num: integer): boolean;
var
	original, invertido, digito: integer;
begin
	original:=num;
	invertido:=0;
	while(num <> 0) do
	begin
		digito:=mod 10 num;
		invetido:=invetido * 10 + digito;
		num:=num div 10;
	end;
	escapi:=(original = invertido);
end;

procedure ejecutar(v: vector; diml: integer);
var
	i, j: integer;
	total, cant: integer;
begin
	total:=0;
	for i: 1 to diml do
	begin
		if(escapi(v[i].dni) then
		total:=total + 1;
end;
			
var
	v: vector;
	diml: integer;
begin
	iniciar(v){ya iniciado}
	cargar(v, diml){se dispone}
	ejecutar(v, diml);
end.
