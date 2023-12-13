
CREATE TABLE acteur (
   acteurID INT PRIMARY KEY,
   prenom VARCHAR(50) NOT NULL,
   nom VARCHAR(50) NOT NULL
);

CREATE TABLE CreaOrPro (
   producteurCreateurID INT PRIMARY KEY,
   prenom VARCHAR(50) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   role VARCHAR(50)
);

CREATE TABLE forum (
   ForumID INT PRIMARY KEY,
   titre VARCHAR(50) NOT NULL,
   datedenvoie DATE NOT NULL,
   texte VARCHAR(50) NOT NULL
);

CREATE TABLE genre (
   genreID INT PRIMARY KEY,
   nomGenre VARCHAR(50) NOT NULL
);

CREATE TABLE notes (
   noteid INT PRIMARY KEY,
   valeurnote INT NOT NULL,
   datenote DATE NOT NULL,
   type VARCHAR(50) NOT NULL
);

CREATE TABLE pays (
   pays_ID INT PRIMARY KEY,
   nompays VARCHAR(50) NOT NULL
);

CREATE TABLE series (
   serieID INT PRIMARY KEY,
   annees INT NOT NULL,
   titre VARCHAR(50) NOT NULL,
   datedecreation DATE NOT NULL,
   pays_ID INT NOT NULL,
   FOREIGN KEY (pays_ID) REFERENCES pays(pays_ID)
);

CREATE TABLE episodes (
   episodeID INT PRIMARY KEY,
   titre VARCHAR(50) NOT NULL,
   duree TIME NOT NULL,
   datepremierediffusion DATE NOT NULL,
   saisonNumero INT NOT NULL,
   realisateur INT,
   producteurCreateurID INT NOT NULL,
   serieID INT NOT NULL,
   FOREIGN KEY (producteurCreateurID) REFERENCES CreaOrPro(producteurCreateurID),
   FOREIGN KEY (realisateur) REFERENCES CreaOrPro(producteurCreateurID),
   FOREIGN KEY (serieID) REFERENCES series(serieID)
);

CREATE TABLE utilisateurs (
   utilisateurID INT PRIMARY KEY,
   pseudo VARCHAR(50) NOT NULL,
   DatedInscription DATE NOT NULL,
   age INT NOT NULL,
   sexe VARCHAR(50) NOT NULL,
   genreID INT NOT NULL,
   noteid INT NOT NULL,
   FOREIGN KEY (noteid) REFERENCES notes(noteid),
   FOREIGN KEY (genreID) REFERENCES genre(genreID)
);

CREATE TABLE CreaOrProSerie (
   serieID INT,
   producteurCreateurID INT,
   PRIMARY KEY (serieID, producteurCreateurID),
   FOREIGN KEY (serieID) REFERENCES series(serieID),
   FOREIGN KEY (producteurCreateurID) REFERENCES CreaOrPro(producteurCreateurID)
);

CREATE TABLE notesEpisode (
   episodeID INT,
   noteid INT,
   PRIMARY KEY (episodeID, noteid),
   FOREIGN KEY (episodeID) REFERENCES episodes(episodeID),
   FOREIGN KEY (noteid) REFERENCES notes(noteid)
);

CREATE TABLE ActeurEpisode (
   episodeID INT,
   acteurID INT,
   PRIMARY KEY (episodeID, acteurID),
   FOREIGN KEY (episodeID) REFERENCES episodes(episodeID),
   FOREIGN KEY (acteurID) REFERENCES acteur(acteurID)
);

CREATE TABLE UtilisateurForum (
   utilisateurID INT,
   ForumID INT,
   PRIMARY KEY (utilisateurID, ForumID),
   FOREIGN KEY (utilisateurID) REFERENCES utilisateurs(utilisateurID),
   FOREIGN KEY (ForumID) REFERENCES forum(ForumID)
);

CREATE TABLE genreserie (
   serieID INT,
   genreID INT,
   PRIMARY KEY (serieID, genreID),
   FOREIGN KEY (serieID) REFERENCES series(serieID),
   FOREIGN KEY (genreID) REFERENCES genre(genreID)
);
ALTER TABLE forum
ALTER COLUMN texte VARCHAR(250);


