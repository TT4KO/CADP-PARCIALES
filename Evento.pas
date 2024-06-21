{Un salon de eventos necesita un programa para administrar la informacion de las reservas de diciembre de 2023. 
Se dispone de una estrucutra con la informacion de las reservas.
De cada reserva se conoce: numero de reserva, DNI del cliente, dia del evento(1..31), hora de inicio, 
hora de fin  y categoria de serivicio (1..4). 
Ademas, se dispone de una tabla con el precio por hora de reserva de acuerdo a cada categoria de servicio.
A)generar una nueva estructura con numero y precio total de a cada reserva. Esta estrucuta debe generar ordenada 
por el precio total de cada reserva.
B)Informar los dias del mes con menor cantidad de reservas de clientes con DNI impar.
C)Informar el porcentaje de reservas de eventos que inicien despues de las 12 hs y se produzcan en la segunda quincena}

program niudas;
type
rangodia = 1..31;
rangocat = 1..4
reserva = record
    numero: integer;
    dni: integer;
    dia: rangodia;
    horainicio: integer;
    horafinal: integer;
    categoria: rangocat;
end;
lista = ^nodo;
  nodo = record
  dato: reserva;
  sig: lista;
end;

reserva2 = record
  numero2: integer;
  preciototal: integer;
end;

lista2 = ^nodo2;
  nodo2 = record
  dato: reserva2;
  sig: lista2;
end;

vmes = array [rangomes] of integer;
vprecio = array [categoria] of real;

procedure iniciar(var vc: vmes);
var
    i: rangomes;
begin
    for i:=1 to 12
    vc[i]:=0;
end;

function calcularprecio(a, b: integer; vp: vprecio):real;
var
    duracion: integer;
begin
    duracion:=b - a;
    calcularprecio:=duracion * v[l^.dato.categoria];
end;

procedure minimo(vc: vmes; var mesmin, min:integer);
var
    i: rangomes;
begin
    for i:=1 to 12 do
    if(vc[i] > min) then
    min:=vc[i];
    mesmin:=i;
end;

function promedio(a, b: integer):real;
begin
    promedio:=(a/100)*b;
end;

procedure insertarOrdenado(var L2: lista2; r:reserva2);
var
  nue: lista2;
  ant,act: lista2;
begin
  new(nue);
  nue^.dato:= d;
  ant:= L2;
  act:= L2;
  While(act <> nil)and(r.precioTotal > act^.dato.precioTotal) do  // > ascendente | < descendente
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

procedure recorrer(l: lista; var l2: lista; vp: vprecio);
var
    vc: vmes;
    r: reserva2;
    cantidadpar: integer;
    totalreservas: integer;
    reservascondicion: integer;
    mesmin, min: integer;
begin
    iniciar(vc);
    min:=-1;   
    totalreservas:=0;
    while(l <> nil) do
    begin        
        calcularprecio(l^.dato.horafinal, l^.dato.horainicio, l^.dato.categoria);{a}
        r.numero2:=l^.dato.numero;
        r.preciototal:=calcularprecio;{a}
         ordenada(l2, r);   
        
        if(digitos(l^.dato.dni)) then
        vc[l^.dato.dia]:=vc[l^.dato.dia] + 1;{b}
            
        totalreservas:=totalreservas + 1;{c}
        if(l^.dato.horainicio > 12) and (vc[l^.dato.dia] > 15) then
        reservascondicion:=reservascondicion + 1;       

        l:=l^.sig;      
    end;
    minimo(vc, mesmin, min);
    porcentaje(totalreservas, reservascondicion;)
end;

var
l: lista;
l2: lista2;
vp: vprecio;
begin
    l:=nil;
    l2:=nil;
    cargarreserva(l);{se dispone}
    cargarvector(vp);{se dispone}
    recorrer(l, l2, vp);
end.
