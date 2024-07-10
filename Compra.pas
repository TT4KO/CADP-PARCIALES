{Un supermercado dispone de una estrucuta de datos con todas las compras, sin ningun orden en particular. 
De cada compra se conoce codigo, mes, año (entre 2014 y 2024), monto y el DNI del cliente. 
Un cliente puede haber realizado mas de una compra.
Realziar un programa lea de teclado un año y luego:
a. Almacene en otra estrucuta de datos las compras realizadas en el año leido. 
   Esta estructura debe quedar ordenada por DNI del cliente.
b. Una vez almacenada la informacion, procese los datos del inciso a. e informe:
    1. Para cada cliente, el monto total facturado entre todas sus compras.
    2. Los dos mese con menor facturacion.
    3. La cantidad de compras con codigo multiplo de 10} 

program jkdpas;
const
cantmes = 12;
type
rangoaño = 2014..2024;
rangomes = 1..cantmes;
compra = record
    codigo: integer;
    mes: rangomes;
    año: rangomes;
    monto: real;
    dni: integer;
end;
lista = ^nodo;
    nodo = record
    dato: compra;
    sig: lista;
end;
vector = array [rangomes] of integer;

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
var
    añoactual: rangoaño;
begin
    while(l <> nil) do
    begin
        if(l^.dato.año = añoactual) then
        ordenado(l2, l^.dato);
        l:=l^.sig;
    end;
end;

procedure iniciar(var vc: vector);
var
    i: rangomes;
begin
    for i:=1 to cantmes do
    vc[i]:=0;
end;

procedure minimo(vc: vector; var mesmin1, mesmin2, min1, min2: integer);
var
    i: rangomes;
begin
    for i:=1 to cantmes do
    begin
        if(vc[i] < min1) then
        min2:=min1;
        mesmin2:=mesmin1;
        min1:=vc[i];
        mesmin1:=i;
    end
    else
    if(vc[i] > min2) then
    min2:=vc[i];
    mesmin2:=i;
end;

procedure procesar(l2: lista);
var
    montototal: real;
    mesmin1, mesmin2, min1, min2: integer;
    cantidaddiez: integer;
    dniactual: integer;
    vc: vector;
begin
    iniciar(vc);
    min1:=-1;
    min2:=-1;
    cantidaddiez:=0;
    while(l2 <> nil) do
    begin
        montototal:=0;
        dniactual:=l^.dato.dni;
        while(l2 <> nil) and (l2^.dato.dni = dniactual) do
        begin
            montototal:=montototal + l^.dato.monto;
            
            vc[l^.dato.mes]:=vc[l^.dato.mes] + l^.dato.monto
            
            if(l^.dato.codigo mod 10 = 0) then
            cantidaddiez:=cantidaddiez + 1;
            l2:=l2^.sig;
        end;
        write(montototal);
    end;
    minimo(vc, mesmin1, mesmin1, min1, min2);
    write(mesmin1, mesmin2);
    write(cantidaddiez)
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
