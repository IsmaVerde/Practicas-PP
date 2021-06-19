let remove n l = 
    let rec borrar aux n l = match l with 
        |[] -> List.rev aux
        |h::t -> if n = h then List.rev_append aux t
                 else borrar (h::aux) n t
    in borrar [] n l;;

let remove_all n l = 
        let rec borrar aux n l = match l with 
                |[] -> List.rev aux
                |h::t -> if n = h then borrar aux n t
                    else borrar (h::aux) n t
        in borrar [] n l;;

let rec ldif l1 l2 = match l2 with 
	|[] -> l1
	|h::t -> ldif (remove_all h l1) t;;

(*let rec prod n l1 l2 = match l1 with 
	[] -> l2 
	|h::t -> prod n t ((n,h)::l2);;

let lprod l1 l2 =
	let rec lista ll l1 l2 = match l1 with
		[] -> rev ll
		|h::t -> lista (prod h l2 ll) t l2
	in lista [] l1 l2;;
*)

let lprod l1 l2 =
	let rec aux1 acc1 = function
	     [] -> List.rev acc1
	     | h1::t1 -> let rec aux2 acc2 = function
	                     [] -> acc2
			     | h2::t2 -> aux2  ((h1,h2)::acc2) t2
                        in aux1 (aux2 acc1 l2) t1
        in aux1 [] l1;;

(*let lprod l1 l2 =
  let rec aux acc = function
      ([], _) -> List.rev acc

    | (_::t1, []) -> aux acc (t1, l2)

    | (h1::t1, h2::t2) -> aux ((h1,h2)::acc) (h1::t1, t2)

  in
    aux [] (l1, l2)
  ;;
let lprod l1 l2 = flatten (map (function x -> map (function y -> (x, y)) l2) l1);;*)

let divide ll =
    let rec lista i ll l1 l2 = match ll with
        |[] -> List.rev l1, List.rev l2
        |h::t -> 
              if (i mod 2) = 0 then lista (i + 1) t l1 (h::l2)
              else lista (i + 1) t (h::l1) l2
    in lista 1 ll [] [];;
