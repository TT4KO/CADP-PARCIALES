{Un supermercado  dispone de una estructura de datos con todas las compras realizadas sin ningun orden en particular. 
De cada compra se conoce: codigo, año(1980 y 2024), monto y dni del cliente. 
Un cliente puede haber realizado mas de una compra. Realizar un programa pocese la informacion de las compras y:
A. Almacene en otra estrucuta de datos las compras realizadas entre los años 2010 y 2020. 
   Esta estrucuta debe quedar ordenada por el DNI del cliente.
B.Una vez almacenada la estrucuta de incisio A, procesar estos datos de compras.
    1.El año con menor facturacion.
    2.Los dos DNI de los clientes que realizaron mayor cantidad de compras.
    3.El monto total facturado de compras con codigo multiplo de 10.}
program jidas;
type
rangoanio = 1980..2024;
rangonuevo = 2010..2020;
compra = record
    codigo: integer;
    anio: rangoanio;
    monto: real;
    dni: integer;
end;
lista = ^nodo;
    nodo = record
    dato: compra;
    sig: lista;
end;
vector = array [rangoanio] of real;
vector2 = array [rangonuevo] of real;

procedure Ordenado(var L: lista; c: compra);
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

procesar nuevalista(l: lista; l2: lista);
var
    c: compra;
begin
    while(l <> nil) do
    begin
        if(l^.dato.anio > 2010) and (l^.dato.anio < 2020) then
        ordenado(l2, l^.dato);
        l:=l^.sig;
    end;
end;

procedure iniciar(vc: vector2);
var
    i: rangonuevo;
begin
    for i:=1 to 10 do
    vc[i]:=0;
end;

procedure minimo(vc: vector2; var min, aniomin: integer);
var
    for i:=1 to 10 do
    if(vc[i] < min) do
    min:=vc[i];
    aniomin:=i;
end;

procedure maximo(dni, cantcompras: integer; var dnimax1, dnimax2, max1, max2: integer);
begin
    if(cantcompras > max1) then
    begin
        max2:=max1;
        dnimax2:=dnimax1;
        max1:=cantcompras;
        dnimax1:= dni;
    end
    else
    if(cantcompras > max2) then
        max:=cantcompras;
        dnimax2:=dni;
end;
    
procedure procesar(l2: lista);
var
    dniactual, dnimax1, dnimax2, max1, max2, min, aniomin, cantcompras: integer;
    total: real;
    vc: vector2;
begin
    iniciar(vc);
    max1:=-1;
    max2:=-1;
    min:=9999;
    total:=0;
    while(l2 <> nil) do
    begin
        cantcompras:=0;
        dniactual:=l^.dato.dni;
        while(l2 <> nil) and (l^.dato.dni = dniactual) do
        begin
            cantcompras=cantcompras + 1;
            
            vc[l^.dato.anio]:=vc[l^.dato.anio] + l^.dato.monto;
            
            if(l^.dato.dni mod 10 = 0) then
            total:=total + l^.dato.monto;
            
            l2:=l2^.sig;
        end;
        maximo(dniactual, cantcompras, dnimax1, dnimax2, max1, max2);
    end:
    minimo(vc, min, aniomin);
    write(aniomin);
    write(total);
    write(dnimax1, dnimax2);
end;

var
l, l2: lista;
begin
    l:=nil;
    l2:= nil;
    cargarcompra(l);{se dispone}
    nuevalista(l, l2);
    procesar(l2);
end.
