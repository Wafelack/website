#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]
then
    echo "usage: $0 <name>"
    exit 1
fi

NAME=$(echo ${1,,} | sed -e "s/ /_/g")
cat >> "articles/${NAME}.html" << EOF
<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf8 />
        <meta name=viewport content="width=device-width, initial-scale=1.0" />
        <meta name=keywords content="Programming, Wafelack, Rust, Free Software" />
        <title>$1</title>
        <link rel=icon href=../assets/icon.png />
        <link rel=stylesheet type=text/css href=../master.css />
    </head>
    <body>
        <h1>$1</h1>
        <p><i>$(date +"%d %B %Y")</i></p>



        <a href="../">Go To Main Page</a>
    </body>
    <footer><hr>Copyright (C) 2021 Wafelack<br>All this website's content is licensed under <a href="https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1">CC BY-SA 4.0</a> license.</footer>
</html>
EOF
