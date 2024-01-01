type state =
  | Done
  | Loading
//   | Error(string)

@react.component
let default = () => {
  // Don't care, didn't ask, token gets exposed in network request anyways.
  let client = SimpleFM.simpleFm(~key="64346b97f7b9f6b97f29b37e3e1c521c")

  let (state, setState) = React.useState(_ => Loading)
  let (data, setData) = React.useState(_ => Js.Obj.empty())

  React.useEffect(() => {
    setData(_ => Js.Obj.empty()) // required to make "setData" a name in the scope :/
    let data = client.user.getRecentTracks({"username": "lexisother"})

    open Js.Promise2
    Js.Promise2.resolve(data)
    ->then(res => {
      // Required due to type-safety quirkiness
      %raw(`setData(() => res)`)
      setState(_ => Done)

      resolve()
    })
    ->ignore

    None
  }, [])

  switch state {
  | Loading => <div> {React.string("Loading...")} </div>
  | Done => {
      open Option

      let data: SimpleFM.Types.recentTracksRes = data // typecasting because apparently that's possible
      let playing = data["search"]["nowPlaying"]
      let latest = data["tracks"][0]->getUnsafe
      <div>
        <h1> {React.string(playing ? "now playing!" : "last played")} </h1>
        <br />
        <blockquote>
          <a href={latest["url"]}>
            {React.string(`${latest["artist"]["name"]} - ${latest["name"]}`)}
          </a>
        </blockquote>
      </div>
    }
  //   | Error(msg) => <div> {React.string(msg)} </div>
  }
}
