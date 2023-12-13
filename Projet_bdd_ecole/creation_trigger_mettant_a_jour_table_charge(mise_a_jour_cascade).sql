CREATE OR ALTER TRIGGER TRG_MajCharge
ON PROFESSEURS
AFTER DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF (SELECT COUNT(*) FROM deleted) > 0
    BEGIN
        -- Supprimer les charges associées au professeur supprimé
        DELETE FROM CHARGE WHERE NUM_PROF = (SELECT NUM_PROF FROM deleted);
    END
    ELSE IF (SELECT COUNT(*) FROM inserted) > 0 AND (SELECT NUM_PROF FROM inserted) <> (SELECT NUM_PROF FROM deleted)
    BEGIN
        -- Mettre à jour le numéro du professeur dans la table CHARGE
        UPDATE CHARGE SET NUM_PROF = (SELECT NUM_PROF FROM inserted) WHERE NUM_PROF = (SELECT NUM_PROF FROM deleted);
    END
END;