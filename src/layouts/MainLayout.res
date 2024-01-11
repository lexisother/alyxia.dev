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
          <p>
            <i className="emoji" ariaHidden=true> {React.string("🌙")} </i>
            {React.string("pages")}
          </p>
          <ul>
            <li>
              <i className="emoji" ariaHidden=true> {React.string("📗")} </i>
              <a href="/blog/"> {React.string("blog")} </a>
            </li>
            <li>
              <i className="emoji" ariaHidden=true> {React.string("💚")} </i>
              <a href="/friends/"> {React.string("friends")} </a>
            </li>
            <li>
              <i className="emoji" ariaHidden=true> {React.string("✉️")} </i>
              <a href="/contact/"> {React.string("contact")} </a>
            </li>
          </ul>
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
