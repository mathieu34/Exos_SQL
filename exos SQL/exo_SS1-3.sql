Create database SS;
Use SS; 

Create table personne(
Noss int(15) not null,
Nom varchar(15), 
Prenom varchar(15), 
Adresse varchar(40),

constraint Pk_personne primary key (Noss)

);

Create table consultation(
Nocons int(10) not null auto_increment,
date_cons date,
symptomes varchar(15), 
Nosspat int(10), 
Nossmed int (10),
date date,

constraint Pk_consultation primary key (Nocons),
constraint FK1 foreign key (Nosspat) references personne (Noss),
constraint FK2 foreign key (Nossmed) references personne (Noss)

);

Create table medicament(
NomMed varchar(15) not null,
NomSubst varchar(15),
prix float(5),

constraint Pk_medicament primary key (NomMed)

);

Create table prescription(
Nocons int(10) not null auto_increment,
NomMed varchar(15),

constraint Pk_prescription primary key (Nocons, NomMed), 
constraint FK3 foreign key (Nocons) references consultation (Nocons),
constraint FK4 foreign key (NomMed) references medicament (NomMed)

);

insert into personne (Noss, Nom, Prenom, Adresse)
values (1, "Dupont", "Michel", "7 rue la voile");

insert into personne (Noss, Nom, Prenom, Adresse)
values (2, "Durant", "Janine", "6 rue la voile");
insert into personne (Noss, Nom, Prenom, Adresse)
values (3, "Dejean", "Janine", "5 rue la voile");

insert into consultation (Nocons, symptomes, Nosspat, Nossmed, date_cons)
values (1, "toux seche", 1, 2, 2018/01/02);
insert into consultation (Nocons, symptomes, Nosspat, Nossmed, date_cons)
values (2, "toux seche", 1, 3, 2018/01/02);

insert into medicament (NomMed, Nomsubst, prix)
values ("euphon", "codeine", "5.5");
insert into medicament (NomMed, Nomsubst, prix)
values ("tussi", "noscapine", "6.5");

insert into prescription (Nocons, NomMed)
values (1, "euphon");
insert into prescription (Nocons, NomMed)
values (2, "tussi");


select nom, NomMed from personne, medicament, consultation where consultation.symptomes = "toux seche" and personne.Noss = consultation.Nosspat;

select Nom, Nosspat, count(c.NossMed) from personne as p inner join consultation as c on p.Noss = c.NossPat group by c.NossMed, date_cons having count(c.NossMed) = 2;
select Nom, Nosspat, count(NossMed) from personne, consultation where personne.Noss = consultation.Nossmed group by NossMed, date_cons having count(NossMed) = 2;

select Nom, Nossmed from personne, consultation, medicament where medicament.Nomsubst != "noscapine" and symptomes = "toux seche"  and personne.Noss = consultation.Nossmed;


