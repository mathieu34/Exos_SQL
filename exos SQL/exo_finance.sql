DROP DATABASE IF EXISTS finance;
CREATE DATABASE finance;
USE finance;

CREATE TABLE compte
(
idCompte int primary key,
idClient int,
solde int,
resume int
);

CREATE TABLE action
(
idAction int,
idCompte int,
montant int
);

CREATE TABLE customer
(
idClient int primary key,
nom VARCHAR(45),
prenom VARCHAR(45),
adresse VARCHAR(100),
annee int
);

ALTER TABLE action ADD PRIMARY KEY (idAction, idCompte);
ALTER TABLE compte ADD FOREIGN KEY (idClient) REFERENCES client(idClient);

INSERT INTO customer VALUES (1,'Nom1','Prenom1','Adresse1',1990);
INSERT INTO customer VALUES (2,'Dupont','Prenom2','Adresse2',1967);
INSERT INTO customer VALUES (3,'Nom3','Prenom3','Adresse3',1978);
INSERT INTO customer VALUES (4,'Nom4','Prenom4','Adresse4',1987);
INSERT INTO customer VALUES (5,'Nom5','Prenom5','Adresse5',1963);
INSERT INTO customer VALUES (6,'Nom6','Prenom6','Adresse6',2000);
INSERT INTO customer VALUES (7,'Nom7','Prenom7','Adresse7',1954);
INSERT INTO customer VALUES (30,'Dupuis','Jean','1 rue Pasteur',1978);

INSERT INTO compte VALUES (1,30,5,0);
INSERT INTO compte VALUES (2,2,2345,2);
INSERT INTO compte VALUES (3,3,1222,5);
INSERT INTO compte VALUES (4,4,23,3);
INSERT INTO compte VALUES (5,5,456,14);
INSERT INTO compte VALUES (6,6,234,34);
INSERT INTO compte VALUES (7,7,12345,12);
INSERT INTO compte VALUES (8,1,876,1);

INSERT INTO action VALUES (1,1,+30);
INSERT INTO action VALUES (2,2,+5);
INSERT INTO action VALUES (3,1,-60);

select nom, prenom from customer where idClient < 1000 and annee > 1968 ;

select co.idcompte, co.solde from compte as co inner join customer as c on c.idClient = co.idClient where co.solde > 1000 and c.nom = "dupont";

select c.idClient, c.nom from customer as c inner join compte as co on co.idClient = c.idClient inner join action as a on a.idCompte = co.idCompte and a.idAction = co.idCompte where a.montant >= 0 or  a.montant is not NULL ;

select sum(a.montant), a.idAction from action as a  where a.idCompte = 1 and a.montant not between -50 and 10 order by a.idAction asc;

select a.idCompte, sum(a.montant) from action as a where a.montant not between -50 and 10 group by a.idCompte ;

select c.idCompte from compte as c inner join T as T on T.idcompte = c.idcompte having sum(a.montant) != T.resume;

