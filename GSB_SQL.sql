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
        Labo        Varchar (255) ,
        Email       Varchar (255) ,
        PRIMARY KEY (NumVisiteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RapportdeVisite
#------------------------------------------------------------

CREATE TABLE RapportdeVisite(
        NumRapport       Int NOT NULL ,
        MotifVisite      Varchar (255) ,
        Bilan            Text ,
        DateRapport      Date ,
        OffreEchantillon Int ,
        VisiteurMedical  Int ,
        Praticien        Varchar (255) ,
        NumVisiteur      Int ,
        NumPraticien     Int ,
        NumOffre         Int ,
        PRIMARY KEY (NumRapport ) ,
        INDEX (OffreEchantillon ,VisiteurMedical ,Praticien )
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
# Table: OffreEchantillon
#------------------------------------------------------------

CREATE TABLE OffreEchantillon(
        NumOffre Int NOT NULL ,
        PRIMARY KEY (NumOffre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: compose
#------------------------------------------------------------

CREATE TABLE compose(
        Quantite      Int ,
        NumOffre      Int NOT NULL ,
        NumMedicament Int NOT NULL ,
        PRIMARY KEY (NumOffre ,NumMedicament )
)ENGINE=InnoDB;

ALTER TABLE RapportdeVisite ADD CONSTRAINT FK_RapportdeVisite_NumVisiteur FOREIGN KEY (NumVisiteur) REFERENCES VisiteurMedical(NumVisiteur);
ALTER TABLE RapportdeVisite ADD CONSTRAINT FK_RapportdeVisite_NumPraticien FOREIGN KEY (NumPraticien) REFERENCES Praticien(NumPraticien);
ALTER TABLE RapportdeVisite ADD CONSTRAINT FK_RapportdeVisite_NumOffre FOREIGN KEY (NumOffre) REFERENCES OffreEchantillon(NumOffre);
ALTER TABLE compose ADD CONSTRAINT FK_compose_NumOffre FOREIGN KEY (NumOffre) REFERENCES OffreEchantillon(NumOffre);
ALTER TABLE compose ADD CONSTRAINT FK_compose_NumMedicament FOREIGN KEY (NumMedicament) REFERENCES Medicament(NumMedicament);
