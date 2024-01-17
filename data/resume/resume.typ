#let primary_colour = rgb("#3E0C87") // vivid purple

#let coloredLine() = {
     line(length: 100%, stroke: 1pt + primary_colour)
}

#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("icons/" + name + ".svg")
  )
  h(3pt)
}

#let findMe(services) = {
  set text(8pt)
  let icon = icon.with(shift: 2.5pt)

  services.map(service => {
    icon(service.name)

    if "display" in service.keys() {
      link(service.link)[#{service.display}]
    } else {
      link(service.link)
    }
    }).join(h(10pt))
}

#let term(period, location) = {
  text(9pt)[#icon("calendar") #period #h(1fr) #icon("location") #location]
}

#let alta(
  name: "",
  links: (),
  tagline: "",
  doc,
) = {
  set text(9.8pt, font: "Iosevka NF", tracking: 0.0225pt)
  set par(justify: true)
  set page(
    paper: "us-letter",
    margin: (x: 54pt, y: 52pt),
  )

  show heading.where(
    level: 2
  ): it => text(
      fill: primary_colour,
      font: "Iosevka NF",
    [
      #{it.body}
      #v(-7pt)
      #line(length: 100%, stroke: 1pt + primary_colour)
    ]
  )

  show heading.where(
    level: 4
  ): it => text(
    fill: primary_colour,
    font: "Iosevka NF",
    it.body
  )

  [= #name]
  if tagline.len() > 0 {
    ["#tagline" \ ]
  }
  findMe(links)

  columns(2, doc)
}

#let titleCompany(title, company) = [
  #text(10pt)[#title] #h(1fr) _#[#company]_
]

#let textAside(body) = {
  let cell = rect.with(
    width: 100%,
    radius: 0pt,
    stroke: none,
  )
  grid(
    columns: (auto, 4pt, 35pt),
    gutter: -1pt,
    cell(body),
  )
}

#show: doc => alta(
  name: "Alyxia Sother",
  links: (
    (name: "email", link: "mailto:alyxia@riseup.net"),
    (name: "website", link: "https://alyxia.dev/", display: "alyxia.dev"),
    (name: "github", link: "https://github.com/lexisother", display: "@lexisother"),
    // todo: guard with `if` block
    // (name: "linkedin", link: "", display: "alyxia sother"),
    (name: "mastodon", link: "https://is.nota.live/@alyxia", display: "@alyxia@is.nota.live"),
  ),
  tagline: "Yes.",
  doc,
)

#textAside[Hello, I'm Alyxia Sother. I'm an experienced software engineer based in The Netherlands, and a not-so-very prolific blogger. I do however enjoy writing when I get the chance.]

// todo: detail

If you want someone that is dedicated to their craft and a fearless innovator, please look no further. I'm more than willing to hear you out.

== Experience

#titleCompany[Archmage of Backend][Brik.digital]\
#term[2022-02 -- 2024-02][Venlo, NL]

At Brik.digital I directly influenced the betterment of internal processes such as code review and CI/CD workflows. Along with this, I've lead development of projects such as the new websites for local TV broadcasts and internal tooling.

This has easily been the best job I've ever had and it's had an enormous impact on how I operate and communicate within a team environment. For a while my actions were mostly gone unnoticed as it was small behind the scenes work, but as I was pulled into more of the processes here I've learnt more than I did at high school for four years.

#coloredLine()

#titleCompany[Software Engineer][Fyra Labs]\
#term[2023-03 -- 2023-10][Remote]

At Fyra Labs I helped with development of internal tools, rewrites of said tools, and lead some personal pet projects, such as my very own CMS capable of making simple text-based posts.

- Rewrote the entirety of the Discord bot used in the Fyra Labs server
- Handmade PHP CMS project, frontend of which is easily extendable through a handwritten JS module system

#coloredLine()

// get banished to the right column
\
\

== Projects

==== alyxia.dev\
Custom blog engine that powers #text(fill: blue)[#link("https://alyxia.dev")[alyxia.dev]]. It is a handcrafted work of art written in ReScript with two goals:

1. To be as "insane" as possible.
2. To be as fun as possible.

This project took some getting used to due to the use of Rescript, a language I hadn't previously written in before, but it's gone very well so far. I am starting to integrate more things into it, such as this resume.
