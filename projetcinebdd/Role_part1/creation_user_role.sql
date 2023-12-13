-- Création des rôles
CREATE ROLE admin;
CREATE ROLE data_engineer;
CREATE ROLE data_analyst;
CREATE ROLE data_scientist;
CREATE ROLE stagiaire;
CREATE ROLE metier;

-- Attribution des autorisations aux rôles be like:

-- Administrateur
GRANT ALL PRIVILEGES ON  projetcinebdd TO admin;

-- Data Engineer
GRANT CONNECT, CREATE, INSERT, CREATE DB, DROPDB, CREATE VIEW, DROP VIEW TO data_engineer;

-- Data Analyst
GRANT CONNECT, SELECT, CREATE VIEW TO data_analyst;

-- Data Scientist
GRANT CONNECT,SELECT, CREATE DB, INSERT, CREATE VIEW, DROP VIEW TO data_scientist;

-- Stagiaire 
GRANT LOGIN, PASSWORD  TO stagiaire ;


-- Métier
GRANT CONNECT, SELECT TO metier;

-- Création des utilisateurs
CREATE USER Our_admin WITH PASSWORD = 'ourpwd';
CREATE USER Another_admin WITH PASSWORD = 'antherpwd';

CREATE USER Oumii_data_engineer WITH PASSWORD = 'oumiipwd';
CREATE USER Ndeye_data_engineer WITH PASSWORD = 'ndeyepwd';

CREATE USER Fatou_data_analyst WITH PASSWORD = 'fatoupwd';
CREATE USER Awa_data_analyst WITH PASSWORD = 'awapwd';

CREATE USER Badara_data_scientist WITH PASSWORD = 'badarapwd';
CREATE USER Yaye_data_scientist WITH PASSWORD = 'yayepwd';

CREATE USER Wilfrid_stagiaire WITH PASSWORD = 'wilfridpwd';
CREATE USER Franck_stagiaire WITH PASSWORD = 'franckpwd';

CREATE USER Bati_metier WITH PASSWORD = 'batipwd';
CREATE USER Someone_metier WITH PASSWORD = 'smeonepwd';

-- Attribution des rôles aux utilisateurs
GRANT admin TO Our_admin, Another_admin;
GRANT data_engineer TO Oumii_data_engineer, Ndeye_data_engineer;
GRANT data_analyst TO Fatou_data_analyst, Awa_data_analyst;
GRANT data_scientist TO Badara_data_scientist, Yaye_data_scientist;
GRANT stagiaire TO Wilfrid_stagiaire, Franck_stagiaire;
GRANT metier TO Bati_metier, Someone_metier;
