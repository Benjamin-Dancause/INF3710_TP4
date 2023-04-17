
--1. Retournez la marque, le modèle et l’emplacement d’origine des véhicules
SELECT marque, modele, emplacement_origine
FROM vehicule;

--2. Retournez la marque, le modèle et l’emplacement d’origine des véhicules
-- y compris les marques et modèles qui n’ont pas de localisation
SELECT marque, modele, emplacement_origine
FROM vehicule;

--3. Retournez les emplacements sans véhicules
SELECT *
FROM emplacement
WHERE emplacement.id_emplacement NOT IN
	(SELECT emplacement_origine FROM vehicule);
	
--4. Retournez tous les véhicules dont le domicile est situé dans la ville de Montréal
SELECT *
FROM vehicule v INNER JOIN emplacement e
ON (v.emplacement_origine=e.id_emplacement)
WHERE e.ville='Montréal';

--5. Retournez les emplacements et le nombre de voitures hybrides à chaque emplacement

SELECT emplacement_origine AS emplacement, COUNT(immatriculation)
FROM vehicule v INNER JOIN emplacement e
ON (v.emplacement_origine=e.id_emplacement)
WHERE v.immatriculation IN (SELECT immatriculation FROM hybride)
GROUP BY emplacement;

--6. Retournez les plaques d’immatriculation des véhicules qui ont été utilisés (pas seulement réservés)

SELECT	immatriculation
FROM vehicule v INNER JOIN utilisation u
ON (v.immatriculation=u.vehicule);

--7. Retournez toutes les informations des membres (personnes physiques) vivant dans une
--ville avec un emplacement qui a des voitures hybrides

SELECT *
FROM membre
WHERE membre.ville IN
	(
		SELECT ville
		FROM vehicule v INNER JOIN emplacement e
		ON (v.emplacement_origine=e.id_emplacement)
		WHERE v.immatriculation IN (SELECT immatriculation FROM hybride)
	);

--8. Retournez toutes les informations des véhicules à l’emplacement Montréal qui 
--sont libres le 23/01/2023 à 10 h

SELECT *
FROM vehicule
WHERE immatriculation NOT IN
	(
		SELECT immatriculation
		FROM vehicule v INNER JOIN reservation r
		ON(v.immatriculation=r.vehicule_desire)
		WHERE (r.date_debut < '2023-01-23' AND r.date_fin > '2023-01-23') OR
			(r.date_fin = '2023-01-23' AND r.heure_fin < '10:00:00') OR
			(r.date_debut = '2023-01-23' AND r.heure_debut > '10:00:00')
	);


--9. Retournez les plaques d’immatriculation et le nombre de réservations de chaque véhicule
--(y compris ceux sans réservation, c’est-à-dire que le nombre de réservations est 0)

SELECT immatriculation, COUNT(id_reservation) AS qte_reservation
FROM vehicule v LEFT JOIN reservation r
ON (v.immatriculation=r.vehicule_desire)
GROUP BY immatriculation;

--10. Quel est le véhicule avec la consommation de carburant la plus élevée ?

SELECT *
FROM vehicule
WHERE consommation_essence = 
	(
		SELECT MAX(consommation_essence)
		FROM vehicule
	);

--11. Retournez la consommation de carburant maximale, moyenne et minimale par catégorie de véhicule

SELECT 'hybride' AS category, MAX(consommation_essence), AVG(consommation_essence), MIN(consommation_essence)
FROM vehicule v
WHERE v.immatriculation IN (SELECT immatriculation FROM hybride)
UNION
SELECT 'berline' AS category, MAX(consommation_essence), AVG(consommation_essence), MIN(consommation_essence)
FROM vehicule v
WHERE v.immatriculation IN (SELECT immatriculation FROM berline)
UNION
SELECT 'mini-camionette' AS category, MAX(consommation_essence), AVG(consommation_essence), MIN(consommation_essence)
FROM vehicule v
WHERE v.immatriculation IN (SELECT immatriculation FROM mini_camionnette)

--12. Retournez tous les membres qui ont réservé un véhicule à un endroit autre que leur
--emplacement d’origine même si le type de véhicule existe à leur emplacement d’origine

SELECT id_membre, permis_de_conduire, emplacement_origine, est_cooperatif, est_autopartage,
	est_physique, mot_de_passe, date_de_naissance, adresse_postale, ville, courriel, nombre_de_part,
	numeroBanque, compteDeBanque
FROM membre m INNER JOIN reservation r
ON (m.id_membre=r.membre)
WHERE (m.emplacement_origine!=r.emplacement)
GROUP BY m.id_membre;


