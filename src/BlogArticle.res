module Params = {
  type t = {slug: string}
}

type props = {mdxSource: MdxRemote.output, path: string}

let default = (props: props) => {
  let {mdxSource, path} = props

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
    <div className="w-full">
      {React.string(title)}
      <div className="flex justify-center">
        <div className="max-w-740 w-full">
          children
          <div className="mt-12">
            <div className="pt-20 flex flex-col items-center">
              <div className="text-24 sm:text-32 text-center text-gray-80 font-medium">
                {React.string("Want to read more?")}
              </div>
              <Next.Link href="/blog" className="text-fire hover:text-fire-70">
                {React.string("Back to Overview")}
                <Icon.ArrowRight className="ml-2 inline-block" />
              </Next.Link>
            </div>
          </div>
        </div>
      </div>
    </div>
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

  let props = {mdxSource, path}

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
