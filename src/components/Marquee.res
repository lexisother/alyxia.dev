// Don't even ask.

%%raw(`import * as React from "react"`)

@react.component
let make = (~children) => {
  %raw(`React.createElement("marquee", {
              truespeed: "",
              scrolldelay: "30",
              scrollamount: "3"
        }, props.children)
  `)
}
