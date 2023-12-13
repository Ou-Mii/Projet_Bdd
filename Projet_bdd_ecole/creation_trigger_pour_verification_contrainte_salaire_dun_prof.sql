CREATE TRIGGER TR_SalaireProfesseur
ON PROFESSEURS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(SALAIRE_ACTUEL)
    BEGIN
        IF (SELECT COUNT(*) FROM inserted i INNER JOIN deleted d ON i.NUM_PROF = d.NUM_PROF WHERE i.SALAIRE_ACTUEL < d.SALAIRE_ACTUEL) > 0
        BEGIN
            RAISERROR ('Le salaire d''un Professeur ne peut pas diminuer.', 16, 1);
            ROLLBACK;
        END
    END
END;