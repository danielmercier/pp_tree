open Libadalang

let files = List.tl (Array.to_list Sys.argv)

let ctx = AnalysisContext.create ()

let pp_file fmt f =
  let u = AnalysisContext.get_from_file ctx f in
  match AnalysisUnit.root u with
  | Some node ->
      Format.fprintf fmt "@[<v 2>%s:@ %a@]" f AdaNode.pp_tree node
  | None ->
      Format.fprintf fmt "@[<v 2>%s:@ None@]" f

let () = Format.printf "@[<v>%a@ @]" (Format.pp_print_list pp_file) files
