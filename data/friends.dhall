let Friend = ./types/Friend.dhall

let friends =
      [ Friend::{
        , name = "Marsh"
        , image = "marsh.png"
        , link = "https://marsh.zone"
        }
      , Friend::{
        , name = "Chloe"
        , image = "chloe.png"
        , link = "https://arciniega.one"
        }
      , Friend::{
        , name = "Lily"
        , image = "lily.png"
        , link = "https://lylythii.com"
        }
      , Friend::{
        , name = "Lynne"
        , image = "lynne.png"
        , link = "https://youtu.be/K6TtKNB1fWg"
        }
      , Friend::{ name = "Nax", image = "nax.png", link = "https://nax.dev" }
      , Friend::{ name = "Maisy", image = "maisy.png", link = "https://maisy.moe" }
      , Friend::{
        , name = "Maru"
        , image = "maru.png"
        , link = "https://github.com/unclamped"
        }
      , Friend::{
        , name = "Mopi"
        , image = "mopi.jpg"
        , link = "https://estrogen.monster"
        }
      , Friend::{
        , name = "Amy"
        , image = "amy.gif"
        , link = "https://oomfie.town"
        }
      , Friend::{
        , name = "Molten"
        , image = "molten.png"
        , link = "https://moltencoredev.github.io"
        }
      , Friend::{
        , name = "birb"
        , image = "birb.png"
        , link = "https://miaowi.ng"
        }
      , Friend::{
        , name = "Baph"
        , image = "baph.gif"
        , link = "https://hentainetwork.xyz"
        }
      , Friend::{
        , name = "Maggie"
        , image = "maggie.gif"
        , link = "https://iusearchbtw.fun"
        }
      , Friend::{
        , name = "Marvin"
        , image = "marvin.png"
        , link = "https://nurmarv.in"
        }
      , Friend::{
        , name = "Noia"
        , image = "noia.png"
        , link = "https://noia.site"
        }
      , Friend::{
        , name = "Ashley"
        , image = "ashley.png"
        , link = "https://foxuccino.pages.gay/"
        }
      ]

in  friends
