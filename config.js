// Innstillinger for den frittstående nettsiden (index.html).
// Fyll inn Firebase-nøklene for å lagre plasser og meldinger felles for alle.
// Uten nøkler lagres alt bare i hver enkelt nettleser.
window.PARKERING_CONFIG = {
  firebase: {
    apiKey: "",
    authDomain: "",
    projectId: "",
    appId: "",
  },
  // Annonselinjen under kartet. La text være tom for å vise plassholderen.
  ad: {
    text: "",
    url: "",
  },
};
