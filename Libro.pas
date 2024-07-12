{Una librería dispone de información de los libros vendidos durante el año 2023. De cada libro
se conoce código del libro, título, autor, código de género (1..20), año de publicación y la
calificación obtenida en cada uno de los 12 meses del año. La calificación es numérica de 0 a
10, donde el valor 0 significa que el libro no ha sido vendido ese mes.
Se solicita:
a. Informar para cada género la cantidad de libros publicados antes del año 2000.
b. Informar los títulos de los 2 libros con mejor calificación promedio en los meses en los que se
vendieron. Solo deben considerarse los libros que se vendieron en más de 6 meses.
c. Implementar e invocar un módulo que genere una lista con los libros cuyo código posee
exactamente 4 dígitos pares y haya sido publicado entre 1995 y 2005. La lista debe estar
ordenada por autor.
d. Ingresar un código de libro y buscar su título en la lista generada en el inciso c}
program jdikas;
const
cantgenero = 20;
cantmes = 12;
type
rangomes = 1..cantmes;
rangogenero = 1..cantgenero;
libro = record
    codigo: integer;
    titulo: string;
    autor: string;
    genero: rangogenero;
    año: integer;
    califiacion: vectomes;
end;
vectormes = array [rangomes] of integer;
lista = ^nodo;
    nodo = record
    dato: libro;
    sig: lista;
end;
vectorgenero = array [rangogenero] of integer;

procedure fijarse(v: vectormes; var comprames: integer; var prom: real);
var 
    i:rangomes;
    suma: integer;
begin
    suma:=0;
    for i:=1 to cantmes do
    begin
        if(vc[i] > 0) then
        comprames:=comprames + 1;
        suma:=suma + vc[i];
    end;
    prom:=comprames/suma;
end;
    
procedure maximo(titulo: sting; prom: real; var titulomax1, titulomax2: string; var max1, max2: real);
begin
    if(prom > max1) then
    begin
        max2:=max1;
        titulomax2:=titulomax1;
        max1:=prom;
        titulomax1:=titulo;
    end
    else
    if(prom > max2) then
    max2:=prom;
    titulomax2:=titulo;
end;

procedure procesar(l: lista);
var
    comprames: integer;
    prom: real;
    vc: vectorgenero;
    titulomax1, titulomax2, max1, max2: integer;
begin
    iniciar(vc);
    comprames:=0;
    prom:=0;
    max1:=-1
    max2:=-1;
    while(l <> nil) do
    begin
        if(l^.dato.año < 2000) then
        vc[l^.dato.genero]:=vc[l^.dato.genero] + 1;
        
        fijarse(l^.dato.califiacion, comprames, prom);
        if(comprames > 6) then
        maximo(l^.dato.titulo, prom, titulomax1, titulomax2, max1, max2);
        l:=l^.sig;
    end;
    write(titulomax2, titulomax1);
    for i:=1 to cantmes
    write(vc[i], i);
end;

functio cumple(num: integer):boolean;
var 
    dig, cant: integer;
begin
    cant:=0;
    while(l <> nil) do
    begin
        dig:=num mod 10;
        if(dig mod 2 = 0) then
        cant:=cant + 1;
        num:=num div 10;
    end;
    cumple:=(cant = 4);
end;

procedure Ordenado(var L: lista; li: libro);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= li;
  ant:= L;
  act:= L;
  While(act <> nil)and(li.titulo > act^.dato.titulo) do  // > ascendente | < descendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act = ant) then //al principio o vacio
      L:= nue
    else
      ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure nuevalista(l: lista; var l2:lista);
begin
    while(l <> nil) do
    begin
        if(cumple(l^.dato.codigo)) and (l^.dato.año >= 1995) and (l^.dato.año =< 2005) then
        ordenado(l2, l^.dato);
        l:=l^.sig;
    end;
end;

procedure buscar(L: lista; auxCodActual: integer; var titulo: string);
var
  prosiga: Boolean;
begin
  prosiga:= false;
  While(L <> nil) and (prosiga)do
    begin
      if(L^.dato.codPeli = auxCodActual)then
        begin
          L^.dato.puntajePromedilo:= titulo;
          prosiga:= true;
        end;
      L:= L^.sig;
    end;
end;

var
l, l2: lista;
aux: boolean;
titulo: string;
begin
    cargarlibro(l);
    procesar(l);
    nuevalista(l, l2);
    read(titulo);
    buscar(l2, aux, titulo);
    if(aux)then
    write('se encontro');
end.
