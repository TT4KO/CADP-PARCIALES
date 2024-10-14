program idsa;
const
cantcamiones = 100;
type
rangocamiones = 1..cantcamiones;

vectorcaminiones = array [rangocamiones] of camiones;
caminiones = record
  patente: integer;
  ano: integer;
  capacidad: real;
end;

vectorpatente = array [rangocamiones] of real;

viaje = record
  codigo_viaje: integer;
  codigo_camion: rangocamiones;
  kilometros: integer;
  destino: string;
  ano: integer;
  dni: integer;
end;
lista = ^nodo
  nodo = record
  dato: viaje;
  sig: lista;
end;

procedure leer(var v: viaje);
begin
  read(v.dni);
  if(v.dni <> -1) then
  begin
  read(v.codigo_viaje);
  read(v.codigo_camion);
  read(v.kilometros);
  read(v.destino);
  read(v.ano);
  read(v.dni);
  end;
end;

procedure agregarAdelante(var L: lista; v: viaje);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarviaje(var l: lista);
var
  v: viaje;
begin
  leer(v);
  while(v.dni <> -1) dato
  begin
  adelante(l, v);
  leer(v);
  end;
end;

procedure maximo(patentekilo: integer; var max, patentemax: integer; patenteactual: integer);
begin
  if(patentekilo > max) then
  max:=patentekilo;
  patentemax:=patenteactual
end;

procedure minimo(patentekilo: integer; var min, patentemin: integer; patenteactual: integer);
begin
  if(patentekilo < min) then
  min:=patentekilo;
  patentemin:=patenteactual
end;

procedure iniciar(var v: vectorpatente);
var
  i: rangocamiones;
begin 
  for i:=1 to cantcamiones do
  v[i]:=0;
end;

procedure procesar(l: lista; v: vectorcaminiones);
var
  cantviajes: integer;
  patentemax, max, patentemin, min: integer;
  vp: vectorpatente;
begin
  iniciar(vp);
  max:=-1;
  min:=9999;
  cantviajes:=0;
  while(l <> nil) do 
  begin
    vp[l^.dato.codigo_camion]:=vp[l^.dato.codigo_camion] + l^.dato.kilometros;

    if(l^.dato.capacidad > 30,5) and ((l^.dato.ano - v[l^.dato.ano]) > 5) then
    cantviajes:=cantviajes + 1;

    if(digitos(l^.dato.dni)) then
    write(l^.dato.codigo_viaje);

    l:=l^.sig;
  end;
  maximo(patentekilo, max, patentemax, v[l^.dato.patente]);
  write(patentemax);
  minimo(patentekilo, min, patentemin, v[l^.dato.patente]);
  write(patentemin);
  write(cantviajes);
end;

var 
l: lista;
v: vectorcaminiones;
begin
  l:=nil
  cargarvector(v);//se dispone
  cargarviaje(l);
  procesar(l, v);
end.

