{Una revista deportiva dispone de informacion de los jugadores de futbol participantes de la liga profesional 2022.
De cada jugador de conoce codigo de jugador, apellido y nombres,
codigo de equipo[1..8], año de nacimiento y la calificacion obtenida para cada una de las 27 fechas del torneo ya finaliza. 
La calificacion es numerica de 0 a 10 doinde el valor 0 
significa que el jugador no ha participado de la fecha

A)informar para cada equipo la cantidad de jugadores mayores a 35 años

b)informar los codigos de los 2 jugadores con menor calificaion promedio en los partidos en los que participo. 
Solo deben considerarse los jugadores que participaron con mas de 14
fechas

c)implementar e invocar a un modulo que genere una lista con los jugadores cuyo codigo possee
exactmente 3 digitos impares y haya nacido entre 1983 y 1990. La lista debe estar 
ordenada por codigo de jugador}
program ndias;
const
cantcali = 27;
cantequipo = 8;
type
rangoequipo = 1..cantequipo;
rangocali = 1..cantcali;
jugador = record
    codigo: integer;
    ayn: string;
    equipo = rangoequipo;
    anio: integer;
    calificacion = vtorneo;
end;

lista = ^nodo;
nodo = record
dato: jugador;
sig: lista;
end;

vequipo = array [rangoequipo] of integer;
vtorneo = array [rangocali] of integer;

procedure iniciar(var vc: vequipo);
var
    i: rangoequipo;
begin
    for i:= 1 to cantequipo do
    vc[i]:=0;
end;

function fijarse(vt: vtorneo);
var
    i: rangocali;
    cant: integer;
begin
    cant:=0;
    for i:=1 to cantcali do
    if(vt[i] > 0) then
    begin
    cant:=cant + 1;
    end;
    fijarse:=cant;
end;

fucntion digitos(num: integer):boolean;
var
    dig, canti: integer;
begin
    canti:=0;
    while(num <> 0) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 1) then
        canti:=canti + 1;
        num:=num div 10;
    end;
    digitos:=(canti = 3);
end;

procedure insertarOrdenado(var L2: lista; j: jugador);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= j;
  ant:= L2;
  act:= L2;
  While(act <> nil)and(j.codigo > act^.dato.codigo) do  // > ascendente | < descendente
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

function promedio(vt: vtorneo): real;
var
    i, sum, count: integer;
begin
    sum := 0;
    count := 0;
    for i := 1 to cantcali do
        if vt[i] > 0 then
        begin
            sum := sum + vt[i];
            count := count + 1;
        end;
    if count > 0 then
        promedio := sum / count
    else
        promedio := 0;
end;

procedure(numero: integer; nombre: string);
var
    nommax1, nonmax2: string;
    max1, max2: integer;
begin
    if(numero > max1) then
    begin
        max2:=max1;
        nonmax2:=nommax1;
        max1:=numero;
        nommax1:=nombre;
    end
    else
    if(numero > max2) then
    max2:=numero;
    nonmax2:=nombre;
end;

procedure recorrer(l: lista; var l2: lista);
var
    j: jugador;
    vc: vequipo;
    vt: vtorneo;
    edad: integer;
    prome: integer;
begin
    edad:=0;
    iniciar(vc);
    while(l <> nil) do
    begin
        edad:= 2022 - l^.dato.anio;
        if(edad > 35) then
        vc[l^.dato.equipo]:=vc[l^.dato.equipo] + 1;
        
        fijarse(l^.dato.calificacion) > 14;
        prome:=promedio(l^.dato,calificacion)
        
        if(digitos(l^.dato.codigo) and (l^.dato.anio > 1983) and (l^.dato.anio < 1990)) then
        ordenada(l2, j)
        l:=l^.sig;
    end;
    maximo(prome, l^.dato.nombre);
    write(nonmax2, nommax1);
    for i:=1 to cantequipo
    writle('para cada equipo hay:' vc[i], i);
end;

var
l, l2: lista;
var
    l:=nil;
    l2:=nil;
    cargarjugador(l);
    recorrer(l, l2);
end.
