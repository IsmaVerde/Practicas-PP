open List;;

let split_firsts n l =
    let n1 = (n+1) / 2 and n2 = n / 2 in
        let rec cut i l =
             if i > 0 then cut (i-1) (tl l)
             else l
        in (n1, l, n2, cut n1 l);;

let rec merge_t ord l1 l2 = 
    let rec lista acc ord l1 l2 = match l1,l2 with
        [],l | l,[] -> rev_append acc l
        | h1::t1, h2::t2 -> 
             if ord h1 h2 then lista (h1::acc) ord t1 l2
             else lista (h2::acc) ord l1 t2
    in lista [] ord l1 l2;;

let msort3 ord l = 
	let rec sort ord n l = match n with
         0 -> []
        | 1 -> [hd l]
        | _ -> 
         let n1, l1, n2, l2 = split_firsts n l in
         merge_t ord (sort ord n1 l1) (sort ord n2 l2)
    in sort ord (length l) l;;

(*Hay una mejora considerable en los tiempos de ejecucion de un 44,85%, ya que msort2 = 1.70698, msort3 = 1.17846 para una lista de 100_000 elementos*)
