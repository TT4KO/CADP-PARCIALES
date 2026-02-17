{Una facultad dispone de los dni de aquellos estudiantes que no cumplen con los requisitos de regularidad (a lo sumo 1000), 
los cuales no pueden seguir siendo estudiantes de la Facultad. Además, dispone de una estructura en la cual almacena todos los estudiantes; 
de cada estudiante se conoce DNI, apellido y legajo. Esta estructura se encuentra ordenada por DNI. 
pide realizar un programa que elimine (eficientemente en tiempo de ejecución) de la estructura que posee todos los estudiantes aquellos estudiantes que han perdido la regularidad.}
 
program lkdmas;
const 
	max = 1000;
type
alumno = record
	dni: integer;
	apellido: string;
	legajo: integer;
end;

lista = ^nodo;
	nodo = record
	dato: alumno;
	sig: lista;
end;
	
vector = array [1..max] of integer;

procedure ordenarVector(var v: vector; dimL: integer);
var
  i, j, min, aux: integer;
begin
  for i := 1 to dimL - 1 do
  begin
    min := i;
    for j := i + 1 to dimL do
      if v[j] < v[min] then
        min := j;
    aux := v[i];
    v[i] := v[min];
    v[min] := aux;
  end;
end;

procedure eliminar(var L: lista; v: vector; dimL: integer);
var
  act, ant: lista;
  i: integer;
begin
  act := L;
  ant := nil;
  i := 1;

  while (act <> nil) and (i <= dimL) do
  begin
    if (act^.dato.dni = v[i]) then
    begin
      { eliminar nodo }
      if (ant = nil) then
        L := act^.sig
      else
        ant^.sig := act^.sig;

      dispose(act);

      if (ant = nil) then
        act := L
      else
        act := ant^.sig;

      i := i + 1;
    end
    else 
    if (act^.dato.dni < v[i]) then
    begin
      ant := act;
      act := act^.sig;
    end
    else
      i := i + 1;
  end;
end;

var
	l: lista;
	v: vector;
	diml: integer;
begin
	l:=nil;
	cargar(l);{dispone}
	iniciar(v);{dispone}
	ordenar(v, diml);
end.
