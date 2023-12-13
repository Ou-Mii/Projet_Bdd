CREATE FUNCTION fn_moyenne (
    @num_etudiant INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @moyenne DECIMAL(10, 2);

    SELECT @moyenne = AVG(points) 
    FROM RESULTATS
    WHERE NUM_ELEVE = @num_etudiant;

    RETURN @moyenne;
END;