let f = function x -> x;;

let g = function x -> x, x;;

let h = function (x, y) -> x;;

let i = function (x, y) -> y;;

let j = function x -> [x];;
(*Solo una de cada una menos de la ultima, que podemos escribir infinitas combinaciones ya que x -> [x;...;x] y seguiria teniendo el tipo 'a -> 'a list*)

(*Se podrian escribir tantas funciones como funciones del tipo exn haya*)
let k = function x -> raise Not_found;;
(*Lo que tienen en comun es que todas son aplicadas a funciones predefinidas como las de error (tipo exn)*)

(*Solo se puede escribir esta funcion de 'a -> 'b list*)
let l = function x -> [];;

(*let fun_123_ab f = (f [1;2;3]) + (f ['a';'b']);;*) 

(*No es posible hacer una funcion asi porque una vez que se aplica f a una int list [1;2;3] se queda como una funcion de int list -> int por lo que al aplicarla luego a un char list da error ya que solo podria utilizarse en int list*)

(*let ff l = function f -> f l;;
let f2 f = f ['a';'b'];;
let fun_123_ab f = 
    let aux = fun f l -> f (l)
    in (aux f [1;2;3]) + (aux f ['a';'b']);;
let fun_123_ab f = 
    let aux f l1 l2 = 
        (ff l1 f) + (ff l2 f)
    in aux f [1;2;3] ['a';'b'];;*)
