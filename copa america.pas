De dispone de una estructura de datos con la informacion de cada pais que ha participado alguna vez del evento. De 
cada cada pais se conoce el nombre del pais, la cnatidad de participaciones en copas Americas e informacion de dichas 
participaciones (a lo sumo 10). De cada participacion se conoce el año y en instancia finalizo(1.fase de grupo,
2.cuartos de finales, 3.semifinal, 4.final)
A).LEA la informacion de un nuevo pais y la incorpore en la estrucuta e datos que se dispone. Del nuevo pais se lee
   el nombre del pais, la cantidad de participaciones y la informacion de cada participacion(año y en que instancia
   finalizo en dicha participacion)
B)Una vez cargada:
  1.Para cada pais, la cantidad de participaciones realizada en años anteriores al 2020 en las que superarn las fase de
    grupos
  2.Los nombres de los paises que llegaron menos veces en instancias de final.
  3.El promedio de participaciones en copas americas entre todos los paises.

program idsa;
const 
cantparti = 10;
cantinstancia = 4;
type
rangoinstancia = 1..cantinstancia;
rangoparti = 1..cantparti;
pais = record
    nombre: string;
    cantidad_participaciones: integer;
    participaciones: vectorparticipaciones;
end;
participacion = record
    ano: integer;
    instancia: rangoinstancia;
end;
vectorparticipaciones = arry [rangoparti] of participacion

lista = ^nodo
    nodo = record
    dato: pais;
    sig: lista;
end;

procedure leerparti(var pa: participacion);
begin
    read(pa.ano);
    read(pa.instancia);
end;

procedure leerpais(var p: pais);
var
    i: rangoparti;
begin
    read(p.nombre);
    read(p.cantidad_participaciones);
    for i:=1 to p.cantidad_participaciones do 
    leerparti(p);
end;

procedure nuevopais(var l: lista);
var
    p: pais;
begin
    leerpais(p);
    adelante(l, p);
end;

function calcularparticipaciones(p: pais);
var
    cant, i: integer;
begin   
    cant:=0;
    for i:=1 to p.cantidad_participaciones do
    if(p.participaciones[i].ano < 2020) and (p.participaciones[i].instancia > 1) then
    cant:=cant + 1;
    calcularparticipaciones:=cant;
end;

procedure actualizar(var pais1, pais2: string: var minpais1, minpais2: integer; nombre: string; finales:integer):
begin   
    if(finales < minpais1) then
    begin   
        minpais2:=minpais1;
        pais2:=pais1;
        minpais1:=finales;
        pais1:=nombre;
    end
    else
    if(finales < minpais2) then
    minpais2:=finales;
    pais1:=nombre;
end;

function cantfinales(p: pais): integer;
var
    i, cant: integer;
begin 
    cant:=0;
    for i:=1 to p.cantidad_participaciones do
    if(p.participaciones[i].instancia = 4) then
    cant:=cant + 1;
    cantfinales:=cant;
end; 

procedure procesar(l: lista);
var
    p: pais;
    nombrepais1, nombrepais2: string;
    finalespais1, finalespais2: integer;
    cantpaises, cantidadparticipaciones: integer;
begin   
    finalespais1:=11;
    finalespais2:=11;
    while(l <> nil) do
    begin
        p:=l^.dato
        wtite('el pais' , p.nombre, 'participo' , calcularparticipaciones(p))
        actualizar(nombrepais1, nombrepais2, finalespais1, finalespais2, p.nombre, cantfinales(p))

        cantpaises:=cantpaises + 1;
        cantidadparticipaciones:=cantidadparticipaciones + p.cantidad_participaciones;
        
        l:=l^.sig;
    end;
    write(nombrepais1; nombrepais2);
    write(calcularparticipaciones/cantpaises);
end;
var 
l: lista;
begin
    l:=nil;
    cargarpais(l);
    nuevopais(l);
    procesar(l);
end.
