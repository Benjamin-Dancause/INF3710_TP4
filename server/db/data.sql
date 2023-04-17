DELETE FROM assurance CASCADE;
DELETE FROM utilisation CASCADE;
DELETE FROM reservation CASCADE;
DELETE FROM accident CASCADE;
DELETE FROM membre CASCADE;
DELETE FROM hybride CASCADE;
DELETE FROM berline CASCADE;
DELETE FROM mini_camionnette CASCADE;
DELETE FROM vehicule CASCADE;
DELETE FROM emplacement CASCADE;
DELETE FROM assureur CASCADE;
DELETE FROM facture CASCADE;


INSERT INTO emplacement VALUES ('0000001', 'Stationnement A', 61, 'Pratt', 'Montréal', 'H3T1J4', 145);
INSERT INTO emplacement VALUES ('0000002', 'Stationnement B', 103, 'Archambault', 'Montréal', 'H3S1J5', 105);
INSERT INTO emplacement VALUES ('0000003', 'Stationnement C', 8950, 'Aspen', 'Sherbrooke', 'J1C0A4', 405);
INSERT INTO emplacement VALUES ('0000004', 'Stationnement D', 123, 'Lake', 'Sherbrooke', 'J1C5A4', 10);


INSERT INTO assureur VALUES ('0000001','Desjardins Assurance Vie');
INSERT INTO assureur VALUES ('0000002','La Capitale Assurance');


--hybride
INSERT INTO vehicule VALUES ('XH1FF3O', 5, 3, 0.1, '0000003', 'Toyota', 'Prius', 59808, '2020-11-18', '');
INSERT INTO vehicule VALUES ('CPDPJG7', 5, 3, 0.2, '0000001', 'Toyota', 'Prius', 134285, '2020-01-08', '');
INSERT INTO vehicule VALUES ('UWT9VKX', 5, 6, 0.15, '0000002', 'Toyota', 'Prius', 18046, '2020-11-18', '');
INSERT INTO vehicule VALUES ('0I8OH2H', 6, 5, 0.3, '0000001', 'Toyota', 'Sonata', 74309, '2020-01-08', '');
INSERT INTO vehicule VALUES ('UF6CD5B', 6, 2, 0.6, '0000002', 'Toyota', 'Sonata', 11207, '2020-01-08', '');

INSERT INTO hybride VALUES (11, 'XH1FF3O');
INSERT INTO hybride VALUES (11, 'CPDPJG7');
INSERT INTO hybride VALUES (11, 'UWT9VKX');
INSERT INTO hybride VALUES (16, '0I8OH2H');
INSERT INTO hybride VALUES (16, 'UF6CD5B');

--berline
INSERT INTO vehicule VALUES ('V3EU242', 8, 3, 0.1, '0000003', 'Subaru', 'Legacy', 51157, '2019-06-02', '');
INSERT INTO vehicule VALUES ('ARCUBK0', 7, 6, 0.3, '0000001', 'Subaru', 'Legacy', 75682, '2020-01-08', '');
INSERT INTO vehicule VALUES ('GWZ32U8', 9, 4, 0.6, '0000003', 'Subaru', 'Legacy', 100649, '2020-01-08', '');
INSERT INTO vehicule VALUES ('DV38WYN', 8, 3, 0.13, '0000001', 'Subaru', 'Legacy', 133448, '2020-01-08', '');
INSERT INTO vehicule VALUES ('JW86ZFE', 9, 3, 0.2, '0000002', 'Honda', 'Civic', 92024, '2020-01-08', '');

INSERT INTO berline VALUES ('V3EU242');
INSERT INTO berline VALUES ('ARCUBK0');
INSERT INTO berline VALUES ('GWZ32U8');
INSERT INTO berline VALUES ('DV38WYN');
INSERT INTO berline VALUES ('JW86ZFE');

--mini-camionette
INSERT INTO vehicule VALUES ('4MMN9WP',10, 5, 0.5, '0000001', 'Ford', 'Transit', 142100, '2020-01-08', '');
INSERT INTO vehicule VALUES ('AI1ENBM', 11, 7, 0.3, '0000001', 'Ford', 'Transit', 66333, '2020-01-08', '');
INSERT INTO vehicule VALUES ('WBNE3XU', 12, 1, 0.6, '0000002', 'Ford', 'Transit', 60057, '2019-06-02', '');
INSERT INTO vehicule VALUES ('O3VB5QC', 11, 2, 0.3, '0000002', 'Ford', 'Transit', 51830, '2020-01-08', '');

INSERT INTO mini_camionnette VALUES ('4MMN9WP');
INSERT INTO mini_camionnette VALUES ('AI1ENBM');
INSERT INTO mini_camionnette VALUES ('WBNE3XU');
INSERT INTO mini_camionnette VALUES ('O3VB5QC');


INSERT INTO assurance VALUES ('0000001', '0000001', 'XH1FF3O', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000002', '0000001', 'CPDPJG7', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000003', '0000001', 'UWT9VKX', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000004', '0000001', '0I8OH2H', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000005', '0000002', 'UF6CD5B', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000006', '0000002', 'V3EU242', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000007', '0000002', 'ARCUBK0', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000008', '0000001', 'GWZ32U8', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000009', '0000001', 'DV38WYN', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000010', '0000002', 'JW86ZFE', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000011', '0000001', '4MMN9WP', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000012', '0000002', 'AI1ENBM', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000013', '0000001', 'WBNE3XU', '2020-01-08', '2023-07-08');
INSERT INTO assurance VALUES ('0000014', '0000001', 'O3VB5QC', '2020-01-08', '2023-07-08');


INSERT INTO membre VALUES ('0000001', 'C618529848512', '0000003', 'true', 'true', 'true', 'mdp123', '1930-10-10', 'H3T1J4', 'Sherbrooke', 'xyz@yahoo.com', 5, '165681835486', 'Banque Nationale');
INSERT INTO membre VALUES ('0000002', 'D673462848512', '0000003', 'true', 'true', 'false', 'mdp123', '1982-10-10', 'H3T1J4', 'Montréal', 'xycs@yahoo.com', 63, 'RBC Banque Royale');
INSERT INTO membre VALUES ('0000003', 'S618527456512', '0000002', 'true', 'false', 'true', 'mdp123', '1985-10-10', 'H3T1J4', 'Sherbrooke', 'wew@yahoo.com', 54, 'Banque Nationale');
INSERT INTO membre VALUES ('0000004', 'K618529848745', '0000002', 'true', 'false', 'false', 'mdp123', '1977-10-10', 'H3T1J4', 'Sherbrooke', 'xy2az@yahoo.com', 96, 'Banque Nationale');
INSERT INTO membre VALUES ('0000005', 'B618529234851', '0000002', 'false', 'true', 'true', 'mdp123', '1960-10-10', 'H3T1J4', 'Montréal', 'casf@yahoo.com', 0, 'RBC Banque Royale');
INSERT INTO membre VALUES ('0000006', 'D612534238512', '0000003', 'false', 'true', 'false', 'mdp123', '1939-10-10', 'H3T1J4', 'Shawinigan', '3rt@yahoo.com', 0, 'RBC Banque Royale');
INSERT INTO membre VALUES ('0000007', 'B618552353252', '0000001', 'false', 'false', 'true', 'mdp123', '1959-10-10', 'H3T1J4', 'Montréal', 'daw@yahoo.com', 0, 'Banque Nationale');
INSERT INTO membre VALUES ('0000008', 'T618529897376', '0000001', 'false', 'false', 'false', 'mdp123', '1931-10-10', 'H3T1J4', 'Magog', 'gr3@yahoo.com', 0, 'RBC Banque Royale');


INSERT INTO accident VALUES ('0000001', '2021-10-10', '01:01:01', '0000001');
INSERT INTO accident VALUES ('0000002', '2021-10-10', '02:01:01', '0000001');
INSERT INTO accident VALUES ('0000003', '2021-10-10', '01:01:01', '0000002');
INSERT INTO accident VALUES ('0000004', '2021-10-10', '04:01:01', '0000001');
INSERT INTO accident VALUES ('0000005', '2021-10-10', '07:01:01', '0000001');
INSERT INTO accident VALUES ('0000006', '2021-10-10', '09:01:01', '0000001');



INSERT INTO facture VALUES ('0000001', 123, '2023-10-10', 'true');
INSERT INTO facture VALUES ('0000002', 427, '2023-10-10', 'true');
INSERT INTO facture VALUES ('0000003', 725, '2023-10-10', 'true');



INSERT INTO utilisation VALUES ('0000001', '0000001', '0000003', 'V3EU242', '0000001', 51150, 51157, '2023-04-10', '01:01:01', '2023-04-10', '01:01:01', 21);
INSERT INTO utilisation VALUES ('0000002', '0000001', '0000003', 'XH1FF3O', '0000001', 59800, 59808, '2023-04-10', '01:01:01', '2023-04-10', '01:01:01', 15);



INSERT INTO reservation VALUES ('0000001', '0000001', 'UF6CD5B', '0000001', '2026-04-10', '01:01:01', '2026-04-11', '01:01:01', '');
INSERT INTO reservation VALUES ('0000002', '0000001', '4MMN9WP', '0000003', '2023-01-10', '01:01:01', '2026-02-11', '01:01:01', '');
INSERT INTO reservation VALUES ('0000003', '0000001', 'AI1ENBM', '0000003', '2023-01-10', '01:01:01', '2026-02-11', '01:01:01', '');
INSERT INTO reservation VALUES ('0000004', '0000001', 'WBNE3XU', '0000003', '2023-01-10', '01:01:01', '2026-02-11', '01:01:01', '');
INSERT INTO reservation VALUES ('0000005', '0000003', 'UF6CD5B', '0000001', '2026-04-09', '10:01:01', '2026-04-09', '20:01:01', '');


