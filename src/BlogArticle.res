module Params = {
  type t = {slug: string}
}

type props = {mdxSource: MdxRemote.output, path: string, slug: string}

let default = (props: props) => {
  let {mdxSource, path, slug} = props

  let children =
    <MdxRemote
      frontmatter={mdxSource.frontmatter}
      compiledSource={mdxSource.compiledSource}
      scope={mdxSource.scope}
      components={MarkdownComponents.default}
    />

  let fm = mdxSource.frontmatter->BlogFrontmatter.decode

  let content = switch fm {
  | Ok({id, title, description, date}) =>
    <article>
      <h1> {React.string(title)} </h1>
      <p>
        <a href=slug> {React.string(date)} </a>
      </p>
      <div className="e-content"> children </div>
    </article>
  | Error(msg) => <div> {React.string(msg)} </div>
  }

  content
}

let getStaticProps: Next.GetStaticProps.t<props, Params.t> = async ctx => {
  open Next.GetStaticProps
  let {params} = ctx

  let path = switch BlogApi.getAllPosts()->Js.Array2.find(({path}) =>
    BlogApi.blogPathToSlug(path) == params.slug
  ) {
  | None => params.slug
  | Some({path}) => path
  }

  let filePath = Node.Path.resolve("blog", path)

  let source = filePath->Node.Fs.readFileSync

  let mdxSource = await MdxRemote.serialize(
    source,
    {parseFrontmatter: true, mdxOptions: MdxRemote.defaultMdxOptions},
  )

  let slug = params.slug
  let props = {mdxSource, path, slug}

  {"props": props}
}

let getStaticPaths: Next.GetStaticPaths.t<Params.t> = async () => {
  open Next.GetStaticPaths

  let paths = BlogApi.getAllPosts()->Belt.Array.map(postData => {
    params: {
      Params.slug: BlogApi.blogPathToSlug(postData.path),
    },
  })

  {paths, fallback: false}
}
