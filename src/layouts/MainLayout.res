type nav = {name: string, link: string, emoji: string}
type hnav = {name: string, emoji: string, links: array<nav>}
@module("data/data.json") external hnavs: array<hnav> = "nav"

@react.component
let make = (~components=MarkdownComponents.default, ~children) => {
  <>
    <div className="container">
      <header>
        <div className="h-card">
          <img className="u-photo" src="/static/img/aly.png" width="48" height="48" />
          <a className="p-name p-author u-url" href="https://alyxia.dev">
            {React.string("alyxia")}
          </a>
        </div>
        <nav>
          {hnavs
          ->Array.map(hnav => {
            let navs =
              hnav.links
              ->Array.map(v => {
                <li>
                  <i className="emoji" ariaHidden=true> {React.string(v.emoji)} </i>
                  <a href=v.link> {React.string(v.name)} </a>
                </li>
              })
              ->React.array

            <>
              <p>
                <i className="emoji" ariaHidden=true> {React.string(hnav.emoji)} </i>
                {React.string(hnav.name)}
              </p>
              <ul> navs </ul>
            </>
          })
          ->React.array}
        </nav>
      </header>
      <main>
        <MdxProvider components> children </MdxProvider>
      </main>
      <footer>
        <img src="/static/img/88x31/self.png" />
        {React.string(" ")}
        <span> {React.string("♥")} </span>
        {React.string(" ")}
        <a href="https://github.com/lexisother/alyxia.dev" target="_blank" rel="noopener nofollow">
          {React.string("source code")}
        </a>
      </footer>
    </div>
  </>
}
