{de cada ticket se conoce el codigo del evento, deni del comprador, mes de la funcion (entre 1 y 12) y 
ubicacion(1:palco, 2: pullman, 3: platea alta, 4:platea baja) platea baja. 
La informacion se encuentra ordenada por codigo de evento.
Ademas, la empresa dispone de una estructura de datos con informacion del costo del ticket por ubicacion
A)genere una lista que tenga por cada codigo del evento, la cantidad de tickets vendidos
b)informe el mes con mayor monto recaudado
c)informe el promedio recaudado por cada evento entre todos sus tickets}

program djidsa;
const
cantubi = 4;
type
rangomes = 1..12;
rangoubi = 1..cantubi;
tickets = record
codeve: integer;
dni: integer;
mes: rangomes;
ubicacion: rangoubi;
end;

lista = ^nodo;
nodo = record;
dato: tickets;
sig: lista;
end;

tickets2 = record
codeve2: integer;
cantvendido: integer;
end;

lista2 = ^nodo2;
nodo2 = record
dato: tickets2;
sig: lista2;
end;

vmes = array [rangomes] of real;
vubi = array [rangoubi] of integer;

function promedio(a: integer; b:real): real;
begin
    promedio:=b/a;
end;

procedure maximo(vc: vmes; var maxmes, max);
var
    i: rangomes;
begin
    for i:= 1 to 12 do
    if(vc[i] > max) then
    max:=vc[i];
    maxmes:=i;
end;

procedure procesar(l: lista; var l2: lista2; v: vubi);
var
    vc: vmes;
    t: tickets2;
    maxmes, max: integer;
    cantevento: integer;
    totalt: real;
begin
    max:=-1;
    iniciar(vc);
    cantevento:=0;
    totalt:=0;
    while(l <> nil) do
    begin
        t.codeve2:= l^.dato.codeve;
        t.cantvendido:=0;
        while(l <> nil) and (l^.dato.codeve = t.codeve2) do
        begin
            t.cantvendido:=t.cantvendido + 1;
            vc[l^.dato.mes]:=vc[l^.dato.mes] + v[l^.dato.ubicacion];
            
            cantevento:=cantevento + 1;
            totalt:=totalt + [l^.dato.ubicacion];
            
            l:=l^.sig;
        end;
        adelante(l2, t);
    end;
    maximo(vc, maxmes, max);
    promedio(cantevento, total);
end;
    

var
l: lista; l2: lista2;
v: vubi;
begin
    l:=nil;
    l2:=nil;
    cargarlista(l);
    cargarvector(v);
    procesar(l, l2, v);
end.
