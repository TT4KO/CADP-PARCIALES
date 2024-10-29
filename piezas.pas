{Una fabrica de automóviles necesita un programa para administrar las piezas de los diferentes modelos de automóviles que fabrica.  De cada pieza se conoce: 
ódigo de pieza, descripción, cantidad en stock, costo de la piza, código modelo al que pertenece(1 al 10), stock mínimo. La lectura finaliza al leer el código de pieza 9999 el cual debe procesarse.
A. Leer y almacenar la información de la piezas en una estrucuta de datos adecuada. La información debe quedar almacenada en el mismo orden que fue leída.
B. A partir de la estructura generada en A) calcular e informar.
1. Los 2 códigos de modelo de automóviles mas baratos de fabricar
2. El promedio de piezas con codigo de modelo 3 u cuyo codigo de pieza comienza en 9
3. Cual es el código de pieza en el que La fabrica deberá gastar mas dinero para que su stock actual supere en una unidad a sus stock mínimo}

program oads;
const 
cantcodigo = 10;
type
rangocodigo = 1..cantcodigo;
pieza = record
    codigo_pieza: integer;
    descripcion: string;
    cantidad_stock: integer;
    costo: real;
    codigo_modelo: rangocodigo;
    stock_minimo: integer;
end;
lista = ^nodo 
    nodo = record
    dato: pieza;
    sig: lista;
end;
vector = array [rangocodigo] of real;

procedure leer(var p: pieza);
begin   
    read(p.codigo_pieza);
    if(p.codigo_pieza <> 9999) then
    read(p.descripcion);
    read(p.cantidad_stock);
    read(p.costo);
    read(p.codigo_modelo);
    read(p.stock_minimo);
end;

procedure agregaratras(var L,Ult: lista; p: pieza);
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

procedure cargarlista(var l: lista);
var 
    p: pieza;
    ult: lista;
begin   
    repeat
        leer(p);
        atras(l, ult, p);
    until(p.codigo_pieza = 9999);
end;

function calcular(p: pieza);
var
    diferencia: integer;
begin
    diferencia:=p.stock_minimo - p.cantidad_stock;
    diferencia:=diferencia + 1;
    calcular:=diferencia * p.costo;
end;

function digitos(num: integer):boolean
begin
    digitos:=(num div 9 = 0)
end;

procedure iniciar(var v: vector);
var
    i: rangocodigo;
begin   
    for i:=1 to cantcodigo do
    v[i]:=0;
end;

function promedio(a,b :integer):real;
begin   
    promedio:=a/b;
end;

procedure procesar(l: lista);
var
    v: vector;
    codmax1, codmax2: integer;
    max1, max2: real;
    cantpiezas: integer;
    cantpromedio: integer;
    piezamax: integer;
    maxgasto, codigomaximo: integer;
begin
    maxgasto:=-1;
    cantpiezas:=0;
    iniciar(v);
    max1:=-1;
    max2:=-1;
    while(l <> nil) do
    begin
        v[l^.dato.codigo_modelo]:=v[l^.dato.codigo_modelo] + l^.dato.costo;

        cantpiezas:=cantpiezas  + 1;
        if(l^.dato.codigo_modelo = 3) and (digitos(l^.dato.codigo_pieza)) then
        cantpromedio:=cantpromedio + 1

        if(l^.dato.cantidad_stock < l^.dato.stock_minimo) then
        if(calcular(l^.dato) > maxgasto) then
        maxgasto:=calcular(l.dato);
        codigomaximo:=l^.dato.codigo_pieza;
       
        l:=l^.sig
    end;
    maximo(v, codmax1, codmax2, max1, max2);
    promedio(cantcodigo, cantpiezas);
end;


var
    l: lista;
begin
    l:=nil;
    cargarlista(l);
    procesar(l);
end.
