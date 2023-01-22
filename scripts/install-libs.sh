#!/bin/bash

git clone https://github.com/nikodemus/sb-daemon /root/quicklisp/local-projects/sb-daemon
git clone https://github.com/mishoo/sytes /root/quicklisp/local-projects/sytes

wget -O chroma.tar.gz https://github.com/alecthomas/chroma/releases/download/v2.4.0/chroma-2.4.0-linux-amd64.tar.gz
tar -xvzf chroma.tar.gz
mv chroma /usr/bin
