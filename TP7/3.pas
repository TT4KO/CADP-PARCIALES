program uasd;
const  

type
viaje = record
    numero: integer;
    codigo: integer;
    origen: string;
    destino: string;
    kilometros: integer;
end;
lista = ^nodo
    nodo = record
    dato: viaje;
    sig: lista;
end;

procedure maximo(var codigomax1, codigmax2, max1, max2: integer; total: integer; kilometros: integer);
begin
    if(total > max1) then
    begin
        codigomax2:=codigomax1;
        max2:=max1;
        codigomax1:=kilometros;
        max1:=total;
    else
    end
    if(total > max2) then
        codigomax2:=kilometros;
        max2:=total;
end

procedure insertarOrdenado(var L: lista; v: viaje);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= v;
  ant:= L;
  act:= L;
  While(act <> nil)and(v.numero > act^.dato.numero) do  
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act = ant) then 
      L:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure procesar(l: lista; var l2: lista);
var
    codigomax1, codigmax2, max1, max2: integer;
    kilometrostotal: integer;
begin   
    max1:=-1;
    max2:=-1;
    kilometrostotal:=0;
    while(l <> nil) do
    begin
        kilometrostotal:=kilometrostotal + l^.dato.kilometros;

        if(l^.dato.kilometros > 5) then
        ordenado(l2, l^.dato);
    
        l:=l^.sig;
    end;
    maximo(codigomax1, codigomax2, max1, max2, kilometrostotal, l^.dato.kilometros);
    write(codigomax2, codigomax1);
end;

var
l, l2: lista;
begin
    l:=nil;
    l2:=nil;
    cargarviaje(l);
    procesar(l, l2);
end.
