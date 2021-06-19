(*PRACTICA 8 PP*)

(*PARTE 1*)
open List;;

let rlist r n =
    let rec aux i l =
        if i > n then l
        else aux(i+1)(Random.int r::l)
    in aux 1[];;

let crono f x =
    let t = Sys.time() in
    f x;
    Sys.time() -.t;;
        
let rec qsort1 ord = function
[] -> []
| h::t -> let after, before = partition (ord h) t in
qsort1 ord before @ h :: qsort1 ord after;;
(*Al ser no terminal la implementacion de qsort1, esta funcion
tendra problemas con listas muy grandes*)

let rec qsort2 ord = function
[] -> []
| h::t -> let after, before = partition (ord h) t in
rev_append (rev (qsort2 ord before)) (h :: qsort2 ord after);;
(* qsort2 tiene la ventaja de ser terminal sobre qsort1,
lo que hace que se pueda aplicar a listas mucho mas grandes*)

let l1 = rlist 1000 400000;;
(* l1 no es ordenable por qsort1, da un stack overflow. En cambio,
 para qsort2, si es ordenable. *)

let lprueba = rlist 2500 50000;;
(*lista aleatoria usada para comprobar tiempo de ordenacion
-Tiempos medidos en una maquina virtual-
 qsort1: 0.505685 segundos
 qsort2: 0.537793 segundos
 qsort2 es mas lento devido a que utilizar rev_append y rev
 juntos es mas costoso en tiempo que utilizar @ como qsort1.
 Por ello, qsort2 tarda un 6% mas que qsort1 *)

let qsort3 ord l =
  let rec sort_asc = function
    [] -> []
    | h::t -> let after, before = partition (ord h) t in
      append (sort_des before) (h :: sort_asc after)
    and sort_des = function
    [] -> []
    | h::t -> let after, before = partition (ord h) t in
      append (sort_des before) (h :: sort_asc after)
    in sort_asc l;;
    
(* qsort3: 0.508557 segundos
  - un 6% mas rapido que qsort2
  - un 0.025% mas lento que qsort1  *)
