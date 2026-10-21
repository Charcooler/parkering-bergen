// Innstillinger for den frittstående nettsiden (index.html).
// Fyll inn Firebase-nøklene for å lagre plasser og meldinger felles for alle.
// Uten nøkler lagres alt bare i hver enkelt nettleser.
window.PARKERING_CONFIG = {
  firebase: {
    apiKey: "AIzaSyA6TDAy4xkRBRdxkkpvAyqc03-v4M7kmhg",
    authDomain: "parkering-bergen.firebaseapp.com",
    projectId: "parkering-bergen",
    appId: "1:933377180:web:69f04ac1cda03e5fa0a959",
  },
  // Annonselinjen under kartet. La text være tom for å vise plassholderen.
  ad: {
    text: "",
    url: "",
  },
};
