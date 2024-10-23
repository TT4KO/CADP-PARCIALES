program jodsa;
const 
cantgenero = 5;
type
rangogenero = 1..cantgenero;
persona = record
    dni: integer;
    ayn: string;
    edad: integer;
    codigo: rangogenero;
end;
lista = ^nodo
    nodo = record
    dato: persona;
    sig: lista;
end;

vector = array [rangogenero] of integer;

procedure leer(var p: persona);
begin
    read(p.dni);
    read(p.ayn);
    read(p.edad);
    read(p.codigo);
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

procedure cargar(var l: lista);
var
    p: persona;
begin
    repeat
        leer(p);
        adelante(l, p);
    until(p.dni = 33555444);
endl;    

procedure maximo(var codmax1, codmax2, max1, max2: integer; v: vector);
var
    i: rangogenero;
begin   
    for i:=1 to cantgenero do
    if(v[i] > max1) then
    begin
        max2:=max1;
        codmax2:=codmax1;
        max1:=v[i];
        codmax1:=i;
    end;
    else
    if(v[i] > max2) then
    max2:=v[i];
    codmax2:=i;
end;

procedure procesar(l: lista);
var
    v: vector;
    cantdni: integer;
    codmax1, codmax2, max1, max2: integer;
begin
    iniciar(v);
    cantdni:=0;
    max1:=-1;
    max2:=-1;
    while(l <> nil) do
    begin
        if(digitos(l^.dato.dni)) then
        cantdni:=cantdni + 1;

        v[l^.dato.codigo]:=v[l^.dato.codigo] + 1;

        l:=l^.sig;
    end;
    write(cantdni);
    maximo(codmax1, codmax2, max1, max2, v);
    write(codmax1, codmax2);
end;

procedure eliminarDni(var L:lista;var ok: Boolean; dni: integer);
var
  act,ant: lista;
begin
  ok:= false;
  act:= L;
  ant:= L;
  While((act <> nil) and( act^.dato.dni <> dni))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if( act <> nil)then
      begin
        ok:= true;
        if(act = L)then
          begin
            L:= act^.sig; 
          end
        else 
          ant^.sig:= act^.sig;
        Dispose(act);
      end;
end;

var
l: lista;
dni: integer;
ok: boolean;
begin   
    l:=nil;
    cargar(l);
    procesar(l);
    read(dni);
    eliminar(l, ok, dni);
    if (ok) then
    write('eliminado');
end.
