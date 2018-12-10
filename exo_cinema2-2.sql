Create database CINEMA;
Use CINEMA; 

Create table Film(
idfilm int(10) not null auto_increment,
titre varchar(40), 
metteur_en_scene varchar(40), 
acteur varchar(40),

constraint Pk_film primary key (idfilm)

);

Create table Salle(
idsalle int(10) not null auto_increment,
nom_cine varchar(40),
adresse varchar(40), 
telephone int(10), 

constraint Pk_salle primary key (idsalle)

);

Create table Programme(
idprogramme int(10) not null auto_increment,
idfilm int(10),
idsalle int(10),
nom_cine varchar(40),
titre varchar(40), 
horaire time,

constraint Pk_programme primary key (idprogramme), 
constraint FK foreign key (idsalle) references Salle (idsalle),
constraint FK1 foreign key (idfilm) references Film (idfilm)

);
insert into Film (titre, metteur_en_scene, acteur) values ('Cris et chuchotements', 'Bergam', 'Ulllman');
insert into Film (titre, metteur_en_scene, acteur) values ('Cris et chuchotements', 'Bergam', 'Andersson');
insert into Film (titre, metteur_en_scene, acteur) values ('Cris et chuchotements', 'Bergam', 'Thulin');

insert into Film (titre, metteur_en_scene, acteur) values ('Speed 2', 'Jan de Bont','S Bullock');
insert into Film (titre, metteur_en_scene, acteur) values ('Speed 2', 'Jan de Bont','W Dafoe');

insert into Film (titre, metteur_en_scene, acteur) values ('Marion','M Poirier', 'C Tetard');
insert into Film (titre, metteur_en_scene, acteur) values ('Marion','M Poirier', 'MF Pisier');
insert into Film (titre, metteur_en_scene, acteur) values ('Marion','M Poirier', 'M Poirier');

insert into Film (titre, metteur_en_scene, acteur) values ('Eyes wide shut','Kubrick', 'Cruise');
insert into Film (titre, metteur_en_scene, acteur) values ('Eyes wide shut','Kubrick', 'Kidman');

insert into Salle (nom_cine, adresse, telephone) values ('Diagonal Capitole', '5 rue de Verdun', 0467585810);
insert into Salle (nom_cine, adresse, telephone) values ('Diagonal Centre', '18 place St Denis', 0467929181);
insert into Salle (nom_cine, adresse, telephone) values ('Gaumont', "Place de l'Oeuf", 0467322581);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (9, 2,'Diagonal Centre', 'Eyes wide shut', 140000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (10, 2,'Diagonal Centre', 'Eyes wide shut', 173000);

insert into Programme (idfilm, idsalle,nom_cine, titre, horaire) values (3, 3,'Gaumont', 'Speed 2', 143000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (4, 3,'Gaumont', 'Speed 2', 183000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (5, 3,'Gaumont', 'Speed 2', 223000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (6, 3,'Gaumont', 'Marion', 183000);
insert into Programme (idfilm, idsalle, nom_cine, titre, horaire) values (7, 3,'Gaumont', 'Marion', 203000);

select * from programme where titre = "Speed 2";

select * from programme where titre = "Eyes wide shut" and horaire > 143000;

SELECT titre from film where Metteur_en_scene = Acteur;

select * from programme where titre = "Marion" or nom_cine = "Diagonal Centre";
 
select distinct programme.titre from film, programme where film.acteur  = 'MF Pisier' AND  film.titre = programme.titre;
select f.titre, nom_cine, horaire from film as f inner join programme as p on f.idfilm = p.idfilm
where f.acteur = 'MF Pisier' AND p.titre = f.titre;

select metteur_en_scene from film where metteur_en_scene = acteur;
select distinct f1.metteur_en_scene from film as f1 inner join film as f2 on f1.idfilm = f2.idfilm
where f1.acteur = f2.metteur_en_scene;

select titre from film having count(metteur_en_scene) > 2;

select metteur_en_scene, acteur from film where film.titre = "Marion";