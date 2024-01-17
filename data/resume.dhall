let Link = ./types/Link.dhall

let Resume = ./types/Resume.dhall

in  Resume::{
    , name = "Alyxia Sother"
    , tagline = "Archmage of Engineering"
    , links =
      [ Link::{ title = "email", url = "mailto:alyxia@riseup.net" }
      , Link::{
        , title = "website"
        , description = "alyxia.dev"
        , url = "https://alyxia.dev"
        }
      , Link::{
        , title = "github"
        , description = "@lexisother"
        , url = "https://github.com/lexisother"
        }
      , Link::{
        , title = "mastodon"
        , description = "@alyxia@is.nota.live"
        , url = "https://is.nota.live/@alyxia"
        }
      ]
    }
