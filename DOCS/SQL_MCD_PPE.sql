#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: VisiteurMedical
#------------------------------------------------------------

CREATE TABLE VisiteurMedical(
        NumVisiteur Int NOT NULL ,
        Nom         Varchar (255) ,
        Motdepasse  Varchar (255) ,
        Prenom      Varchar (25) ,
        Adresse     Varchar (255) ,
        Ville       Varchar (255) ,
        Secteur     Varchar (255) ,
        Labo        Varchar (25) ,
        Email       Varchar (25) ,
        PRIMARY KEY (NumVisiteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RapportdeVisite
#------------------------------------------------------------

CREATE TABLE RapportdeVisite(
        NumRapport     Int NOT NULL ,
        MotifVisite    Varchar (255) ,
        Bilan          Text ,
        DateRapport    Date ,
        NumVisiteur    Int ,
        NumPraticien   Int ,
        NumEchantillon Int ,
        PRIMARY KEY (NumRapport )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Medicament
#------------------------------------------------------------

CREATE TABLE Medicament(
        NumMedicament Int NOT NULL ,
        Denomination  Varchar (255) ,
        PRIMARY KEY (NumMedicament )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Praticien
#------------------------------------------------------------

CREATE TABLE Praticien(
        NumPraticien Int NOT NULL ,
        Nom          Varchar (255) ,
        Prenom       Varchar (25) ,
        PRIMARY KEY (NumPraticien )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Echantillon
#------------------------------------------------------------

CREATE TABLE Echantillon(
        NumEchantillon Int NOT NULL ,
        PRIMARY KEY (NumEchantillon )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: compose
#------------------------------------------------------------

CREATE TABLE compose(
        quantite       Int ,
        NumMedicament  Int NOT NULL ,
        NumEchantillon Int NOT NULL ,
        PRIMARY KEY (NumMedicament ,NumEchantillon )
)ENGINE=InnoDB;

ALTER TABLE RapportdeVisite ADD CONSTRAINT FK_RapportdeVisite_NumVisiteur FOREIGN KEY (NumVisiteur) REFERENCES VisiteurMedical(NumVisiteur);
ALTER TABLE RapportdeVisite ADD CONSTRAINT FK_RapportdeVisite_NumPraticien FOREIGN KEY (NumPraticien) REFERENCES Praticien(NumPraticien);
ALTER TABLE RapportdeVisite ADD CONSTRAINT FK_RapportdeVisite_NumEchantillon FOREIGN KEY (NumEchantillon) REFERENCES Echantillon(NumEchantillon);
ALTER TABLE compose ADD CONSTRAINT FK_compose_NumMedicament FOREIGN KEY (NumMedicament) REFERENCES Medicament(NumMedicament);
ALTER TABLE compose ADD CONSTRAINT FK_compose_NumEchantillon FOREIGN KEY (NumEchantillon) REFERENCES Echantillon(NumEchantillon);
