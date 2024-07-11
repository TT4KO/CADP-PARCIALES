{Se dispone de una estructura de datos con la informacion de las sesiones de bizarrap. 
De casa sesion se conoec: titulo, nombre del artista, 
genero musical(1:trap latino, 2:reggaeton,
3: urban, 4: electronica, 5: pop rap) año de estreno y cantidad de reproducciones en spotify. 
La informacion no posee un orden especifico.
A) informar los dos codigos de gnero musical menor cantida de reproducciones en spotify
B)generara una lista ordenada por año que contenga las sesiones del genero "trap latino" y "urban" 
  cuya suma de los digitos de la cantidad de
  reproducciones sea multiplo de 5;
C)realizar un modulo qu reciba la lista generada en el punto anterior e informe para cada año, la cantidad 
  de sesiones realizada junto al total de reproducciones de spotify de esas sesiones}
program djasi;
type
rangogenero = 1..5;
sesion = record
    titulo: string;
    nombre: string;
    genero = rangogenero;
    año: integer;
    reproducciones: integer;
end;
    lista = ^nodo;
    nodo = record
    dato: sesion;
    sig: lista;
end;

vector = array [rangogenero] of integer;

sesion2 = record
cantsesiones: integer;
cantrepro: integer;
end;

procedure insertarOrdenado(var L2: lista; d: cliente);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= d;
  ant:= L2;
  act:= L2;
  While(act <> nil)and(s.año > act^.dato.año) do  // > ascendente | < descendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act = ant) then //al principio o vacio
      L2:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure iniciar(var v:vector);
var
    i: rangogenero;
begin
    for i:= 1 to 5 do
    v[i]:=0;
end;

procedure minimo(vc: vector);
var
    codmin1, codmin2, min1, min2: integer;
    i: integer;
begin
    min1:=9999;
    min2:=9999;
    for i:= 1 to 5 do
    if(vc[i] < min1) then
    begin
        min2:=min1;
        codmin2:=codmin1;
        min1:=vc[i];
        codmin1:=1;
    end
    else
    if(vc[i] < min2) then
        min2:=vc[i];
        codmin2:=i;
end;
    
procedure nuevalista(l1: lista; var l2: lista);
var
    vc: vector;
    s: sesion;
begin
    iniciar(vc);
    while(l <> nil) do
    begin
        
        vc[l^.dato.genero]:=vc[l^.dato.genero] + l^.dato.reproducciones;
        
        if(l^.dato.genero = 1) and (l^.dato.genero = 3) and (l^.dato.reproducciones mod 5 = 0) then
        ordenado(l2, s);
        l:=l^.sig;
    end;
    minimo(vc);
    write('los minimos son: ' , codmin1 , ' y ' , codmin2);
end;

procedure nuevonuevo(l2: lista);
var
    se: sesion2
    anioacutal: integer;
begin
    while(l2 <> nil) do
    begin
        s.cantsesiones:=0;
        s.repro:=0;
        anio = l2^.dato.anio;
        while(l2 <> nil) and (l2^.dato.anio = anio) do
        begin
            s.cantsesiones:=s.cantsesiones + 1;
            s.repro:=s.repro + l2^.dato.reproducciones;
            l2:=l2^.sig;
        end;
    end;
end;
    
var
l: l2: lista;
begin
    l:= nil;
    l2:=nil;
    cargarsesion(l){se dispone}
    nuevalista(l, l2);
    nuevonuevo(l2);
end.
