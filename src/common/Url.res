type t = {
  fullpath: array<string>,
  base: array<string>,
}

let parse = (route: string): array<string> => {
  route->Js.String2.split("/")->Belt.Array.keep(s => s !== "")
}
