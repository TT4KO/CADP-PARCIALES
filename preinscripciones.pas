{Una escuela primaria necesita un programa para administrar la información de preinscripciones al ciclo lectivo 2025. Para ello, dispone de una estructura de datos con la información de las preinscripciones realizadas entre julio y octubre) De cada preinscripción se conoce: fecha (día y mes), DNI del alumno, apellido y nombre del alumno, teléfono de contacto y horario de preferencia (1: Mañana, 2: Tarde, 3: Jornada extendida, 4: Jornada completa).
Se pide:
A) Generar una nueva estructura que contenga solamente las preinscripciones realizadas en julio y agosto.
B) A partir de la nueva estructura generada, calcular e informar:
1. Los dos horarios menos requeridos.
2. Apellido, nombre y teléfono de aquellos alumnos con DNI compuesto solamente por dígitos pares. 
3. Cantidad de preinscripciones al horario Jornada extendido}

program iuasd;
const 
canthorario = 4;
type
rangohorario = 1..canthorario;
tfecha = record
    dia: integer;
    mes: integer;
end;
alumno = record 
    fecha: tfecha
    dni: integer;
    ayn: string;
    telefono: integer;
    horario: rangohorario;
end;
lista = ^nodo
    nodo = record
    dato: alumno;
    sig: lista;
end;

vector = array [rangohorario] of integer;

procedure Adelante(var L: lista; a: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= L;
  L:= nue;
end;

procedure nueva(l: lista; var l2: lista);
begin
    while(l <> nil) do
    begin
        if(l^.dato.fecha.mes >= 7) and (l^.dato.fecha.mes <= 8) do
        adelante(l2, l^.dato);
        l:=l^.sig;
    end;
end;

procedure iniciar(var v: vector);
var
    i: rangohorario;
begin   
    for i:=1 to canthorario do
    v[i]:=0;
end;

function digitos(num: integer):boolean;
var
    dig: integer;
begin
    digitos:=true
    while(num <> 0) and digitos do
    begin
        dig:=num mod 10;
        if(dig mod 2 <> 0) then
        digitos:=false
        num:=num div 10;
    end;
    digitos:=true;
end;

procedure minimo(v: vector; var horariomin1, horariomin2, min1, min2: integer);
var
    i: rangohorario;
begin   
    for i:=1 to canthorario do
    if(v[i] < min1) then
    begin
        min2:=min1;
        horariomin2:=horariomin1;
        min1:=v[i];
        horariomin1:=i:
    end
    else
    if(v[i] < min2) then
    min2:=v[i];
    horariomin2:=i;
end;


procedure procesar(l: lista);
var
    v: vector;
    horariomin1, horariomin2, min1, min2: integer;
    total: integer;
begin
    iniciar(v);
    total:=0;
    while(l <> nil) do
    begin
        v[l^.dato.horario]:=v[l^.dato.horario] + 1;

        if(digitos(l^.dato.dni) then
        write(l^.dato.ayn);
        write(l^.dato.telefono);

        if(l^.dato.horario = 3) then
        total:=total + 1;
        l:=l^.sig;
    end;
    minimo(v, horariomin1, horariomin2, min1, min2);
    write(horariomin1, horariomin2);
    write(total);
end;
var
l, l2: lista;
begin
    l:=nil;
    l2:=nil;
    cargar(l);//se dispone
    nueva(l, l2);
    procesar(l2);
end.
