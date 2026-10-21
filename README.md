# Parkering Bergen sentrum

En app for soneparkering i Bergen sentrum. Brukere kan

- foreslå plasser (navn, gate, bydel, sone, ca. antall plasser) og plassere dem på kartet,
- melde om det er ledig når de selv står der (mye ledig / noen ledige / nesten fullt / fullt,
  ca. antall ledige og kommentar),
- sortere plassene etter avstand fra seg selv (GPS, eller trykk på kartet).

Meldinger eldre enn 2 timer vises som utdatert. En liten annonselinje under kartet kan
redigeres av eier/redaktører.

Kartet fyller skjermen. På mobil ligger plassene i et ark som dras opp fra bunnen, på PC i en
fast kolonne til venstre. De offentlige parkeringshusene (ByGarasjen, KlosterGarasjen,
GriegGarasjen og NordnesGarasjen) ligger inne fra start, med lenke til sanntidsledige plasser hos
Bergen Parkering. Status meldes med ett trykk, og «Kjør hit» åpner veibeskrivelse.

### Sanntid fra P-husene

På den frittstående nettsiden henter appen ledige plasser og ledige ladere for ByGarasjen,
KlosterGarasjen og GriegGarasjen hvert 45. sekund fra
`https://ledig-parkering.no/wp-json/lpark/v1/live` – samme kilde som bergenparkering.no bruker.
Data eldre enn 5 minutter vises ikke. Dette er ikke et dokumentert, offisielt API, så det kan
endre seg; da faller appen tilbake til lenken til Bergen Parkering. På claude.ai vises bare
lenken, fordi artifacts ikke får hente data fra andre nettsteder.

## Filer

- `app.html` – selve appen (brukes som delt claude.ai-artifact, med felles database).
- `build.sh` – lager `index.html`, en frittstående versjon (f.eks. for GitHub Pages).
  Utenfor claude.ai lagres data bare i nettleseren (localStorage).
- `kart/plasser.json` – kommunens avgiftsplasser (parkeringsautomater og parkometre fra Bergen kommunes Parkeringskart), slått sammen per gatestrekning.
- `kart/soner.json` – boligsonene, parkeringsforbudssoner og betalingsautomater fra Bergen kommunes Boligsonekart (Bymiljøetaten).
- `kart/` – kartgrunnlag fra Kartverket (topo, CC BY 4.0): `kart-z15.jpg`/`kart-z16.jpg` dekker sentrum med Sandviken, Møhlenpris, Solheimsviken og Fjellsiden, `kart.jpg` er et skarpere bilde av selve sentrum.

## Nettsiden

Appen ligger på <https://charcooler.github.io/parkering-bergen/> (GitHub Pages fra grenen
`gh-pages`). Etter endringer i `app.html`: kjør `./build.sh`, commit, og
`git push origin main && git push origin main:gh-pages`. På mobil kan siden legges på
hjemskjermen («Legg til på Hjem-skjerm») og åpnes som en app.

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
