program iuasnd;
const  
cantcultivo = 20;
cantmes = 12;
type
rangomes = 1..cantmes;
rangocultivo = 1..cantcultivo;
empresa = record
    codigo: integer;
    nombre: string;
    estatal_privada: boolean;
    ciudad: string;
    cultivos: vectorcultivo;
end;
lista = ^nodo   
    nodo = record
    dato: empresa;
    sig: lista;
end;

vectorcultivo = array [rangocultivo] of cultivo;

cultivo = record
    tipo: string;
    hectareas: integer;
    meses: rangomes;
end;

procedure leercultivo(var c: cultivo);
begin
    read(c.hectareas);
    if(c.hectareas <> 0) then
    read(c.tipo);
    read(c.meses);
end;

procedure leer(var e: empresa);
var
    i: rangocultivo;
begin
    read(e.codigo);
    if (e.codigo <> -1) then
    read(e.estatal_privada);
    read(e.ciudad);
    for i:=1 to cantcultivo do
    begin
        leercultivo(e.cultivos[i]);
        while(e.cultivos[i].hectareas <> 0) do
        begin
            leercultivo(e.cultivos[i]);
        end;
    end;
end;

procedure cargar(var l: lista);
var
    e: empresa;
begin
    leer(e);
    while(e.codigo <> -1) do
    begin
        adelante(l, e);
        leer(e);
end;

function digitos(num: integer): boolean;
var
    dig: integer;
    cant: integer;
begin
    cant:=0;
    while(num <> 0) and (cant < 3) do
    begin
        dig:=num mod 10;
        if(dig = 0) then
        begin
            cant:=cant+1
        end;
        num:=num div 10;
    end;
    digitos:=cant = 2;
end;

procedure calcularpuntoa(e: empresa);
var
    i: rangocultivo;
begin
    for i:=1 to cantcultivo do
    if(p.ciudad = 'san miguel') and (p..cultivos[i].tipo = 'maiz') and (digitos(p.codigo)) then
    write(p.nombre);
end;

function calcularpuntoc(e: empresa);
var
    total: integer;
    i: integer;
begin
    for i:= 1 to cantcultivo do
    begin
        if(e.cultivos[i].tipo = maiz) then
        total:=total + l^.dato.meses;
    end;
    calcular:=total;
end;

procedure calcularpuntob(e: empresa; var cantidadhectareas: integer);
var
    i: rangocultivo;
begin
    for i:1 to cantcultivo do
    if(p.cultivos[i].tipo = 'soja') then
    cantidadhectareas:=cantidadhectareas + p.cultivos[i].hectareas;
end;

procedure maximo(var nombremax: string; var max: integer; calcular: integer; nombre: string);
begin
    if(calcular > max) then
        max:=calcular;
        nombremax:= nombre;
end;

procedure procesar(l: lista);
var
    cantempresas: integer;
    nombremax: string;
    cantidadhectareas: integer;
    max: integer;
    totalhectareas: integer;
begin
    cantidadhectareas:=0;
    cantempresas;=0;
    max:=-1;
    totalhectareas:=0;
    while(l <> nil) do
    begin
        calcularpuntoa(l^.dato);

        totalhectareas:=totalhectareas + l^.dato.cultivos[i].hectareas;
        calcularpuntob(l^.dato, cantidadhectareas);
        
        
        calcularpuntoc(l^.dato)

        l:=l^.sig;
    end;
    write(cantidadhectareas);
    maximo(nombremax, max, calcularpuntoc, l^.dato.nombre)
    write(nombremax);
    promedio(totalhectareas/cantidadhectareas);
end;

var
l: lista;
begin
    l:=nil;
    cargar(l);
    procesar(l);
end.
