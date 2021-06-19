open List;;
open Bintree;;

(*let bi = Node (1, Node (2, Node (5, Empty, Empty), Node (6, Node (9, Empty, Empty), Node (8, Empty, Empty))), Node (3, Node (4, Empty, Empty), Node (7, Empty, Empty)));;

let bi_completo = Node (1, Node (2, Node (5, Empty, Empty), Node (6, Empty, Empty)), Node (3, Node (4, Empty, Empty), Node (7, Empty, Empty)));;

let tree = Node (1, Node (2, Empty, Empty), Node (3, Empty, Empty));;*)

let rec strict = function
     Empty -> true
    |Node (x, Empty, Empty) -> true
    |Node (x, y, Empty) -> false
    |Node (x, Empty, z) -> false
    |Node (x, y, z) -> strict y && strict z;;

let rec sinhijos = function 
     [] -> true
    |Empty::t -> false
    |Node (x, Empty, Empty)::t -> sinhijos t
    |Node (x, y, z)::t -> false;;

let perfect t = if strict t then 
    (let rec norden = function
        | (res, [], next) -> norden (res, rev next, [])
        | (res, Node (x, y, z)::t, next) -> 
          if (y = Empty && z = Empty) then sinhijos t 
          else norden (x::res, t, rev_append [y;z] next)
        | (res, Empty::t, next) -> 
             norden (res, t, next)
    in norden ([], [t], []))
    else false;;

let rec altura = function
        Empty -> 0
      | Node (_,i,d) -> 1 + max (altura i) (altura d);;

let rec altura_izq = function
        Empty -> 0
      | Node (_,i,d) -> 1 + (altura_izq i);;

let rec igual acc = function
    [] -> true
    |h::t -> if altura h = acc then igual acc t
             else false;;  

let complete tree = if tree = Empty then false else
    (let rec norden = function
        | (res, [], next) -> norden (res, rev next, [])
        | (res, Node (x, y, z)::t, next) -> 
             if (altura_izq (Node (x, y, z)) = 1) then false
             else if (altura_izq (Node (x, y, z)) = 2) then 
                       igual 2 (Node (x, y, z)::t)
                  else norden (x::res, t, rev_append [y;z] next)
        | (res, Empty::t, next) -> 
             norden (res, t, next)
    in norden ([], [tree], []));;
