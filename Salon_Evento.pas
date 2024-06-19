{Un salon de eventos necesita un programa para administrar la informacion de las reservas de diciembre de 2023. Se dispone de una estruicutra con la informacion de las reservas.
De cada reserva se conoce: numero de reserva, DNI del cliente, dia del evento(1..31), hora de inicio, hora de fin  y categoria de serivicio (1..4). Ademas, se dispone de una tabla
co el precio por hora de reserva de acuerdo a cada categoria de servicio.
A)generar una nueva estructura con numero y precio total de acada reserva. Esta estrucuta debe generar ordenada por el precio total de cada reserva.
B)Informar los dias del mes con menor cantidad de reservas de clientes con DNI impar.
C)Informar el porcentaje de reservas de eventos que inicien despues de las 12 hs y se produzcan en la segunda quincena}

program das;
type
rangodia = 1..31;
rangocat = 1..4;
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
vectordia = array [rangodia] of integer;
vectormonto = array [rangocat] of real;

reservaConPrecio = record
    numeroReserva: integer;
    precioTotal: real;
    
end;
lista2 = ^nodo2;
  nodo2 = record
  dato: reservaConPrecio;
  sig: lista2;
end;

procedure iniciar(var vc: vectordia);
var
    i: rangodia;
begin
    for i:=1 to 31 do
    vc[i]:=0;
end;

procedure insertarOrdenado(var L2: lista; r: reservaConPrecio);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= r;
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

function calcularPrecioTotal(res: reserva; v: vectormonto): real;
var
  duracionEnHoras: integer;
begin
  duracionEnHoras := res.horafinal - res.horainicio;
  calcularPrecioTotal := duracionEnHoras * v[res.categoria];
end;


procedure generarlista(var l2, montontotal: integer);
var
    r: reservaConPrecio;
begin
    r.numero:=l2^.dato.numeroReserva;
    r.preciototal:=montontotal;
    ordenado(l2, r);
    end;

procedure nuevalista(l: lista; var l2: lista; v: vectormonto);
var
    while(l <> nil) do
    begin
        montontotal:=calcularPrecioTotal(l, v);
        generarlista(l2, montontotal)
        l:=l^.sig;
    end;
end;

procedure iniciar(var vc: vectordia);
var
    i: rangodia;
begin
    for i:=1 to 31 do
    vc[i]:=0;
end;

function cumple(num: integer): boolean;
var
    suma, digito: integer;
begin
    suma := 0;
    while num <> 0 do
    begin
        digito := num mod 10;
        suma := suma + digito;
        num := num div 10;
    end;
    cumple := (suma mod 3 = 0); // Devuelve true si la suma de los dígitos es divisible por 3
end;

procedure minimo(vc: vectordia; var diamin1, diamin2, min1, min2 : integer);
var
    i: rangodia;
begin
    for i:=1 to 31 do
    if(vc[i] < min1) then
    begin
        min2:=min1;
        diamin2:=diamin1;
        min1:=vc[i];
        diamin1:=i;
    end
    else
    if(vc[i] < min2) then
    min2:=vc[i];
    diamin2:=i;

procesar procesar(l: lista);
var
    vc: vectordia;
    diamin1, diamin2, min1, min2: integer;
begin
    iniciar(vc);
    min1:=-1;
    min2:=-1;
    while(l <> nil) do
    begin
        if (cumple(l^.dato.dni)) then
        vc[l^.dato.dia]:=vc[l^.dato.dia] + 1;
        l:=l^.sig;
    end;
    minimo(vc, diamin1, diamin2, min1, min2);
end;

var
l, l2: lista;
v: vectormonto;
begin
    l:= nil;
    l2:=nil;
    cargarcompra(l);{se dispone}
    cargarvector(v);{se dispone}
    nuevalista(l, l2, v);
    procesar(l, v);
end.
