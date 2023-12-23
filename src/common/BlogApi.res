module GrayMatter = {
  type output = {
    data: Js.Json.t,
    content: string,
  }

  @module("gray-matter") external matter: string => output = "default"
}

type post = {
  path: string,
  frontmatter: BlogFrontmatter.t,
}

let blogPathToSlug = path => {
  path->Js.String2.replaceByRe(%re(`/\d\d\d\d-\d\d-\d\d-(.+)\.mdx$/`), "$1")
}

let getAllPosts = () => {
  let postsDirectory = Node.Path.join2(Node.Process.cwd(), "blog")

  let mdFiles = dir => {
    Node.Fs.readdirSync(dir)->Js.Array2.filter(path => Node.Path.extname(path) === ".mdx")
  }

  let posts = mdFiles(postsDirectory)->Js.Array2.map(path => {
    let {GrayMatter.data: data} =
      Node.Path.join2(postsDirectory, path)->Node.Fs.readFileSync->GrayMatter.matter

    switch BlogFrontmatter.decode(data) {
    | Error(msg) => Js.Exn.raiseError(msg)
    | Ok(d) => {
        path,
        frontmatter: d,
      }
    }
  })

  posts->Js.Array2.sortInPlaceWith((a, b) => {
    String.compare(Node.Path.basename(b.path), Node.Path.basename(a.path))->Float.toInt
  })
}
