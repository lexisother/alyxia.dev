type t = {
  id: string,
  title: string,
  description: Js.null<string>,
  date: DateStr.t,
}

@scope("JSON") @val
external parse: string => t = "parse"

let decode = (json: Js.Json.t): result<t, string> => {
  let str = Js.Json.stringifyAny(json)

  switch str {
  | Some(str) => Ok(str->parse)
  | None => Error("fuck")
  }
}
