{
A)De cada alumno se lee su dni, nombre y apellido, año de ingreso y nota obtenida(entre 0 y 10) 
  en cada una de las 10 autoevaluaciones. En caso de no realizar alguna autoevaluacion, se asigna la nota -1. 
  La lectura finaliza cuando se ingresa el dni 44444444(que debe procesarse).
B)realizar un modulo que reciba la estructura de datos generada en el inciso anterior, e imprima en pantalla:
    1)DNI de los alumnos que podran rendir el parcial de CADP.
    Para poder rendir, los alumnos deben haber realizado al menos 8 autoevaluaciones y deben haber
    aprobado (nota 6 o superior) al menos 4 autoevaluaciones.
    2)El porcentaje de alumnos que hayan ingresado en el año 2020 y que se hayan presentado a todas las autoevaluaciones, sobre el total de alumnos.
    3)apellido y nombre de aquellos alumnos donde la suma de los digitos del DNI es par.}

program jkdas;
const
canteva = 10;
type
rangoeva = 1..canteva;
alumno = record
    dni: integer;
    nya: string;
    anio: integer;
    evualacion: rangoeva;
end;

vectornotas = array [rangoeva] of evualacion;

lista = ^nodo;
    nodo = record
    dato: alumno;
    sig: lista;
end;

procedure leereva(var v: vectornotas);
var
    i: rangoeva;
begin
    for i:=1 to canteva do
    read(v[i]);
end;

procedure leer(var a: alumno);
begin
    read(a.dni);
    read(a.nya);
    anio(a.anio);
    leereva(a.evualacion);
end;

procedure cargaralumno(var l: alumno);
var
    a: alumno;
begin
    repeat
    leer(a);
    adelante(l, a);
    until(a.nota = -1);
end;

procedure calcular(v: vectornotas; var asistencia, aprobada: integer);
var
    i: rangoeva;
begin
    aprobada:=0;
    asistencia:=0;
    for i:=1 to canteva do
    if(v[i] > 0) then
    asistencia:=asistencia + 1;
    if(v[i] > 6) then
    aprobada:=aprobada + 1;
end;

function sumatotalespar(num: integer): integer;
var
    dig, suma: integer;
begin   
    suma:=0;
    while(num <> 0) do
    begin   
        num:=suma + (num mod 10)
        num:=num div 10
    end;
end;

function porcentaje(a, b: integer):real;
begin
    porcentaje:=(a*100)/b;
end;

procedure procesar(l: lista);
var
    cantidadevaprobada, cantasistencia: integer;
    totalalumnos, alunoscondicion: integer;
begin
    totalalumnos:=0;
    alunoscondicion:=0;
    while(l <> nil) do
    begin   
        calcular(l^.dato.evualacion, cantasistencia, cantidadevaprobada);
        if(cantasistencia >= 8) and (cantidadevaprobada > 4) then
        write(l^.dato.dni)
        
        totalalumnos:=totalalumnos + 1;
        if(l^.dato.anio = 2020) and (cantasistencia = canteva) then
        alunoscondicion:=alunoscondicion + 1;
        
        if (sumatotalespar(l^.dato.dni) MOD 2 = 0) then
        write(l^.dato.nya);
    end;
    write(porcentaje(totalalumnos, alunoscondicion));
end;

var
l: lista;
begin
    cargaralumno(l);
    procesar(l);
end.
