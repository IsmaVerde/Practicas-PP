let hanoi (orig,aux,dest) n =
    if n<=0 then raise (Invalid_argument "hanoi")
    else
        let rec torre n a b c = 
           if n=1 then [(a,c)]
           else (torre (n - 1) a c b) @ (a,c) :: (torre (n - 1) b a c) 
        in torre n orig aux dest;;
