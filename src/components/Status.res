type status = {content?: string, face?: string, timeAgo?: string}
type state =
  | Done
  | Loading

@react.component
let default = () => {
  let (state, setState) = React.useState(_ => Loading)
  let (data, setData) = React.useState(_ => None)

  React.useEffect(() => {
    let getData = async () => {
      let res = await Fetch.get("https://status.cafe/users/alyxia/status.json")
      let data = await res->Fetch.Response.json
      Console.log(data)
      setData(_ => Some(data))
    }

    open Promise
    getData()
    ->then(() => {
      setState(_ => Done)
      resolve()
    })
    ->ignore

    None
  }, [])

  switch state {
  | Loading => <div> {React.string("Loading status...")} </div>
  | Done => {
      open Option
      open JsonCombinators
      open JsonCombinators.Json.Decode

      let data = data->getUnsafe->Js.Json.stringify
      let decode = object(field => {
        content: field.required("content", string),
        face: field.required("face", string),
        timeAgo: field.required("timeAgo", string),
      })
      let data = data->Json.parseExn->Json.decode(decode)->Result.getOr({})

      <div>
        <h1> {React.string("latest status")} </h1>
        <br />
        <blockquote>
          <div className="status-meta">
            <a href="https://status.cafe/users/alyxia"> {React.string("alyxia")} </a>
            <span> {React.string(data.face->getUnsafe)} </span>
            <span className="subtle"> {React.string(data.timeAgo->getUnsafe)} </span>
          </div>
          <div dangerouslySetInnerHTML={"__html": data.content->getUnsafe} />
        </blockquote>
      </div>
    }
  }
}
