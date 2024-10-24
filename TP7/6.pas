program iksad;
const
cant = 7;
type
rango = 1..cant;
objeto = record
    codigo: integer;
    categoria: rango;
    nombre: string;
    distancia: integer;
    descubridor: string;
    ano: integer;
end;
lista = ^nodo
    nodo = record
    dato: objeto;
    sig: lista;
end;

vector = array [rango] of integer;

procedure leer(var o: objeto);
begin
    read(o.codigo);
    if(o.codigo <> -1) then
        read(o.categoria);
        read(o.nombre);
        read(o.distancia);
        read(o.descubridor);
        read(o.ano);
end;

procedure atras(var L,Ult: lista; p: persona);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if(L = nil) then //si es el primer nodo
    L:= nue
  else      // si no es el primer nodo
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargar(var l: lista);
var
    o: objeto;
    ult: lista;
begin
    leer(o);
    while(o.codigo <> -1) then
    atras(l, ult, o);
    leer(o);
end;

procedure iniciar(var v: vector);
var
    i: rango;
begin
    for i:=1 to cant do
    v[i]:=0;
end;

procedure maximo(distancia, codigo: integer; var codmax1, codmax2, max1, max2: integer);
begin
    if(distancia > max1) then
    begin
        max2:=max1;
        codmax2:=codmax1;
        max1:=distancia;
        codmax1:=codigo
    end
    else 
    if(distancia > max2) then
        max2:=distancia;
        codmax2:=codigo
end;

procedure procesar(l: lista);
var
    v: vector;
    codmax1, codmax2, max1, max2: integer;
    cantplanetas: integer;
    distanciatotal: integer;
begin
    iniciar(v);
    max1:=-1;
    max2:=-1;
    cantplanetas:=0;
    distancia:=0;
    while(l <> nil) do
    begin
        distancia:=distancia + l^.dato.distancia;

        if(l^.dato.descubridor = 'galileo galilei') and (l^.dato.ano < 1600) then
        cantplanetas:=cantplanetas + 1;

        v[l^.dato.categoria]:=v[l^.dato.categoria] + 1;

        if(digitos(l^.dato.codigos)) then
        write(l^.dato.nombre);

        l:=l^.sig;
    end;
    maximo(distancia, l^.dato.codigo, codmax1, codmax2, max1, max2);
    write(codamx1, codmax2);
    write(cantplanetas);
    for i:=1 to cant do
    write(v[i], i);
end;

var
l: lista;
begin
    l:=nil;
    cargar(l);
    procesar(l);
end.
