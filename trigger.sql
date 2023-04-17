-- DROP TABLE IF EXISTS AVENDRE CASCADE;

DROP FUNCTION mettre_en_vente() CASCADE;

CREATE FUNCTION mettre_en_vente() RETURNS TRIGGER AS $testingValue$
	BEGIN
		CREATE TABLE IF NOT EXISTS AVENDRE
		(
			immatriculation VARCHAR(7) PRIMARY KEY,
			consommation_essence NUMERIC,
			prix_horaire NUMERIC,
			prix_distance NUMERIC,
			emplacement_origine VARCHAR(7) REFERENCES emplacement(id_emplacement),
			marque VARCHAR(30),
			modele VARCHAR(30),
			kilometrage NUMERIC,
			mise_en_service DATE,
			information_supplementaire VARCHAR(250)
		);
		IF EXISTS(
			SELECT *
			FROM AVENDRE v
			WHERE NEW.immatriculation=v.immatriculation AND NEW.kilometrage > OLD.kilometrage
		) THEN 
			UPDATE AVENDRE
			SET kilometrage=NEW.kilometrage
			WHERE immatriculation=NEW.immatriculation;
			RETURN NULL;
		ELSEIF (NEW.kilometrage > 150000 AND NEW.immatriculation IN (SELECT immatriculation FROM vehicule NATURAL JOIN hybride)) THEN
			INSERT INTO AVENDRE VALUES (NEW.immatriculation, NEW.consommation_essence, NEW.prix_horaire,
											NEW.prix_distance, NEW.emplacement_origine, NEW.marque, NEW.modele,
											NEW.kilometrage, NEW.mise_en_service, NEW.information_supplementaire);
		ELSEIF (NEW.kilometrage > 200000 AND NEW.immatriculation IN (SELECT immatriculation FROM vehicule NATURAL JOIN berline)) THEN
		INSERT INTO AVENDRE VALUES (NEW.immatriculation, NEW.consommation_essence, NEW.prix_horaire,
											NEW.prix_distance, NEW.emplacement_origine, NEW.marque, NEW.modele,
											NEW.kilometrage, NEW.mise_en_service, NEW.information_supplementaire);
		ELSEIF (NEW.kilometrage > 350000 AND NEW.immatriculation IN (SELECT immatriculation FROM vehicule NATURAL JOIN mini_camionnette)) THEN
		INSERT INTO AVENDRE VALUES (NEW.immatriculation, NEW.consommation_essence, NEW.prix_horaire,
											NEW.prix_distance, NEW.emplacement_origine, NEW.marque, NEW.modele,
											NEW.kilometrage, NEW.mise_en_service, NEW.information_supplementaire);
		
		END IF;
					RETURN NEW;
	END;
	$testingValue$ LANGUAGE plpgsql;


CREATE TRIGGER odometre_limite
AFTER UPDATE
ON vehicule
FOR EACH ROW
EXECUTE PROCEDURE mettre_en_vente();


--POUR VERIFIER LE TRIGGER

UPDATE vehicule
SET kilometrage=155000
WHERE immatriculation = 'XH1FF3O' OR immatriculation = 'CPDPJG7';

-- UPDATE vehicule
-- SET kilometrage = 400000
-- WHERE immatriculation = '4MMN9WP' OR immatriculation = 'AI1ENBM';

UPDATE vehicule
SET kilometrage = 300000
WHERE immatriculation = '4MMN9WP' OR immatriculation = 'AI1ENBM';


UPDATE vehicule
SET kilometrage=150
WHERE immatriculation = 'XH1FF3O' OR immatriculation = 'CPDPJG7';


SELECT *
FROM AVENDRE;



