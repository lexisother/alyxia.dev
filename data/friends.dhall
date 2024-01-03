let Friend = ./types/Friend.dhall

let friends =
      [ Friend::{
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
        , name = "Birb"
        , image = "birb.png"
        , link = "https://miaowi.ng"
        }
      ]

in  friends
