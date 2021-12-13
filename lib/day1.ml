let count_increases depths =
  let _, num_increases =
    depths
    |> Seq.fold_left
         (fun (last, num_increases) d ->
           let num_increases =
             match last with
             | Some last when d > last -> num_increases + 1
             | _ -> num_increases
           in
           (Some d, num_increases))
         (None, 0)
  in
  num_increases

let rec sliding_window (seq : int Seq.t) =
  match seq () with
  | Nil -> Seq.empty
  | Cons (x, seq) -> (
      match seq () with
      | Nil -> Seq.empty
      | Cons (y, seq) -> (
          match seq () with
          | Nil -> Seq.empty
          | Cons (z, seq) ->
              Seq.(cons (x + y + z) (sliding_window (cons y (cons z seq))))))

let run part file =
  CCIO.with_in file (fun ic ->
      let depths = CCIO.read_lines_seq ic |> Seq.map int_of_string in
      match part with
      | `Part_1 -> count_increases depths
      | `Part_2 -> count_increases (sliding_window depths))
