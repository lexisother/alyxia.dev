#!/bin/bash

if command -v jpegoptim >/dev/null 2>&1 ; then
    echo "jpegoptim found"
    find ./public \( -iname "*.jpg" -o -iname "*.jpeg" \) | jpegoptim -p -P --files-stdin -w $(nproc --all)
else
    echo "jpegoptim was not found! install either with your package manager or get the binary from the github"
    echo "https://github.com/tjko/jpegoptim/releases/latest"
fi

if command -v oxipng >/dev/null 2>&1 ; then
    echo "oxipng found"
    oxipng -o max -a -r ./public
else
    echo "oxipng was not found! install with your package manager, cargo or get the binary from the github"
    echo "https://github.com/shssoichiro/oxipng/releases/latest"
fi
