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

## Felles lagring på egen nettside (Firebase)

På claude.ai lagres alt felles automatisk. Den frittstående nettsiden (`index.html`,
f.eks. på GitHub Pages) bruker Firebase for felles lagring:

1. Gå til <https://console.firebase.google.com> og lag et prosjekt (gratisnivået holder).
2. **Build → Authentication → Get started → Sign-in method:** slå på **Anonymous**.
3. **Build → Firestore Database → Create database** (velg f.eks. `eur3`, start i *production mode*).
4. **Firestore → Rules:** lim inn innholdet i `firestore.rules` og trykk **Publish**.
5. **Project settings → General → Your apps → Web (`</>`):** registrer en app og kopier
   `apiKey`, `authDomain`, `projectId` og `appId` inn i `config.js`.
6. **Authentication → Settings → Authorized domains:** legg til `charcooler.github.io`.

Firebase-nøklene for nettsider er ikke hemmelige; tilgangen styres av `firestore.rules`.
Annonsen på nettsiden endres i `config.js` (`ad.text` og `ad.url`).
