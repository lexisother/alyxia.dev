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

module RssFeed = {
  // Module inspired by
  // https://gist.github.com/fredrikbergqvist/36704828353ebf5379a5c08c7583fe2d

  // Example reference example for RSS 2.0:
  // http://static.userland.com/gems/backend/rssTwoExample2.xml

  type item = {
    title: string,
    href: string,
    description: string,
    pubDate: Js.Date.t,
  }

  let dateToUTCString = date => {
    date->Js.Date.setHours(15.0)->ignore
    date->Js.Date.toUTCString
  }

  let getLatest = (~max=10, ~baseUrl="https://alyxia.dev", ()): array<item> => {
    let items =
      getAllPosts()
      ->Js.Array2.map(post => {
        let fm = post.frontmatter
        let description = Js.Null.toOption(fm.description)->Belt.Option.getWithDefault("")
        {
          title: fm.title,
          href: baseUrl ++ "/blog/" ++ blogPathToSlug(post.path),
          description,
          pubDate: DateStr.toDate(fm.date),
        }
      })
      ->Js.Array2.slice(~start=0, ~end_=max)
    items
  }

  let toXmlString = (~siteTitle="alyxia.dev blog", ~siteDescription="", items: array<item>) => {
    let latestPubDateElement =
      Belt.Array.get(items, 0)
      ->Belt.Option.map(item => {
        let latestPubDateStr = item.pubDate->dateToUTCString
        `<lastBuildDate>${latestPubDateStr}</lastBuildDate>`
      })
      ->Belt.Option.getWithDefault("")

    let itemsStr =
      items
      ->Js.Array2.map(({title, pubDate, description, href}) => {
        let descriptionElement = switch description {
        | "" => ""
        | desc =>
          `<description>
            <![CDATA[${desc}]]>
          </description>`
        }

        let dateStr = pubDate->dateToUTCString
        `
        <item>
          <title><![CDATA[${title}]]></title>
          <link> ${href} </link>
          <guid> ${href} </guid>
          ${descriptionElement}
          <pubDate>${dateStr}</pubDate>
        </item>
      `
      })
      ->Js.Array2.joinWith("\n")

    let ret = `<?xml version="1.0" encoding="utf-8" ?>
    <rss version="2.0">
      <channel>
        <title>${siteTitle}</title>
        <link>https://alyxia.dev</link>
        <description>${siteDescription}</description>
        <language>en</language>
        ${latestPubDateElement}
        ${itemsStr}
      </channel>
    </rss>`

    ret
  }
}
