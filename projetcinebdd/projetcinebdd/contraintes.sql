ALTER TABLE utilisateurs
ADD CONSTRAINT ConsulterSexe
CHECK (sexe IN ('homme', 'femme'));


ALTER TABLE utilisateurs
ADD CONSTRAINT UniquePseudo
UNIQUE (pseudo);

ALTER TABLE CreaOrPro
ADD CONSTRAINT DF_CreaOrPro_role
DEFAULT 'Créateur' FOR role;