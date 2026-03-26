{El indec dispone de una estructura de datos donde guarda la informacion de la canasta basica de cada familia. 
La canasta basica esta compuesta por items y cada item tiene: codigo de categoria (1..300), precio y dni. 
Esta estructura esta ordenada por codigo de categoria y puede haber mas de 1 item con igual categoria. 
Ademas se dispone de una estructura de datos donde para cada categoria se tiene su peso (un valor real entre 0 y 1).
Hacer un programa que:
A) procese la informacion e informe para cada canasta basica de la familia el monto total gastado
(esto se hace sumando el costo de cada item multiplicado por el valor de el peso de la categoria del item)
B) Informe los codigos de categoria de los 15 items que representan el mayor gasto en esa canasta basica}

const
  maxCat = 300;
  maxTop = 15;

type
  rango = 1..maxCat;
  item = record
    codigo: rango;
    precio: real;
    nombre: string;
  end;
  lista = ^nodo;
  nodo = record
    dato: item;
    sig: lista;
  end;
  vectorPesos = array[rango] of real;
  topItem = record
    codigo: rango;
    gasto: real;
  end;
  vectorTop = array[1..maxTop] of topItem;


procedure insertarTop(var v: vectorTop; var dimL: integer; cod: integer; gasto: real);
var
  i, pos: integer;
begin
  pos := 1;
  while (pos <= dimL) and (v[pos].gasto > gasto) do
    pos := pos + 1;
  if pos <= maxTop then
  begin
    if dimL < maxTop then
      dimL := dimL + 1;
    for i := dimL downto pos + 1 do
      v[i] := v[i-1];
    v[pos].codigo := cod;
    v[pos].gasto := gasto;
  end;
end;

procedure procesar(l: lista; v: vectorPesos);
var
  actual: integer;
  total: real;
  gastoItem: real;
  top: vectorTop;
  dimTop, i: integer;
begin
  dimTop := 0;
  while (l <> nil) do
  begin
    actual := l^.dato.codigo;
    total := 0;
    while (l <> nil) and (l^.dato.codigo = actual) do
    begin
      gastoItem := l^.dato.precio * v[l^.dato.codigo];
      total := total + gastoItem;
      insertarTop(top, dimTop, l^.dato.codigo, gastoItem);
      l := l^.sig;
    end;
    writeln('Categoria: ', actual, ' Total: ', total:0:2);
  end;
  writeln('--- TOP 15 ---');
  for i := 1 to dimTop do
    writeln('Codigo: ', top[i].codigo, ' Gasto: ', top[i].gasto:0:2);
end;

var
  l: lista;
  v: vectorPesos;
begin
  l := nil;
  iniciarVector(v);   {se dispone}
  cargarLista(l);     {se dispone, ordenada por codigo}
  procesar(l, v);
end.
