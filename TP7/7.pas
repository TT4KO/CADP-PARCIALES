program isd;
const  
cant = 24;
type
rango = 1..cant;
alumnmo = record
    numero: integer;
    ayn: string;
    correo: string;
    ingreso: integer;
    egreso: integer;
    notas: vector;
end;
vector = array [rango] of integer;
lista = ^nodo
    nodo = record
    dato: alumnmo;
    sig: lista;
end;

procedure ordenarDescendente(var notas: vector);
var
    i, j, aux: integer;
begin
    for i := 1 to cant - 1 do
        for j := i + 1 to cant do
            if notas[i] < notas[j] then
            begin
                aux := notas[i];
                notas[i] := notas[j];
                notas[j] := aux;
            end;
end;

procedure leernota(var v: vector);
var
    i: rango;
begin
    for i:=1 to cant do
    begin
        read(v[i]);
    end;
    ordenarDescendente(v);
end;

procedure leer(var a: alumnmo);
begin
    read(a.numero);
    if(a.numero <> -1) then
        read(a.ayn);
        read(a.correo);
        read(a.ingreso);
        read(a.egreso);
        leernota(a.notas);
end;

function calcular(v: vector);
var
    i: rango;
    suma: integer;
    promedio: integer;
begin   
    suma:=0;
    for i:=1 to cant do
    begin
        suma:=suma + v[i];
    end;
    promedio:=suma/cant;
    write(promedio);
end;


procedure carga(var l: lista);
var
    a: alumnmo;
begin
    leer(a);
    while(a.numero <> -1) then
    adelante(l, a);
    leer(a);
end;

procedure minimo(tiempo: integer; var nombre1, nombre2, correomin1, corremin2: string; var min1, min2: integer; ayn: string; correo: string);
begin
    if(tiempo > min1) then
    begin
        min2:=min1;
        nombre2:=nombre1;
        corremin2:=correomin1;
        min1:=tiempo;
        nombre1:=nombre;
        correomin1:=correo;
    end
    else
        if(tiempo > min2) then
        min2:=tiempo;
        nombre2:=nombre;
        corremin2:=correo
end;

procedure procesar(l: lista);
var
    cantalumnos: integer;
    tiempo: integer;
    nombre1, nombre2: string;
    correomin1, corremin2: stringl
    min1, min2: integer;
begin
    min1:=9999;
    min2:=9999;
    cantalumnos:=0;
    while(l <> nil) do
    begin
        calcular(l^.dato.notas);
        write(calcular);
        
        if(l^.dato.ano = 2012) and (digitos(l^.dato.numero)) then
        cantalumnos:=cantalumnos + 1;

        tiempo:=l^.dato.egreso - l^.dato.ingreso;
        
        l:=l^.sig;
    end;
    minimo(tiempo, nombre1, nombre2, correomin1, corremin2, min1, min2, l^.dato.ayn, l^.dato.correo);
    write(nombre1, nombre2, correomin1, corremin2);
    wtite(cantalumnos)
end;

procedure 

procedure eliminarDni(var L:lista;var ok: Boolean; numero: integer);
var
  act,ant: lista;
begin
  ok:= false;
  act:= L;
  ant:= L;
  While((act <> nil) and( act^.dato.numero <> numero))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if( act <> nil)then
      begin
        ok:= true;
        if(act = L)then
          begin
            L:= act^.sig; //o L^.sig; seria lo mismo
          end
        else 
          ant^.sig:= act^.sig;
        Dispose(act);
      end;
end;

var
l: lista;
numero: integer;
ok: boolean;
begin
    l:=nil;
    carga(l);
    procesar(l);
    read(numero);
    eliminar(l, ok, numero);
    if(ok)then
    write('eliminado');
end.
