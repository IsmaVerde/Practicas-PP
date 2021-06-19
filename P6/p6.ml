(*PRACTICA 6 PP*)
let l = [1;2;3;4;5;6;7];;
let m = [1;3;5;7];;

let split = function l -> (List.map fst l, List.map snd l);;

let combine = 
	function l -> function m -> 
	(List.map2 (function a -> function x -> (a,x)) l m);;

let length l = 
	List.fold_left (fun a _ -> a +1) 0 l;;

let append l m =
	List.fold_right (fun h t -> h::t) l m;;

let rev l = 
	List.fold_left (fun a x -> x::a) [] l;;
    
let concat l = 
	List.fold_left ( @ ) [] l;;
  (* la complejidad es mayor usando fold_right*)
let partition f l = 
	(List.filter f l),(List.filter (fun x -> if f x then false else true) l);;

let remove_all f l = 
	List.filter (fun a' -> a'<>f) l;;

let ldif l m = match m with
	[]-> l
	|_->List.fold_right remove_all m l;;

let lprod l m = 
	List.concat(List.map (fun a' ->List.map (fun b'->a',b') m) l);;

let multicomp l = 
	List.fold_right(fun f g a' -> f (g a')) l (fun a ->a);;
 
