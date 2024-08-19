
CREATE TABLE Laitetyyppi (
                Laitetyyppi VARCHAR(30) NOT NULL,
                Lisatieto VARCHAR(250),
                CONSTRAINT Laitetyyppi_pk PRIMARY KEY (Laitetyyppi)
)

-- Comment for table [Laitetyyppi]: Minkä tyyppinen laite tai tarvike. Luokittelua varten.

-- Comment for column [Laitetyyppi]: Laitetyypin nimitys, esim. videokameta, kaapeli tms.

-- Comment for column [Lisätieto]: Laitetyypin lisätiedot


CREATE TABLE Lainaaja (
                LainaajaID VARCHAR(50) NOT NULL,
                Etunimi VARCHAR(30) NOT NULL,
                Sukunimi VARCHAR(50) NOT NULL,
                Ryhma VARCHAR(50) NOT NULL,
                Puhelin VARCHAR(20),
                Sahkoposti VARCHAR(30),
                CONSTRAINT Lainaaja_pk PRIMARY KEY (LainaajaID)
)

-- Comment for table [Lainaaja]: Lainaajan henkilötiedot

-- Comment for column [LainaajaID]: Oppilasnumero tai henkilökunnan sähköpostiosoite

-- Comment for column [Ryhmä]: Luokka tai osasto, johon lainaaja kuuluu


CREATE TABLE Laite (
                LaiteID INT IDENTITY NOT NULL,
                Laitetyyppi VARCHAR(30) NOT NULL,
                Nimi VARCHAR(50) NOT NULL,
                Lisatieto VARCHAR(250),
                CONSTRAINT Laite_pk PRIMARY KEY (LaiteID)
)

-- Comment for table [Laite]: Tavarat ja tarvikkeet, joita voi lainata

-- Comment for column [LaiteID]: Automaattisesti kasvava numero, josta tulostetaan viivakooditarra.

-- Comment for column [Laitetyyppi]: Laitetyypin nimitys, esim. videokameta, kaapeli tms.

-- Comment for column [Nimi]: Laitteen tai tarvikkeen nimitys


CREATE TABLE Varaus (
                VarausID INT IDENTITY NOT NULL,
                LainaajaID VARCHAR(50) NOT NULL,
                LaiteID INT NOT NULL,
                Alkaa DATETIME NOT NULL,
                Paattyy DATETIME NOT NULL,
                CONSTRAINT Varaus_pk PRIMARY KEY (VarausID)
)

CREATE TABLE Lainaus (
                LainausID INT IDENTITY NOT NULL,
                LaiteID INT NOT NULL,
                LainaajaID VARCHAR(50) NOT NULL,
                Lainauspaiva DATETIME NOT NULL,
                Palautuspaiva DATETIME,
                CONSTRAINT Lainaus_pk PRIMARY KEY (LainausID)
)

ALTER TABLE Laite ADD CONSTRAINT Laitetyyppi_Laite_fk
FOREIGN KEY (Laitetyyppi)
REFERENCES Laitetyyppi (Laitetyyppi)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Lainaus ADD CONSTRAINT Lainaaja_Lainaus_fk
FOREIGN KEY (LainaajaID)
REFERENCES Lainaaja (LainaajaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Varaus ADD CONSTRAINT Lainaaja_Varaus_fk
FOREIGN KEY (LainaajaID)
REFERENCES Lainaaja (LainaajaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Lainaus ADD CONSTRAINT Laite_Lainaus_fk
FOREIGN KEY (LaiteID)
REFERENCES Laite (LaiteID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Varaus ADD CONSTRAINT Laite_Varaus_fk
FOREIGN KEY (LaiteID)
REFERENCES Laite (LaiteID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
