/*********************************
 Creación de Base de datos y uso
**********************************/
CREATE DATABASE IF NOT EXISTS Lliga_basquet;
USE Lliga_basquet;

/*********************************
        Creación de Tablas
**********************************/
CREATE TABLE IF NOT EXISTS Equips(
    id_equip INTEGER,
    nom_equip VARCHAR(45),
    ciutat VARCHAR(45),
    web_oficial VARCHAR(250),
    punts INTEGER,
    PRIMARY KEY(id_equip)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS Jugadors(
    id_jugador INTEGER,
    nom VARCHAR(45),
    cognom VARCHAR(45),
    posicio VARCHAR(45),
    id_capita INTEGER,
    data_alta DATETIME,
    salari_brut INTEGER,
    equip INTEGER,
    alçada INTEGER,
    alçadaSec INTEGER,
    PRIMARY KEY(id_jugador)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS Partits(
   id_partit INTEGER,
   elocal INTEGER,
   evisitant INTEGER,
   resultat INTEGER,
   data DATE,
   arbitratge VARCHAR(45)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/**************************
    Modificaciones tablas
****************************/
/*Afegir a la taula partits la clau primària a l’atribut id_partit.*/
ALTER TABLE Partits
ADD PRIMARY KEY (id_partit);

/*Afegir la clau forana com a constraint jugador_fk a 
la taula jugadors de l’atribut equip cap a equips atribut id_equip.*/
ALTER TABLE Jugadors
ADD CONSTRAINT jugador_fk
FOREIGN KEY (equip) REFERENCES Equips(id_equip);

/*
Afegir la clau forana com a constraint elocal_fk a la taula partits 
de l’atribut elocal cap a equips atribut id_equip.
*/
ALTER TABLE Partits
ADD CONSTRAINT elocal_fk
FOREIGN KEY (elocal) REFERENCES Equips(id_equip);

/*Afegir la clau forana com a constraint evisitant_fk a la taula partits 
de l’atribut evisitant cap a equips atribut id_equip.*/
ALTER TABLE Partits
ADD CONSTRAINT evisitant_fk
FOREIGN KEY (evisitant) REFERENCES Equips(id_equip);

/*
Canvia el tipus de dades de l’atribut resultat a varchar(45) 
de la taula partits.
*/
ALTER TABLE Partits
CHANGE resultat resultat VARCHAR(45);

/*
Afegeix una restricció de comprovació de dades a la taula jugadors
 atribut alçada sigui superior a 1.7 m.
*/
ALTER TABLE Jugadors
ADD CHECK (alçada>=1.7);   

/*
Canvia el nom a la columna arbitratge per arbitre de la taula partits.
*/
ALTER TABLE Partits
CHANGE arbitratge arbitre VARCHAR(45);

/*
Afegeix una restricció de valor únic a l’atribut nom_equip de la taula equips.
*/
ALTER TABLE Equips
ADD UNIQUE (nom_equip);

/*
Modifica el valor salari_brut de la taula jugadors 
a un valor per defecte 20000.
*/
ALTER TABLE Jugadors
CHANGE salari_brut salari_brut INTEGER DEFAULT 20000;

/*
Modifica l’atribut alçada a tipus decimal(4,2) i valor 
per defecte null de la taula jugadors.
*/
ALTER TABLE Jugadors
CHANGE alçada alçada DECIMAL(4,2) DEFAULT NULL;

/*
Elimina la columna alçadaSec de la taula jugadors.
*/
ALTER TABLE Jugadors
DROP alçadaSec;


