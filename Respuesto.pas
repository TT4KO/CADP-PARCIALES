{un fabricante de dispositivos electronicos desea processar informacion de los respuestos que compro.
De cada respuesto conoce su codigo, precio, 
codigo de marca(entre 1 y 130) y nombre del pais del que proviene. 
El fabricante dispone de una estructura de datos con la informacion de los respuesto,
ordenados por nombre del pais.
A)Lea el codigo y el nombre de las 130 marcas con las que trabaja, y las almacene en una estrucuta de datos. 
La informacion se ingre sin ningun orden en particular.
B)Una vez completada la carga, procese la informacion edlos resputso e informe:
    1)La cantidad de paises a los que se le compro mas de 100 respuesto.
    2)Para cada marca, nombre d ela marca y el precio del prodducto mas barato.
    3)La cantidad de respuesto que no poseen ningun creo en su codigo.
Implemente el programa principal que invoque a los modulos de los incisos a y b, e imprima los resultados.}

program ndas;
const
cantmarca = 130;
type
rangomarca = 1..cantmarca;
respuesto = record
    codigo: integer;
    precio: real;
    marca: rangomarca;
    pais: string;
end;

vector = array [rangomarca] of string;
vmoonto = array [rangomarca] of real;

lista = ^nodo;
    nodo = record
    dato: respuesto;
    sig: lista;
end;

procedure leerrespuesto(var nombre: string; var codigo: integer);
begin
    read(nombre);
    read(codigo);
end;

procedurecargarinfo(v: vector);
var
    i, cod: integer;
    nombre: string;
begin
    for i:=1 to cantmarca do
    leerrespuesto(nombre, cod);
    v[cod]:=nombre;
end;
    
function digitos(num, digitobuscado: integer):integer;
var
    dig, cant: integer;
begin   
    cant:=0;
    while(num <> 0) do
    begin   
        dig:=mod 10 num;
        if (dig = digitobuscado) then
        cant:=cant + 1;
        num:= num div 10;
    end;
    digitos:=(cant = 0);
end;    

procedure minimo(vc: vmonto);
var
    marcamin, min, i: integer;
begin
    min:=9999;
    for i:=1 to cantmarca do
    if(vc[i] > min) then
        min:=vc[i];
        marcamin:=i;
end;

procedure iniciar(var vc: vmonto);
var
    i: integer;
begin
    for i := 1 to cantmarca do
        vc[i] := 0;
end;

procedure procesar(l: lista; v: vector; var vc: vmonto);
var
    cantpaises: integer;
    respuestos100: integer;
    nombreactual: string;
    cantceros: integer;
begin
    cantceros:=0;
    respuestos100:=0;
    iniciar(vc);
    while(l <> nil) do
    begin
        cantpaises:=0;
        nombreactual:=l^.dato.pais;
        while(l <> nil) and (l^.dato.pais = nombreactual) do
        begin
            cantpaises:=cantpaises + 1;
            
            vc[l^.dato.marca]:=vc[l^.dato.marca] + l^.dato.precio;
            
            if(digitos(l^.dato.codigo, 0 )= 0) then
            cantceros:=cantceros + 1;
            
            l:=l^.sig;
        end;
        if(cantpaises > 100) then
        respuestos100:=respuestos100 + 1;
        for i:= 1 to cantmarca do
        minimo(vc);
    end;
end;

var
l: lista;
v: vector;
vc: vmonto;
begin
    l:=nil;
    cargarrespuesto(l);
    procedurecargarinfo(v);
    procesar(l, v, vc);
end.
