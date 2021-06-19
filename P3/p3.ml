(*EJERCICIO 1*)
let f = function x -> function y -> function z ->(z > y) || ((x <> y) && (z / (x - y) > y));;

let f = function x -> function y -> function z ->
if (z>y) then true else (if (x<>y) then (z/(x-y)>y) else false);;

false && (2/0 > 0);;
(* Pense que devolveria -: bool -> bool, pero devuelve -: bool = false debido a que siempre es falso y obviaria la excepcion de division por cero*)
true && (2/0 > 0);;
(*En este caso no da un resultado y si sale la excepcion por division por cero*)
true || (2 / 0 > 0);;
(*Aqui obvia la excepcion de la division por 0 y dara como resultado -: bool = true *)
false || (2 / 0 > 0);;
(*Aqui da la excepcion por division por 0 *)
let con = (&&);;
(*Da como resultado val con : bool -> bool -> bool = <fun> *)
let dis = (||);;
(*Da como resultado val dis : bool -> bool -> bool = <fun> *)
(&&) (1 < 0) (2 / 0 > 0);;
(*Da como resultado - : bool = false *)
con (1 < 0) (2 / 0 > 0);;
(*Da una excepcion por division por cero *)
(||) (1 < 0) (2 / 0 > 0);;
(*Da una excepcion por division por cero *)
dis (1 < 0) (2 / 0 > 0);;
(*Da una excepcion por division por cero *)

(*EJERCICIO 2*)
let curry = function f -> (function a -> (function b -> f(a,b)));;
let uncurry =  function g -> (function (a,b) -> g a b);;
uncurry(+);;
(*Devuelve como resultado - : int * int -> int = <fun> *)
let sum = (uncurry(+));;
(*Define sum como val sum: int * int -> int = <fun> *)
(* sum 1;;
Da error de tipo porque la funcion debe aplicarse a un par*)
sum(2,1);;
(*Da como resultado - : int = 3 *)
let g = curry(function p -> 2 * fst p + 3 * snd p);;
(*Define g como val g : int -> int -> int = <fun> *)
(* g(2,5);;
Da error de tipo porque la definicion de g no permite que se aplique a pares*)
let h = g 2;;
(*Define h como val h: int -> int = <fun> *)
h 1, h 2, h 3;;
(*Da como resultado - : int*int*int = (7,10,13) *)

(*EJERCICIO 3 *)
let comp = function f -> function g -> function x -> f(g(x));;
let f2 = let square x = x * x in comp square ((+)1);;
(*Define f2 como val f2 : int -> int = <fun> *)
f2 1, f2 2, f2 3;;
(*Da como resultado - : int * int * int = (4,9,16) *)
