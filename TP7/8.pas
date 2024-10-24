program dks;
const 
cant = 7;
type
rango = 1..cant;
tfehca = record
    dia: integer;
    mes: integer;
    ano: integer;
end;

transferencia = record
    cuenta_origen: integer;
    titular_origen: integer;
    cuenta_destino: integer;
    titular_destino: integer;
    fecha: tfecha;
    hora: integer;
    monto: real;
    codigo: rango;
end;
lista = ^nodo
    nodo = record
    dato: transferencia;
    sig: lista;
end;

vector = array [rango] of integer;

procedure Ordenado(var L: lista; t: transferencia);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= d;
  ant:= L;
  act:= L;
  While(act <> nil)and(t.cuenta_origen > act^.dato.cuenta_origen) do  // > ascendente | < descendente
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


procedure nuevalissta(l: lista; var l2: lista);
begin
    while(l <> nil) do
    begin
        if(l^.dato.numero_origen <> l^.dato.titular_destino) then
        ordenado(l2, l^.dato);
        l:=l^.sig;
    end;
end;

procedure iniciar(var v: vector);
var
    i:rango;
begin
    for i:=1 to cant do
    v[i]:=0;
end;

procedure maximo(var codmax, max: integer; v: vector);
var
    i: rango;
begin   
    for i:=1 to cant do
    if(v[i] > max) then
    max:=v[i];
    codmax:=i;
end;

function digitos(num: integer): boolean;
var
    dig, cantpar, cantimpar: integer;
begin
    cantimpar:=0;
    cantpar:=0;
    while(num <> 0) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 0) then
        cantpar:=cantpar + 1
        else
        cantimpar:=cantimpar + 1;
        num:=num div 10;
    end;
    dnipar:=cantpar < cantimpar;
end;  

procedure procesar(l: lista);
var
    v: vector;
    montototal: integer;
    numeroactual: integer;
    cantidad: integer;
    codmax, max: integer;
begin
    iniciar(v);
    cantidad:=0;
    max:=-1;
    while(l <> nil) do
    begin
        montototal:=0;
        numeroactual:=l^.dato.cuenta_origen;
        while(l <> nil) and (l^.dato.cuenta_origen = numeroactual) do
        begin
            montototal:=montototal + l^.dato.monto;

            v[l^.dato.codigo]:=v[l^.dato.codigo] + 1;

            if(l^.dato.fecha.mes = 6) and ((digitos)l^.dato.cuenta_destino) then
            cantidad:=cantidad + 1;

            l:=l^.sig;
        end;
        write(montototal);
    end;
    write(cantida);
    maximo(codmax, max, v);
    write(codmax);
end;

var 
l, l2: lista
begin
    l:=nil;
    l2:=nil;
    cargartransferencia(l);
    nuevalissta(l, l2);
    procesar(l2);
end.
