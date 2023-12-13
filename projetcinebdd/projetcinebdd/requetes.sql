--Quel est la liste des séries de la base ?
SELECT *
 FROM series;
--Combien de pays différents ont créé des séries dans notre base ?.
SELECT COUNT(DISTINCT pays_ID) AS nb_pays 
FROM series;

--Quels sont les titres des séries originaires du Japon, triés par titre ?
SELECT titre
FROM series
WHERE pays_ID =2 
ORDER BY titre;
--Combien y a-t-il de séries originaires de chaque pays ?
SELECT pays_ID, 
COUNT(*) AS nb_series 
FROM series 
GROUP BY pays_ID

--Combien de séries ont été créés entre 2001 et 2015?
SELECT COUNT(*) AS nb_series 
FROM series
 WHERE annees BETWEEN 2001 AND 2015;
--Quelles séries sont à la fois du genre « Comédie » et « Science-Fiction » ?
SELECT DISTINCT s.titre FROM series s
JOIN genreserie gs1 ON s.serieID = gs1.serieID AND gs1.genreID = 1
JOIN genreserie gs2 ON s.serieID = gs2.serieID AND gs2.genreID = 4;
--Quels sont les séries produites par « Spielberg », affichés par date décroissantes ?
SELECT s.titre, cp.nom, s.datedecreation
FROM series s
JOIN CreaOrProSerie cps ON s.serieID = cps.serieID
JOIN CreaOrPro cp ON cps.producteurCreateurID = cp.producteurCreateurID
WHERE cp.producteurCreateurID = 1
ORDER BY s.datedecreation DESC;
---Afficher les séries Américaines par ordre de nombre de saisons croissant.
SELECT s.titre, COUNT(e.serieID) AS nb_saisons FROM series s
LEFT JOIN episodes e ON s.serieID = e.serieID
WHERE s.pays_ID = 1
GROUP BY s.titre
ORDER BY nb_saisons ASC;
--Quelle série a le plus d’épisodes ?
SELECT TOP 1 s.titre, COUNT(e.episodeID) AS nb_episodes
FROM series s
LEFT JOIN episodes e ON s.serieID = e.serieID
GROUP BY s.titre
ORDER BY nb_episodes DESC;
--La série « Big Bang Theory » est-elle plus appréciée des hommes ou des femmes
SELECT 
    s.titre,
    AVG(CASE WHEN u.sexe = 'Homme' THEN n.valeurnote END) AS moyenne_hommes,
    AVG(CASE WHEN u.sexe = 'Femme' THEN n.valeurnote END) AS moyenne_femmes
FROM 
    series s
JOIN 
    episodes e ON s.serieID = e.serieID
JOIN 
    notesEpisode ne ON e.episodeID = ne.episodeID
JOIN 
    notes n ON ne.noteid = n.noteid
JOIN 
    utilisateurs u ON n.noteid = u.noteid
WHERE 
    s.titre = 'Big Bang Theory'
GROUP BY 
    s.titre;
--Affichez les séries qui ont une note moyenne inférieure à 5, classé par note.
SELECT s.titre, AVG(n.valeurnote) AS moyenne_note
FROM series s
JOIN episodes e ON s.serieID = e.serieID
JOIN notesEpisode ne ON e.episodeID = ne.episodeID
JOIN notes n ON ne.noteid = n.noteid
GROUP BY s.titre
HAVING AVG(n.valeurnote) < 5
ORDER BY moyenne_note;
--Pour chaque série, afficher le commentaire correspondant à la meilleure note.
SELECT s.titre, n.type
FROM series s
JOIN episodes e ON s.serieID = e.serieID
JOIN notesEpisode ne ON e.episodeID = ne.episodeID
JOIN notes n ON ne.noteid = n.noteid
WHERE n.valeurnote = (SELECT MAX(valeurnote) FROM notes);
--Affichez les séries qui ont une note moyenne sur leurs épisodes supérieure à 8.
-- Séries avec une note moyenne sur les épisodes supérieure à 8
SELECT s.titre, AVG(n.valeurnote) AS Notesuperieur8
FROM series s
JOIN episodes e ON s.serieID = e.serieID
JOIN notesEpisode ne ON e.episodeID = ne.episodeID
JOIN notes n ON ne.noteid = n.noteid
GROUP BY s.titre
HAVING MAX(n.valeurnote) > 8
ORDER BY Notesuperieur8 DESC
;
--Afficher le nombre moyen d’épisodes des séries avec l’acteur « Bryan Cranston »
  SELECT AVG(nombre_episodes) AS nombre_moyen_episodes
FROM (
    SELECT s.serieID, COUNT(e.episodeID) AS nombre_episodes
    FROM acteur a
    JOIN ActeurEpisode ae ON a.acteurID = ae.acteurID
    JOIN episodes e ON ae.episodeID = e.episodeID
    JOIN series s ON e.serieID = s.serieID
    WHERE a.prenom = 'Bryan' AND a.nom = 'Cranston'
    GROUP BY s.serieID
) AS SeriesAvecBryanCranston;
--Quels acteurs ont réalisé des épisodes de série ?
SELECT DISTINCT a.acteurID, a.prenom, a.nom
FROM acteur a
JOIN ActeurEpisode ae ON a.acteurID = ae.acteurID;
--Quels acteurs ont joué ensemble dans plus de 80% des épisodes d’une série
SELECT a1.prenom AS acteur1_prenom, a1.nom AS acteur1_nom,
       a2.prenom AS acteur2_prenom, a2.nom AS acteur2_nom
FROM acteur a1
JOIN ActeurEpisode ae1 ON a1.acteurID = ae1.acteurID
JOIN episodes e ON ae1.episodeID = e.episodeID
JOIN ActeurEpisode ae2 ON e.episodeID = ae2.episodeID
JOIN acteur a2 ON ae2.acteurID = a2.acteurID
GROUP BY a1.acteurID, a1.prenom, a1.nom, a2.acteurID, a2.prenom, a2.nom
HAVING COUNT(DISTINCT e.episodeID) > 0.8 * (SELECT COUNT(DISTINCT e2.episodeID) FROM episodes e2);
--Quels acteurs ont joué dans tous les épisodes de la série « Breaking Bad » ?
SELECT a.prenom, a.nom
FROM acteur a
JOIN ActeurEpisode ae ON a.acteurID = ae.acteurID
JOIN episodes e ON ae.episodeID = e.episodeID
JOIN series s ON e.serieID = s.serieID
WHERE s.titre = 'Breaking Bad'
GROUP BY a.acteurID, a.prenom, a.nom, s.titre
HAVING COUNT(DISTINCT e.episodeID) = (SELECT COUNT(DISTINCT e2.episodeID) FROM episodes e2 WHERE s.titre = 'Breaking Bad');
--Quels utilisateurs ont donné une note à chaque série de la base
SELECT DISTINCT u.utilisateurID, u.pseudo
FROM utilisateurs u
JOIN notes n ON u.noteid = n.noteid
JOIN genreserie gs ON gs.genreID = u.genreID
JOIN series s ON gs.serieID = s.serieID
WHERE NOT EXISTS (
    SELECT gs2.serieID
    FROM genreserie gs2
    WHERE gs2.serieID = gs.serieID
    AND NOT EXISTS (
        SELECT n2.noteid
        FROM notes n2
        WHERE n2.noteid = n.noteid
        AND NOT EXISTS (
            SELECT ue.episodeID
            FROM ActeurEpisode ue
            JOIN episodes e ON ue.episodeID = e.episodeID
            WHERE e.serieID = gs2.serieID
            AND ue.acteurID = u.utilisateurID
        )
    )
);
--Les messages initiés par « Azrod95 » génèrent combien de réponses en moyenne ?
SELECT AVG(nombre_reponses) AS messageAzrod
FROM (
    SELECT COUNT(uf.ForumID) AS nombre_reponses
    FROM forum f
    JOIN UtilisateurForum uf ON f.ForumID = uf.ForumID
    JOIN utilisateurs u ON uf.utilisateurID = u.utilisateurID
    WHERE u.pseudo = 'Azrod95'
    GROUP BY f.ForumID
) AS sous_requete;




