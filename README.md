# Parkering Bergen sentrum

En app for soneparkering i Bergen sentrum. Brukere kan

- foreslå plasser (navn, gate, bydel, sone, ca. antall plasser) og plassere dem på kartet,
- melde om det er ledig når de selv står der (mye ledig / noen ledige / nesten fullt / fullt,
  ca. antall ledige og kommentar),
- sortere plassene etter avstand fra seg selv (GPS, eller trykk på kartet).

Meldinger eldre enn 2 timer vises som utdatert. En liten annonselinje under kartet kan
redigeres av eier/redaktører.

## Filer

- `app.html` – selve appen (brukes som delt claude.ai-artifact, med felles database).
- `build.sh` – lager `index.html`, en frittstående versjon (f.eks. for GitHub Pages).
  Utenfor claude.ai lagres data bare i nettleseren (localStorage).
- `kart/` – kartgrunnlag for Bergen sentrum fra Kartverket (topo, CC BY 4.0).
