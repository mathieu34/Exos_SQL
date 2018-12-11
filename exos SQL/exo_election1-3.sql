DROP DATABASE IF EXISTS election;
Create database election;
Use election; 
SET FOREIGN_KEY_CHECKS = 0;

Create table categorie(
numcat int(5) not null,
intitule char (15),

constraint Pk_categorie primary key (numcat)

);


Create table question(
numQ int(5) not null,
descrip varchar(40),

constraint Pk_question primary key (numQ)

);


Create table personne(
numpers int(5) not null,
age int(3), 
sexe binary(1), 
numcat int(5),

constraint Pk_personne primary key (numpers),
constraint FK foreign key (numcat) references categorie (numcat)
);


Create table avis(
numA int(5) not null,
numQ int(5),
numpers int(5),
reponse varchar(40),

constraint Pk_avis primary key (numA), 
constraint FK1 foreign key (numQ) references question (numQ),
constraint FK2 foreign key (numpers) references personne (numpers)
);

insert into personne (numpers , age, sexe, numcat)
values (1, 42, "M", 1);
insert into personne (numpers , age, sexe, numcat)
values (2, 45, "F", 2);
insert into personne (numpers , age, sexe, numcat)
values (3, 45, "F", 2);

insert into categorie (numcat, intitule)
values (1, "ouvrier");
insert into categorie (numcat, intitule)
values (2, "cadre");


insert into question (numQ, descrip)
values (1, "referendum europeen");
insert into question (numQ, descrip)
values (2, "baisse des impots");

insert into avis (numA, numQ, numpers, reponse)
values (1, 1, 1, "oui");
insert into avis (numA, numQ, numpers, reponse)
values (2, 2, 2, "oui");
insert into avis (numA, numQ, numpers, reponse)
values (3, 2, 3, "");

select p.numpers from personne as p inner join categorie as c on c.numcat = p.numcat where sexe = "F" and intitule = "cadre";

select p.numpers from personne as p inner join avis as a on a.numpers = p.numpers where age > 25 and reponse = "";

select count(numA), numQ from avis where numA < 2 group by numQ;

select count(a.numpers) from avis as a inner join question as q on q.numQ = a.numQ where a.reponse = "oui" and q.descrip = "referendum europeen" group by(a.numpers);

select p.age from personne as p inner join avis as a on a.numpers = p.numpers inner join question as q on q.numQ = a.numQ where p.age > 40 and q.descrip = "baisse des impots" and a.reponse = "oui";


