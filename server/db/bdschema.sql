DROP TABLE IF EXISTS vehicule CASCADE;
DROP TABLE IF EXISTS assureur CASCADE;
DROP TABLE IF EXISTS emplacement CASCADE;
DROP TABLE IF EXISTS assurance CASCADE;
DROP TABLE IF EXISTS membre CASCADE;
DROP TABLE IF EXISTS accident CASCADE;
DROP TABLE IF EXISTS facture CASCADE;
DROP TABLE IF EXISTS utilisation CASCADE;
DROP TABLE IF EXISTS reservation CASCADE;
DROP TABLE IF EXISTS hybride CASCADE;
DROP TABLE IF EXISTS berline CASCADE;
DROP TABLE IF EXISTS mini_camionnette CASCADE;

CREATE TABLE assureur
(
	id_assureur VARCHAR(7) PRIMARY KEY,
	nom_compagnie VARCHAR(30)
);


CREATE TABLE emplacement
(
	id_emplacement VARCHAR(7) PRIMARY KEY,
	nom_emplacement VARCHAR(90),
	no_rue INTEGER,
	rue VARCHAR(20),
	ville VARCHAR(20),
	code_postal VARCHAR(6),
	nb_stationnement INTEGER

);

CREATE TABLE vehicule
(
	immatriculation VARCHAR(7) PRIMARY KEY,
	consommation_essence NUMERIC, -- en  L/100 km
	prix_horaire NUMERIC,
	prix_distance NUMERIC, -- en dollar CA par km
	emplacement_origine VARCHAR(7) REFERENCES emplacement(id_emplacement),
	marque VARCHAR(30),
	modele VARCHAR(30),
	kilometrage NUMERIC,
	mise_en_service DATE,
	information_supplementaire VARCHAR(250)
);



CREATE TABLE assurance
(
	no_assurance VARCHAR(7) PRIMARY KEY,
	id_assureur VARCHAR(7) REFERENCES assureur(id_assureur),
	immatriculation VARCHAR(7) REFERENCES vehicule(immatriculation),
	debut DATE,
	fin DATE
);


CREATE TABLE membre
(
	id_membre VARCHAR(7) PRIMARY KEY,
	nom VARCHAR(50),
	permis_de_conduire VARCHAR(13), -- code sur le permis de conduire
	emplacement_origine VARCHAR(7) REFERENCES emplacement(id_emplacement),
	est_cooperatif BOOLEAN,
	est_autopartage BOOLEAN,
	est_physique BOOLEAN,
	mot_de_passe VARCHAR(40),
	date_de_naissance DATE,
	adresse_postale VARCHAR(250),
	ville VARCHAR(50),
	courriel VARCHAR(255),
	nombre_de_part NUMERIC, -- seulement pour les membre cooperatif
	numeroBanque VARCHAR(34),
	compteDeBanque VARCHAR(50),
	cotisation_annuelle NUMERIC
);

CREATE TABLE accident
(
	id_accident VARCHAR(7) PRIMARY KEY,
	date_accident DATE,
	temps_accident TIME,
	id_membre VARCHAR(7) REFERENCES membre(id_membre)
);

CREATE TABLE facture
(
	id_facture VARCHAR(7) PRIMARY KEY,
	cout_total NUMERIC,
	date_echeance DATE,
	est_payÃ©e BOOLEAN
);

CREATE TABLE utilisation
(
	id_utilisation VARCHAR(7) PRIMARY KEY,
	facture VARCHAR(7) REFERENCES facture(id_facture),
	emplacement VARCHAR(7) REFERENCES emplacement(id_emplacement),
	vehicule VARCHAR(7) REFERENCES vehicule(immatriculation),
	membre VARCHAR(7) REFERENCES membre(id_membre),
	odometre_avant NUMERIC,
	odometre_apres NUMERIC,
	date_debut DATE,
	heure_debut TIME,
	date_fin DATE,
	heure_fin TIME,
	cout NUMERIC
);

CREATE TABLE reservation
(
	id_reservation VARCHAR(7) PRIMARY KEY,
	emplacement VARCHAR(7) REFERENCES emplacement(id_emplacement),
	vehicule_desire VARCHAR(7) REFERENCES vehicule(immatriculation),
	membre VARCHAR(7) REFERENCES membre(id_membre),
	date_debut DATE,
	heure_debut TIME,
	date_fin DATE,
	heure_fin TIME,
	exigence VARCHAR(250)
);

CREATE TABLE hybride (
	Kilowatts_necessaires INTEGER,
	Immatriculation VARCHAR(7) REFERENCES vehicule(immatriculation),
	PRIMARY KEY(Immatriculation)
);
CREATE TABLE berline (
	Immatriculation VARCHAR(7) REFERENCES vehicule(immatriculation),
	PRIMARY KEY(Immatriculation)
);

CREATE TABLE mini_camionnette(
	Immatriculation VARCHAR(7) REFERENCES vehicule(immatriculation),
	PRIMARY KEY(Immatriculation)
);
