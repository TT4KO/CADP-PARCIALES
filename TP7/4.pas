program idas;
const
cant = 42;
type
rango = 1..cant;
paciente = record
    nombre: string;
    apellido: string;
    peso: vector;
    diml: cant;
end;

vector = array [rango] of real;

lista = ^nodo
    nodo = record
    dato: paciente;
    sig: lista;
end;

function calcular(v: vector; diml: integer);
var
    i: rango;
    semana, pesomax: integer;
    total: integer;
begin
    pesomax:=-1;
    total:=0;
    for i:1 to diml do
    total:=v[i+1] + v[i]
    if(total > pesomax) then
    peso:=total
    semana:=i;
end;


procedure procesar(l: lista);
var
    pesototal: integer;
begin
    pesototal:=0;
    while(l <> nil) do
    begin
        calcular(l^.dato.peso, l^.dato.diml);

        pesototal:=pesototal + l^.dato.peso;
    
        l:=l^.sig;
    end;
    write(pesototal);
end;

var
l: lista;
begin
    l:=nil;
    cargar(l);
    procesar(l);
end.

