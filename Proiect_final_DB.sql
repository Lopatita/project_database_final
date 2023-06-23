CREATE DATABASE Proiect_final_DB;
CREATE TABLE Country (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY (POLYGON, 4326)
);
CREATE TABLE if not exists City (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY (POLYGON, 4326),
    tara_id INT,
    FOREIGN KEY (tara_id) REFERENCES Tara(id)
);
CREATE TABLE Points_of_interest (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY (POLYGON, 4326),
    oras_id INT,
    FOREIGN KEY (oras_id) REFERENCES Oras(id)
);
CREATE TABLE Categorii (
    id INT PRIMARY KEY,
    nume VARCHAR(50)
);
CREATE TABLE County (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY(POLYGON, 4326),
    tara_id INT,
    FOREIGN KEY (tara_id) REFERENCES Tara(id)
);


