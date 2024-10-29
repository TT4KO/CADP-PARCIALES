{una fabrica de automoviles necesita un programa para administrar las 900000 piezas de los diferentes modelos de atumoviles de fabrica.
De cada pieza, se cnoce, codigo de piesza, descripcion, cantidad en stock, costo de l apieza, codigo de modelo al  que pertene(1 al 10), stock minimo y su peso en kg.
A. Leer y almacenar la informacion de las piezas en una estructura da datos adecuada. La informacion debe quedar almacenada en el mismo orden que fue leida.
B. A partir de la estructura generada en A. Se requiere:
    1. Realizar una lista de las piezas cuyo stock actual sea igual al stock minimo.
    2. Calcular el promedio de piezas que pasan mas de 1 kg y su codigo pieza posea al menos 3 digitos multiplos de 2.
    3. Utilizando la lista generada en B)1. calcular e informar los dos codigos de piezas mas costotsas cuyo codigo
       de modelo sea menor que 5}
program ikdas;
const 
cantcod = 10;
cantpieza = 900000;
type
rangopieza = 1..cantpieza;
vectorpieza = array [rangopieza] of pieza;
rangocod = 1..cantcod;
pieza = record
    codigo_pieza: integer;
    descripcion: string;
    cantidad_stock: integer;
    costo: real;
    codigo_modelo: rango;
    stock_minimo: integer;
    peso: real;
end;

lista = ^nodo
    nodo = record
    dato: pieza;
    sig: lista;
end;

procedure leer(var p: pieza);
begin   
    read(p.codigo_pieza);
    read(p.descripcion);
    read(p.cantidad_stock);
    read(p.costo);
    read(p.codigo_modelo);
    read(p.stock_minimo);
    read(p.peso);
end;

function digitos(num: integer):boolean;
var
    dig: integer;
    cant: integer;
begin
    cant9:=0;
    while(num <> 0) and (cant < 4) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 0) then
        begin
            cant:=cant+1
        end;
        num:=num div 10;
    end;
    digitos:=(cant = 3);
end;


procedure cargarvector(var v: vectorpieza);
var
    i: rangopieza;
    p: pieza;
begin
    for i:=1 to cantpieza do
    leer(p);
    v[i]:=p;
end;

function promediar(a,b : integer):real;
begin
    promediar:=a/b;
end;

procedure Adelante(var L: lista; p: pieza);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= L;
  L:= nue;
end;

procedure procesar(v: vectorcultivo; var l: lista);
var
    p: pieza;
    i: rangopieza;
    cant: integer;
begin
    cant:=0;
    for i:=1 to cantpieza do
    begin
    if(v[i].cantidad_stock = v[i].stock_minimo) then
    adelante(l, p);

    if(v[i].peso > 1) and (digitos(v[i].codigo_pieza)) then
    cant:=cant + 1;
    end;
    promediar(cant, cantpieza);
end;

procedure maximo(codigoact: integer; costoact: real; var codmax1, codmax2: integer; var max1, max2: real);
begin
    if(costoact > codmax1) then
    begin
        max2:=max1;
        codmax2:=codmax1;
        codmax1:=costoact;
        codmax1:=codigoact;
    end
    else
    if(costoact > max2) then
    max2:=costoact;
    codmax2:=codigoact;

end;
procedure listanueva(l: lista);
var
    codmax1, codmax2: integer;
    max1, max2: real;
begin
    max1:=-1;
    max2:=-1;
    while(l <> nil) do
    begin
        maximo(l^.dato.codigo_pieza, l^.dato.costo, codmax1, codmax2, max1, max2);
        l:=l^.sig;
    end;
    write(codmax1, codmax2)
end;

var
v: vectorpieza;
l: lista;
begin
    l:=nil;
    cargarvector(v);
    procesar(v, l);
    listanueva(l);
end.
