(*BiNTREE*)
type 'a bin_tree = Empty | Node of 'a * 'a bin_tree * 'a bin_tree;;

let arbol = Node (1, Node(2,Node(4,Empty,Empty),Node(5,Empty,Empty)),
Node(3,Node(6,Empty,Empty),Node(7,Empty,Empty)));;

let breadth_first arbol = 
	let rec aux rest acc = match rest with
	[] -> List.rev acc
	|Empty::t -> aux t acc 
	|Node(r,i,d)::t -> aux (t@[i]@[d]) (r::acc)
in aux [arbol] [];;


let rec breadthBT tree =
if tree=Empty then []
else let Node(w,l,r)=tree in (w::breadthBT l)@breadthBT r;;

(*GTREE*)
type 'a g_tree = Gt of 'a * 'a g_tree list;;

let rec breadth_first = function
Gt (x, []) -> [x]
| Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

let breadth_first_t arbol = 
	let rec aux arbol acc = match arbol with
		| Gt (x, []) -> x::acc
		| Gt (x, (Gt (y, t2))::t1) -> aux (Gt (y, List.rev_append (List.rev t1) t2)) (x::acc)
	in List.rev(aux arbol []);;

let arbol = Gt (1,[Gt (2,[Gt (4,[]);Gt (5,[])]);Gt (3,[Gt (6,[])])]);;


let arbol2 = Gt (1,[Gt (2,[Gt (4,[]);Gt (5,[])]) ;Gt (3,[Gt (6,[])]) ;Gt (7,[Gt (8,[])])]);;

let rec init_gtree n =
	if (n <= 0) then
		Gt(0,[])
	else 
		let p = init_gtree(n-1)
	in Gt(n,[p;p]);;

let t = init_gtree 100000;;
breadth_first arbol;;
(*Stack overflow during evaluation (looping recursion?).*)
breadth_first_t arbol;;

