create database canigou ;
use canigou;
create table adherent
(
    id_code int(11) auto_increment not null,
    nom varchar(255),
    prenom varchar (255),
    date_naissance date,
    constraint primary key (id_code)
);

create table annee
(
    id_annee int (11) auto_increment not null,
    prix_cotisation_adulte float,
    prix_cotisation_mineur float,
    constraint primary key (id_annee)

);

create table lieu 
(
    id_lieu int (11) auto_increment not null,
    lieu varchar(50),
    constraint primary key (id_lieu)

);

create table niveau 
(
    id_niveau int (11) auto_increment not null,
    facile varchar (50),
    moyen varchar (50),
    difficile varchar (50),
    competition varchar (50),
    constraint primary key (id_niveau)
);

create table marche 
(
    id_marche int (11) auto_increment not null,
    date_marche date,
    id_lieu int (11),
    id_niveau int (11),
    constraint primary key (id_marche),
    constraint Fk1  foreign key (id_lieu)  references lieu (id_lieu),
    constraint FK2  foreign key (id_niveau) references niveau (id_niveau)
);

create table realiser
(
    id_code int (11),
    id_marche int (11),
    constraint PK primary key (id_code,id_marche ),
    constraint FK3 foreign key (id_code) references adherent (id_code),
    constraint FK4 foreign key (id_marche) references marche (id_marche)
);

create table cotisation
(

    id_code int (11),
    id_annee int (11),
    constraint PK primary key (id_code, id_annee ),
    constraint FK5  foreign key (id_code ) references adherent (id_code ),
    constraint FK6 foreign key ( id_annee) references annee ( id_annee)
);

alter table annee
add check (annee >2000 and annee < 2020);

INSERT INTO lieu (id_lieu, lieu)
VALUES (1, "Castelneau"),
       (2, "Perols");
       
       
INSERT INTO adherent VALUES (1, "dupond", "marc", "2002/01/22");