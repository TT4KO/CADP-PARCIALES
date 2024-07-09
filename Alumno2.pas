{Se dispone de un listado con todos los alumnos que ingresaron este año en la facultado. De cada alumno se concoe su dni, 
nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10), 
turno (entre 1 y 4) y si estuvo presente o ausente en cada una de las 12 clases de practica.
A) Realizar un modulo que reciba la informacion de los alumnos y retorne una nueva estructura de datos que contenga
   solo aquellos alumnos que podran rendir el parcial. Para poder rendir el parcial, 
   los alumnos deben contar con al menos 8 aistencias en las 12 clases de practica.
B) Realizar un modulo que reciba la estructura de datos generada en el inciso anterior e imprima en pantalla
    1) Apellidos y nombre y el dni de los alumnos que hayan obtenido nota 8 o superior en el ingreso
    2) Turno con mayor cantidad de alumnos en condiciones de rendir el examen
    3)Cantidad de alumnos que no posean ningun digitos cero en su DNI.}

program mdkas;
const
cantnota = 10;
cantturno = 4;
cantclase = 12;
type
rangoclase = 1..cantclase;
rangoturno = 1..cantturno;
rangonota = 4..cantnota;
alumno = record
    dni: integer;
    nya: string;
    nota: rangonota;
    turno: rangoturno;
    clase: vectorclase;
end;
vectorclase = array [rangoclase] of boolean;
vectorturno = array [rangoturno] of integer;
lista = ^nodo
    nodo = record
    dato: alumno;
    sig: lista,
end;

function cumple(v: vectorclase);
var
    i: rangoclase;
    cant: integer;
begin
    cant:=0;
    for i:=1 to cantclase do
    begin
        if(v[i]) then
        cant:=cant + 1;
    end;
    cumple:=(cant => 8)
end;

procedure nuevalista(l: lista; var l2: lista);
var
    a: alumno;
begin
    while(l <> nil) do
    begin
        if(cumple(l^.dato.clase)) then
        adelante(l2, l^.dato);
        l:=l^.sig;    
    end;
end;

procedure iniciar(var vc: vectorturno);
var
    i: rangoturno;
begin
    for i:=1 to cantturno do
    vc[i]:=0;
end;

function digitos(num, digitobuscado: integer):integer;
var
    dig, cant: integer;
begin   
    cant:=0;
    while(num <> 0) do
    begin   
        dig:=mod 10 num;
        if (dig = digitobuscado) then
        cant:=cant + 1;
        num:= num div 10;
    end;
    digitos:=(cant = 0);
end;

procedure maximo(vc: vectorturno);
var
    i: rangoturno;
    turnomax, max: integer;
begin
    max:=-1;
    for i:= 1 to cantturno do
    if(vc[i] > max) then
    max:=vc[i];
    turnomax:=i;
end;

procedure procesar(l2: lista);
var
    cantidadcero: integer;
    vc: vectorturno;
begin   
    iniciar(vc);
    cantidadcero:=0;
    while(l2 <> nil) do
    begin
    
        if(l^.dato.nota >= 8) then
        write(l^.dato.nya, l^.dato.dni);
        
        vc[l^.dato.turno]:=vc[l^.dato.turno] + 1;
        
        if(digitos(l^.dato.dni, 0) = 0) then
        cantidadcero:=cantidadcero + 1;
        
        l2:=l2^.sig;
    end;
    maximo(vc);
    write(cantidadcero);
end;

var
l, l2: lista;
begin
    l:=nil;
    l2:= nil;
    cargaralumno(l);{se dispone}
    nuevalista(l, l2);
    procesar(l2);
end.
