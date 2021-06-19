let x=1;;
(* Da val x : int = 1, asignandole a x el valor de 1 *)
let y=2;;
(* Da val y : int = 2, asignandole a y el valor de 2 *)
x - y;;
(* Da -: int = -1 *)
let x=y in x-y;;
(* La expresion da -: int = 0 *)
(*z;;
Da error porque no hay ningun valor asignado a z o porque no se aplican las comillas para darle el valor char. Error de tipo *)
let z = x+ y;;
(* Da val z : int = 3, asignandole el entero 3 a z *)
z;;
(* Da -: int = 3 *)
let x = 5;;
(* Da val x : int = 5 *)
z;;
(* Sigue dando -: int = 3 *)
let y = 5 in x + y;;
(* Da -: int = 10 *)
x+y;;
(* Da -: int = 7 *)
let p = 2,5;;
(* Da val p : int * int = (2, 5) *)
snd p, fst p;;
(* Da -: int * int = (5, 2) *)
p;;
(* Da -: int * int = (2, 5) *)
let x,y = p;;
(* Da val x : int = 2 y val y : int = 5 *)
let z = x+y;;
(* Da val z : int = 7 *)
let x,y = p,x;;
(* Da val x : int * int = (2, 5) y val y : int = 2 *)
let x = let x,y = 2,3 in x * x + y;;
(* Da val x : int = 7 *)
x + y;;
(* Da -: int = 9 *)
z;;
(* Da -: int = 7 *)
let x = x + y in let y = x * y in x + y + z;;
(* Da -: int = 34 *)
x + y + z;;
(* Da -: int = 16 *)
int_of_float;;
(* Da -: float -> int = <fun> *)
float_of_int;;
(* Da -: int -> float = <fun> *)
int_of_char;;
(* Da -: char -> int = <fun> *)
char_of_int;;
(* Da -: int -> char = <fun> *)
abs;;
(* Da -: int -> int = <fun> *)
sqrt;;
(* Da -: float -> float = <fun> *)
truncate;;
(* Da -: float -> int = <fun> *)
ceil;;
(* Da -: float -> float = <fun> *)
floor;;
(* Da -: float -> float = <fun> *)
Char.code;;
(* Da -: char -> int = <fun> *)
String.length;;
(* Da -: string -> int = <fun> *)
fst;;
(* Da -: 'a * 'b -> 'a = <fun>*)
snd;;
(* Da -: 'a * 'b -> 'b = <fun>*)
let f = function x -> 2 * x ;;
(* Da val f : int -> int = <fun> *)
f (2+1);;
(* Da -: int = 6 *)
f 2 + 1;;
(* Da -: int = 5 *)
let n = 10;;
(* Da val n : int = 10 *)
let sum = function n -> function x -> n + x;;
(* Da val sum : int -> int -> = <fun> *)
sum 5;;
(* Da -: int -> int = <fun> *)
sum 1 2;;
(* Da -: int = 3 *)
let n = 1;;
(* Da val n : int = 1 *)
sum n 10;;
(* Da -: int = 11 *)
let sumn = sum n;;
(* Da val sumn : int -> int = <fun> *)
sumn 100;;
(* Da -: int = 101 *)
let n = 1000;;
(* Da val n : int = 1000 *)
sumn 100;;
(* Da -: int = 101 *)

(*EXPRESiONES 3*)
let u = 4+5+6+7+8;;

let v = sqrt 4.;;

let w = char_of_int 65;;

let x = not true;;

let y = if 5<4 then "un 8" else "un 10";;

let z = (4, -5);;
