{para ellos se dispone de una estrcutura de datos con la informacion de todos los viajes reliazdos. 
De cada viaje se conoce el codigo de viaje, el numero de coche(entre 1000 y 2500),el mes en que se realizo el viaje, 
cantidad de pasajes vendidos y el dni del chofer. La informacion nose encuentra ordenada por ningun criterio. 
Ademas, la empresa dispone de una estructura de datos con informacion sobre la capacidad maximo de cada coche
A)Informe el numero de coche con el cual se realizaron mas viajes.
B)genera una lista con los viajes realizados en el mes 2 por un chofer con dni multiplo de 10,
donde la cantidad de pasajes vendidos no alcanza la capacidad maxima del coche.
C)para cada coche, informe el promedio de pasajeros que viajaron entre todos sus viajes.}

program nodas;
const

type
rangocoche = 1000..2500;
viaje = record
    codigo: integer;
    coche: rangocoche;
    mes: integer;
    pasajes: integer;
    dni: integer;
end;
lista = ^nodo;
    nodo = record
    dato: viaje;
    sig: lista;
end;
vector = array [rangocoche] of integer;

procedure inicar(var v1, v2: vector);
var 
    i: rangocoche;
begin   
    for i:=1000 to 2500 do
    v1[i]:=0;
    v2[i]:=0;
end;

procedure maximo(vviajes: vectorcoche);
var
    viajemax, max: integer;   
    i: rangocoche;
begin
    max:=-1;
    for i:=1000 to 2500 do
    if(vviajes[i] > max) then
    max:=vviajes[i];
    viajemax:=i;
end;

functio promedio(vaijes, vectorcoche);
begin
    promedio:=viajes/vectorcoche;
end;

procedure procesar(l: lista; var l2: lista; v: vector; var vectorcoche, vviajes: vector);
var 
    i: rangocoche;
begin
    iniciar(vectorcoche, vviajes);
    while(l <> nil) do
    begin
        vviajes[l^.dato.coche]:=vviajes[l^.dato.coche] + 1;
        
        vectorcoche[l^.dato.coche]:=vectorcoche[l^.dato.coche] + l^.dato.pasajes;
        
        if(l^.dato.mes = 2) and (l^.dato.dni mod 10 = 0) and (vectorcoche[l^.dato.coche] < v[l^.dato.coche]) then
        adelante(l2, l^.dato);
        l:=l^.sig;
    end;
    maximo(vviajes);
    for i:=1000 to 2500 do
    promedio(vviajes[i], vectorcoche[i]);
end;

var
l, l2: lista;
v, vectorcoche, vviajes: vector;
begin
    l:=nil;
    l2:=nil;
    cargarviaje(l);
    cargarvector(v);
    procesar(l, l2, v, vectorcoche, vviajes);
end.
