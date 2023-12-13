INSERT INTO pays (pays_ID, nompays)
VALUES
  (1, 'États-Unis'),
  (2, 'Japon'),
  (3, 'Chine'),
  (4, 'Luxembourg'),
  (5, 'France'),
  (6, 'Sénégal');


INSERT INTO CreaOrPro (producteurCreateurID, prenom, nom, role)
VALUES
  (1, 'Steven', 'Spielberg', 'Producteur'),
  (2, 'Christopher', 'Nolan', 'Créateur'),
  (3, 'Spielberg', 'Spielberg', 'Producteur'),
  (4, 'Martin', 'Scorsese', 'Créateur'),
  (5, 'George', 'Lucas', 'Producteur et Créateur'),
  (6, 'David', 'Fincher', 'Créateur'),
  (7, 'J.J.', 'Abrams', 'Producteur et Créateur'),
  (8, 'Stanley', 'Kubrick', 'Créateur'),
  (9, 'James', 'Cameron', 'Producteur et Créateur'),
  (10, 'Alfred', 'Hitchcock', 'Créateur');


INSERT INTO acteur (acteurID, prenom, nom)
VALUES
  (1, 'Tom', 'Hanks'),
  (2, 'Leonardo', 'DiCaprio'),
  (3, 'Meryl', 'Streep'),
  (4, 'Brad', 'Pitt'),
  (5, 'Cate', 'Blanchett'),
  (6, 'Denzel', 'Washington'),
  (7, 'Angelina', 'Jolie'),
  (8, 'Johnny', 'Depp'),
  (9, 'Julia', 'Roberts'),
  (10, 'Bryan', 'Cranston'),
  (11, 'Bryan', 'Cranston');

INSERT INTO notes (noteid, valeurnote, datenote, type)
VALUES
  (1, 8, '2023-01-01', 'Critique'),
  (2, 9, '2023-01-02', 'Appréciation'),
  (3, 7, '2023-01-03', 'Note générale'),
  (4, 6, '2023-01-04', 'Avis personnel'),
  (5, 8, '2023-01-05', 'Critique'),
  (6, 9, '2023-01-06', 'Appréciation'),
  (7, 5, '2023-01-07', 'Note générale'),
  (8, 7, '2023-01-08', 'Avis personnel'),
  (9, 8, '2023-01-09', 'Critique'),
  (10, 9, '2023-01-10', 'Appréciation'),
  (11, 8, '2023-01-11', 'Critique'),
  (12, 9, '2023-01-12', 'Appréciation'),
   (13, 4, '2023-01-03', 'Critique'),
  (14, 6, '2023-01-04', 'Appréciation');


INSERT INTO forum (ForumID, titre, datedenvoie, texte)
VALUES
  (1, 'Discussion générale', '2023-01-01', 'Ceci est un forum de discussion.'),
  (2, 'Séries TV populaires', '2023-01-02', 'Parlons des séries TV qui font sensation en ce moment.'),
  (3, 'Cinéma et Réalisateurs', '2023-01-03', 'Échangez sur vos réalisateurs de cinéma préférés et leurs œuvres.'),
  (4, 'Nouvelles Sorties', '2023-01-04', 'Discutons des dernières sorties cinématographiques et télévisuelles.'),
  (5, 'Technologies du Film', '2023-01-05', 'Parlons des avancées technologiques dans le monde du cinéma et de la télévision.'),
  (6, 'Théories de Séries', '2023-01-06', 'Partagez vos théories sur les séries TV et discutons-en.'),
  (7, 'Acteurs en Vogue', '2023-01-07', 'Qui sont les acteurs les plus en vogue actuellement ? Partagez vos opinions.'),
  (8, 'Hommages Cinématographiques', '2023-01-08', 'Rendons hommage aux grands classiques du cinéma.'),
  (9, 'Coups de Cœur Séries', '2023-01-09', 'Quelles séries recommandez-vous ? Partagez vos coups de cœur.'),
  (10, 'Coulisses de Tournage', '2023-01-10', 'Découvrez les coulisses de tournage des séries et des films.');



INSERT INTO series (serieID, annees, titre, datedecreation, pays_ID)
VALUES
  (1, 2005, 'Breaking Bad', '2005-01-20', 1),
  (2, 2010, 'Mindhunter', '2010-05-15', 1),
  (3, 2009, 'Death Note', '2009-02-10', 2),
  (4, 2001, 'Dynasty', '2001-01-01', 3),
  (5, 2011, 'Alert', '2011-01-01', 3),
  (6, 2021, 'Pooky', '2021-01-01', 4),
  (7, 2002, 'Lucifer', '2002-01-01', 2),
  (8, 2015, 'Big Bang Theory', '2015-01-01', 6),
  (9, 2022, 'Je déteste Noël', '2022-01-01', 5),
  (10, 2020, 'Virgin River', '2020-01-01', 4);


INSERT INTO CreaOrProSerie (serieID, producteurCreateurID)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);


INSERT INTO episodes (episodeID, titre, duree, datepremierediffusion, saisonNumero, realisateur, producteurCreateurID, serieID)
VALUES
(1 ,'episode1','01:10:00', '2015-08-20', 2, 7, 2, 5),
 (2, 'Travail', '01:00:00', '2005-01-20', 1, 2, 3, 4),
  (3, 'Season Finale', '01:15:00', '2010-05-15', 1, 3, 1, 2),
  (4, 'Special Episode', '00:50:00', '2008-12-25', 2, 4, 2, 4),
  (5, 'The Premiere', '00:55:00', '2012-03-05', 1, 5, 1, 1),
  (6, 'Mid-Season Break', '01:10:00', '2015-08-20', 2, 6, 2, 5),
  (7, 'Crossover Event', '01:30:00', '2016-11-12', 3, 7, 1, 3),
  (8, 'Premier Épisode', '00:45:00', '2007-09-24', 1, 8, 8, 8),
  (9, 'Deuxième Épisode', '00:40:00', '2007-10-01', 1, 9, 8, 8),
  (13, 'Épisode A', '00:30:00', '2023-01-01', 1, 1, 1, 1),
  (14, 'Épisode B', '00:30:00', '2023-01-02', 1, 1, 1, 1);


INSERT INTO notesEpisode (episodeID, noteid)
VALUES
  (1, 2),
  (1, 4),
  (2, 3),
  (3, 4),
  (4, 5),
   (8, 11),
  (9, 12),
   (13, 13),
  (14, 14);

INSERT INTO ActeurEpisode (episodeID, acteurID)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 11),
  (6, 11);







INSERT INTO genre (genreID, nomGenre)
VALUES
  (1, 'Action'),
  (2, 'Comédie'),
  (3, 'Drame'),
  (4, 'Science-Fiction'),
  (5, 'Horreur');


INSERT INTO genreserie (serieID, genreID)
VALUES
  (1, 1),
  (1,2),
  (1,4),
  (2, 2),
  (3, 1),
  (4, 2);

  INSERT INTO utilisateurs (utilisateurID, pseudo, DatedInscription, age, sexe, genreID, noteid)
VALUES
  (1, 'Utilisateur1', '2023-01-05', 25, 'Homme', 2, 1),
  (2, 'Utilisateur2', '2023-02-20', 30, 'Femme', 1, 2),
  (3, 'Utilisateur3', '2023-03-25', 22, 'Femme', 3, 3),
  (4, 'Utilisateur5', '2023-02-20', 30, 'Femme', 1, 2),
  (5, 'Azrod95', '2023-03-25', 22, 'Femme', 3, 3),
  (6, 'Utilisateur11', '2023-01-11', 25, 'Homme', 2, 11),
  (7, 'Utilisateur12', '2023-01-12', 30, 'Femme', 1, 12),
    (8, 'Utilisateur8', '2023-01-05', 25, 'Homme', 2, 13),
  (9, 'Utilisateur9', '2023-01-06', 30, 'Femme', 1, 14);


  INSERT INTO UtilisateurForum (utilisateurID, ForumID)
VALUES
  (3, 1),
  (4, 1),
  (5, 2);


  
INSERT INTO series (serieID, annees, titre, datedecreation, pays_ID)
VALUES
  (11, 2010, 'Série A', '2010-01-01', 1),
  (12, 2015, 'Série B', '2015-01-01', 2),
  (13, 2012, 'Série C', '2012-01-01', 3);


INSERT INTO episodes (episodeID, titre, duree, datepremierediffusion, saisonNumero, realisateur, producteurCreateurID, serieID)
VALUES
  (20, 'Épisode 1', '00:45:00', '2010-01-10', 1, 1, 1, 11),
  (21, 'Épisode 2', '00:40:00', '2010-01-17', 1, 2, 1, 11),
  (22, 'Épisode 1', '00:45:00', '2015-02-05', 1, 3, 2, 12),
  (23, 'Épisode 2', '00:40:00', '2015-02-12', 1, 4, 2, 12),
  (24, 'Épisode 1', '00:45:00', '2012-01-20', 1, 5, 3, 13),
  (25, 'Épisode 2', '00:40:00', '2012-01-27', 1, 6, 3, 13);


INSERT INTO notes (noteid, valeurnote, datenote, type)
VALUES
  (30, 9, '2023-01-30', 'Critique'),
  (31, 8, '2023-02-05', 'Appréciation'),
  (32, 9, '2023-02-10', 'Avis personnel'),
  (33, 7, '2023-02-15', 'Note générale'),
  (34, 9, '2023-02-20', 'Critique'),
  (35, 8, '2023-02-25', 'Appréciation');


INSERT INTO notesEpisode (episodeID, noteid)
VALUES
  (20, 30),
  (21, 31),
  (22, 32),
  (23, 33),
  (24, 34),
  (25, 35);







