{Una escuela primaria necesita un programa para administrar la informacion de preincripciones del ciclo lectivo 2025. De cada preincripcion 
se lee: DNI del alumno, apellido y nombre del alumno, fecha de nacimiento del alumno(dia, mes, y ano), telefono de contaco, 
y horario de preferencia (1: manana, 2: tarde, 3:jornada extendida, 4:jornada completa). La lectura finaliza cuando se lee el DNI -1(que no debe procesarse).
Se pide:
A)Leer y almacenar la informaiocn de las preincripciones en una estructura de datos adecuada. La informacion debe quedar almacenada en el mismo orden
  en que fue leida.
B)a partior de la estructua de datos generada en A), calcular e informar:
    1. Los dos horarios mas requeridos por alumnos nacidos entre enero y junio
    2. Apallido, nombre y telefono de aquellos alumnos con DNI compuesto solamente por digitos pares.
    3. Porcentaje de preincripciones al horario jornada completa.}



program mdkas;
const
canthorario = 4;
type
rangohorario = 1..canthorario;
Tfehca = record
    dia: integer;
    mes: integer;
    ano: integer;
end;

alumno = record
    dni: integer;
    ayn: string;
    fecha: Tfecha; 
    telefono: integer;
    horario: rangohorario;
end;
vector = array [rangohorario] of integer;
lista = ^nodo
    nodo = record
    dato: alumno;
    sig: lista;
end;

procedure agregar(var f: tfecha)
begin
    read(f.dia);
    read(f.mes);
    read(f.ano);
end;

procedure leer(var a: alumno);
begin
    read(a.dni);
    if(a.dni <> -1) then
    read(a.ayn);
    read(a.telefono);
    read(a.)horario;
    agregar(a.fecha);
end;

procedure agregaratras(var L,Ult: lista; a: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= nil;
  if(L = nil) then //si es el primer nodo
    L:= nue
  else      // si no es el primer nodo
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargar(var l: lista);
var
    a: alumno;
    ult: lista;
begin   
    leer(a);
    while(a.dni <> -1) do
    begin
        atras(l, ult, a);
        leer(a);
    end;
end;

procedure iniciar(var v: vector);
var 
    i: rangohorario;
begin   
    for i:=1 to canthorario do
    v[i]:=0;
end;

function digitos(num: integer);
var
    cant, dig: integer;
begin
    cant:=0;
    while(l <> nil) and (cant < 2) do
    begin
        dig:=num div 10;
        if(dig mod 2 = 1) then
        cant:=cant + 1;
        num:=num div 10;
    end;
    digitos:= (cant = 0);
end;

procedure maximo(v: vector; var horariomax1, horariomax2, max1, max2: integer);
var
    i: rangohorario;
begin
    for i:=1 to canthorario
    if(v[i] > max1) then
    begin
        max2:=max1;
        horariomax2:=horariomax1;
        max1:=v[i];
        horariomax1:=i;
    end
    else
    if(v[i] > max2) then
    max2:=v[i];
    horariomax2:=i;
end;

function procentaje(a, b: integer):real;
begin
    Porcentaje:=(a/b)*100;
end;

procedure procesar(l: lista);
var
    v: vector;
    horariomax1, horariomax2, max1, max2: integer;
    total, jornada: integer;
begin
    iniciar(v);
    max1:=-1;
    max2:=-1;
    total:=0;
    jornada:=0;
    while(l <> nil) do
    begin
        if(l^.dato.fecha.mes >= 1) and (l^.dato.fecha.mes =< 6) then
        v[l^.dato.horario]:=v[l^.dato.horario] + 1;

        if(digitos(l^.dato.dni)) then
        write(l^.dato.ayn);
        write(l^.dato.telefono);

        total:=total + 1;
        if(l^.dato.horario = 4) then
        jornada:=jornada + 1;

        l:=l^.sig
    end;
    maximo(v, horariomax1, horariomax2, max1, max2);
    procentaje(total, jornada);
    write(horariomax1, horariomax2);
end;

var
l: lista;
begin 
    l:=nil;
    cargar(l);
    procesar(l);
end.
