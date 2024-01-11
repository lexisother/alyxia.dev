let Nav = ./types/Nav.dhall

let nav =
      [ Nav::{ name = "blog", link = "/blog/", emoji = "📗" }
      , Nav::{ name = "friends", link = "/friends/", emoji = "💚" }
      , Nav::{ name = "contact", link = "/contact/", emoji = "✉️" }
      ]

in  nav
