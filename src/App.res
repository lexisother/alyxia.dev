@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  <div className="p-6">
    <nav>
      <ul className="flex flex-row gap-4 justify-center">
        <li>
          <Link href="/" isNavLink=true> {React.string("Home")} </Link>
        </li>
        <li>
          <Link href="/blog" isNavLink=true> {React.string("Blog")} </Link>
        </li>
      </ul>
    </nav>
    <main>
      {switch url.path {
      | list{} => <Home />
      | list{"blog"} => <Blog />
      | _ => <NotFound />
      }}
    </main>
  </div>
}
