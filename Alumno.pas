{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso y las
notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el alumno
  con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a cada alumno
  deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
    a. El promedio de notas obtenido por cada alumno.
    b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente
    por dígitos impares.
    c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se
    recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la
estructura generada en el inciso 1. El alumno puede no existir.}
program Alu;
type
materias = 1..5 ;
vnotas = array [materias] of real ;
alumnos = record
	numero : integer;
	nombre : string;
	mail : string;
	ingreso : integer;
	egreso : integer;
	notas : vnotas ;
end;
lista = ^nodo;
	nodo = record 
	dato : alumnos;
	sig : lista;
end;
procedure ordenarvector (var v: vnotas);
var
	i,j,p:integer;
	item:real;
begin
	for i:=1 to 4 do
		begin
		p:=i;
		for j:=i+1 to 5 do
			if (v[j]>v[p]) then
				p:=j;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;
		end;
end;

procedure leeralumno ( var a : alumnos );
var
		i: materias;
begin
	write('ingrese el numero de alumno: '); readln(a.numero);
	if (a.numero <> -1 ) then 
	begin
		write('ingrese el nombre del alumno: '); readln(a.nombre);
		write('ingrese el mail del alumno: '); readln(a.mail);
		write('En que año ingreso el alumno a la facultad: ');readln(a.ingreso);
		write('En que año engreso el alumno a la facultad: ');readln(a.egreso);
	for i := 1 to 5 do 
	begin
	write('ingrese la nota con la que aprobo la materia ',i, ' : '); readln(a.notas[i]);
		end;
	end;
end;

procedure agregaradelante ( var l : lista ; a : alumnos);
var
		nuevo : lista;
begin
		new(nuevo); nuevo^.dato:= a; nuevo^.sig := l ;
		if ( l = nil ) then begin
				l := nuevo;
		end
		else begin
				nuevo^.sig := l ;
				l := nuevo;
		end;
end;

procedure cargarlista ( var l : lista );
var
		a: alumnos;
begin
			leeralumno(a);
				while (a.numero <> -1 ) do begin
							agregaradelante( l , a );
							leeralumno(a);
				end;
end;

function numImpares ( num : integer ) : boolean ;
var
		dig , impares , total : integer ;
begin
impares := 0; total := 0;
			while (num <> 0) do begin
						dig := num mod 10 ;
						if ( dig mod 2 = 1 ) then
								impares := impares +1 ;
						total := total +1;
			end;
			numImpares := (total = impares);
end;

procedure minimos (  var nombremin1,nombremin2,mail1,mail2 : string ; var tiempocarrera1, tiempocarrera2 : integer;tiempocarrera : integer; nombre,mail: string);
begin
			if ( tiempocarrera < tiempocarrera1 ) then begin
				tiempocarrera2 := tiempocarrera1; nombremin2 := nombremin1; mail2:= mail1;
				tiempocarrera1:= tiempocarrera; nombremin1 := nombre; mail1 := mail;
			end
			else if ( tiempocarrera < tiempocarrera2 ) then begin
					tiempocarrera2 := tiempocarrera; nombremin2 := nombre; mail2 := mail;
			end;
end;

procedure eliminar ( var l : lista ; num : integer; var ok : boolean );
var
		act, ant : lista;  // para no perder la lista
begin
act := l ; ant := l; ok:= false;
			while ( act <> nil ) and ( act^.dato.numero <> num ) do begin
						ant:= act ;
						act := act^.sig;
			end;
			if ( act <> nil) then begin
					ok := true;
							if ( act = ant ) then
									l := l^.sig
							else
									ant^.sig := act^.sig;
			dispose(act);
			end;
end;

procedure recorrerlista ( l : lista );
var
		impares , tiempocarrera,tiempocarrera1,tiempocarrera2: integer ;
		nombremin1,nombremin2,mail1,mail2 : string ; 
		i : materias ; 
		sumanotas : real;
begin
tiempocarrera1:= 9999; tiempocarrera2 := 9999; impares := 0;
while ( l <> nil ) do 
begin  
	sumanotas := 0;
		for i := 1 to 5 do 
		sumanotas := sumanotas + l^.dato.notas[i];
		writeln('El promedio obtenido por el alumno', l^.dato.nombre, ' es de : ', (sumanotas/5):4:2);
		tiempocarrera:= ( l^.dato.egreso - l^.dato.ingreso);
		minimos(nombremin1,nombremin2,mail1,mail2,tiempocarrera1,tiempocarrera2,tiempocarrera,l^.dato.nombre,l^.dato.mail);
										if ( l^.dato.ingreso = 2012) and numImpares(l^.dato.numero) then 
													impares := impares +1;
						l := l^.sig;
			end;
			writeln(' La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares es de : ' , impares); 
			writeln('El alumno que mas rapido se recibio fue ', nombremin1,' y su correo es ' ,mail1, ' y del segundo ', nombremin2, ' correo ', mail2);
end;

var
		l : lista ; nroaeliminar : integer; ok : boolean;
begin
l := nil;
cargarlista(l);
recorrerlista(l);
write('ingrese el numero de alumno que desea eliminar: '); readln(nroaeliminar);
eliminar(l , nroaeliminar , ok );
if (ok = true) then
	writeln('El alumno fue eliminado con exito.')
	else
			writeln('El numero de alumno ingresado no corresponde a un alumno de esta catedra. ');
end.
