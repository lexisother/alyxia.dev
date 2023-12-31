type params = {slug: string}

type props = {posts: array<BlogApi.post>}

let default = (props: props): React.element => {
  let {posts} = props

  let content = if Belt.Array.length(posts) === 0 {
    <div className="mt-8">
      <h1> {React.string("Blog not yet available")} </h1>
    </div>
  } else {
    <>
      <h2> {React.string("blog")} </h2>
      <ul>
        {Js.Array2.map(posts, post => {
          <li>
            <time dateTime=post.frontmatter.date> {React.string(post.frontmatter.date)} </time>
            {React.string(" ")}
            <a href={"/blog/" ++ post.frontmatter.id}> {React.string(post.frontmatter.title)} </a>
          </li>
        })->React.array}
      </ul>
    </>
  }

  content
}

let getStaticProps: Next.GetStaticProps.t<props, params> = async _ctx => {
  let posts = BlogApi.getAllPosts()

  let props = {
    posts: posts,
  }

  {"props": props}
}
