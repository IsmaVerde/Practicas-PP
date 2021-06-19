let lowercase = function x -> Char.chr(32 + Char.code x);;

let uppercase = function x -> Char.chr(Char.code x - 32);;
