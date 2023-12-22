type pageComponent = React.component<{.}>
type pageProps = {.}

type props = {"Component": pageComponent, "pageProps": pageProps}

let make = (props: props): React.element => {
  let component = props["Component"]
  let pageProps = props["pageProps"]

  let router = Next.Router.useRouter()

  let content = React.createElement(component, pageProps)

  let url = router.route

  <div> {React.string("hi")} </div>
}
