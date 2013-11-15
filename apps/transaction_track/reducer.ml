let unpack : string -> int*int = Util.unmarshal in
let (key, values) = Program.get_input() in
let rawVals = List.map (fun elem -> unpack elem) values in
let compare (bid1, _) (bid2,_) = if bid1 < bid2 then -1
                else if bid1 > bid2 then 1 else 0 in
let sum = List.fold_left (fun acc v ->
    if snd v = 0 then
        0
    else
        acc + (snd v) )
    0 (List.sort compare rawVals) in
    Program.set_output [string_of_int sum]