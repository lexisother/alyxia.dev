let Nav = ./Nav.dhall

in  { Type = { name : Text, emoji : Text, links : List Nav.Type }
    , default = { name = "", emoji = "", links = [] : List Nav.Type }
    }
