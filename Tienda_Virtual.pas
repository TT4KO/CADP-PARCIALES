{una tienda virtual necesita un programa para administar la informacion de sus clientes. de cada cliente se lee: numero, 
dni, apellido y nombre, fecha de
nacimiento(dia, mes y año), nivel(1..5) y puntaje. La lectura finaliza cuando se lee el cliente con DNI 444444, que debe
procesarse.
Se pide:
A)generar una estrucutra que contega numero, apellido y nombre de aquellos clientes con DNI compuesto solamente por digitos pares.
B)Informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos despues del año 1990
C)Implementar un modulo que elemine, de la estructura generada, la informacion relacionada  a un numero de cliebnte 
recibido por parametro. Tener en cuenta que dicho numero
puede no exisitr en la estructura.}

program parcial;
const
cantnivel = 5
type
rangonivel = 1..cantnivel;
tfecha = record
  dia: integer;
  mes: integer;
  anio: integer;
end;

cliente = record
    numero: integer;
    dni: integer;
    ayn: string;
    nacimiento: fecha;
    nivel: rangonivel;
    puntaje: integer;
end;

lista = ^nodo;
nodo = record
dato: cliente;
sig; lista;
end;

cliente2 = record
    numero2: integer;
    ayn2: string;
end;

lista2 = ^nodo2;
    nodo2 = record
    dato: cliente2;
    sig: lista2;
end;

vector = array [rangonivel] of integer;

procedure leer(var f: tfecha);
var
    readln(f.dia);
    readln(f.mes);
    readln(f.anio);
end;    

procedure leercliente(var c: cliente);
begin
    readln(c.numero);
    readln(c.dni);
    readln(c.ayn);
    leer(c.nacimiento);
    readln(c.puntaje);
end;
    
procedure agregarAdelante(var L: lista; c: cliente);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarcliente(var l: lista);
var
    c: cliente;
begin
    repeat
        leercliente
        adelante(l, c);
    until(c.dni = 444444);
end;

procedure iniciar(var vc: vector);
var
    i: rangonivel;
begin
    for i:=1 to 5 do
    vc[i]:=0;
end;

function digitos(num: integer):boolean;
var
    aux: boolean; 
    dig: integer;
begin
    aux:= false;
    while(num <> 0) and (aux=true) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 0) then
        begin
            aux:=false
        end;
        num:=num div 10;
    end;
    digitos:=true;
end;

    
procedure agregarAdelante(var L2: lista2; ce: cliente);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= ce;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure maximo(vc: vector);
var
    i, nivelmax, max: integer;
begin
    max:=-1;
    for i:= 1 to 5 do
    if(vc[i] > max ) then
    max:=vc[i];
    nivelmax:=i;
end;

procedure minimo(vc: vector);
var
    i, nivelmin, min: integer;
begin
    max:=-1;
    for i:= 1 to 5 do
    if(vc[i] < min ) then
    min:=vc[i];
    nivelmin:=i;
end;

procedure recorrer(l: lista; var l2: lista2);
var
    ce: cliente2;
    vc: vector;
begin
    iniciar(vc);
    while(l <> nil) do
    begin
        if(digitos(l^.dato.dni)) then
        ce.numero2:=l^.dato.nombre;{a}
        ce.ayn2:=l^.dato.ayn;{a}
        adelante(l2, ce);
         
        if(l^.dato.anio > 1990) then
        vc[l^.dato.nivel]:=vc[l^.dato.nivel] + l^.dato.puntaje{b}
        
        l:=l^.sig;
    end;
   
    maximo(vc);
    writeln(nivelmax);
    minimo(vc);
    writeln(nivelmin);
end;

procedure eliminarDni(var L2:lista2;var ok: Boolean; numero: integer);
var
  act,ant: lista2;
begin
  ok:= false;
  act:= L2;
  ant:= L2;
  While((act <> nil) and( act^.dato.numero2 <> numero))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if( act <> nil)then
      begin
        ok:= true;
        if(act = L2)then
          begin
            L2:= act^.sig; //o L^.sig; seria lo mismo
          end
        else 
          ant^.sig:= act^.sig;
        Dispose(act);
      end;
end;

var 
l: lista:
l2: lista2;
ok: boolean;
numero: integer;
begin
    l:=nil;
    cargarcliente(l);
    l2:=nil;
    recorrer(l, l2);
    read(numero);
    eliminar(l2, ok, numero);
    if(ok) then
    writeln('eliminado')
    else
    writeln('no eliminado');
end.
