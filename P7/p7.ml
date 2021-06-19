(*PRACTICA 7 PP*)
let l = [4;5;6;9];;
let m = [1;2;3];;
let k = [(1,2);(3,4);(5,6)];;

(*let rec suml = function
[] -> 0
| h::t -> h + suml t;;
*)
let suml l = List.fold_left (+) 0 l;;

(*let rec maxl = function
[] -> raise (Failure "maxl")
| h::[] -> h
| h::t -> max h (maxl t);;
*)
let maxl = function
    [] -> raise (Failure "maxl")
  | h::t -> List.fold_left max h t;;

(*let rec to0from n =
if n < 0 then []
else n :: to0from (n-1);;
*)
let init n f =
  let rec aux c i n f =
	if i<0 then raise(Invalid_argument "init")
	else if i >= n then c
    else aux ((f i) :: c) (i+1) n f
  in List.rev (aux [] 0 n f);;
(*LIST.INIT NO COMPILA*)

let to0from n=
    if n < 0 then []
    else List.rev(init (n+1) (fun n -> n));;

(*let rec fromto m n =
if m > n then []
else m :: fromto (m+1) n;;
*)
let fromto m n =
    if m > n then []
    else init (n-m+1) (fun n -> n+m);;

(*let rec from1to n =
if n < 1 then []
else from1to (n-1) @ [n];;
*)
let from1to n =
    if n < 1 then []
    else init (n) (fun n -> n+1);;

(*let append =
List.append;;
*)	
let append l m =
  let rec aux a l m =
    match l, m with
    | [], [] -> List.rev a
    | [], h :: t -> aux (h :: a) [] t
    | h :: t, l -> aux (h :: a) t l
  in aux [] l m;;

(*let map =
List.map;;
*)
let map f l =
  let rec aux a = function
    | [] -> a
    | h :: t -> aux (a @ [f h]) t
  in aux [] l;;

(*let power x y =
let rec innerpower x y =
if y = 0 then 1
else x * innerpower x (y-1)
in
if y >= 0 then innerpower x y
else invalid_arg "power";; *)

let power x y =
	if y<0 then invalid_arg "power" else
		let rec aux y acc =match y with
		| 0 -> acc
		| _ -> aux (y-1) (x*acc)
	in aux y 1;;

(*let incseg l =
List.fold_right (fun x t -> x::List.map ((+) x) t) l [];; *)

let incseg l =
	let rec aux l acc = match l,acc with
		| [],_ -> List.rev acc
		| h1::t1,[] -> aux t1 [h1]
		| h1::t1,h2::t2 -> aux t1 (h1+h2::acc)
	in aux l [];;

(*let rec remove x = function
[] -> []
| h::t -> if x = h then t
else h :: remove x t;;
*)
let remove x l =
	let rec aux l acc = match l with
		| [] -> acc
		| h::t -> if x=h then aux [] (List.rev_append acc t) else aux t (h::acc)
	in aux l [];;

(*let rec insert x = function
[] -> [x]
| h::t -> if x <= h then x::h::t
else h :: insert x t;; *)

let rec insert x l =
  let rec aux des = function
	[]->List.rev_append des[x]
  | h::t -> if x <= h then List.rev_append des(x::h::t)
			else aux(h::des)t
	in aux[]l;;

(*let rec insert_gen f x l = match l with
[] -> [x]
| h::t -> if f x h then x::l
else h :: insert_gen f x t;; *)

let insert_gen f x l =
	let rec aux l des = match l with
		| [] -> List.rev (x::des)
		| h::t -> if f x h then List.rev_append (x::des) l else aux t (h::des)
	in aux l [];;
