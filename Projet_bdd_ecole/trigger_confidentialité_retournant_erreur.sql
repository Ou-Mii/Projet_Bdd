CREATE OR ALTER TRIGGER TRG_AugmentationSalaire
ON PROFESSEURS
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Utilisateur VARCHAR(50);
    DECLARE @AugmentationPourcentage DECIMAL(5, 2);

    -- Récupérer les informations de l'utilisateur courant
    SET @Utilisateur = USER_NAME();

    -- Vérifier si l'utilisateur n'est pas 'GrandChef'
    IF @Utilisateur <> 'GrandChef'
    BEGIN
        -- Vérifier si le salaire est augmenté de plus de 20%
        SELECT @AugmentationPourcentage = (i.SALAIRE_ACTUEL - d.SALAIRE_ACTUEL) / d.SALAIRE_ACTUEL * 100
        FROM inserted i
        INNER JOIN deleted d ON i.NUM_PROF = d.NUM_PROF;

        IF @AugmentationPourcentage > 20
        BEGIN
            -- Annuler la modification et retourner une erreur
            RAISERROR('Modification interdite', -20002, 1);
            ROLLBACK;
        END
    END
END;