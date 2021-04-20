DROP PROCEDURE IF EXISTS healteam;
DROP PROCEDURE IF EXISTS moveToteam;
DROP PROCEDURE IF EXISTS moveTocaught;
DROP TABLE IF EXISTS evolutions;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS caught;
DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS stats;


CREATE TABLE types(

id_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(16) NOT NULL
);

CREATE TABLE pokemons(

id_pokemon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(16) NOT NULL,
id_type1 INT UNSIGNED NOT NULL,
id_type2 INT UNSIGNED NOT NULL,
description VARCHAR(32) NOT NULL,
weight INT NOT NULL,
height INT NOT NULL,
pokedex_number INT NOT NULL,
FOREIGN KEY (id_type1) REFERENCES types(id_type),
FOREIGN KEY (id_type2) REFERENCES types(id_type)
);

CREATE TABLE stats(

id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
max_hp INT NOT NULL,
actual_hp INT NOT NULL,
lvl INT NOT NULL,
xp INT UNSIGNED NOT NULL,
attack INT NOT NULL,
defense INT NOT NULL,
special INT NOT NULL,
agility INT NOT NULL,
shiny BOOLEAN
);

CREATE TABLE caught(
id_caught INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_pokemon INT UNSIGNED NOT NULL,
id_stat INT UNSIGNED NOT NULL,
FOREIGN KEY (id_pokemon) REFERENCES pokemons(id_pokemon),
FOREIGN KEY (id_stat) REFERENCES stats(id_stat)
);

CREATE TABLE team(
id_team INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_pokemon INT UNSIGNED NOT NULL,
id_stat INT UNSIGNED NOT NULL,
FOREIGN KEY (id_pokemon) REFERENCES pokemons(id_pokemon),
FOREIGN KEY (id_stat) REFERENCES stats(id_stat)
);

CREATE TABLE evolutions(
id_evolution INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_pokemon_to_evolve INT UNSIGNED NOT NULL,
id_pokemon_evolved INT UNSIGNED NOT NULL,
lvl_requirement INT NOT NULL,
FOREIGN KEY (id_pokemon_to_evolve) REFERENCES pokemons(id_pokemon),
FOREIGN KEY (id_pokemon_evolved) REFERENCES pokemons(id_pokemon)
);

INSERT INTO `types`(`name`)
VALUES ('Volador'),('Lucha'),('Fuego'),('Planta'),('Agua'),('Roca'),('Tierra'),('Bicho'),('Hielo'),('Fantasma'),('Dragon'),('Psiquico'),('Veneno'),('Electrico'),('NONE'),('Normal');
 
 
INSERT INTO `pokemons`(`name`,`id_type1`,`id_type2`,`description`,`weight`,`height`,`pokedex_number`)
VALUES ('Bulbasaur',4,13,'plantasaurio',5,2,7),('Charmander',3,15,'lagartija',6,5,1),('Squirtle',5,15,'tortuguilla',10,5,4),('Ivysaur',4,13,'Floripondio',12,20,8),('Venusaur',4,13,'Palmera',20,50,9),
('Wartortle',5,15,'tortuguilla de guerra',10,20,5), ('Blastoise',5,15,'tortugaza de guerra',100,30,6), ('Charmeleon',5,15,'lagartija grande',10,20,2),('Charizard',5,1,'not a dragon',60,90,3),
('Pachirisu',14,15,'not pikachu',1,1,10), ('Raichu',14,15,'Fatass Pikachu',20,30,13),('Jynx',9,15,'Lady GaGa',13,27,15),('Pikachu',14,15,'Nintendo slave',13,5,12),('Dunsparce',16,15,'Who s this?',3,3,11),('Agumon',11,3,'NOT EVEN A POKEMON',20,20,14),
('Mewtwo',12,15,'niño probeta',30,60,16);


INSERT INTO `stats`(`max_hp`,`actual_hp`,`lvl`,`xp`,`attack`,`defense`,`special`,`agility`,`shiny`)
VALUES (450,450,100,1000000,50,80,300,80,false),(450,320,99,1000000,51,80,280,80,true),
(89,89,20,5861,100,20,15,200,false),(125,125,36,12012,200,40,40,230,false),(40,25,5,200,20,40,40,10,false)
,(100,100,100,1000000,100,100,100,100,false),(80,10,2,40,6,10,12,3,true),(50,50,45,203146,500,200,20,20,false),(5,3,3,60,5,4,5,7,true)
,(70,58,90,135315,80,200,150,4,false),(90,90,90,183158,80,220,170,6,true),(65,65,20,1516,20,40,38,79,true),(89,63,33,32156,102,40,40,120,false),(800,2,100,2000000,500,300,300,800,false)
,(500,500,99,999999,99,86,84,3,true),(20,15,2,31,5,5,5,20,true),(135,135,82,165654,20,120,200,40,false),(40,30,15,516,20,80,20,100,false),(236,236,52,65164,48,63,23,220,true),(100,100,100,100,100,100,100,100,true);

INSERT INTO `team`(id_pokemon,id_stat)
VALUE (1,1),(1,2),(12,3),(14,19),(6,6),(16,14);

INSERT INTO `caught`(id_pokemon,id_stat)
VALUE (13,4),(8,7),(13,17),(9,5),(15,9),(11,10),(4,20),(3,8),(6,11),(9,13),(13,18),(15,12),(10,16),(5,15);

INSERT INTO `evolutions`(`id_pokemon_to_evolve`,`id_pokemon_evolved`,`lvl_requirement`)
VALUE (1,4,16),(4,5,36);

DELIMITER //

CREATE PROCEDURE moveTocaught(in idteam INT UNSIGNED, OUT idpokemon INT UNSIGNED , OUT idstat INT UNSIGNED  )
BEGIN

 SELECT team.id_pokemon, team.id_stat INTO idpokemon,idstat FROM team WHERE team.id_team=idteam;
DELETE FROM team WHERE team.id_team = idteam;
INSERT INTO `caught` (`id_pokemon`,`id_stat`)
VALUE (idpokemon,idstat);
END//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE moveToteam(in idcaught INT UNSIGNED, OUT idpokemon INT UNSIGNED , OUT idstat INT UNSIGNED  )
BEGIN
IF (SELECT COUNT(*) FROM team) >= 6 THEN
SET @morethansix ="Ya hay 6 pokemons en el equipo";
SELECT @morethansix;
ELSE
SELECT caught.id_pokemon, caught.id_stat INTO idpokemon,idstat FROM caught WHERE caught.id_caught=idcaught;
DELETE FROM caught WHERE caught.id_caught = idcaught;
INSERT INTO `team` (`id_pokemon`,`id_stat`)
VALUE (idpokemon,idstat);

END IF;
END//
DELIMITER ;

