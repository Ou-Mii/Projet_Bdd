--1.
ALTER TABLE ELEVES
ADD CONSTRAINT check_sexe CHECK (SEXE IN ('m', 'M', 'f', 'F') OR SEXE IS NULL);

--2.
SELECT *
FROM PROFESSEURS
WHERE SALAIRE_ACTUEL > SALAIRE_BASE;

--3.
ALTER TABLE PROFESSEURS
ADD CONSTRAINT check_salaire_base_actuel CHECK (SALAIRE_BASE < SALAIRE_ACTUEL);

--4.
CREATE FUNCTION dbo.DoubleMoyenneSalaire(@specialite VARCHAR(20)) RETURNS INT
AS
BEGIN
    DECLARE @doubleMoyenne INT;
    SELECT @doubleMoyenne = 2 * AVG(SALAIRE_ACTUEL)
    FROM PROFESSEURS
    WHERE SPECIALITE = @specialite;

    RETURN @doubleMoyenne;
END;



