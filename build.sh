#!/bin/sh
# Lager en frittstående index.html (for GitHub Pages) av app.html.
# Publiser: git push origin main && git push origin main:gh-pages
cd "$(dirname "$0")"
ICON='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 64 64%22%3E%3Crect width=%2264%22 height=%2264%22 rx=%2212%22 fill=%22%230a4f9e%22/%3E%3Crect x=%226%22 y=%226%22 width=%2252%22 height=%2252%22 rx=%228%22 fill=%22none%22 stroke=%22white%22 stroke-width=%224%22/%3E%3Ctext x=%2232%22 y=%2246%22 text-anchor=%22middle%22 font-family=%22Arial,sans-serif%22 font-weight=%22700%22 font-size=%2236%22 fill=%22white%22%3EP%3C/text%3E%3C/svg%3E'
{
  printf '<!doctype html>\n<html lang="nb">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta name="theme-color" content="#0a4f9e">\n<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">\n<meta name="apple-mobile-web-app-capable" content="yes">\n<meta name="mobile-web-app-capable" content="yes">\n<meta name="apple-mobile-web-app-title" content="Parkering">\n'
  printf '<link rel="icon" href="%s">\n<link rel="apple-touch-icon" href="kart/ikon.png">\n' "$ICON"
  # samme luft rundt hakk og hjemlinje som claude.ai gir artifacts
  printf '<style>:root{padding:env(safe-area-inset-top,0px) 0 env(safe-area-inset-bottom,0px)}</style>\n'
  printf '</head>\n<body style="margin:0">\n'
  cat app.html
  printf '\n</body>\n</html>\n'
} > index.html
