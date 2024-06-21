{UNA PANADERIA ARTESANAL DE LA PLATA VENDE PRODUCTOS DE ELABORACION PROPIA. 
LA PANADERIA AGRUPA A SUS PRODUCTOS EN 26 CATEGORIAS[POR EJ..1. PAN; 2.MEDIALUNAS; PARA CADA CATEGORIA SE CONOCE SU NOMBRE Y EL PRECIO POR KILO DEL PRODUCTO].
LA PANADERIA "DISPONE" DE INFORMACION DE TODAS LAS COMPRAS REALIZADA EN EL ULTIMO AÑO. DE CADA COMPRA SE CONOCE EL DNI DEL CLIENTE, 
LA CATEGORIA DEL PRODUCTO(ENTRE 1 Y EL 26) Y LA CANTIDAD DE KILOS COMPRADOS. LA INFORMACION -SE ENCUENTRE ORDENADA POR DNI DEL CLIENTE-.

A)REALIZAR UN MODULO QUE RETORNE LA INFORMACION DE LAS CATEGORIAS EN UNA ESTRUCUTA DE DATOS ADECUADAS. LA INFORMACION SE LEE POR TELCADO SIN NINGUN ORDEN.
DE CADA CATEGORIA SE LEE EL NOMBRE, EL CODIGO(1 A 26) Y EL PRECIO POR KILOS

B)RETORNE
1.DNI DEL CLIENTE QUE MAS COMPRAS HA REALIZADO
2.MONTO TOTAL RECAUDADO POR CADA CATEGORIA
3.CANTIDAD TOTAL DE COMPRAS DE CLIENTES CON DNI COMPUESTO PORM AL MENOS 3 DIGITOS PARES;}

program jidas;
const
cantcat = 26;
type
rangocat = 1..cantcat;
categoria = record
    nombre: string;
    precio: real;
end;

vectorcategoria = array [rangocat] of categoria;

compra = record
    dni: integer;
    cate: rangocat;
    cantidad: integer;
end;

lista = ^nodo;
    nodo = record
    dato: compra;
    sig: lista;
end;

vector = array [rangocat] of real;

procedure leer(var c: categoria; cod: integer);
begin
    read(c.nombre);
    read(c.precio);
    read(cod);

procedure cargarcompra(var v: vectorcategoria);
var 
    cod: integer;
    c: categoria;
    i: rangocat;
begin
    for i:=1 to cantcat
    leer(c, cod);
    v[cod]:=c;
end;

procedure iniciar(var vc: vector);
var 
    i: rangocat;
begin
    for i:=1 to cantcat do
    vc[i]:=0;
end;

procedure maximo(actual, compra, max:integer; var dnimax: integer);

begin
    if(compra > max) then
    max:=compra;
    dnimax:=dniactual;
end;

function digitos(dni: integer): boolean;
var
  digito, pares: integer;
begin
  pares := 0;
  while dni <> 0 do
  begin
    digito := dni mod 10;
    if digito mod 2 = 0 then
      inc(pares);
    dni := dni div 10;
  end;
  tieneTresPares := pares >= 3;
end;

procedure procesar(l: lista; v: vectorcategoria);
var 
    max, dnimax :integer;
    cantpares: integer;
    vc: vector;
    dniactual: integer;
    dnicompra: integer;
begin
    iniciar(vc);
    max:=-1;
    cantpares:=0;
    while(l <> nil) do
    begin
        dnicompra:=0;
        dniactual:=l^.dato.dni;
        while(l <> nil) and (l^.dato.dni = dniactual) do
        begin
            dnicompra:=dnicompra + 1;
            
            vc[l^.dato.categoria]:=vc[l^.dato.categoria] + v[l^.dato.cate].precio;
            
            if(digitos(l^.dato.dni)) then
            cantpares:=cantpares + 1;
        
            l:=l^.sig;
        end;
        maximo(dniactual, dnicompra, max, dnimax);
        write(max);
    end;
    write('monto total: ' vc[i] , i);
    write(cantpares);
end;

var
l: lista;
v: vectorcategoria;
begin
    cargarvector(l);
    cargarcompra(v);
    procesar(l, v);
end.
