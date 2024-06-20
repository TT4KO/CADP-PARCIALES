{un fabricante de dispositivos desea procesar informacion de respuesto que compro. El frabricante dispone de una estructura de datos con los nombres 
de los 200 paises de los cuales provienen respuestos, en la que para cada codigo de pais(1..200) se tiene su nombre.
Realizar un programa que:
A. Lea la informacion de respuesto comprados y la almacene en una estructura de datos adecuada. De cada respuesto se lee codigo, precio y codigo del pais
del que proviene(entre 1 y 200). La lactura finaliza al ingresar el codigo -1(que no debe procesarce);
B.Una vez cargada la informacion, procese la estructura de datros del inciso a e informe.
    1. Cantidad de paises para los que la cantidad de respuestos comprados es menor que el promedio de respuesto comprados a todos los paises.
    2. Para cada pais, el nombre del pais y el precio del respuesto mas caro.
    3. La cantidad de respuestos que poseen al menos 3 cereos en su codigo
Implemente el programa principal que invoque a los modulos de los incisos a y b, e informe los resultados.}

program nodas;
const
cantpaises = 200;
type
rangopaises = 1..cantpaises;
vectorpaises = array [rangopaises] of string;
respuesto = record
    codigo: integer;
    precio: real;
    codigopais: rangopaises;
end;
lista = ^nodo;
    nodo = record
    dato: respuesto;
    sig: lista;
end;
vmonto = array [rangopaises] of real;
vcantidad = array [rangopaises] of integer;

procedure leer(var r: respuesto);
begin
    read(r.codigo);
    if(r.codigo <> -1) then
        read(r.precio);
        read(r.codigopais);
end; 

procedure agregarAdelante(var L: lista; r: respuesto);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= r;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarrespuesto(var l: lista);
var
    r: respuesto;
begin
    leer(r);
    while(r.codigo <> -1) do
    begin
        adelante(l, r);
        leer(r);
    end;
end;

procedure iniciar(var cantidadtres: integer; var vm: vmonto; var vc: vcantidad);
var
    i: rangopaises;
begin
    cantidadtres:=0;
    for i:=1 to cantpaises do
    vm[i]:=0;
    vc[i]:=0;
end;

function sacarpromedio(vc: vcantidad): real;

var 
    suma, promedio: real;
    i, cant: integer;
begin   
    cant:=0;
    suma:=0;
    for i:=1 to cantpaises do
    begin
        suma:=suma + v[i];
    end;
    promedio:= suma / cantpaises
    for i:=1 to cantpaises do
        if(v[i] > promedio) then
        cant:=cant + 1;
    sacarpromedio:=cant;
end;

function digitos(num: integer): boolean;
var
    dig: integer;
    cant0: integer;
begin
    cant0:=0;
    while(num <> 0) and (cant9 < 4) do
    begin
        dig:=num mod 10;
        if(dig = 0) then
        begin
            cant9:=cant9+1
        end;
        num:=num div 10;
    end;
    sacarnueve:=cant9 = 3;
end;

procedure procesar(vp: vectorpaises; var vm: vmonto; var vc: vcantidad; var cantidadtres: integer);
var
    pais: string;
begin
    pais:=l^.dato.codigopais;
    while(l <> nil) do
    begin
        vc[pais]:=vc[pais] + 1;
        
        vm[pais]:=vm[pais] + l^.dato.precio;
        
        if(digitos(l^.dato.codigopais)) then
        cantidadtres:=cantidadtres + 1;
        
        l:=l^.sig;
    end;
end;
    
var
vp: vectorpaises;
vm: vmonto;
vc: vcantidad;
l: lista;
cantidadtres: integer;
begin
    l:=nil;
    cargarvector(vp);
    cargarrespuesto(l);
    iniciar(cantidadtres, vm, vc);
    procesar(vp, vm, vc, l, cantidadtres);
    write('la cantidad de codigos con digito: ' cantidadtres);
    write('la cantidad de respuesto son: ' , sacarpromedio(vc));
    for i:=1 to cantpaises do
    write(vp[i], vm[i]);
end.
