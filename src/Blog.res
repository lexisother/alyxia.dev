type params = {slug: string}

type props = {posts: array<BlogApi.post>}

let default = (props: props): React.element => {
  let {posts} = props

  let content = if Belt.Array.length(posts) === 0 {
    <div className="mt-8">
      <h1> {React.string("Blog not yet available")} </h1>
    </div>
  } else {
    <div>
      {Js.Array2.map(posts, post => {
        <a href={"/blog/" ++ post.frontmatter.id}>
          <h3> {React.string(post.frontmatter.title)} </h3>
        </a>
      })->React.array}
    </div>
  }

  content
}

let getStaticProps: Next.GetStaticProps.t<props, params> = async _ctx => {
  let posts = BlogApi.getAllPosts()
  Console.log(posts)

  let props = {
    posts: posts,
  }

  {"props": props}
}
