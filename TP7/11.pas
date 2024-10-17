program si;
const  
canteventos = 100;
canttipo = 5;
type
rangoeventos = 1..canteventos;
rangotipo = 1..canttipo;
vector_evento = array [rangoeventos] of evento;
evento = record
    nombre: string;
    tipo: rangotipo;
    lugar: string;
    cantidad: integer;
    costo: real;
end;
venta = record
    codigo: integer;
    numero_evento: rangoeventos;
    dni: integerl;
    entradas: integer;
end;
lista = ^nodo
    nodo = record
    dato: venta;
    sig: lista;
end;

vectornumero = array [rangoeventos] of real;

procedure leer(var v: venta);
begin
    read(v.codigo);
    if(v.codigo <> -1) then
    read(v.numero);
    read(v.dni);
    read(v.entradas);
end;

procedure cargarventa(var l: lista);
var
    ve: venta;
begin
    leer(ve);
    while(ve.codigo <> -1) do
    adelante(l, ve)
    leer(ve);
end;

procedure iniciar(v: vectornumero);
var
    i: rangoeventos;
begin
    for i:=1 to canteventos do
    v[i]:=0;
end;

function cumple(v: vector_evento; cantidad:integer):boolean;
var
    i:rangoeventos;
    aux: boolean;
begin
    aux:=false;
    if(v[50] > cantidad) then
    begin
        aux:=true;
    end;
    cumple:=aux;
end;

procedure minimo(vn: vector_evento; v: vector_evento;var nombremin1, nombremin2, lugarmin1, lugarmin2: string; var min1, min2: integer);
var
    i: rangoeventos;
begin
    if(vn[i] < min1) then
    begin  
        min2:=min1;
        nombremin2:=nombremin1;
        lugarmin2:=lugarmin1;
        min1:=vn[i];
        nombremin1:=v[i].nombre;
        lugarmin1:=v[i].lugar;
    end
    else
    begin
        if(vn[i] < min2) then
        min2:=vn[i];
        lugarmin1:=v[i].lugar;
        nombremin1:=v[i].nombre;
    end;

function digitos(dni: integer): boolean;
var
    digito, pares, impares: integer;
begin
    pares := 0;
    impares := 0;
    while dni <> 0 do
    begin
        digito := dni mod 10;
        if (digito mod 2 = 0) then
            pares := pares + 1
        else
            impares := impares + 1;
        dni := dni div 10;
    end;
    digitos:= pares > impares;
end;

procedure procesar(l: lista; v: vector_evento);
var
    ve: string
    vn: vectornumero;
    cantidad: integer;
    nombremin1, nombremin2: string;
    lugarmin1, lugarmin2: string;
    min1, min2: real;
    totalentradas: integer;
begin
    ve:=l^.dato;
    iniciar(vn);
    totalentradas:=0;
    cantidad:=0;
    min1:=9999;
    min2:=9999;
    while(l <> nil) do
    begin
        vn[ve.numero_evento]:=vn[ve.numero_evento] + v[ve.numero_evento].costo;

        if(digitos(ve.dni)) and (v[v.numero_evento].tipo = 3) then
        cantidad:=cantidad + v[ve.numero_evento].entradas;

        if(ve.cultivo = 50) then
        totalentradas:=totalentradas + ve.entradas;
        l:=l^.sig;
    end;
    minimo(vn, v ,nombremin1, nombremin2, lugarmin1, lugarmin2, min1, min2);
    write(lugarmin1, lugarmin2, nombremin1, nombremin2)
    write(cantidad);
    if(v[50] > totalentradas) then
    write('el evento 50 supera la cantidad');
end;

var
l: lista;
v: vector_evento;
begin   
    l:=nil;
    cargarvector(v);
    cargarventa(l);
    procesar(v, l);
end.
