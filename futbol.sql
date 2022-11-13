/*********************************
 Creación de Base de datos y uso
**********************************/
CREATE DATABASE IF NOT EXISTS Futbol;
USE Futbol;

/**************************
        Creación tablas
****************************/
CREATE TABLE IF NOT EXISTS Jugadors(
    id_jugador INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    data_naix DATE NOT NULL,
    demarcacio VARCHAR(50) NOT NULL,
    internacional INTEGER NOT NULL,
    id_equip INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Equips(
	id_equip INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    estadi VARCHAR(50) NOT NULL,
    aforament INTEGER NOT NULL,
    any_fundacio INTEGER NOT NULL,
    ciutat VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Partits(
    id_equip_local INTEGER NOT NULL,
    id_equip_visitant INTEGER NOT NULL,
   	data DATE NOT NULL,
    gols_local INTEGER NOT NULL,
    gols_visitant INTEGER NOT NULL,
    observacions VARCHAR(200) NULL
);

CREATE TABLE IF NOT EXISTS Gols(
    id_equip_local INTEGER NOT NULL,
    id_equip_visitant INTEGER NOT NULL,
	minut INTEGER NOT NULL,
    descripcio VARCHAR(200) NULL,
   	id_jugador INTEGER NOT NULL
);

/**************************
    Modificaciones tablas
****************************/
ALTER TABLE Partits 
ADD hora_inici TIME NULL;
CREATE INDEX Jugador_id 
ON Jugadors (id_jugador);
CREATE INDEX Equip_id 
ON Equips (id_equip);
ALTER TABLE Equips 
CHANGE any_fundacio fundacio INTEGER NOT NULL;
ALTER TABLE Equips 
ADD anagrama VARCHAR(30) NULL;

ALTER TABLE Jugadors
ADD CONSTRAINT FK_Equips_id_equip
FOREIGN KEY (id_equip) REFERENCES Equips(id_equip);

/**************************
    Insercción de datos
****************************/
/**************************
        Tabla Equips
****************************/
INSERT INTO Equips(id_equip,nom,estadi,aforament,fundacio,ciutat,anagrama)
VALUES (1,'Real Madrid','Santiago Bernabeu',80000,1950,'Madrid',NULL);

INSERT INTO Equips(id_equip,nom,estadi,aforament,fundacio,ciutat,anagrama)
VALUES (2,'F.C. Barcelona','Camp Nou',70000,1948,'Barcelona',NULL);

INSERT INTO Equips(id_equip,nom,estadi,aforament,fundacio,ciutat,anagrama)
VALUES (3,'Valencia C.F','Mestalla',60000,1952,'Valencia',NULL);

INSERT INTO Equips(id_equip,nom,estadi,aforament,fundacio,ciutat,anagrama)
VALUES (4,'Atlético de Madrid','Wanda Metropolitano',55000,1945,'Madrid',NULL);

/**************************
        Tabla Jugadors
****************************/
INSERT INTO Jugadors (id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (1,'Thibaut Courtois','80/5/6','Portero',50,1);

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (2,'Karim Benzema','74/7/7','Delantero',80,1);

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (3,'Isco','68/6/6','Centrocampista',75,1);

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (4,'Luis Suárez','66/3/3','Delantero',50,2);

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (5,'Arturo Vidal','79/5/5','Centrocampista',45,2); 

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (6,'Arthur','76/3/3','Centrocampista',25,2);

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (7,'Kevin Gameiro','65/5/5','Centrocampista',40,3); 

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (8,'Rodrigo Moreno','73/3/3','Centrocampista',40,3); 

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (9,'Jason','75/5/5','Centrocampista',35,3); 

INSERT INTO Jugadors(id_jugador,nom,data_naix,demarcacio,internacional,id_equip)
VALUES (10,'Manu Vallejo','76/6/5','Centrocampista',20,3);

/**************************
        Tabla Partits
****************************/
INSERT INTO Partits(id_equip_local,id_equip_visitant,data,gols_local,gols_visitant,observacions,hora_inici)
VALUES (1,2,'3/3/18',2,1,NULL,NULL);

INSERT INTO Partits(id_equip_local,id_equip_visitant,data,gols_local,gols_visitant,observacions,hora_inici)
VALUES (1,3,'4/4/18',3,1,NULL,NULL);

INSERT INTO Partits(id_equip_local,id_equip_visitant,data,gols_local,gols_visitant,observacions,hora_inici)
VALUES (2,3,'3/4/18',0,4,NULL,NULL);

INSERT INTO Partits(id_equip_local,id_equip_visitant,data,gols_local,gols_visitant,observacions,hora_inici)
VALUES (2,1,'3/7/18',2,1,NULL,NULL);
/**************************
        Tabla Gols
****************************/ 
INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (1,2,35,'De falta',2);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (2,1,70,NULL,2);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (1,2,88,NULL,4);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (1,3,5,NULL,3);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (1,3,10,'De penalti',2);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (1,3,47,NULL,3);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (1,3,60,NULL,7);

INSERT INTO Gols(id_equip_local,id_equip_visitant,minut,descripcio,id_jugador)
VALUES (2,3,8,NULL,9);
