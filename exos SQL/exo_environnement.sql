DROP DATABASE IF EXISTS environnement;
CREATE DATABASE environnement;
USE environnement;

CREATE TABLE modele
(
idmodele int primary key,
libelle VARCHAR(45),
crashtest VARCHAR(45),
consommation int
);

CREATE TABLE carburant
(
designation VARCHAR(45) primary key,
cours FLOAT,
pollution int(45)
);

CREATE TABLE utilise
(
idmodele int,
designation VARCHAR(45)
);

CREATE TABLE vehicule
(
immatriculation VARCHAR(45) primary key,
kilometrage int,
idmodele int,
nom_proprio VARCHAR(45)
);

CREATE TABLE proprietaire
(
nom VARCHAR(45) primary key,
age int
);

ALTER TABLE utilise ADD PRIMARY KEY (idmodele, designation);
ALTER TABLE utilise ADD FOREIGN KEY (idmodele) REFERENCES modele(idmodele);
ALTER TABLE utilise ADD FOREIGN KEY (designation) REFERENCES carburant(designation);
ALTER TABLE vehicule ADD FOREIGN KEY (idmodele) REFERENCES modele(idmodele);
ALTER TABLE vehicule ADD FOREIGN KEY (nom_proprio) REFERENCES proprietaire(nom);

INSERT INTO carburant VALUES ('Essence',1.4,200);
INSERT INTO carburant VALUES ('Diesel',1.3,250);
INSERT INTO carburant VALUES ('GPL',0.8,20);
INSERT INTO carburant VALUES ('Electrique',1.1,56);

INSERT INTO modele VALUES (1,'ville','top',5);
INSERT INTO modele VALUES (2,'ville','mauvais',6);
INSERT INTO modele VALUES (3,'sport','moyen',7);
INSERT INTO modele VALUES (4,'berline','ça passe',8);
INSERT INTO modele VALUES (5,'berline','mauvais',9);
INSERT INTO modele VALUES (6,'4X4','top',10);

INSERT INTO proprietaire VALUES ('gens1',23);
INSERT INTO proprietaire VALUES ('gens2',45);
INSERT INTO proprietaire VALUES ('gens3',54);
INSERT INTO proprietaire VALUES ('gens4',18);
INSERT INTO proprietaire VALUES ('gens5',28);
INSERT INTO proprietaire VALUES ('gens6',33);

INSERT INTO utilise VALUES (1,'Diesel');
INSERT INTO utilise VALUES (1,'Essence');
INSERT INTO utilise VALUES (1,'Electrique');
INSERT INTO utilise VALUES (2,'Diesel');
INSERT INTO utilise VALUES (2,'Essence');
INSERT INTO utilise VALUES (2,'GPL');
INSERT INTO utilise VALUES (3,'Diesel');
INSERT INTO utilise VALUES (3,'Essence');
INSERT INTO utilise VALUES (3,'Electrique');
INSERT INTO utilise VALUES (4,'Diesel');
INSERT INTO utilise VALUES (4,'Essence');
INSERT INTO utilise VALUES (4,'Electrique');
INSERT INTO utilise VALUES (5,'Diesel');
INSERT INTO utilise VALUES (5,'Essence');
INSERT INTO utilise VALUES (5,'GPL');
INSERT INTO utilise VALUES (6,'Diesel');
INSERT INTO utilise VALUES (6,'Essence');
INSERT INTO utilise VALUES (6,'Electrique');

INSERT INTO vehicule VALUES ('45VBJ7',20000,1,'gens1');
INSERT INTO vehicule VALUES ('13FDF',45678,1,'gens2');
INSERT INTO vehicule VALUES ('234FGN',234098,2,'gens2');
INSERT INTO vehicule VALUES ('HH6DC',134567,2,'gens3');
INSERT INTO vehicule VALUES ('BGD56V',22334,3,'gens3');
INSERT INTO vehicule VALUES ('45FGH',1234,3,'gens3');
INSERT INTO vehicule VALUES ('345VBN',99322,4,'gens4');
INSERT INTO vehicule VALUES ('67FGH',76543,4,'gens5');
INSERT INTO vehicule VALUES ('9877GG',25678,5,'gens6');
INSERT INTO vehicule VALUES ('HGF46',187368,5,'gens6');
INSERT INTO vehicule VALUES ('FCF56',12356,6,'gens6');


select p.nom, v.kilometrage from proprietaire as p inner join vehicule as v on v.nom_proprio = p.nom where v.kilometrage > 100000;

select c.pollution, m.consommation, m.idmodele from carburant as c inner join utilise as u on u.designation = c.designation inner join modele as m on m.idmodele = u.idmodele where m.libelle = "4x4";

select m.libelle, avg(m.consommation), c.designation from modele as m inner join utilise as u on u.idmodele = m.idmodele inner join carburant as c on c.designation = u.designation where c.pollution > 20 group by c.designation; 

