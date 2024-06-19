{para ellos se dispone de una estrcutura de datos con la informacion de todos los viajes realizados. De cada viaje se conoce el codigo de viaje, 
el numero de coche(entre 1000 y 2500),
el mes en que se realizo el viaje, cantidad de pasajes vendidos y el dni del chofer. La informacion nose encuentra ordenada por ningun criterio. 
Ademas, la empresa dispone 
de una estructura de datos con informacion sobre la capacidad maximo de cada coche
A)Informe le numero de coche con el cual se realizaron mas viajes.
B)genera una lista con los viajes realizados en el mes 2 por un chofer con dni multiplo de 10, doinde la cantidad de pasajes vencidos no alcanza la capacidad 
maxima del coche
C)para cada coche, iunforme el promedio de pasajeros que viajaron entre todos sus viajes.}

program djais;
type
viaje = record
rangonumero = 1000...1500;
codigo: integer;
    numero: rangonumero;
    mes: integer;
    pasajes: integer;
    dni: integer;

end;

lista = ^nodo;
    nodo = record
    dato: viaje;
    sig: lista;
end;

vector = array[rangonumero] of integer;

procedure agregarAdelante(var L: lista; v: viaje);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= d;
  nue^.sig:= L2;
  L2:= nue;
end;

 function cumple(num: integer): boolean;
begin
  cumple := (num mod 10 = 0);
end;

procedure nuevalista(l: lista; var l2: lista; capacidadmaximo: vector2);
var
    v: viajes;
begin
    while(l <> nil) do
    begin
        if(l^.dato.mes = 2) and (cumple(l^.dato.dni)) and (l^.dato.pasajes < capacidadmaximo) then
        adelante(l2, v);
        l:=l^.sig;
    end;
end;

procedure inicar(var vc: vector);
var
    i: rangonumero;
begin
    for i:=1000 to 2500
    vc[i]:=0;
end;

procedure inicar(var vp: vector);
var
    i: rangonumero;
begin
    for i:=1000 to 2500
    vp[i]:=0;
end;

procedure maximo(vc: vector; var cochemax, max: integer);
var
    i: rangonumero;
begin
    for i:= 1000 to 2500 do
    begin
        if(vc[i] > max) then
        max:=vc[i];
        cochemax:=i;
    end;
end;
    
procedure promedio(vp: vector; vc: integer);
var
    i: rangonumero;
    suma: integer;
begin
    suma:= 0;
    for i:=1000 to 2500 do
    suma:= vp[i] / vc[i];
end;
    

var
    i: rangonumero;
    cant, suma: integer;

procedure procesar(l: lista);
var
    vc, vp: vector;
    
    cochemax, max: integer;
    prom: real;
begin
    max:=-1;
    cochemax:=-1;
    prom:=0;
    inicar(vc);
    iniciar2(vp);
    while(l <> nil) do
    begin
        vc[l^.dato.numero]:=vc[l^.dato.numero] + 1;
        vp[l^.dato.numero]:=vp[l^.dato.numero] + l^.dato.pasajes;
        
        l:=l^.sig;
    end;
    maximo(vc, cochemax, max);
    promedio(vp, vc);
end;   

var
l, l2: lista;
capacidadmaximo: vector2
begin
    l:=nil;
    l2:=nil;
    cargarviaje(l);{se dispone}
    cargardatos(capacidadmaximo);{se dispone}
    nuevalista(l, l2);
    procesar(l);
end.
