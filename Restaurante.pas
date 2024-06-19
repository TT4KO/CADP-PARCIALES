{un restaurante necesita un programa para administar la informacion de los platos que ofrece. Se dispone de una estrucutra con la informacion de los platos. De cada plato
se conoce: nombre, precio, categoria(1:entrada, 2:principal, 3:postre, 4:minuta), cantidad de ingrediente y nombre de cada uno de los ingredientes(a lo sumo 10).
A) generar una nueva estructura con nombre y precio de cada plato que psea perejil entre sus ingredientes
B)informar las dos categorias con mayor cantidad de platos ofrecidos
C)informar el precio promedio de los platos con mas de 5 ingredientes.}
program jdias;
const
cantcat = 4;
canting = 10;
type
rangoing = 1..canting;
rangocat = 1..cantcat;
plato = record
    nombre: string;
    precio: real;
    categoria: rangocat;
    cantingredientes: string;
    ingredientes: vector;
end;
vector = array [rangoing] string;
lista = ^nodo;
    nodo = record
    dato: platos;
    sig: lista;
end;
vcat = array [rangocat] of integer;

plato2 = record
    nombre2: string;
    precio2: real;
end;

lista2 = ^nodo2;
    nodo2 = record
    dato: plato2;
    sig: lista2;
end;

procedure iniciar(var vc: vcat);
var
    i: rangocat;
begin
    for i:= 1 to cantcat do
    vc[i]:=0;
end;

procedure agregarAdelante(var L2: lista2; p: plato2);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure maximo(vc: vector);
var
    i: rangocat;
    maxcat, maxcat2, max, max2: integer;
begin
    max:=-1;
    max2:=-1;
    for i:=1 to cantcat do
    if(vc[i] > max) then
    begin
        max2:=max;
        maxcat2:=maxcat;
        max:=vc[i];
        maxcat:=i;
    end
    else
    if (vc[i] > max2) then
    max2:=vc[i];
    maxcat2:=i;
end;

function promedio(a, b: integer): real;
begin
    promedio:=a/b;
end;

procedure nuevalista(l: lista; var l2: lista2);
var
    p: plato2;
    vc: vcat;
    totalprecio, cantplatos: integer;
begin
    inicar(vc);
    totalprecio:=0;
    cantplatos:=0;
    while(l <> nil) do
    begin
        if(l^.dato.ingrediente[i] = perejil) then
        p.nombre2:=l^.dato.nombre;
        p.precio2:=l^.dato.precio2;
        adelante(l2, p);
               
        vc[l^.dato.categoria]:=vc[l^.dato.categoria] + 1;
        
        if(l^.dato.cantingredientes > 5) then
        cantplatos:=cantplatos + 1;
        totalprecio:=totalprecio + l^.dato.precio;
        
        l:=l^.sig;
    end;
    maximo(vc);
    promedio(cantplatos, totalprecio);
end;

var
l: lista;
l2: lista2;
begin
    l:=nil;
    l2:=nil;
    cargarplato(l);{se dispone}
    nuevalista(l, l2);
end.
