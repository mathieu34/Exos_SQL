create database cinema1;
use cinema1;

create table artiste (
nom char(10),
nation char(10),
sexe char(10)
);


create table film (
titre char(10) ,
nom_producteur char (10),
nom_realisateur char(10)
);

create table joue (
titre char(10),
nom_acteur char(10)
);

create table seance (
numero int(5),
nomcine int(10),
horaire int (5),
titre char (10)
);

create table AVU (
nom_spectateur char(15),
titre char (15)
);

create table aime (
nom_spectateur char(15),
titre char (15)
);

alter table artiste add constraint pk_artiste primary key(nom);

alter table film add constraint pk_film primary key(titre);

alter table joue add constraint pk_joue primary key(titre,nom_acteur);

alter table seance add constraint pk_seance primary key(numero,nomcine,horaire);

alter table AVU add constraint pk_avu primary key(nom_spectateur, titre);

alter table aime add constraint pk_aime primary key(nom_spectateur, titre);



alter table film add constraint fk_film_realise foreign key(nom_realisateur) references artiste(nom);

alter table joue add constraint fk_joue_film foreign key(titre) references film (titre);

alter table joue add constraint fk_joue_acteur foreign key(nom_acteur) references artiste (nom);

alter table seance add constraint fk_seance_titre foreign key(titre) references film (titre);

alter table AVU add constraint fk_avu_film foreign key(titre) references film (titre);

alter table aime add constraint fk_aime_film foreign key(titre) references film (titre);



Alter table seance add nb_salles tinyint(4)
DELIMITER |
CREATE TRIGGER before_insert_nb_salles BEFORE INSERT ON seance FOR EACH ROW BEGIN IF NEW.nb_salles > 10 THEN SET NEW.nb_salles = 10; 
END IF; 
END |
DELIMITER ;

ALTER TABLE seance
ADD heure_ouverture TIME;

DELIMITER |
CREATE TRIGGER before_insert_heure_ouverture BEFORE INSERT ON seance FOR EACH ROW IF NEW.heure_ouverture > '00:00:00' AND NEW.heure_ouverture < '10:00:00' THEN SET NEW.heure_ouverture = NULL;
END IF;
END |
DELIMITER ;