program isda;
const
cantpoliza = 6;
type
rangopoliza = 1..cantpoliza;
cliente = record
    codigo: integer;
    dni: integer;
    ayn: string;
    codigo_poliza: rangopoliza;
    monto: real;
end;
lista = ^nodo
    nodo = record
    dato: cliente;
    sig: lista;
end;

vectormonto = array [rangopoliza] of rea;

procedure leer(var c: cliente);
begin
    read(c.codigo);
    read(c.dni);
    read(c.ayn);
    read(c.codigo_poliza);
    read(c.monto);
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

procedure carga(var l: lista);
var
    c: cliente;
begin
    repeat
        leer(c);
        adelante(l, c);
    until (c.codigo = 1122);
end;

procedure informar(l: lista; v: vectormonto);
var 
    montototal: integer;
begin
    write(l^.dato.dni, l^.dato.ayn);
    montototal:=l^.dato.monto + v[l^.dato.codigo_poliza];
    write(montototal);
end;


function digitos(dni: integer):boolean;
var
    dig: integer;
    cant9: integer;
begin
    cant9:=0;
    while(num <> 0) and (cant9 < 3) do
    begin
        dig:=num mod 10;
        if(dig = 9) then
        begin
            cant9:=cant9+1
        end;
        num:=num div 10;
    end;
    digitos:=cant9 = 2;
end;

procedure eliminar(var L:lista;var ok: Boolean; codigo: integer);
var
  act,ant: lista;
begin
  ok:= false;
  act:= L;
  ant:= L;
  While((act <> nil) and( act^.dato.codigo <> codigo))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if( act <> nil)then
      begin
        ok:= true;
        if(act = L)then
          begin
            L:= act^.sig; //o L^.sig; seria lo mismo
          end
        else 
          ant^.sig:= act^.sig;
        Dispose(act);
      end;
end;

procedure procesar(l: lista; v: vectormonto);
begin
    while(l <> nil) do
    begin
        informar(l^.dato, v);
        
        if(digitos(l^.dato.dni)) then
        write(l^.dato.ayn);

        l:=l^.sig;
    end;
end;


var
l: lista;
v: vectormonto;
codigo: integer;
ok: boolean;
begin
    l:=nil;
    cargarvector(v);//se dispone
    carga(l);
    procesar(l, v);
    read(codigo);
    eliminar(l, ok, codigo);
    if(ok) then
    write('eliminado');
end.
