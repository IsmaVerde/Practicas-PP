();;
(* Compila y da lugar a
- : unit = () *)
2 + 5 * 3;;
(*Compila y da lugar a 
- : int = 17 *)
1.0;;
(*Compila y pone - : float = 1*)
(*1.0 * 2;;
No va a compilar debido a que se intenta multiplicar un int con un float. Es un error sintactico. La solucion mas apropiada seria pasar el entero a float y utilizar el operador *. *)
(*2 - 2.0;;
Lo mismo que el anterior, pero utilizando el operador -. *)
(*3.0 + 2.0;;
No compila debido a que el operador es de tipo entero, deberia ser +. , es otro error sintactico*)
5 / 3;;
(*Compila y da lugar a - : int = 1 , debido a que al ser tipo int no puede mostrar los decimales *)
5 mod 3;;
(*Compila y da lugar a - : int = 2 , el resto de la division *)
3.0 *. 2.0 ** 3.0;;
(*Compila y da lugar a - : float = 24 , por la prioridad de operacion*)
3.0 = float_of_int 3;;
(*Compila y da lugar a - : bool = true *)
(*sqrt 4;;
No compila porque se le da un valor entero, en vez de flotante. Error sintactico *)
int_of_float 2.1 + int_of_float (-2.9);;
(*Compila y da lugar a - : int = 0 , porque pasa el valor float a int *)
truncate 2.1 + truncate (-2.9);;
(*Compila y da lugar a - : int = 0 *)
floor 2.1 +. floor (-2.9);;
(*Compila y da lugar a - : float = -1 *)
(*ceil 2.1 +. ceil -2.9;;
Pense que compilaria y daria - : float = 0 , por la suma de aproximaciones por lo alto, pero da un error sintactico *)
'B';;
(*Compila y da lugar a - : char = 'B'*)
int_of_char 'A';;
(*Compila y da lugar a - : int = 65 *)
char_of_int 66;;
(*Compila y da lugar a - : char = 'B' *)
Char.code 'B';;
(*Compila y da lugar a - : int = 66 *)
Char.chr 67;;
(*Compila y da lugar a - : char = 'C' *)
'\067';;
(*Compila y da lugar a - : char = 'C' *)
Char.chr (Char.code 'a'- Char.code 'A' + Char.code 'Ñ');;
(*No compila y da un error lexico, debido a que la Ñ no es parte de los char al tener dos caracteres*)
Char.uppercase 'ñ';;
(*No compila y da un error lexico, debido a que la Ñ no es parte de los char al tener dos caracteres*)
Char.lowercase 'O';;
(*Compila y da lugar a - : char = 'o'*)
"this is a string";;
(*Compila y da lugar a - : string = "this is a string" *)
String.length "longitud";;
(*Compila y da lugar a - : int = 8 *)
(*"1999" + "1";;
No compila debido a que no se pueden sumar strings, al menos con una suma de enteros, error sintactico*)
"1999" ^ "1";;
(*Compila y da lugar a - : string = 19991*)
int_of_string "1999" + 1;;
(*Compila y da lugar a - : int = 2000*)
"\064\065";;
(*Compila y da lugar a -: string = "@A"*)
string_of_int 010;;
(*Compila y da lugar a - : string = "10" , en un principio pense que pondria 010 pero abrevia a 10 porque en los entero los 0 a la izquierda no cuentan*)
not true;;
(*Compila y da lugar a - : bool = false *)
true && false;;
(*Compila y da lugar a - : bool = false *)
true || false;;
(*Compila y da lugar a - : bool = true *)
(1 < 2) = false;;
(*Compila y da lugar a - : bool = false *)
"1" < "2";;
(*Compila y da lugar a - : bool = true *)
2 < 12;;
(*Compila y da lugar a - : bool = true *)
"2" < "12";;
(*Compila y da lugar a - : bool = false *)
"uno" < "dos";;
(*Compila y da lugar a - : bool = false *)
2,5;;
(*Compila y da lugar a - : int * int = (2,5) *)
"hola", "adios";;
(*Compila y da lugar a - : string * string = ("hola","adios")*)
0, 0.0;;
(*Compila y da lugar a - : int * float = (0, 0.0) *)
fst ('a', 0);;
(*Compila y da lugar a - : char = 'a' *)
snd(false, true);;
(*Compila y da lugar a - : bool = true *)
(1,2,3);;
(*Compila y da lugar a - : int * int * int = (1, 2, 3)*)
(1,2),3;;
(*Compila y da lugar a - : (int * int) * int = ((1, 2) 3)*)
fst (1,2),3;;
(*Compila y da lugar a - : int * int = (1, 3)*)
if 3 = 4 then 0 else 4;;
(*Compila y da lugar a - : int = 4 *)
if 3 = 4 then "0" else "4";;
(*Compila y da lugar a - : string = "4" *)
(*if 3 = 4 then 0 else "4";;
No compila porque el 0 y el "4" no son del mismo tipo. Error sintactico. *)
(if 3 < 5 then 8 else 10) + 4;;
(*Compila y da lugar a - : int = 12 *)
2.0 *. asin 1.0;;
(*Compila y da lugar a - : float = 3.14... *)
sin (2.0 *. asin 1.0/.2.);;
(*Compila y da lugar a - : float = 1 *)
function x -> 2 * x;;
(*Compila y da lugar a - : int -> int = <fun> *)
(function x -> 2 * x) (2+1);;
(*Compila y da lugar a - : int = 6 *)
function (x,y) -> 2 * x + y;;
(*Compila y da lugar a - : int * int -> int = <fun> *)
(function (x,y) -> 2 * x + y) (1 + 2, 3);;
(*Compila y da lugar a - : int = 9 *)

