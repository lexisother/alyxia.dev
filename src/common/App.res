type pageComponent = React.component<{.}>
type pageProps = {.}

type props = {"Component": pageComponent, "pageProps": pageProps}

@get
external frontmatter: React.component<{.}> => Js.Json.t = "frontmatter"

let make = (props: props): React.element => {
  let component = props["Component"]
  let pageProps = props["pageProps"]

  let router = Next.Router.useRouter()

  let content = React.createElement(component, pageProps)

  let url = router.route->Url.parse

  switch Belt.List.fromArray(url) {
  | list{"blog"} => content
  | list{"packages"} => content
  | list{"blog", ..._rest} => content
  | _ => <div> content </div>
  }
}
