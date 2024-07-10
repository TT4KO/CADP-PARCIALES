{Un supermercado dispone de una estructura de datos con todas las compras realzidas, sin ningun orden en particular.
De cada compra se  conoce: codigo, año(entre 1980 y 2024), monto y dni del cliente. 
Un cliente puede haber realziado ams de una compra.
Realizar un programa procese la informacion de las compras y:
A. Almacene en otra estrucuta ed datos las compras realizadas entre los años 2010 y 2020. Esta estructura debe quedar ordenada por el dni del cliente.
B. Una vez almacenada la estructura del inciso A, procesar estos datos e informar
    1. eL año con menor facturacion.
    2. Los dos DNI de los clientes que realizaron mayor cantidad de compras.
    3. El monto total facturado de compras con codigo multiplo de 10}
    
program jmdas;
type
rangoaño = 2010..2020;
compra = record
    codigo: integer;
    año: rangoaño;
    monto : real;
    dni: integer;
end;
lista = ^nodo;
    nodo = record
    dato: compra;
    sig: lista;
end;
vector = array [rangoaño] of integer;

procedure insertarOrdenado(var L: lista; c: compra);
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


procedure nuevalista(l: lista; var l2: lista);
begin
    while(l <> nil) do
    begin
        if(l^.dato.año = 1980) and (l^.dato.año = 2024) then
        ordenado(l2, l^.dato)
        l:=l^.sig;
    end;
end;

procedure maximo(compra, dni: integer; var dnimax1, dnimax2, max1, max2: integer;
begin
    max1:=-1;
    max2:=-1;
    if(compra > max1) then
    begin
        max2:=max1;
        dnimax2:=dnimax1;
        max1:=compra;
        dnimax1:=dni;
    end
    else
    if(compra > max2) then
    max2:=compra;
    dnimax2:=dni;
    
procedure minimo(vc: vector);
var
    i: rangoaño;
    añomin, min: integer;
begin
    min:=-1;
    for i:=1 to 10 do
    if(vc[i] < min) then
    min:=vc[i];
    añomin:=i;
end;

procedure procesar(l: lista);
var
    vc: vector;
    total: real;
    dniactual: integer;
    cantcompra: integer;
    dnimax1, dnimax2, max1, max2: integer
begin
    max1:=-1;
    max2:=-1;
    iniciar(vc);
    total:=0;
    while(l <> nil) do
    begin
        dniactual:=l^.dato.dni;
        cantcompra:=0;
        while(l <> nil) and (l^.dato.dni = dniactual) do
        begin
            cantcompra:=cantcompra + 1;
            
            vc[l^.dato.año]:=vc[l^.dato.año] + l^.dato.monto;
            
            if(l^.dato.dni mod 10 = 0) then
            total:=total + l^.dato.monto;
            
            l:=l^.sig;
        end;
        maximo(cantcompra, dniactual, dnimax1, dnimax2, max1, max2: integer);
        write(dnimax1, dnimax2);
    end;
    write(total);
    minimo(vc);
end;

var
l, l2: lista;
begin
    l:=nil;
    l2:=nil;
    cargarcompra(l);{se dispone}
    nuevalista(l, l2);
    procesar(l2);
end.
