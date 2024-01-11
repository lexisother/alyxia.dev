let HNav = ./types/HNav.dhall

let Nav = ./types/Nav.dhall

let nav =
      [ HNav::{
        , name = "pages"
        , emoji = "🌙"
        , links =
          [ Nav::{ name = "blog", link = "/blog/", emoji = "📗" }
          , Nav::{ name = "friends", link = "/friends/", emoji = "💚" }
          , Nav::{ name = "contact", link = "/contact/", emoji = "✉️" }
          ]
        }
      ]

in  nav
