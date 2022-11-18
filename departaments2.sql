/*********************************
 Creación de Base de datos y uso
**********************************/
CREATE DATABASE IF NOT EXISTS Departaments2;
USE Departaments2;

/*********************************
        Creación de Tablas
**********************************/
CREATE TABLE IF NOT EXISTS Centres(
    num_centre INTEGER,
    nom VARCHAR(50),
    direcció VARCHAR(40),
    localitat VARCHAR(40),
    provincia VARCHAR(30),
    PRIMARY KEY (num_centre)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Departaments(
    num_dep INTEGER,
    nom VARCHAR(50),
    pressupost DECIMAL(10,2) UNSIGNED,
    num_centre INTEGER,
    PRIMARY KEY (num_dep),
    UNIQUE KEY (nom),
    FOREIGN KEY(num_centre) REFERENCES Centres(num_centre)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Empleats(
    num_empleat INTEGER,
    nom VARCHAR(50),
    data_naix DATE,
    data_incorporacio DATE,
    tlf VARCHAR(12),
    salari DECIMAL(10,2),
    num_fills INTEGER,
    tipus ENUM('fixe','eventual'),
    num_dep INTEGER,
    PRIMARY KEY (num_empleat),
    FOREIGN KEY(num_dep) REFERENCES Departaments(num_dep)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**************************
    Insercción de datos
****************************/
/**************************
        Tabla Centres
****************************/
INSERT INTO Centres(num_centre,nom,direcció,localitat,provincia)
VALUES (001,'Zona Sur','C/. Verge Montserrat s/n','Sant Boi de Llobregat','Barcelona');

INSERT INTO Centres(num_centre,nom,direcció,localitat,provincia)
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
