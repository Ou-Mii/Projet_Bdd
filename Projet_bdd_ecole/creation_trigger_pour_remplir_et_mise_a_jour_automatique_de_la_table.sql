CREATE TRIGGER TRG_MajProfSpecialite
ON PROFESSEURS
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @v_specialite VARCHAR(20);
    DECLARE @v_nb_professeurs INT;

    -- La spécialité du professeur affecté par l'opération
    SELECT TOP 1 @v_specialite = SPECIALITE FROM inserted;

    -- L nombre de professeurs pour cette spécialité
    SELECT @v_nb_professeurs = COUNT(*) FROM PROFESSEURS WHERE SPECIALITE = @v_specialite;

    -- Mise à jour de la table PROF_SPECIALITE
    IF UPDATE(SPECIALITE) 
    BEGIN 
        UPDATE PROF_SPECIALITE SET NB_PROFESSEURS = @v_nb_professeurs WHERE SPECIALITE = @v_specialite;
    END 
    ELSE IF (SELECT COUNT(*) FROM inserted) > 0
    BEGIN
        INSERT INTO PROF_SPECIALITE VALUES (@v_specialite, @v_nb_professeurs);
    END
    ELSE IF (SELECT COUNT(*) FROM deleted) > 0
    BEGIN
        UPDATE PROF_SPECIALITE SET NB_PROFESSEURS = @v_nb_professeurs WHERE SPECIALITE = @v_specialite;
    END
END;