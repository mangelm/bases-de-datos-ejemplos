/*********************************
 Creación de Base de datos y uso
**********************************/
CREATE DATABASE IF NOT EXISTS Departaments DEFAULT CHARACTER SET latin1;
USE Departaments;

/**************************
        Creación tablas
****************************/
CREATE TABLE IF NOT EXISTS Empleats(
    num_empleat INTEGER,
    nom VARCHAR(50),
    data_naix DATE,
    tlf VARCHAR(12),
    salari DECIMAL(10,2),
    num_fills INTEGER,
    tipus ENUM('fixe','eventual'),
    num_dep INTEGER
);

CREATE TABLE IF NOT EXISTS Departaments(
    num_dep INTEGER,
    nom VARCHAR(50),
    pressupost DECIMAL(10,2),
    num_centre INTEGER
);

CREATE TABLE IF NOT EXISTS Centres(
    num_centre INTEGER,
    nom VARCHAR(50),
    direccio VARCHAR(40),
    localitat VARCHAR(40),
    provincia VARCHAR(30)
);


/**************************
    Modificaciones tablas
****************************/
/*
•	Afegiu claus primàries amb ALTER:
o	empleats(num_empleat)
o	departaments(num_dpt)
o	centres(num_centre)
*/

ALTER TABLE Empleats
ADD PRIMARY KEY (num_empleat);

ALTER TABLE Departaments
ADD PRIMARY KEY (num_dep);

ALTER TABLE Centres
ADD PRIMARY KEY (num_centre);

/*Afegir l’atribut data_incorporacio de 
tipus data desprès data_naix.
*/
ALTER TABLE Empleats 
ADD data_incorporacio DATE
AFTER data_naix;

/*Crear els índexs a les taules empleats, 
departaments i centres, el identificador 
serà el nom de l’atribut acabat amb “_idx”.*/
CREATE INDEX Empleats_idx 
ON Empleats (num_empleat);

CREATE INDEX Departaments_idx 
ON Empleats (num_dep);

CREATE INDEX Centres_idx 
ON Centres (num_centre);

/*
Crear una clau forana per a num_dep 
en la taula empleats cap a departaments
atribut num_dep.
*/
ALTER TABLE Empleats
ADD CONSTRAINT FK_Empleats_num_dep
FOREIGN KEY (num_dep) REFERENCES Departaments(num_dep);

/*
Crear una nova clau forana per a num_centre
 a la taula departaments 
 cap a centres atribut num_centre.
*/
ALTER TABLE Departaments
ADD CONSTRAINT FK_Departaments_num_centre
FOREIGN KEY (num_centre) REFERENCES Centres(num_centre);

/*
Afegir la restricció de clau única (no és posar 
una clau primària) a la taula departaments, per 
evitar que el nom de departament es repeteixi.
*/
ALTER TABLE Departaments
ADD UNIQUE (nom);

/*
Afegir la restricció a departaments per a que el 
pressupost no sigui un valor negatiu. 
*/
ALTER TABLE Departaments
CHANGE pressupost pressupost INTEGER UNSIGNED;

/*
Fixar a totes les taules el tipus d’emmagatzematge 
a innodb i el charset a utf8mb4. Haureu de fer 
servir ALTER TABLE – ENGINE per a fer el canvi 
del motor i CONVERT TO per a convertir les taules 
el charset. (reviseu documentació MYSQL oficial 
per practicar)
*/
ALTER TABLE Empleats 
ENGINE = InnoDB;

ALTER TABLE Departaments 
ENGINE = InnoDB;

ALTER TABLE Centres 
ENGINE = InnoDB;

ALTER TABLE Empleats 
CONVERT TO CHARACTER SET utf8mb4;

ALTER TABLE Departaments
CONVERT TO CHARACTER SET utf8mb4;

ALTER TABLE Centres
CONVERT TO CHARACTER SET utf8mb4;


/**************************
    Insercción de datos
****************************/
/**************************
        Tabla Centres
****************************/
INSERT INTO Centres(num_centre,nom,direccio,localitat,provincia)
VALUES (001,'Zona Sur','C/. Verge Montserrat s/n','Sant Boi de Llobregat','Barcelona');

INSERT INTO Centres(num_centre,nom,direccio,localitat,provincia)
VALUES (002,'Zona Centro','Carretera Marina 4','Prat de Llobregat','Barcelona');
/**************************
        Tabla Departaments
****************************/
INSERT INTO Departaments (num_dep,nom,pressupost,num_centre)
VALUES (005, 'Reparaciones', 150000, 001);

INSERT INTO Departaments(num_dep,nom,pressupost,num_centre)
VALUES (010,'Ventas',200000,002);
/**************************
        Tabla Empleats
****************************/
INSERT INTO Empleats (num_empleat,nom,data_naix,data_incorporacio,tlf,salari,num_fills,tipus,num_dep)
VALUES (001,'Juan Páez','1960/10/25',19801025,954858691,25000.34,0,'fixe',005);

INSERT INTO Empleats (num_empleat,nom,data_naix,data_incorporacio,tlf,salari,num_fills,tipus,num_dep)
VALUES (002,'Rosa Gil','1965/12/25',19891025,954668221,34000.34,1,'fixe',010);



