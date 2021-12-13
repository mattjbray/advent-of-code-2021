open CCFormat
open Advent_of_code_2021

let depths = [| 199; 200; 208; 210; 200; 207; 240; 269; 260; 263 |]

let () =
  printf "@[<hv 2>part 1:@ depths: %a@ -> %a increases@]@."
    (hbox (array int))
    depths int
    (Day1.count_increases (Array.to_seq depths))

let () =
  printf "@[<hv 2>part 2:@ depths: %a@ window: %a@ -> %a increases@]@."
    (hbox (array int))
    depths
    (hbox (array int))
    (Day1.sliding_window (Array.to_seq depths) |> Array.of_seq)
    int
    (Day1.count_increases (Day1.sliding_window (Array.to_seq depths)))
