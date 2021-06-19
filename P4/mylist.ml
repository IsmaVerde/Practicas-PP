(*PRACTICA 4 PP*)
let l = [4;5;6];;
let m = [1;2;3];;
let hd = function
    [] -> failwith "hd"
  | a::l -> a;;

let tl = function
    [] -> failwith "tl"
  | a::l -> l;;

let length l =
    let rec aux = function
        ([],i)->i
        |(_::t,i)->aux(t,i+1)
        in aux(l,0);;

let compare_lengths l m =
    if length l>length m then length l
    else length m;;
 
let rec nth l x =
    if x=0 then hd l
    else nth (tl l) (x-1);;

let rec append l m = 
     match l with
  | h :: t -> h :: append t m
  | [] -> m;;

let init n f =
  let rec init' c i n f =
    if i >= n then c
    else init' ((f i) :: c) (i+1) n f
  in List.rev (init' [] 0 n f);;

let rec rev_append l1 l2 =
  match l1 with
    [] -> l2
  | a :: l -> rev_append l (a :: l2);;
    
let rev =
  let rec rev_apd c l =
    match l with
      [] -> c
    | h::t -> rev_apd (h::c) t in
  fun l -> rev_apd [] l;;
  
let rec concat = function
    [] -> []
  | l::r -> l @ concat r;;
  
let flatten = concat;;

let rec map f = function
    [] -> []
  | a::l -> let r = f a in r :: map f l;;
  
let rev_map f l =
  let rec rmap_f c = function
    | [] -> c
    | a::l -> rmap_f (f a :: c) l
  in rmap_f [] l;;
  
let rec map2 f l1 l2 =
  match (l1, l2) with
    ([], []) -> []
  | (a1::l1, a2::l2) -> let r = f a1 a2 in r :: map2 f l1 l2
  | (_, _) -> invalid_arg "List.map2";;
  
let rec fold_left f c l =
  match l with
    [] -> c
  | a::l -> fold_left f (f c a) l;;
  
let rec fold_right f l c =
  match l with
    [] -> c
  | a::l -> f a (fold_right f l c);;
  
let rec find p = function
  | [] -> raise Not_found
  | x :: l -> if p x then x else find p l;;
  
let rec for_all p = function
    [] -> true
  | a::l -> p a && for_all p l;;
  
let rec exists p = function
    [] -> false
  | a::l -> p a || exists p l;;
  
let rec mem x = function
    [] -> false
  | a::l -> compare a x = 0 || mem x l;;

let filter p =
  let rec find c = function
  | [] -> rev c
  | x :: l -> if p x then find (x :: c) l else find c l in
  find [];;
  
let find_all=filter;;

let partition p l =
  let rec part yes no = function
  | [] -> (rev yes, rev no)
  | x :: l -> if p x then part (x :: yes) no l else part yes (x :: no) l in
  part [] [] l;;

let rec split = function
    [] -> ([], [])
  | (x,y)::l ->
      let (rx, ry) = split l in (x::rx, y::ry);;
      
let rec combine l1 l2 =
  match (l1, l2) with
    ([], []) -> []
  | (a1::l1, a2::l2) -> (a1, a2) :: combine l1 l2
  | (_, _) -> invalid_arg "List.combine";;
