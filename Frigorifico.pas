{realizar un modulo que cargue en una estructura de datos adecuada la informacion de las compras. 
De cada compra se conoce el monto abonado, el mes que se realizo la compra, 
la cantida de kilos comprados y el nombre del frigorifico. Por cada frigorifico puede haber mas de una compra.
La informacion de las comrpas debe quedar ordenada por nombre 
de frigorifico. La lectura finaliza al ingresar la compra con 100 kilos de carne, que debe procesarce.

A)los nombres de los frigorificos para los cuales el monto total facturado supero los 45000 pesos

B)los dos meses en los que se relizaron menor cantidad de compras.

C)el monto promedio de las compras realizadas durante el mes de septiembre}

program ComprasFrigorificos;

const
    cantmes = 12;

type
    rangomes = 1..cantmes;
    compra = record
        monto: integer;
        mes: rangomes;
        kilos: integer;
        nombre: string;
    end;

    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;

    vector = array[rangomes] of integer;

procedure leercompra(var c: compra);
begin
    writeln('Ingrese el monto:');
    readln(c.monto);
    writeln('Ingrese el mes (1-12):');
    readln(c.mes);
    writeln('Ingrese los kilos:');
    readln(c.kilos);
    writeln('Ingrese el nombre del frigorífico:');
    readln(c.nombre);
end;

procedure ordenado(var L: lista; c: compra);
var
    nue, ant, act: lista;
begin
    new(nue);
    nue^.dato := c;
    ant := nil;
    act := L;
    while (act <> nil) and (c.nombre > act^.dato.nombre) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if (ant = nil) then
        L := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;

procedure cargarcompra(var l: lista);
var
    c: compra;
begin
    repeat
        leercompra(c);
        ordenado(l, c);
    until (c.kilos = 100);
end;

procedure iniciar(var vc: vector);
var
    i: rangomes;
begin
    for i := 1 to cantmes do
        vc[i] := 0;
end;

procedure minimo(vc: vector; var mesMin1, mesMin2: integer);
var
    i, min1, min2: integer;
begin
    min1 := maxint;
    min2 := maxint;
    for i := 1 to cantmes do
    begin
        if vc[i] < min1 then
        begin
            min2 := min1;
            mesMin2 := mesMin1;
            min1 := vc[i];
            mesMin1 := i;
        end
        else if vc[i] < min2 then
        begin
            min2 := vc[i];
            mesMin2 := i;
        end;
    end;
end;

function promedio(a, b: integer): real;
begin
    if b = 0 then
        promedio := 0
    else
        promedio := a / b;
end;

procedure procesar(l: lista);
var
    montototal, cantcompras, septiembre, totalSeptiembre: integer;
    vc: vector;
    nombreactual: string;
    mesMin1, mesMin2: integer;
begin
    iniciar(vc);
    septiembre := 0;
    totalSeptiembre := 0;

    while l <> nil do
    begin
        nombreactual := l^.dato.nombre;
        montototal := 0;
        while (l <> nil) and (l^.dato.nombre = nombreactual) do
        begin
            montototal := montototal + l^.dato.monto;
            if montototal > 45000 then
                writeln(nombreactual);
                
            vc[l^.dato.mes] := vc[l^.dato.mes] + 1;
                
            if l^.dato.mes = 9 then
            begin
                totalSeptiembre := totalSeptiembre + l^.dato.monto;
                septiembre := septiembre + 1;
            end;
            l := l^.sig;
        end;
    end;

    minimo(vc, mesMin1, mesMin2);
    writeln('Los dos meses con menor cantidad de compras son: ', mesMin1, ' y ', mesMin2);
    writeln('Monto promedio de compras en septiembre: ', promedio(totalSeptiembre, septiembre):0:2);
end;

var
    l: lista;
begin
    l := nil;
    cargarcompra(l);
    procesar(l);
end.
