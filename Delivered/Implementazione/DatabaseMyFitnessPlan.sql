CREATE DATABASE palestra; 
USE palestra;

CREATE TABLE utenti
(
Email VARCHAR(30) PRIMARY KEY NOT NULL,
DataNascita DATE NOT NULL,
Nome VARCHAR(25) NOT NULL,
Cognome VARCHAR(25) NOT NULL,
Password VARBINARY(255) NOT NULL,
Tipo VARCHAR(10) NOT NULL,
Stato BOOLEAN NOT NULL
)engine=InnoDB;

CREATE TABLE corsi
(
Nome VARCHAR(25) NOT NULL,
DataInizio DATE NOT NULL,
DataFine DATE NOT NULL,
Tipo VARCHAR(15) NOT NULL,
Costo DOUBLE NOT NULL,
Stato BOOLEAN NOT NULL,
EtaConsigliata1 INT NOT NULL,
EtaConsigliata2 INT NOT NULL,
MaxIscritti INT NOT NULL,
NomeIstruttore VARCHAR(25) NOT NULL,
PRIMARY KEY(Nome,DataInizio,DataFine)
)engine=InnoDB;

CREATE TABLE giorni
(
Nome VARCHAR(25) NOT NULL,
OrarioInizio TIME(0) NOT NULL,
OrarioFine TIME(0) NOT NULL,
Luogo VARCHAR(15) NOT NULL,
NomeCorso VARCHAR(25) NOT NULL,
DataInizioCorso DATE NOT NULL,
DataFineCorso DATE NOT NULL,
PRIMARY KEY(Nome,OrarioInizio,OrarioFine,NomeCorso,DataInizioCorso,DataFineCorso),
FOREIGN KEY(NomeCorso,DataInizioCorso,DataFineCorso) REFERENCES corsi(Nome,DataInizio,DataFine)
)engine=InnoDB;

CREATE TABLE iscrizioni
(
	EmailUtente VARCHAR(30) NOT NULL,
    NomeCorso VARCHAR(25) NOT NULL,
    DataInizioCorso DATE NOT NULL,
    DataFineCorso DATE NOT NULL,
    FOREIGN KEY(EmailUtente) REFERENCES utenti(Email),
    FOREIGN KEY(NomeCorso,DataInizioCorso,DataFineCorso) REFERENCES corsi(Nome,DataInizio,DataFine)
)engine=InnoDB;