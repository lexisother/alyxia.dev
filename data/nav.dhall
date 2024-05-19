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
      , HNav::{
        , name = "webring"
        , emoji = "🌐"
        , links =
          [ Nav::{ name = "previous", link = "https://webring.birb.cc/prev", emoji = "⏮️" }
          , Nav::{ name = "home", link = "https://webring.birb.cc", emoji = "🏠" }
          , Nav::{ name = "next", link = "https://webring.birb.cc/next", emoji = "⏭️" }
          ]
        }
      ]

in  nav
