{De casa session se lee: titulo de sesion, nombre del artista, 
genero musical(1:trap, 2: reggaeton, 3:urban, 4:electronica, 5:pop rap)y cantidad de visualizaciones en youtube.
la lectura finaliza cuando se lee la sesion del artista coin nombre "peso pluma", la cual debe proecsarse. 
La informacion debe quedar almacenada en una estructura dwe datos 
ordenada por titulo de eseion de forma ascendente.
A)informar los dos codigos de genero musical con mayor cantidad de visualizaciones en youtube.
B)informar la cantidad de sesiones del genero "reggaeton" cuya cantidad de visualizaciones 
contiene la misma cantidad de digitos pares que impares
c)Realiazr un modulo que reciba un titulo de sesion y elimine dicha sesion de la estructura. 
El titulo de sesion puede no exisitr, Invocar el modulo desarrollado en el
programa principal con un titulo leido por teclado.}

program dmdklas;
const
cantgenero = 5;
type
rangogenero= 1..cantgenero;
session = record
  titulo: string;
  nombre: string;
  genero: rangogenero;
  visual: integer;
end;

vector = array [rangogenero] of integer;

lista = ^nodo;
  nodo = record
  dato: session;
  sig: lista;
end;

procedure leer(var s: session);
begin
    readln(s.titulo);
    readln(s.nombre);
    readln(s.genero);
    readln(s.visual);
end;

procedure Ordenado(var L: lista; s:session);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= s;
  ant:= L;
  act:= L;
  While(act <> nil)and(s.titulo > act^.dato.titulo) do  // > ascendente | < descendente
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
    

procedure cargarsession(var l: lista);
var
    s: session;
begin
    repeat
        leer(s);
        ordenado(l, s);
    until(s.titulo = 'peso');
end;

procedure iniciar(var vc: vector);
var
    i:rangogenero;
begin
    for i:=1 to cantgenero do
    vc[i]:=0;
end;

procedure maximo(vc: vector; var codmax1, codmax2, max1, max2);
var
    i: rangogenero;
begin
    for i:=1 to cantgenero do
    if(vc[i] > max1) then
    begin
        max2:=max1;
        codmax2:=codmax1;
        max1:=vc[i];
        codmax1:=i;
    end
    else
    if(vc[i] > max2) then
    max2:=vc[i];
    codmax2:=i;
end;

function digitos(num:integer): boolean;
var
    cantp, canti, dig: integer;
begin
    canti:=0;
    cantp:=0;
    while(num <> 0) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 0) then
        cantp:=cantp + 1;
        else
        canti:= canti+ 1;
    end;
    digitos:=(cantp + canti);
end;

procedure procesar(l:lista);
var
    vc: vector;
    codmax1, codmax2, max1, max2: integer;
    cantidad: integer;
begin
    max1:=-1;
    max2:=-1;
    codmax2:=-1;
    codmax1:=1;
    cantidad:=0;
    iniciar(vc);
    while(l <> nil) do
    begin
        vc[l^.dato.genero]:=vc[l^.dato.genero] + l^.dato.visual;
        
        if(vc[l^.dato.genero] = 2) and (digitos(l^.dato.visual)) then
        cantidad:=cantidad + 1;
        l:=l^.sig;
    end;
    maximo(vc, codmax1, codmax2, max1, max2);
end;

procedure eliminar(var L:lista;var ok: Boolean; titulo2:integer;
var
  act,ant: lista;
begin
  ok:= false;
  act:= L;
  ant:= L;
  While((act <> nil) and(act^.dato.titulo <> titulo2))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if (act <> nil)then
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

var
l: lista;
ok: boolean;
titulo2: string;
begin
    l:=nil;
    cargarsession(l);
    procesar(l);
    read(titulo2);
    eliminar(l, ok, titulo2);
    if(ok) then
    write('eliminado');
end.
