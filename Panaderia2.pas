{La panaderia agrupa a sus productos en 20 cateogrias(por ej: 1 pan; 2, medialuna; ect) 
De cada categoria se conoce: nombre y precio por kilo del producto. 
La panaderia dispone de la informacion de las categorias
A) Realizar un modulo que retorne en una estructura de datos adecuada, 
la informacion de todas las compras efectuadas en el ultimo año. Dicha informacion
se lee desde teclado, ordenada por DNI del cliente. 
De cada compra se lee: DNI del cliente, la categoria del producto(entre 1 y 20) y cantidad de kilos
comprados. La lectura finaliaz cuando se ingresa el DNI -1 (que debe procesarse)
B)Realiar un modulo que reciba la informacion de las categorias y la de las todas las compras y retorne
    1. DNI del cliente que menos dinero ha gastado.
    2. Cantidad de compras por categoria.
    3. Cantidad total de compras de clientes con DNI compuesto por, a lo sumo, 5 digitos impares.}

program mdikas;
const
cantcategoria = 20;
type
rangocategoria = 1..cantcategoria;
categoria = record
    nombre: string;
    precio: real;
vectorcategoria = array [rangocategoria] of categoria;

compras = record
    dni: integer;
    categorias: rangocategoria;
    kilos: real;
end;
lista = ^nodo;
    nodo = record
    dato: compras;
    sig: lista;
end;
vectorcompras = array [rangocategoria] of integer;

procedure leer(var c: cliente);
var
    read(c.dni);
    read(c.categoria);
    read(c.kilos);
end;

procedure Ordenado(var L: lista; d: cliente);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= c;
  ant:= L;
  act:= L;
  While(act <> nil)and(c.dni > act^.dato.dni) do  // > ascendente | < descendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act = ant) then //al principio o vacio
      L:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure cargarlista(var l: lista);
var 
    c: compras;
begin
    repeat
        leer(c);
        ordenado(l, c);
    until(c.dni <> -1);
end;

procedure iniciar(var vc: vectorcompras);
var 
    i: rangocategoria;
begin
    for i:= 1 to cantcategoria do
    vc[i]:=0;
end;

function digitos(num: integer): boolean;
var
    dig: integer;
    cant: integer;
begin
    cant9:=0;
    while(num <> 0) and (cant9 < 6) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 1) then
        begin
            cant:=cant+1
        end;
        num:=num div 10;
    end;
    digitos:= = cant = 5;
end;

procedure minimo(dni, compra, compramin: integer);
var 
    min: integer;
begin
    min:=-1;
    if(compra > min) then
    min:=compra;
    compramin:=dni;
end;

procedure procesar(v: vectorcategoria; l: lista);
var 
    compradni: integer;
    vc: vectorcompras;
    cantidadimpar: integer;
    dniactual: integer;
    compramin: integer;
begin
    iniciar(vc);
    cantidadimpar:=0;
    while(l <> nil) do
    begin
        compradni:=0;
        dniactual:=l^.dato.dni;
        while(l <> nil) and (l^.dato.dni = dniactual) do
        begin
            compradni:=compradni + v[l^.dato.categorias].precio * l^.dato.kilos;
            
            vc[l^.dato.categorias]:=vc[l^.dato.categorias] + 1;
            
            if(digitos(l^.dato.dni)) then
            cantidadimpar:=cantidadimpar + 1;
            
            l:=l^.sig;
        end;
        minimo(dniactual, compradni, compramin);
        write(compramin)
    end;
    write(vc[i], i);
    write(cantidadimpar);
end;
        
var
v: vectorcategoria;
l: lista;
begin
    cargarvector(vectorcategoria);{se dispone}
    cargarlista(l);
    procesar(v, l);
end.
