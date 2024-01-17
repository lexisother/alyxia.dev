let Link = ./Link.dhall

in  { Type = { name : Text, tagline : Text, links : List Link.Type }
    , default = { name = "", tagline = "", links = [] : List Link.Type }
    }
