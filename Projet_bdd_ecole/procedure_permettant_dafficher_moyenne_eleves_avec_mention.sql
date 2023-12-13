-- Exemple pour SQL Server
CREATE PROCEDURE pr_resultat
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @num_eleve INT;
    DECLARE @moyenne DECIMAL(10, 2);
    DECLARE @mention VARCHAR(20);

    -- Déclaration du curseur pour parcourir les élèves
    DECLARE eleve_cursor CURSOR FOR
    SELECT DISTINCT NUM_ELEVE FROM RESULTATS;

    OPEN eleve_cursor;

    FETCH NEXT FROM eleve_cursor INTO @num_eleve;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Calcul de la moyenne pour chaque élève
        SELECT @moyenne = AVG(points)
        FROM RESULTATS
        WHERE NUM_ELEVE = @num_eleve;

        -- Attribution de la mention en fonction de la moyenne
        IF @moyenne < 10 
            SET @mention = 'Échec';
        ELSE IF @moyenne < 12 
            SET @mention = 'Passable';
        ELSE IF @moyenne < 14 
            SET @mention = 'Assez bien';
        ELSE IF @moyenne < 16 
            SET @mention = 'Bien';
        ELSE
            SET @mention = 'Très bien';

        -- Affichage des résultats
        PRINT 'Élève ' + CAST(@num_eleve AS VARCHAR(10)) + ' - Moyenne : ' + CAST(@moyenne AS VARCHAR(10)) + ' - Mention : ' + @mention;

        FETCH NEXT FROM eleve_cursor INTO @num_eleve;
    END;

    CLOSE eleve_cursor;
    DEALLOCATE eleve_cursor;
END;
