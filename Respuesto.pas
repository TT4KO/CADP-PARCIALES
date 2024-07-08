{un fabricante de dispositivos electronicos desea procesar informacion de los respuestos que compro.
De cada respuesto conoce su codigo, precio, 
codigo de marca(entre 1 y 130) y nombre del pais del que proviene. 
El fabricante dispone de una estructura de datos con la informacion de los respuesto,
ordenados por nombre del pais.
A)Lea el codigo y el nombre de las 130 marcas con las que trabaja, y las almacene en una estrucuta de datos. 
La informacion se ingresa sin ningun orden en particular.
B)Una vez completada la carga, procese la informacion edlos resputso e informe:
    1)La cantidad de paises a los que se le compro mas de 100 respuesto.
    2)Para cada marca, nombre de la marca y el precio del prdducto mas barato.
    3)La cantidad de respuesto que no poseen ningun cero en su codigo.
Implemente el programa principal que invoque a los modulos de los incisos a y b, e imprima los resultados.}

program jidas;
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
lista = ^nodo;
    nodo = record
    dato: respuesto;
    sig: lista;
end;

vectornombre = array [rangomarca] of string;
vectorprecio = array [rangomarca] of real;

procedure cargarcosas(var v: vectornombre);
var
    i: rangomarca;
    codigo: integer;
    nombre: string;
begin
    for i:=1 to cantmarca do
    leer(codigo, nombre);
    v[codigo]:=nombre;
end;

function cumple(num, digitobuscado: integer):integer;
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
    cumple:=(cant = 0);
end;

precedure iniciar(var vc: vectorprecio);
var 
    i: rangomarca;
beign
    for i:=1 to cantmarca do
    vc[i]:=0;
end;

procedure minimo(var marca: string; nuevovalor: integer);
begin
    if(nuevovalor > marca) then
    marca:= nuevovalor;
end;

procedure procesar(l:lista; v: vectornombre; var vc: vectorprecio; var ninguncero, cantidadpaises: integer); 
var
    cantcompras: integer;
    paisactual: string;
begin
    iniciar(vc);
    cantidadpaises:=0;
    ninguncero:=0;
    while(l <> nil) do
    begin
        cantcompras:=0;
        paisactual:=l^.dato.pais;
        while(l <> nil) and (l^.dato.pais = paisactual) do
        begin
            cantidadpaises:=cantidadpaises + 1;
            
            minimo(vc[l^.dato.marca], l^.dato.precio)
            
            if(cumple(l^.dato.codigo, 0))then
            ninguncero:=ninguncero + 1;
        
            l:=l^.sig;
        end;
        if(cantcompras > 100) then
        cantidadpaises:=cantidadpaises + 1;
    end;
end;
    

var
l: lista;
v: vectornombre;
vc: vectorprecio;
cantidadpaises: integer;
ninguncero: integer;
begin
    l:=nil;
    cargarrespuesto(l){se dispone}
    cargarcosas(v);
    procesar(v, l, vc, ninguncero, cantidadpaises);
        write(ninguncero);
        write(ninguncero);
        for i:=1 to cantmarca do
            write(v[i], vc[i]);
end.
