#!/bin/sh
# Lager en frittstående index.html (for f.eks. GitHub Pages) av app.html.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="nb">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n</head>\n<body style="margin:0">\n'
  cat app.html
  printf '\n</body>\n</html>\n'
} > index.html
