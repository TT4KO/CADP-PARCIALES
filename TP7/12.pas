program iusd;
const  
cantsub = 4;
type
rangosub = 1..cantsub;
vectormonto = array [rangosub] of real

cliente = record
    nombre: string;
    dni: integer;
    edad: integer;
    tipo_sub: rangosub;
end;
lista = ^nodo
    nodo = record
    dato: cliente;
    sig: lista;
end;

cliente2 = record
    nombre2: string;
    dni2: integer;
end;

lista2 = ^nodo2
    nodo2 = record
    dato:cliente2;
    sig: lista2;
end;
vectorsub = array [rangosub] of integer;

procedure leer(var c: cliente);
begin
    read(c.dni);
    if(c.dni <> 0) then
    read(c.nombre);
    read(c.edad);
    read(c.tipo_sub);
end;

procedure Adelante(var L: lista; d: cosa);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= d;
  nue^.sig:= L;
  L:= nue;
end;

procesar cargar(var l: lista);
var
    c: cliente;
begin
    leer(c);
    while(c.dni <> 0) do 
    begin   
        adelante(l, c);
        leer(c);
    end;
end;

procedure agregarOrdenado(var l2: lista2; c: cliente2);
var
    nuevo, actual, anterior: lista2;
begin
    new(nuevo);
    nuevo^.dato := c;
    nuevo^.sig := nil;
    if (l2 = nil) or (c.dni < l2^.dato.dni) then
    begin
        nuevo^.sig := l2;
        l2 := nuevo;
    end
    else
    begin
        anterior := l2;
        actual := l2^.sig;
        while (actual <> nil) and (actual^.dato.dni < c.dni) do
        begin
            anterior := actual;
            actual := actual^.sig;
        end;
        nuevo^.sig := actual;
        anterior^.sig := nuevo;
    end;
end;

procedure calcularMaximos(vs: vectorsub; var max1, max2, tipo1, tipo2: integer);
var
    i: rangosub;
begin
    max1 := -1;
    max2 := -1;
    for i := 1 to cantsub do
    begin
        if vs[i] > max1 then
        begin
            max2 := max1;
            tipo2 := tipo1;
            max1 := vs[i];
            tipo1 := i;
        end
        else if vs[i] > max2 then
        begin
            max2 := vs[i];
            tipo2 := i;
        end;
    end;
end;

procedure procesar(l: lista; var l2: lista2; v: vectormonto);
var
    totalmonto: real;
    vs: vectorsub;
    c: cliente2;
    clientemax1, clientemax2, max1, max2: integer;
begin
    iniciar(vs);
    totalmonto:=0;
    max1:=-1;
    max2:=-1;
    while(l <> nil) do
    begin
        totalmonto:=totalmonto + v[l^.dato.tipo_sub];

        vs[l^.dato.tipo_sub]:=vs[l^.dato.tipo_sub] + 1;

        if(l^.dato.edad > 40) and (l^.dato.tipo_sub = 3) and (cumple(l^.dato.tipo_sub)) then
            c.nombre2:=l^.dato.nombre;
            c.dni2:=l^.dato.dni
            ordenado(l2, c);
    end;
    maixmo(vs, clientemax1, clientemax2, max1, max2);
end;


var
l: lista;
l2: lista2;
v: vectormonto;
begin
    l:=nil;
    l2:=nil;
    cargarmonto(v);
    cargar(l);
    procesar(l, l2, v);
end.
