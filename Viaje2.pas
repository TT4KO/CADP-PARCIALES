{De cada viaje se conoce el codigo de tren, el mes en que se realizo el viaje(entre 1 y 12),
la cantidad mde pasajeros que viajaron, y el codigo de la ciudad de destino(entre 1 y 20).
La informacion se encuentre ordenada por codigo de tren.
Ademas, la empresa dispone de una estructura de datfos con informacion del costo del ticket por ciudad destino.
A)genere una lista que tenga por cada codigo del tren, la cantidad de viajes realizados.
B)informe el mes con mayor monto recaudado.
C)informe el promedio de pasajeros por cada tren entre todos sus viajes}

program jdias;
type
rangomes = 1..12;
rangodestino = 1..20;
viaje = record
    codigo: integer;
    mes: rangomes;
    pasajeros: integer;
    destino: rangodestino;
end;

lista = ^nodo;
    nodo = record
    dato: viaje;
    sig: lista;
end;

tren = record
    codigo2: integer;
    cantviajes: integer;
end;

lista2 = ^nodo2;
    nodo2 = record
    dato: tren;
    sig: lista2;
end;

vmonto = array[rangodestino] of real;
vmes = array [rangomes] of integer;

procedure adelante(l2: lista2; t:tren);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= t;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure iniciar(var vc: vmes);
var
    i:rangomes;
begin
    for i:= 1 to 12 do
    vc[i]:=0;
end;

procedure maximo(vc: vmes; var mesmax, max: integer);
var
    i: rangomes;
begin
    for i:= 1 to 12 do
    if(vc[i] > max) then
    max:=vc[i];
    mesmax:=i;
end;

function promedio(a, b: integer): real;
begin
    promedio:=b/a;
end;

procedure cargartodo(l: lista; var l2: lista2; v: vmonto);
var
    vc: vmes;
    t: tren;
    mesmax, max: integer;
    cantpasajeros: integer;
begin
    iniciar(vc);
    max:=-1;
    t.codigo2:=l^.dato.codigo;
    t.cantviajes:=0;
    while(l <> nil) do
    begin
        cantpasajeros:=0;
        while(l <> nil) and (t.codigo2 = l^.dato.codigo) do
        begin
            t.cantviajes:=t.cantviajes + 1;{a}
            
            vc[l^.dato.mes]:=vc[l^.dato.mes] + v[l^.dato.destino];{b}
            
            cantpasajeros:=cantpasajeros + l^.dato.pasajeros{c}
            
            l:=l^.sig;
            
        end;
        adelante(l, t);
    end;
    maximo(vc, mesmax max)
    promedio(cantpasajeros, t.cantviaje);
end;
    

var
l: lista; l2: lista2;
v: vmonto;
begin
    l:=nil;
    l2:=nil;
    cargarviaje(l);
    cargarvector(v);
    cargartodo(l, l2, v);
end.
