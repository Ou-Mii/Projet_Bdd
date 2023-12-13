CREATE OR ALTER TRIGGER TRG_AuditResultats
ON RESULTATS
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Utilisateur VARCHAR(50);
    DECLARE @DateMaj DATETIME;
    DECLARE @DescMaj VARCHAR(20);
    DECLARE @NumEleve INT;
    DECLARE @NumCours INT;
    DECLARE @Points INT;

    -- Récupérer les informations de l'utilisateur courant
    SET @Utilisateur = USER_NAME();
    -- Récupérer la date de la modification
    SET @DateMaj = GETDATE();

    -- Pour chaque opération INSERT, UPDATE, DELETE
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Il y a eu une opération INSERT ou UPDATE
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            -- Il y a eu une opération UPDATE
            SET @DescMaj = 'UPDATE';
            SELECT @NumEleve = NUM_ELEVE, @NumCours = NUM_COURS, @Points = POINTS FROM inserted;
        END
        ELSE
        BEGIN
            -- Il y a eu une opération INSERT
            SET @DescMaj = 'INSERT';
            SELECT @NumEleve = NUM_ELEVE, @NumCours = NUM_COURS, @Points = POINTS FROM inserted;
        END
    END
    ELSE
    BEGIN
        -- Il y a eu une opération DELETE
        SET @DescMaj = 'DELETE';
        SELECT @NumEleve = NUM_ELEVE, @NumCours = NUM_COURS, @Points = POINTS FROM deleted;
    END

    -- Insérer les informations dans la table AUDIT_RESULTATS
    INSERT INTO AUDIT_RESULTATS (UTILISATEUR, DATE_MAJ, DESC_MAJ, NUM_ELEVE, NUM_COURS, POINTS)
    VALUES (@Utilisateur, @DateMaj, @DescMaj, @NumEleve, @NumCours, @Points);
END;