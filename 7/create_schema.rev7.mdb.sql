CREATE TABLE Benutzergruppen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  IstAdmin int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Benutzergruppen PRIMARY KEY (ID)
);


CREATE TABLE Credentials (
  ID bigint AUTOINCREMENT NOT NULL, 
  Benutzername varchar(255) NOT NULL, 
  BenutzernamePseudonym varchar(255), 
  Initialkennwort varchar(255), 
  PasswordHash varchar(255), 
  RSAPublicKey text, 
  RSAPrivateKey text, 
  AES text,
  CONSTRAINT PK_Credentials PRIMARY KEY (ID),
  CONSTRAINT Credentials_UC1 UNIQUE (Benutzername)
);


CREATE TABLE BenutzerAllgemein (
  ID bigint AUTOINCREMENT NOT NULL, 
  AnzeigeName varchar(255), 
  CredentialID bigint,
  CONSTRAINT PK_BenutzerAllgemein PRIMARY KEY (ID),
  CONSTRAINT BenutzerAllgemein_Credential_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE EigeneSchule_Fachklassen (
  ID bigint AUTOINCREMENT NOT NULL, 
  BKIndex smallint, 
  FKS varchar(3), 
  AP varchar(2), 
  Bezeichnung varchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Kennung varchar(10), 
  FKS_AP_SIM varchar(5), 
  BKIndexTyp varchar(3), 
  Beschreibung_W varchar(100), 
  Status varchar(20), 
  Lernfelder text, 
  DQR_Niveau int, 
  Ebene1Klartext varchar(255), 
  Ebene2Klartext varchar(255), 
  Ebene3Klartext varchar(255),
  CONSTRAINT PK_EigeneSchule_Fachklassen PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_KAoADaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Curriculum varchar(1) DEFAULT '+' NOT NULL, 
  Koordinator varchar(1) DEFAULT '+' NOT NULL, 
  Berufsorientierungsbuero varchar(1) DEFAULT '+' NOT NULL, 
  KooperationsvereinbarungAA varchar(1) DEFAULT '+' NOT NULL, 
  NutzungReflexionsworkshop varchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzI varchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzII varchar(1) DEFAULT '+' NOT NULL,
  CONSTRAINT PK_EigeneSchule_KAoADaten PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Kursart (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(120), 
  InternBez varchar(20), 
  Kursart varchar(5), 
  KursartAllg varchar(5), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Kursart PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Kursart_UC1 UNIQUE (Kursart, KursartAllg)
);


CREATE TABLE EigeneSchule_Merkmale (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schule varchar(1) DEFAULT '+', 
  Schueler varchar(1) DEFAULT '+', 
  Kurztext varchar(10), 
  Langtext varchar(100),
  CONSTRAINT PK_EigeneSchule_Merkmale PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Schulformen (
  ID bigint AUTOINCREMENT NOT NULL, 
  SGL varchar(3), 
  SF_SGL varchar(5), 
  Schulform varchar(100), 
  DoppelQualifikation varchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  BKIndex int, 
  Schulform2 varchar(100),
  CONSTRAINT PK_EigeneSchule_Schulformen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schulformen_UC1 UNIQUE (SGL)
);


CREATE TABLE EigeneSchule_Teilstandorte (
  AdrMerkmal varchar(1) NOT NULL, 
  PLZ varchar(10), 
  Ort varchar(50), 
  Strassenname varchar(55), 
  HausNr varchar(10), 
  HausNrZusatz varchar(30), 
  Bemerkung varchar(50), 
  Kuerzel varchar(30),
  CONSTRAINT PK_EigeneSchule_Teilstandorte PRIMARY KEY (AdrMerkmal)
);


CREATE TABLE EigeneSchule_Texte (
  ID bigint NOT NULL, 
  Kuerzel varchar(50), 
  Inhalt varchar(255), 
  Beschreibung varchar(100), 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Texte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Zertifikate (
  ID bigint AUTOINCREMENT NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Bezeichnung varchar(100), 
  Fach varchar(100), 
  Formatvorlage varchar(255),
  CONSTRAINT PK_EigeneSchule_Zertifikate PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Zertifikate_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Fach_Gliederungen (
  Fach_ID bigint NOT NULL, 
  Gliederung varchar(3) NOT NULL, 
  Faechergruppe int, 
  GewichtungAB int, 
  GewichtungBB int, 
  SchriftlichAB varchar(1) DEFAULT '-', 
  SchriftlichBB varchar(1) DEFAULT '-', 
  GymOSFach varchar(1) DEFAULT '-', 
  ZeugnisBez varchar(130), 
  Lernfelder text, 
  Fachklasse_ID bigint DEFAULT 0 NOT NULL, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Fach_Gliederungen PRIMARY KEY (Fach_ID, Fachklasse_ID)
);


CREATE TABLE Fachgruppen (
  ID bigint NOT NULL, 
  Fachbereich int, 
  SchildFgID bigint, 
  FG_Bezeichnung varchar(80) NOT NULL, 
  FG_Kuerzel varchar(10), 
  Schulformen varchar(255), 
  FarbeR int, 
  FarbeG int, 
  FarbeB int, 
  Sortierung int, 
  FuerZeugnis int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Fachgruppen PRIMARY KEY (ID),
  CONSTRAINT Fachgruppen_UC1 UNIQUE (SchildFgID)
);


CREATE TABLE EigeneSchule_Faecher (
  ID bigint AUTOINCREMENT NOT NULL, 
  FachKrz varchar(20), 
  Bezeichnung varchar(255), 
  ZeugnisBez varchar(255), 
  UeZeugnisBez varchar(255), 
  Zeugnisdatenquelle_ID bigint, 
  StatistikKrz varchar(2), 
  BasisFach varchar(1) DEFAULT '-', 
  IstSprache varchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  SortierungS2 int DEFAULT 32000, 
  NachprErlaubt varchar(1) DEFAULT '+', 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Gewichtung smallint DEFAULT 1, 
  Unterichtssprache varchar(1) DEFAULT 'D', 
  IstSchriftlich varchar(1) DEFAULT '-', 
  IstSchriftlichBA varchar(1) DEFAULT '-', 
  AufZeugnis varchar(1) DEFAULT '+', 
  Lernfelder text, 
  LK_Moegl varchar(1) DEFAULT '+', 
  Abi_Moegl varchar(1) DEFAULT '+', 
  E1 varchar(1) DEFAULT '+', 
  E2 varchar(1) DEFAULT '+', 
  Q1 varchar(1) DEFAULT '+', 
  Q2 varchar(1) DEFAULT '+', 
  Q3 varchar(1) DEFAULT '+', 
  Q4 varchar(1) DEFAULT '+', 
  AlsNeueFSInSII varchar(1) DEFAULT '-', 
  Leitfach_ID bigint, 
  Leitfach2_ID bigint, 
  E1_WZE int, 
  E2_WZE int, 
  Q_WZE int, 
  E1_S varchar(1) DEFAULT '-', 
  E2_S varchar(1) DEFAULT '-', 
  NurMuendlich varchar(1) DEFAULT '-', 
  Aufgabenfeld varchar(2), 
  AbgeschlFaecherHolen varchar(1) DEFAULT '+', 
  GewichtungFHR int, 
  MaxBemZeichen int,
  CONSTRAINT PK_EigeneSchule_Faecher PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Faecher_Zeugnisdatenquellen_FK FOREIGN KEY (Zeugnisdatenquelle_ID) REFERENCES Fachgruppen(SchildFgID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Faecher_UC1 UNIQUE (FachKrz)
);


CREATE TABLE EigeneSchule_FachTeilleistungen (
  Teilleistung_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(5),
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Fach_ID, Kursart, Teilleistung_ID),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Floskelgruppen (
  Kuerzel varchar(10) NOT NULL, 
  Hauptgruppe varchar(4), 
  Bezeichnung varchar(50) NOT NULL, 
  Farbe int,
  CONSTRAINT PK_Floskelgruppen PRIMARY KEY (Kuerzel)
);


CREATE TABLE Floskeln (
  Kuerzel varchar(10) NOT NULL, 
  FloskelText text NOT NULL, 
  FloskelGruppe varchar(10), 
  FloskelFach varchar(20), 
  FloskelNiveau varchar(2), 
  FloskelJahrgang varchar(2),
  CONSTRAINT PK_Floskeln PRIMARY KEY (Kuerzel),
  CONSTRAINT Floskeln_Floskelgruppe_Floskelgruppen_FK FOREIGN KEY (FloskelGruppe) REFERENCES Floskelgruppen(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Gost_Jahrgangsdaten (
  Abi_Jahrgang int NOT NULL, 
  ZusatzkursGEVorhanden int DEFAULT 1, 
  ZusatzkursGEErstesHalbjahr varchar(4) DEFAULT 'Q2.1', 
  ZusatzkursSWVorhanden int DEFAULT 1, 
  ZusatzkursSWErstesHalbjahr varchar(4) DEFAULT 'Q2.1', 
  TextBeratungsbogen varchar(2000), 
  TextMailversand varchar(2000),
  CONSTRAINT PK_Gost_Jahrgangsdaten PRIMARY KEY (Abi_Jahrgang)
);


CREATE TABLE Gost_Blockung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Name varchar(255) DEFAULT 'Neue Blockung' NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL,
  CONSTRAINT PK_Gost_Blockung PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgang_Fachkombinationen (
  Abi_Jahrgang int NOT NULL, 
  ID varchar(30) NOT NULL, 
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 varchar(5), 
  Kursart2 varchar(5), 
  Phase varchar(10) DEFAULT '-' NOT NULL, 
  Typ int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Fachkombinationen PRIMARY KEY (Abi_Jahrgang, ID),
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Fach1_ID_FK FOREIGN KEY (Fach1_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Fach2_ID_FK FOREIGN KEY (Fach2_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgang_Faecher (
  Abi_Jahrgang int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  WaehlbarEF1 int DEFAULT 1 NOT NULL, 
  WaehlbarEF2 int DEFAULT 1 NOT NULL, 
  WaehlbarQ11 int DEFAULT 1 NOT NULL, 
  WaehlbarQ12 int DEFAULT 1 NOT NULL, 
  WaehlbarQ21 int DEFAULT 1 NOT NULL, 
  WaehlbarQ22 int DEFAULT 1 NOT NULL, 
  WaehlbarAbiGK int DEFAULT 1 NOT NULL, 
  WaehlbarAbiLK int DEFAULT 1 NOT NULL, 
  WochenstundenEF1 int, 
  WochenstundenEF2 int, 
  WochenstundenQPhase int, 
  SchiftlichkeitEF1 varchar(1), 
  SchiftlichkeitEF2 varchar(1), 
  NurMuendlich int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Faecher PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Faecher_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Faecher_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Kurse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(5) DEFAULT 'GK' NOT NULL, 
  Kursnummer int NOT NULL, 
  IstKoopKurs int DEFAULT 0 NOT NULL, 
  BezeichnungSuffix varchar(255), 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Kurse PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Kurse_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Regeln (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Typ int NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Regeln PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Regeln_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Schienen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Nummer int NOT NULL, 
  Bezeichnung varchar(255) DEFAULT 'Schiene' NOT NULL, 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Schienen PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Schienen_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Zwischenergebnisse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  AnzahlUmwaehler int DEFAULT 0 NOT NULL, 
  Bewertung bigint DEFAULT -1 NOT NULL, 
  IstMarkiert int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Regelparameter (
  Regel_ID bigint NOT NULL, 
  Nummer int NOT NULL, 
  Parameter bigint NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Regelparameter PRIMARY KEY (Regel_ID, Nummer),
  CONSTRAINT Gost_Blockung_Regelparameter_Regel_FK FOREIGN KEY (Regel_ID) REFERENCES Gost_Blockung_Regeln(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Zwischenergebnisse_Kurs_Schienen (
  Zwischenergebnis_ID bigint NOT NULL, 
  Blockung_Kurs_ID bigint NOT NULL, 
  Schienen_ID bigint NOT NULL, 
  HatKollision int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schienen PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schienen_ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_ErgID_FK FOREIGN KEY (Zwischenergebnis_ID) REFERENCES Gost_Blockung_Zwischenergebnisse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_Schiene_FK FOREIGN KEY (Schienen_ID) REFERENCES Gost_Blockung_Schienen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ImpExp_EigeneImporte (
  ID int DEFAULT 0 NOT NULL, 
  Title varchar(50), 
  DelimiterChar varchar(1), 
  TextQuote varchar(1), 
  SkipLines smallint DEFAULT 0, 
  DateFormat varchar(10), 
  BooleanTrue varchar(10), 
  AbkWeiblich varchar(10), 
  AbkMaennlich varchar(10), 
  MainTable varchar(50), 
  InsertMode int, 
  LookupTableDir varchar(250), 
  SchuelerIDMode varchar(4),
  CONSTRAINT PK_ImpExp_EigeneImporte PRIMARY KEY (ID)
);


CREATE TABLE ImpExp_EigeneImporte_Felder (
  Import_ID int DEFAULT 0 NOT NULL, 
  Field_ID int DEFAULT 0, 
  TableDescription varchar(50), 
  FieldDescription varchar(50), 
  SrcPosition smallint DEFAULT 0, 
  DstTable varchar(50), 
  DstFieldName varchar(50), 
  DstFieldType varchar(1), 
  DstFieldIsIdentifier int, 
  DstLookupDir varchar(250), 
  DstLookupTable varchar(50), 
  DstLookupFieldName varchar(50), 
  DstLookupTableIDFieldName varchar(50), 
  DstResultFieldName varchar(50), 
  DstKeyLookupInsert int, 
  DstKeyLookupNameCreateID int, 
  DstForceNumeric int,
  CONSTRAINT PK_ImpExp_EigeneImporte_Felder PRIMARY KEY (Import_ID, Field_ID)
);


CREATE TABLE ImpExp_EigeneImporte_Tabellen (
  Import_ID int DEFAULT 0 NOT NULL, 
  TableName varchar(50), 
  DstCreateID int, 
  DstIDFieldName varchar(50), 
  Sequence int DEFAULT 0, 
  LookupTable varchar(50), 
  LookupFields varchar(50), 
  LookupFieldTypes varchar(50), 
  LookupFieldPos varchar(50), 
  LookupKeyField varchar(50), 
  LookupResultField varchar(50), 
  LookupResultFieldType varchar(10), 
  DstDefaultFieldName varchar(50), 
  DstDefaultFieldValue varchar(10), 
  GU_ID_Field varchar(50),
  CONSTRAINT PK_ImpExp_EigeneImporte_Tabellen PRIMARY KEY (Import_ID, TableName)
);


CREATE TABLE K_Adressart (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Adressart PRIMARY KEY (ID),
  CONSTRAINT K_Adressart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ankreuzdaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  TextStufe1 varchar(100), 
  TextStufe2 varchar(100), 
  TextStufe3 varchar(100), 
  TextStufe4 varchar(100), 
  TextStufe5 varchar(100), 
  BezeichnungSONST varchar(100),
  CONSTRAINT PK_K_Ankreuzdaten PRIMARY KEY (ID)
);


CREATE TABLE K_Ankreuzfloskeln (
  ID bigint AUTOINCREMENT NOT NULL, 
  Fach_ID bigint, 
  IstASV int DEFAULT 0 NOT NULL, 
  Jahrgang varchar(2) NOT NULL, 
  Gliederung varchar(3), 
  FloskelText varchar(255) NOT NULL, 
  Sortierung int, 
  FachSortierung int, 
  Abschnitt int, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aktiv varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Ankreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT K_Ankreuzfloskeln_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE K_BeschaeftigungsArt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(250), 
  Sichtbar varchar(1) DEFAULT '+' NOT NULL, 
  Schluessel varchar(20), 
  Sortierung int DEFAULT 32000 NOT NULL, 
  Beschreibung text, 
  PersonArt varchar(1),
  CONSTRAINT PK_K_Datenschutz PRIMARY KEY (ID)
);


CREATE TABLE K_EinschulungsArt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(40) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_EinschulungsArt PRIMARY KEY (ID),
  CONSTRAINT K_EinschulungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Einzelleistungen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Gewichtung float,
  CONSTRAINT PK_K_Einzelleistungen PRIMARY KEY (ID)
);


CREATE TABLE K_EntlassGrund (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_EntlassGrund PRIMARY KEY (ID),
  CONSTRAINT K_EntlassGrund_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherArt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  ExportBez varchar(20),
  CONSTRAINT PK_K_ErzieherArt PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherFunktion (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_ErzieherFunktion PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherFunktion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_FahrschuelerArt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_FahrschuelerArt PRIMARY KEY (ID),
  CONSTRAINT K_FahrschuelerArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Foerderschwerpunkt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  StatistikKrz varchar(2), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Foerderschwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Foerderschwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Haltestelle (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  EntfernungSchule float,
  CONSTRAINT PK_K_Haltestelle PRIMARY KEY (ID),
  CONSTRAINT K_Haltestelle_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Kindergarten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(100), 
  PLZ varchar(10), 
  Ort varchar(30), 
  Strassenname varchar(55), 
  HausNr varchar(10), 
  HausNrZusatz varchar(30), 
  Tel varchar(20), 
  Email varchar(40), 
  Bemerkung varchar(50), 
  Sichtbar varchar(1) DEFAULT '-', 
  Sortierung int,
  CONSTRAINT PK_K_Kindergarten PRIMARY KEY (ID)
);


CREATE TABLE K_Ort (
  ID bigint AUTOINCREMENT NOT NULL, 
  PLZ varchar(10) NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Kreis varchar(3), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Land varchar(2),
  CONSTRAINT PK_K_Ort PRIMARY KEY (ID),
  CONSTRAINT K_Ort_UC1 UNIQUE (PLZ, Bezeichnung)
);

CREATE INDEX K_Ort_IDX1 ON K_Ort(PLZ);


CREATE TABLE K_AllgAdresse (
  ID bigint AUTOINCREMENT NOT NULL, 
  AdressArt_ID bigint, 
  AllgAdrName1 varchar(50), 
  AllgAdrName2 varchar(50), 
  AllgAdrStrassenname varchar(55), 
  AllgAdrHausNr varchar(10), 
  AllgAdrHausNrZusatz varchar(30), 
  AllgAdrOrt_ID bigint, 
  AllgAdrTelefon1 varchar(20), 
  AllgAdrTelefon2 varchar(20), 
  AllgAdrFax varchar(20), 
  AllgAdrEmail varchar(100), 
  AllgAdrBemerkungen varchar(255), 
  Sortierung int DEFAULT 32000, 
  AllgAdrAusbildungsBetrieb varchar(1) DEFAULT '-', 
  AllgAdrBietetPraktika varchar(1) DEFAULT '-', 
  AllgAdrBranche varchar(50), 
  AllgAdrZusatz1 varchar(10), 
  AllgAdrZusatz2 varchar(10), 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  Massnahmentraeger varchar(1) DEFAULT '-', 
  BelehrungISG varchar(1) DEFAULT '-', 
  GU_ID varchar(40), 
  ErwFuehrungszeugnis varchar(1) DEFAULT '-', 
  ExtID varchar(50),
  CONSTRAINT PK_K_AllgAdresse PRIMARY KEY (ID),
  CONSTRAINT K_AllgAdresse_K_Adressart_FK FOREIGN KEY (AdressArt_ID) REFERENCES K_Adressart(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE AllgAdrAnsprechpartner (
  ID bigint AUTOINCREMENT NOT NULL, 
  Adresse_ID bigint NOT NULL, 
  Name varchar(120), 
  Vorname varchar(80), 
  Anrede varchar(10), 
  Telefon varchar(20), 
  Email varchar(100), 
  Abteilung varchar(50), 
  Titel varchar(15), 
  GU_ID varchar(40),
  CONSTRAINT PK_AllgAdrAnsprechpartner PRIMARY KEY (ID),
  CONSTRAINT AllgAdrAnsprechpartner_Adr_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE K_Ortsteil (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Ort_ID bigint, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  OrtsteilSchluessel varchar(30),
  CONSTRAINT PK_K_Ortsteil PRIMARY KEY (ID),
  CONSTRAINT K_Ortsteil_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT K_Ortsteil_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Religion (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  StatistikKrz varchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  ExportBez varchar(20), 
  ZeugnisBezeichnung varchar(50),
  CONSTRAINT PK_K_Religion PRIMARY KEY (ID),
  CONSTRAINT K_Religion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Schule (
  ID bigint AUTOINCREMENT NOT NULL, 
  SchulNr varchar(6) NOT NULL, 
  Name varchar(120), 
  SchulformNr varchar(3), 
  SchulformKrz varchar(3), 
  SchulformBez varchar(50), 
  Strassenname varchar(55), 
  HausNr varchar(10), 
  HausNrZusatz varchar(30), 
  PLZ varchar(10), 
  Ort varchar(50), 
  Telefon varchar(20), 
  Fax varchar(20), 
  Email varchar(40), 
  Schulleiter varchar(40), 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  SchulNr_SIM varchar(6), 
  Kuerzel varchar(10), 
  KurzBez varchar(40),
  CONSTRAINT PK_K_Schule PRIMARY KEY (ID),
  CONSTRAINT K_Schule_UC1 UNIQUE (SchulNr)
);


CREATE TABLE K_Schulfunktionen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50), 
  Sortierung int, 
  Sichtbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Schulfunktionen PRIMARY KEY (ID)
);


CREATE TABLE K_Schwerpunkt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Schwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Schwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Sportbefreiung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Sportbefreiung PRIMARY KEY (ID),
  CONSTRAINT K_Sportbefreiung_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_TelefonArt (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_TelefonArt PRIMARY KEY (ID),
  CONSTRAINT K_TelefonArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Textdateien (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(32), 
  Text_ID bigint NOT NULL, 
  Text_Body text, 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung smallint,
  CONSTRAINT PK_K_Textdateien PRIMARY KEY (ID)
);


CREATE TABLE K_Vermerkart (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Vermerkart PRIMARY KEY (ID),
  CONSTRAINT K_Vermerkart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Zertifikate (
  Kuerzel varchar(5) NOT NULL, 
  Bezeichnung varchar(50) NOT NULL,
  CONSTRAINT PK_K_Zertifikate PRIMARY KEY (Kuerzel)
);


CREATE TABLE Katalog_Aufsichtsbereich (
  ID bigint AUTOINCREMENT NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Beschreibung varchar(1000) NOT NULL,
  CONSTRAINT PK_Katalog_Aufsichtsbereich PRIMARY KEY (ID),
  CONSTRAINT Katalog_Aufsichtsbereich_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Katalog_Pausenzeiten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Tag int NOT NULL, 
  Beginn timestamp DEFAULT Now() NOT NULL, 
  Ende timestamp DEFAULT Now() NOT NULL,
  CONSTRAINT PK_Katalog_Pausenzeiten PRIMARY KEY (ID),
  CONSTRAINT Katalog_Pausenzeiten_UC1 UNIQUE (Tag, Beginn, Ende)
);


CREATE TABLE Katalog_Raeume (
  ID bigint AUTOINCREMENT NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Beschreibung varchar(1000) NOT NULL, 
  Groesse int DEFAULT 40 NOT NULL,
  CONSTRAINT PK_Katalog_Raeume PRIMARY KEY (ID),
  CONSTRAINT Katalog_Raeume_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Katalog_Zeitraster (
  ID bigint AUTOINCREMENT NOT NULL, 
  Tag int NOT NULL, 
  Stunde int NOT NULL, 
  Beginn timestamp DEFAULT Now() NOT NULL, 
  Ende timestamp DEFAULT Now() NOT NULL,
  CONSTRAINT PK_Katalog_Zeitraster PRIMARY KEY (ID),
  CONSTRAINT Katalog_Zeitraster_UC1 UNIQUE (Tag, Stunde)
);


CREATE TABLE Kompetenzgruppen (
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL, 
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung varchar(50) NOT NULL,
  CONSTRAINT PK_Kompetenzgruppen PRIMARY KEY (KG_ID)
);


CREATE TABLE Kompetenzen (
  KO_ID bigint NOT NULL, 
  KO_Gruppe bigint NOT NULL, 
  KO_Bezeichnung varchar(64) NOT NULL,
  CONSTRAINT PK_Kompetenzen PRIMARY KEY (KO_ID),
  CONSTRAINT Kompetenzen_Kompetenzgruppen_FK FOREIGN KEY (KO_Gruppe) REFERENCES Kompetenzgruppen(KG_ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE BenutzergruppenKompetenzen (
  Gruppe_ID bigint NOT NULL, 
  Kompetenz_ID bigint NOT NULL,
  CONSTRAINT PK_BenutzergruppenKompetenzen PRIMARY KEY (Gruppe_ID, Kompetenz_ID),
  CONSTRAINT BenutzergruppenKompetenzen_Benutzergruppen_FK FOREIGN KEY (Gruppe_ID) REFERENCES Benutzergruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BenutzergruppenKompetenzen_Kompetenzen_FK FOREIGN KEY (Kompetenz_ID) REFERENCES Kompetenzen(KO_ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE KursFortschreibungsarten (
  ID bigint NOT NULL, 
  Kuerzel varchar(20) DEFAULT 'N' NOT NULL, 
  Bezeichnung varchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_KursFortschreibungsarten PRIMARY KEY (ID),
  CONSTRAINT KursFortschreibungsarten_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Lernplattformen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  BenutzernameSuffixLehrer varchar(255), 
  BenutzernameSuffixErzieher varchar(255), 
  BenutzernameSuffixSchueler varchar(255), 
  Konfiguration text,
  CONSTRAINT PK_Lernplattformen PRIMARY KEY (ID)
);


CREATE TABLE CredentialsLernplattformen (
  ID bigint AUTOINCREMENT NOT NULL, 
  LernplattformID bigint NOT NULL, 
  Benutzername varchar(255) NOT NULL, 
  BenutzernamePseudonym varchar(255), 
  Initialkennwort varchar(255), 
  PashwordHash varchar(255), 
  RSAPublicKey text, 
  RSAPrivateKey text, 
  AES text,
  CONSTRAINT PK_CredentialsLernplattformen PRIMARY KEY (ID),
  CONSTRAINT CredentialsLernplattformen_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT CredentialsLernplattformen_UC1 UNIQUE (LernplattformID, Benutzername)
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 varchar(5), 
  Kursart2 varchar(5), 
  PK varchar(30) NOT NULL, 
  Sortierung int, 
  Phase varchar(10), 
  Typ varchar(1),
  CONSTRAINT PK_NichtMoeglAbiFachKombi PRIMARY KEY (PK),
  CONSTRAINT NichtMoeglAbiFachKombi_Fach1_FK FOREIGN KEY (Fach1_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT NichtMoeglAbiFachKombi_Fach2_FK FOREIGN KEY (Fach2_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Noten (
  ID bigint NOT NULL, 
  Kuerzel varchar(2) NOT NULL, 
  IstTendenznote int DEFAULT 0 NOT NULL, 
  Text varchar(255), 
  AufZeugnis int DEFAULT 0 NOT NULL, 
  Notenpunkte int, 
  TextLaufbahnSII varchar(2), 
  AufLaufbahnSII int DEFAULT 0 NOT NULL, 
  Sortierung int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Noten PRIMARY KEY (ID),
  CONSTRAINT Noten_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE PersonalTypen (
  ID bigint NOT NULL, 
  Kuerzel varchar(20), 
  Bezeichnung varchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_PersonalTypen PRIMARY KEY (ID),
  CONSTRAINT PersonalTypen_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Personengruppen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Gruppenname varchar(100) NOT NULL, 
  Zusatzinfo varchar(100), 
  SammelEmail varchar(100), 
  GruppenArt varchar(20), 
  XMLExport varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_Personengruppen PRIMARY KEY (ID)
);


CREATE TABLE Personengruppen_Personen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Gruppe_ID bigint NOT NULL, 
  Person_ID bigint, 
  PersonNr int, 
  PersonArt varchar(1), 
  PersonName varchar(120) NOT NULL, 
  PersonVorname varchar(80), 
  PersonPLZ varchar(10), 
  PersonOrt varchar(50), 
  PersonStrassenname varchar(55), 
  PersonHausNr varchar(10), 
  PersonHausNrZusatz varchar(30), 
  PersonTelefon varchar(20), 
  PersonMobil varchar(20), 
  PersonEmail varchar(100), 
  Bemerkung varchar(100), 
  Zusatzinfo varchar(100), 
  Sortierung int, 
  PersonAnrede varchar(10), 
  PersonAkadGrad varchar(15),
  CONSTRAINT PK_Personengruppen_Personen PRIMARY KEY (ID),
  CONSTRAINT Personengruppen_Personen_Gruppe FOREIGN KEY (Gruppe_ID) REFERENCES Personengruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SVWS_Client_Konfiguration_Global (
  AppName varchar(100) NOT NULL, 
  Schluessel varchar(255) NOT NULL, 
  Wert text NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Global PRIMARY KEY (AppName, Schluessel)
);


CREATE TABLE SVWS_Core_Type_Versionen (
  NameTabelle varchar(200) NOT NULL, 
  Name varchar(200) NOT NULL, 
  Version bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_Core_Type_Versionen PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_AutoInkremente (
  NameTabelle varchar(200) NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_DB_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_Version (
  Revision int DEFAULT 0 NOT NULL, 
  IsTainted int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SVWS_DB_Version PRIMARY KEY (Revision)
);


CREATE TABLE SchildFilter (
  ID bigint AUTOINCREMENT NOT NULL, 
  Art varchar(1), 
  Name varchar(50) NOT NULL, 
  Beschreibung varchar(255), 
  Tabellen varchar(255), 
  ZusatzTabellen varchar(255), 
  Bedingung text, 
  BedingungKlartext text,
  CONSTRAINT PK_SchildFilter PRIMARY KEY (ID),
  CONSTRAINT SchildFilter_UC1 UNIQUE (Name)
);


CREATE TABLE Schildintern_AbiturInfos (
  PrfOrdnung varchar(20) NOT NULL, 
  AbiFach varchar(1) NOT NULL, 
  Bedingung varchar(3), 
  AbiInfoKrz varchar(20), 
  AbiInfoBeschreibung varchar(255), 
  AbiInfoText text, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_AbiturInfos PRIMARY KEY (AbiFach, AbiInfoKrz, Bedingung, PrfOrdnung)
);


CREATE TABLE Schildintern_Berufsebene (
  Berufsebene int NOT NULL, 
  Kuerzel varchar(2) NOT NULL, 
  Klartext varchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Berufsebene PRIMARY KEY (Berufsebene, Kuerzel)
);


CREATE TABLE Schildintern_DQR_Niveaus (
  Gliederung varchar(4) NOT NULL, 
  FKS varchar(8) NOT NULL, 
  DQR_Niveau int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_DQR_Niveaus PRIMARY KEY (Gliederung, FKS, DQR_Niveau)
);


CREATE TABLE Schildintern_Datenart (
  DatenartKrz varchar(10) NOT NULL, 
  Datenart varchar(50), 
  Tabellenname varchar(30), 
  Reihenfolge int, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Datenart PRIMARY KEY (DatenartKrz)
);


CREATE TABLE Schildintern_FaecherSortierung (
  Fach varchar(2) NOT NULL, 
  Bezeichnung varchar(80), 
  Sortierung1 int, 
  Sortierung2 int, 
  Fachgruppe_ID bigint, 
  FachgruppeKrz varchar(2), 
  AufgabenbereichAbitur varchar(5),
  CONSTRAINT PK_Schildintern_FaecherSortierung PRIMARY KEY (Fach)
);


CREATE TABLE Schildintern_FilterFehlendeEintraege (
  ID bigint NOT NULL, 
  Beschreibung varchar(100), 
  Feldname varchar(30), 
  Tabellen varchar(50), 
  SQLText varchar(100), 
  Schulform varchar(50), 
  Feldtyp varchar(1),
  CONSTRAINT PK_Schildintern_FilterFehlendeEintraege PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_FilterFehlendeEintraegeSchild3 (
  ID bigint NOT NULL, 
  Beschreibung varchar(100), 
  Feldname varchar(30), 
  Tabellen varchar(50), 
  SQLText varchar(100), 
  Schulform varchar(50), 
  Feldtyp varchar(1),
  CONSTRAINT PK_Schildintern_FilterFehlendeEintraegeSchild3 PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_FilterFeldListe (
  ID bigint NOT NULL, 
  Bezeichnung varchar(50), 
  DBFeld varchar(50), 
  Typ varchar(50), 
  Werte varchar(20), 
  StdWert varchar(5), 
  Operator varchar(10), 
  Zusatzbedingung varchar(50),
  CONSTRAINT PK_Schildintern_FilterFeldListe PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_HSchStatus (
  StatusNr int NOT NULL, 
  Bezeichnung varchar(255), 
  Sortierung int, 
  InSimExp varchar(1) DEFAULT '+', 
  SIMAbschnitt varchar(1),
  CONSTRAINT PK_Schildintern_HSchStatus PRIMARY KEY (StatusNr)
);


CREATE TABLE Schildintern_KAoA_Anschlussoption (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  AO_Kuerzel varchar(10) NOT NULL, 
  AO_Beschreibung varchar(255), 
  AO_Stufen varchar(10), 
  Zusatzmerkmal_Anzeige varchar(50),
  CONSTRAINT PK_Schildintern_KAoA_Anschlussoption PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Anschlussoption_IDX1 ON Schildintern_KAoA_Anschlussoption(AO_Kuerzel);


CREATE TABLE Schildintern_KAoA_Berufsfeld (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  BF_Kuerzel varchar(10) NOT NULL, 
  BF_Beschreibung varchar(255),
  CONSTRAINT PK_Schildintern_KAoA_Berufsfeld PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Berufsfeld_IDX1 ON Schildintern_KAoA_Berufsfeld(BF_Kuerzel);


CREATE TABLE Schildintern_KAoA_Kategorie (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  K_Kuerzel varchar(10) NOT NULL, 
  K_Beschreibung varchar(255), 
  K_Jahrgaenge varchar(25),
  CONSTRAINT PK_Schildintern_KAoA_Kategorie PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Kategorie_IDX1 ON Schildintern_KAoA_Kategorie(K_Kuerzel);


CREATE TABLE Schildintern_KAoA_Merkmal (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  M_Kuerzel varchar(20) NOT NULL, 
  Kategorie_ID bigint NOT NULL, 
  M_Beschreibung varchar(255), 
  M_Option varchar(25), 
  M_Kategorie varchar(10), 
  BK_Anlagen varchar(255),
  CONSTRAINT PK_Schildintern_KAoA_Merkmal PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_Merkmal_Kategorie_FK FOREIGN KEY (Kategorie_ID) REFERENCES Schildintern_KAoA_Kategorie(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schildintern_KAoA_Merkmal_IDX1 ON Schildintern_KAoA_Merkmal(M_Kuerzel);


CREATE TABLE Schildintern_KAoA_Zusatzmerkmal (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  ZM_Kuerzel varchar(20) NOT NULL, 
  Merkmal_ID bigint NOT NULL, 
  ZM_Beschreibung varchar(255), 
  ZM_Option varchar(25), 
  ZM_Merkmal varchar(20),
  CONSTRAINT PK_Schildintern_KAoA_Zusatzmerkmal PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_Zusatzmerkmal_Merkmal_FK FOREIGN KEY (Merkmal_ID) REFERENCES Schildintern_KAoA_Merkmal(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schildintern_KAoA_Zusatzmerkmal_IDX1 ON Schildintern_KAoA_Zusatzmerkmal(ZM_Kuerzel);


CREATE TABLE Schildintern_KAoA_SBO_Ebene4 (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  Kuerzel_EB4 varchar(20) NOT NULL, 
  Beschreibung_EB4 varchar(255), 
  Zusatzmerkmal varchar(20), 
  Zusatzmerkmal_ID bigint,
  CONSTRAINT PK_Schildintern_KAoA_SBO_Ebene4 PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_SBO_Ebene4_Zusatzmerkmall_FK FOREIGN KEY (Zusatzmerkmal_ID) REFERENCES Schildintern_KAoA_Zusatzmerkmal(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schildintern_KAoA_SBO_Ebene4_IDX1 ON Schildintern_KAoA_SBO_Ebene4(Kuerzel_EB4);


CREATE TABLE Schildintern_Laender (
  Kurztext varchar(2) NOT NULL, 
  Langtext varchar(40), 
  Sortierung int, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Laender PRIMARY KEY (Kurztext)
);


CREATE TABLE Schildintern_PrfSemAbschl (
  Nr varchar(2) NOT NULL, 
  Klartext varchar(50), 
  StatistikKrz varchar(1), 
  Sortierung int, 
  Schulform varchar(2) NOT NULL, 
  StatistikKrzNeu varchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_PrfSemAbschl PRIMARY KEY (Nr, Schulform)
);


CREATE TABLE Schildintern_PruefOrd_Optionen (
  OP_Schulformen varchar(20) NOT NULL, 
  OP_POKrz varchar(30) NOT NULL, 
  OP_Krz varchar(40) NOT NULL, 
  OP_Abgangsart_B varchar(2), 
  OP_Abgangsart_NB varchar(2), 
  OP_Art varchar(1) NOT NULL, 
  OP_Typ varchar(5), 
  OP_Bildungsgang varchar(1) NOT NULL, 
  OP_Name varchar(255) NOT NULL, 
  OP_Kommentar varchar(100), 
  OP_Jahrgaenge varchar(20) NOT NULL, 
  OP_BKIndex varchar(50), 
  OP_BKAnl_Typ varchar(50), 
  OP_Reihenfolge int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_PruefOrd_Optionen PRIMARY KEY (OP_Art, OP_Bildungsgang, OP_Jahrgaenge, OP_Krz, OP_Name, OP_POKrz, OP_Reihenfolge, OP_Schulformen)
);


CREATE TABLE Schildintern_PruefungsOrdnung (
  PO_Schulform varchar(50) NOT NULL, 
  PO_Krz varchar(30) NOT NULL, 
  PO_Name varchar(255) NOT NULL, 
  PO_SGL varchar(50) NOT NULL, 
  PO_MinJahrgang int DEFAULT 0 NOT NULL, 
  PO_MaxJahrgang int DEFAULT 20 NOT NULL, 
  PO_Jahrgaenge varchar(30) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_PruefungsOrdnung PRIMARY KEY (PO_Krz, PO_Schulform, PO_SGL)
);


CREATE TABLE Schildintern_SchuelerImpExp (
  Tabelle varchar(50) NOT NULL, 
  TabellenAnzeige varchar(50), 
  MasterTable varchar(50), 
  ExpCmd varchar(250), 
  SrcGetFieldsSQL varchar(250), 
  DeleteSQL varchar(250), 
  DstGetIDSQL varchar(250), 
  HauptFeld varchar(50), 
  DetailFeld varchar(50), 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_SchuelerImpExp PRIMARY KEY (Tabelle)
);


CREATE TABLE Schildintern_SpezialFilterFelder (
  ID bigint NOT NULL, 
  Gruppe varchar(2), 
  KurzBez varchar(50), 
  Bezeichnung varchar(50), 
  Grundschule varchar(1), 
  Tabelle varchar(30), 
  DBFeld varchar(50), 
  Typ varchar(1), 
  Control varchar(10), 
  WerteAnzeige varchar(20), 
  WerteSQL varchar(20), 
  LookupInfo varchar(50), 
  OperatorenAnzeige varchar(150), 
  OperatorenSQL varchar(100), 
  Zusatzbedingung varchar(100), 
  ZusatzTabellen varchar(50),
  CONSTRAINT PK_Schildintern_SpezialFilterFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_TextExport (
  DatenartKrz varchar(10) NOT NULL, 
  Feldname varchar(30) NOT NULL, 
  AnzeigeText varchar(50) NOT NULL, 
  Feldtyp varchar(1), 
  Feldwerte varchar(20), 
  ErgebnisWerte varchar(100), 
  LookupFeldname varchar(100), 
  LookupSQLText text, 
  DBFormat varchar(10) DEFAULT 'ALLE' NOT NULL,
  CONSTRAINT PK_Schildintern_TextExport PRIMARY KEY (AnzeigeText, DatenartKrz, DBFormat, Feldname)
);


CREATE TABLE Schildintern_UnicodeUmwandlung (
  ID bigint NOT NULL, 
  Unicodezeichen varchar(2), 
  Ersatzzeichen varchar(2), 
  DecimalZeichen varchar(20), 
  DecimalErsatzzeichen varchar(20), 
  Hexzeichen varchar(50), 
  HexErsatzzeichen varchar(50),
  CONSTRAINT PK_Schildintern_UnicodeUmwandlung PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_VerfImportFelder (
  ID bigint NOT NULL, 
  TableDescription varchar(50), 
  FieldDescription varchar(50), 
  DstTable varchar(50), 
  DstFieldName varchar(50), 
  DstFieldType varchar(1), 
  DstRequiredState varchar(1), 
  DstLookupTable varchar(50), 
  DstLookupTableIDFieldName varchar(50), 
  DstLookupFieldName varchar(50), 
  DstResultFieldName varchar(50), 
  DstKeyLookupInsert varchar(1), 
  DstKeyLookupNameCreateID varchar(1), 
  DstForceNumeric varchar(1),
  CONSTRAINT PK_Schildintern_VerfImportFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_VerfImportTabellen (
  TableName varchar(50) NOT NULL, 
  DstRequiredFields varchar(50), 
  DstIDFieldName varchar(50), 
  Sequence int, 
  LookupTable varchar(50), 
  LookupFields varchar(50), 
  LookupFieldTypes varchar(50), 
  LookupResultField varchar(50), 
  LookupResultFieldType varchar(10), 
  LookupKeyField varchar(50), 
  DstDefaultFieldName varchar(50), 
  DstDefaultFieldValue varchar(20), 
  DstCreateID varchar(1), 
  GU_ID_Field varchar(50),
  CONSTRAINT PK_Schildintern_VerfImportTabellen PRIMARY KEY (TableName)
);


CREATE TABLE Schildintern_Zusatzinfos (
  SGL_BKAbschl varchar(50) NOT NULL, 
  JG_BKAbschl varchar(50) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Zusatzinfos PRIMARY KEY (JG_BKAbschl, SGL_BKAbschl)
);


CREATE TABLE SchuelerListe (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Erzeuger varchar(20), 
  Privat varchar(1) DEFAULT '+',
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerStatus (
  ID int NOT NULL, 
  Bezeichnung varchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_SchuelerStatus PRIMARY KEY (ID),
  CONSTRAINT SchuelerStatus_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuleCredentials (
  Schulnummer int NOT NULL, 
  RSAPublicKey text, 
  RSAPrivateKey text, 
  AES text,
  CONSTRAINT PK_SchuleCredentials PRIMARY KEY (Schulnummer)
);


CREATE TABLE Schuljahresabschnitte (
  ID bigint AUTOINCREMENT NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  VorigerAbschnitt_ID bigint, 
  FolgeAbschnitt_ID bigint,
  CONSTRAINT PK_Schuljahresabschnitte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule (
  ID bigint NOT NULL, 
  SchulformNr varchar(3), 
  SchulformKrz varchar(3), 
  SchulformBez varchar(50), 
  SchultraegerArt varchar(2), 
  SchultraegerNr varchar(6), 
  SchulNr varchar(6), 
  Bezeichnung1 varchar(50), 
  Bezeichnung2 varchar(50), 
  Bezeichnung3 varchar(50), 
  Strassenname varchar(55), 
  HausNr varchar(10), 
  HausNrZusatz varchar(30), 
  PLZ varchar(10), 
  Ort varchar(50), 
  Telefon varchar(20), 
  Fax varchar(20), 
  Email varchar(100), 
  Ganztags varchar(1) DEFAULT '+', 
  Schuljahresabschnitts_ID bigint, 
  AnzahlAbschnitte int DEFAULT 2, 
  Fremdsprachen varchar(1) DEFAULT '+', 
  JVAZeigen varchar(1) DEFAULT '-', 
  RefPaedagogikZeigen varchar(1) DEFAULT '-', 
  AnzJGS_Jahr smallint DEFAULT 1, 
  AbschnittBez varchar(20) DEFAULT 'Halbjahr', 
  BezAbschnitt1 varchar(10) DEFAULT '1. Hj', 
  BezAbschnitt2 varchar(10) DEFAULT '2. Hj', 
  IstHauptsitz varchar(1) DEFAULT '+', 
  NotenGesperrt varchar(1) DEFAULT '-', 
  BezAbschnitt3 varchar(10), 
  BezAbschnitt4 varchar(10), 
  ZurueckgestelltAnzahl int, 
  ZurueckgestelltWeibl int, 
  ZurueckgestelltAuslaender int, 
  ZurueckgestelltAuslaenderWeibl int, 
  ZurueckgestelltAussiedler int, 
  ZurueckgestelltAussiedlerWeibl int, 
  TeamTeaching varchar(1) DEFAULT '+', 
  AbiGruppenprozess varchar(1) DEFAULT '+', 
  DauerUnterrichtseinheit int, 
  Gruppen8Bis1 int, 
  Gruppen13Plus int, 
  InternatsplaetzeM int, 
  InternatsplaetzeW int, 
  InternatsplaetzeNeutral int, 
  SchulLogoBase64 text, 
  Einstellungen text, 
  WebAdresse varchar(100), 
  Land varchar(50),
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchulleitungFunktion (
  ID bigint AUTOINCREMENT NOT NULL, 
  Funktionstext varchar(255) NOT NULL, 
  AbSchuljahr int, 
  BisSchuljahr int,
  CONSTRAINT PK_SchulleitungFunktion PRIMARY KEY (ID)
);


CREATE TABLE Schulver_DBS (
  SchulNr varchar(6) NOT NULL, 
  RegSchl varchar(6), 
  KoRe float, 
  KoHo float, 
  ABez1 varchar(40), 
  ABez2 varchar(40), 
  ABez3 varchar(40), 
  PLZ varchar(6), 
  Ort varchar(34), 
  Strasse varchar(40), 
  TelVorw varchar(6), 
  Telefon varchar(12), 
  FaxVorw varchar(6), 
  Fax varchar(15), 
  ModemVorw varchar(6), 
  Modem varchar(15), 
  SF varchar(2), 
  OeffPri varchar(1), 
  KurzBez varchar(40), 
  SchBetrSchl int, 
  SchBetrSchlDatum varchar(8), 
  ArtDerTraegerschaft varchar(2), 
  SchultraegerNr varchar(6), 
  Schulgliederung varchar(3), 
  Schulart varchar(3), 
  Ganztagsbetrieb varchar(1), 
  FSP varchar(2), 
  Verbund varchar(1), 
  Bus varchar(1), 
  Fachberater int, 
  FachberHauptamtl int, 
  TelNrDBSalt varchar(15), 
  RP varchar(1), 
  Email varchar(100), 
  URL varchar(1000), 
  Bemerkung text, 
  CD int, 
  Stift int, 
  OGTS varchar(1), 
  SELB varchar(1), 
  Internat varchar(1), 
  InternatPlaetze int DEFAULT 0, 
  SMail varchar(50), 
  SportImAbi varchar(1) DEFAULT '0' NOT NULL, 
  Tal varchar(1) DEFAULT '0' NOT NULL, 
  KonKop varchar(1) DEFAULT '0' NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_DBS PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_Schulformen (
  Schulform varchar(2) NOT NULL, 
  SF varchar(2), 
  Bezeichnung varchar(60), 
  Flag varchar(1) DEFAULT '1', 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_Schulformen PRIMARY KEY (Schulform)
);


CREATE TABLE Schulver_Schultraeger (
  SchulNr varchar(255) NOT NULL, 
  RegSchl varchar(255), 
  KoRe varchar(255), 
  KoHo varchar(255), 
  ABez1 varchar(255), 
  ABez2 varchar(255), 
  ABez3 varchar(255), 
  PLZ varchar(255), 
  Ort varchar(255), 
  Strasse varchar(255), 
  TelVorw varchar(255), 
  Telefon varchar(255), 
  SF varchar(255), 
  OeffPri varchar(255), 
  KurzBez varchar(255), 
  SchBetrSchl int, 
  SchBetrSchlDatum varchar(255), 
  SchuelerZahlASD int DEFAULT 0, 
  SchuelerZahlVS int DEFAULT 0, 
  ArtDerTraegerschaft varchar(255), 
  SchultraegerNr varchar(255), 
  Schulgliederung varchar(255), 
  Ganztagsbetrieb varchar(255), 
  Aktiv int DEFAULT 1 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_Schultraeger PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_WeitereSF (
  SNR varchar(6) NOT NULL, 
  SGL varchar(3) DEFAULT '   ' NOT NULL, 
  FSP varchar(2) DEFAULT '  ' NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_WeitereSF PRIMARY KEY (SNR, SGL, FSP)
);


CREATE TABLE Statkue_Abgangsart (
  SF varchar(2) NOT NULL, 
  Art varchar(2) NOT NULL, 
  Beschreibung varchar(200), 
  KZ_Bereich int DEFAULT 0, 
  KZ_Bereich_JG int DEFAULT 0, 
  AbgangsJG varchar(2), 
  Flag varchar(1) DEFAULT '1', 
  geaendert datetime, 
  Sortierung int DEFAULT 0, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Abgangsart PRIMARY KEY (AbgangsJG, Art, KZ_Bereich, SF)
);


CREATE TABLE Statkue_AllgMerkmale (
  ID bigint NOT NULL, 
  SF varchar(2) NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  StatistikKrz varchar(5), 
  Langtext varchar(255) NOT NULL, 
  Schule int, 
  Schueler int, 
  Beginn datetime, 
  Ende datetime, 
  Sort int, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_AllgMerkmale PRIMARY KEY (ID, Kurztext)
);


CREATE TABLE Statkue_AndereGrundschulen (
  SNR varchar(6) NOT NULL, 
  SF varchar(2), 
  ABez1 varchar(40), 
  Strasse varchar(40), 
  Ort varchar(40), 
  Auswahl int, 
  RegSchl varchar(6), 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_AndereGrundschulen PRIMARY KEY (SNR)
);


CREATE TABLE Statkue_Bilingual (
  SF varchar(2) NOT NULL, 
  Fach varchar(2) NOT NULL, 
  Beschreibung varchar(100), 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Bilingual PRIMARY KEY (Fach, SF)
);


CREATE TABLE Statkue_Einschulungsart (
  Art varchar(2) NOT NULL, 
  Sortierung int DEFAULT 0, 
  Beschreibung varchar(100), 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Einschulungsart PRIMARY KEY (Art)
);


CREATE TABLE Statkue_Fachklasse (
  BKIndex int DEFAULT 0 NOT NULL, 
  Flag varchar(1), 
  FKS varchar(3) NOT NULL, 
  AP varchar(2) NOT NULL, 
  BGrp varchar(1), 
  BFeld varchar(2), 
  Ebene3 varchar(2), 
  BAKLALT varchar(2), 
  BAGRALT varchar(4), 
  Sortierung int DEFAULT 0, 
  Status varchar(20), 
  Flag_APOBK varchar(1), 
  Beschreibung varchar(100), 
  Beschreibung_W varchar(100), 
  Beschreibung_MW varchar(100), 
  geaendert datetime, 
  BAKL varchar(5), 
  BAGR varchar(8), 
  Ebene1 varchar(2), 
  Ebene2 varchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Fachklasse PRIMARY KEY (AP, BKIndex, FKS)
);


CREATE TABLE Statkue_Foerderschwerpunkt (
  Beschreibung varchar(100), 
  Flag varchar(1) DEFAULT '1', 
  FSP varchar(2) NOT NULL, 
  geaendert datetime, 
  SF varchar(2) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Foerderschwerpunkt PRIMARY KEY (FSP, SF)
);


CREATE TABLE Statkue_Gliederung (
  SF varchar(2) NOT NULL, 
  Flag varchar(1) NOT NULL, 
  BKAnlage varchar(1) NOT NULL, 
  BKTyp varchar(2) NOT NULL, 
  BKIndex int DEFAULT 0, 
  Beschreibung varchar(100), 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Gliederung PRIMARY KEY (BKAnlage, BKTyp, Flag, SF)
);


CREATE TABLE Statkue_Herkunftsart (
  SF varchar(2) NOT NULL, 
  Art varchar(2) NOT NULL, 
  Beschreibung varchar(255) NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  Sortierung int DEFAULT 0 NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Herkunftsart PRIMARY KEY (Art, SF)
);


CREATE TABLE Statkue_Herkunftsschulform (
  SF varchar(2) NOT NULL, 
  HSF varchar(3) NOT NULL, 
  Beschreibung varchar(150) NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Herkunftsschulform PRIMARY KEY (HSF, SF)
);


CREATE TABLE Statkue_LehrerAbgang (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel varchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerAbgang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerAnrechnung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  GueltigAbSJ int, 
  GueltigBisSJ int, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerAnrechnung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerBeschaeftigungsart (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerBeschaeftigungsart PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerEinsatzstatus (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerEinsatzstatus PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrAnerkennung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerFachrAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrichtung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerFachrichtung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramt (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehramt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramtAnerkennung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehramtAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefAnerkennung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehrbefAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefaehigung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehrbefaehigung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMehrleistung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerMehrleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMinderleistung (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerMinderleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerRechtsverhaeltnis (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerRechtsverhaeltnis PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerZugang (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel varchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerZugang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Nationalitaeten (
  Schluessel varchar(3) NOT NULL, 
  Land varchar(255) NOT NULL, 
  Nationalitaet varchar(255) NOT NULL, 
  Flag varchar(1), 
  geaendert datetime, 
  Beginn datetime, 
  Ende datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Nationalitaeten PRIMARY KEY (Schluessel)
);


CREATE TABLE K_Lehrer (
  ID bigint AUTOINCREMENT NOT NULL, 
  GU_ID varchar(40), 
  Kuerzel varchar(10) NOT NULL, 
  LIDKrz varchar(4), 
  Nachname varchar(120) NOT NULL, 
  Vorname varchar(80), 
  PersonTyp varchar(20) DEFAULT 'LEHRKRAFT', 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+', 
  FuerExport varchar(1) DEFAULT '+', 
  Statistik varchar(1) DEFAULT '+', 
  Strassenname varchar(55), 
  HausNr varchar(10), 
  HausNrZusatz varchar(30), 
  Ort_ID bigint, 
  Ortsteil_ID bigint, 
  Tel varchar(20), 
  Handy varchar(20), 
  Email varchar(100), 
  EmailDienstlich varchar(100), 
  StaatKrz varchar(3), 
  Geburtsdatum date, 
  Geschlecht varchar(1), 
  Anrede varchar(10), 
  Amtsbezeichnung varchar(15), 
  Titel varchar(20), 
  Faecher varchar(100), 
  IdentNr1 varchar(10), 
  SerNr varchar(5), 
  PANr varchar(20), 
  LBVNr varchar(15), 
  VSchluessel varchar(1), 
  DatumZugang date, 
  GrundZugang varchar(10), 
  DatumAbgang date, 
  GrundAbgang varchar(10), 
  PflichtstdSoll float, 
  Rechtsverhaeltnis varchar(1), 
  Beschaeftigungsart varchar(2), 
  Einsatzstatus varchar(1), 
  StammschulNr varchar(6), 
  MasernImpfnachweis varchar(1) DEFAULT '-', 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  LPassword varchar(255), 
  PWAktuell varchar(3) DEFAULT '-;5', 
  SchILDweb_FL varchar(1) DEFAULT '+', 
  SchILDweb_KL varchar(1) DEFAULT '+', 
  SchILDweb_Config text, 
  KennwortTools varchar(255), 
  Antwort1 varchar(255), 
  Antwort2 varchar(255), 
  KennwortToolsAktuell varchar(3) DEFAULT '-;5', 
  XNMPassword varchar(255), 
  XNMPassword2 varchar(255), 
  CredentialID bigint,
  CONSTRAINT PK_K_Lehrer PRIMARY KEY (ID),
  CONSTRAINT K_Lehrer_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_PersonTyp_FK FOREIGN KEY (PersonTyp) REFERENCES PersonalTypen(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Statkue_Nationalitaeten_FK FOREIGN KEY (StaatKrz) REFERENCES Statkue_Nationalitaeten(Schluessel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE EigeneSchule_Abteilungen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Schuljahresabschnitts_ID bigint DEFAULT -1 NOT NULL, 
  AbteilungsLeiter_ID bigint, 
  Sichtbar varchar(1) DEFAULT '+', 
  Raum varchar(20), 
  Email varchar(100), 
  Durchwahl varchar(20), 
  Sortierung int,
  CONSTRAINT PK_EigeneSchule_Abteilungen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abteilungen_Leiter_FK FOREIGN KEY (AbteilungsLeiter_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Abteilungen_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Kurslehrer (
  Blockung_Kurs_ID bigint NOT NULL, 
  Lehrer_ID bigint, 
  Reihenfolge int DEFAULT 1 NOT NULL, 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Kurslehrer PRIMARY KEY (Blockung_Kurs_ID, Lehrer_ID),
  CONSTRAINT Gost_Blockung_Kurslehrer_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Kurslehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgang_Beratungslehrer (
  Abi_Jahrgang int NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Beratungslehrer PRIMARY KEY (Abi_Jahrgang, Lehrer_ID),
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Lehrer_ID_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAbschnittsdaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Rechtsverhaeltnis varchar(1), 
  Beschaeftigungsart varchar(2), 
  Einsatzstatus varchar(1), 
  PflichtstdSoll float, 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float,
  CONSTRAINT PK_LehrerAbschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT LehrerAbschnittsdaten_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAbschnittsdaten_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAbschnittsdaten_UC1 UNIQUE (Lehrer_ID, Schuljahresabschnitts_ID)
);


CREATE TABLE LehrerDatenschutz (
  LehrerID bigint NOT NULL, 
  DatenschutzID bigint NOT NULL, 
  Status int DEFAULT 0 NOT NULL, 
  Abgefragt int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_LehrerDatenschutz PRIMARY KEY (LehrerID, DatenschutzID),
  CONSTRAINT LehrerDatenschutz_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerDatenschutz_Datenschutz_FK FOREIGN KEY (DatenschutzID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerFotos (
  Lehrer_ID bigint NOT NULL, 
  FotoBase64 text,
  CONSTRAINT PK_LehrerFotos PRIMARY KEY (Lehrer_ID),
  CONSTRAINT LehrerFotos_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramt (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz varchar(10), 
  LehramtAnerkennungKrz varchar(10),
  CONSTRAINT PK_LehrerLehramt PRIMARY KEY (Lehrer_ID, LehramtKrz),
  CONSTRAINT LehrerLehramt_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramtFachr (
  Lehrer_ID bigint NOT NULL, 
  FachrKrz varchar(10), 
  FachrAnerkennungKrz varchar(10),
  CONSTRAINT PK_LehrerLehramtFachr PRIMARY KEY (Lehrer_ID, FachrKrz),
  CONSTRAINT LehrerLehramtFachr_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramtLehrbef (
  Lehrer_ID bigint NOT NULL, 
  LehrbefKrz varchar(10), 
  LehrbefAnerkennungKrz varchar(10),
  CONSTRAINT PK_LehrerLehramtLehrbef PRIMARY KEY (Lehrer_ID, LehrbefKrz),
  CONSTRAINT LehrerLehramtLehrbef_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLernplattform (
  LehrerID bigint NOT NULL, 
  LernplattformID bigint NOT NULL, 
  CredentialID bigint, 
  EinwilligungAbgefragt int DEFAULT 0 NOT NULL, 
  EinwilligungNutzung int DEFAULT 0 NOT NULL, 
  EinwilligungAudiokonferenz int DEFAULT 0 NOT NULL, 
  EinwilligungVideokonferenz int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_LehrerLernplattform PRIMARY KEY (LehrerID, LernplattformID),
  CONSTRAINT LehrerLernplattform_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerLernplattform_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerLernplattform_Credential_FK FOREIGN KEY (CredentialID) REFERENCES CredentialsLernplattformen(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Schulleitung (
  ID bigint AUTOINCREMENT NOT NULL, 
  LeitungsfunktionID bigint NOT NULL, 
  Funktionstext varchar(255) NOT NULL, 
  LehrerID bigint NOT NULL, 
  Von datetime, 
  Bis datetime,
  CONSTRAINT PK_Schulleitung PRIMARY KEY (ID),
  CONSTRAINT Schulleitung_Leitungsfunktion_FK FOREIGN KEY (LeitungsfunktionID) REFERENCES SchulleitungFunktion(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schulleitung_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAnrechnung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  AnrechnungsgrundKrz varchar(10), 
  AnrechnungStd float,
  CONSTRAINT PK_LehrerAnrechnung PRIMARY KEY (ID),
  CONSTRAINT LehrerAnrechnung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAnrechnung_UC1 UNIQUE (Abschnitt_ID, AnrechnungsgrundKrz)
);


CREATE TABLE LehrerEntlastung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  EntlastungsgrundKrz varchar(10), 
  EntlastungStd float,
  CONSTRAINT PK_LehrerEntlastung PRIMARY KEY (ID),
  CONSTRAINT LehrerEntlastung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerEntlastung_UC1 UNIQUE (Abschnitt_ID, EntlastungsgrundKrz)
);


CREATE TABLE LehrerFunktionen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Funktion_ID bigint NOT NULL,
  CONSTRAINT PK_LehrerFunktionen PRIMARY KEY (ID),
  CONSTRAINT LehrerFunktionen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_Schulfunktionen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_UC1 UNIQUE (Abschnitt_ID, Funktion_ID)
);


CREATE TABLE LehrerMehrleistung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  MehrleistungsgrundKrz varchar(10) NOT NULL, 
  MehrleistungStd float,
  CONSTRAINT PK_LehrerMehrleistung PRIMARY KEY (ID),
  CONSTRAINT LehrerMehrleistung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerMehrleistung_UC1 UNIQUE (Abschnitt_ID, MehrleistungsgrundKrz)
);


CREATE TABLE Statkue_Organisationsform (
  SF varchar(2) NOT NULL, 
  OrgForm varchar(1) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  Beschreibung varchar(100) NOT NULL, 
  Flag varchar(1), 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Organisationsform PRIMARY KEY (FSP, OrgForm, SF)
);


CREATE TABLE Statkue_PLZOrt (
  ID bigint NOT NULL, 
  PLZ varchar(50), 
  RegSchl varchar(50), 
  Ort varchar(50), 
  Sortierung int DEFAULT 1, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_PLZOrt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Reformpaedagogik (
  SF varchar(2) NOT NULL, 
  RPG varchar(1) NOT NULL, 
  Beschreibung varchar(100) NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Reformpaedagogik PRIMARY KEY (RPG, SF)
);


CREATE TABLE Statkue_Religionen (
  Schluessel varchar(2) NOT NULL, 
  Klartext varchar(50) NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Religionen PRIMARY KEY (Schluessel)
);


CREATE TABLE Statkue_SVWS_BKAnlagen (
  BKAnlage varchar(1) NOT NULL, 
  Beschreibung varchar(120) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_BKAnlagen PRIMARY KEY (BKAnlage)
);


CREATE TABLE Statkue_SVWS_Schulgliederungen (
  SGL varchar(3) NOT NULL, 
  istBK int DEFAULT 0 NOT NULL, 
  Schulformen varchar(120) NOT NULL, 
  istAuslaufend int DEFAULT 0 NOT NULL, 
  istAusgelaufen int DEFAULT 0 NOT NULL, 
  Beschreibung varchar(120) NOT NULL, 
  BKAnlage varchar(1), 
  BKTyp varchar(2), 
  BKIndex varchar(10), 
  istVZ int DEFAULT 0, 
  BKAbschlussBeruf varchar(10), 
  BKAbschlussAllg varchar(10),
  CONSTRAINT PK_Statkue_SVWS_Schulgliederungen PRIMARY KEY (SGL)
);


CREATE TABLE EigeneSchule_Jahrgaenge (
  ID bigint AUTOINCREMENT NOT NULL, 
  InternKrz varchar(20), 
  GueltigVon bigint, 
  GueltigBis bigint, 
  ASDJahrgang varchar(2), 
  ASDBezeichnung varchar(100), 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  IstChronologisch varchar(1) DEFAULT '+', 
  Spaltentitel varchar(2), 
  SekStufe varchar(6), 
  SGL varchar(3), 
  Restabschnitte int, 
  Folgejahrgang_ID bigint,
  CONSTRAINT PK_EigeneSchule_Jahrgaenge PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Jahrgaenge_GueltigVon_FK FOREIGN KEY (GueltigVon) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_GueltigBis_FK FOREIGN KEY (GueltigBis) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_Schulgliederung_FK FOREIGN KEY (SGL) REFERENCES Statkue_SVWS_Schulgliederungen(SGL) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
);


CREATE TABLE Klassen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Bezeichnung varchar(150), 
  ASDKlasse varchar(6), 
  Klasse varchar(15) NOT NULL, 
  Jahrgang_ID bigint, 
  FKlasse varchar(15), 
  VKlasse varchar(15), 
  OrgFormKrz varchar(1), 
  ASDSchulformNr varchar(3), 
  Fachklasse_ID bigint, 
  PruefOrdnung varchar(20), 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Klassenart varchar(2), 
  SommerSem varchar(1) DEFAULT '-', 
  NotenGesperrt varchar(1) DEFAULT '-', 
  AdrMerkmal varchar(1) DEFAULT 'A', 
  KoopKlasse varchar(1) DEFAULT '-', 
  Ankreuzzeugnisse varchar(1) DEFAULT '-',
  CONSTRAINT PK_Klassen PRIMARY KEY (ID),
  CONSTRAINT Klassen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_UC1 UNIQUE (Schuljahresabschnitts_ID, Klasse)
);


CREATE TABLE Kurse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  KurzBez varchar(20) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang varchar(2), 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(5), 
  WochenStd smallint, 
  Lehrer_ID bigint, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Schienen varchar(20), 
  Fortschreibungsart varchar(1), 
  WochenstdKL float, 
  SchulNr int, 
  EpochU varchar(1) DEFAULT '-', 
  ZeugnisBez varchar(130), 
  Jahrgaenge varchar(50),
  CONSTRAINT PK_Kurse PRIMARY KEY (ID),
  CONSTRAINT Kurse_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Kurse_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Kurse_Fortschreibungsart_FK FOREIGN KEY (Fortschreibungsart) REFERENCES KursFortschreibungsarten(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_UC1 UNIQUE (Schuljahresabschnitts_ID, KurzBez, ASDJahrgang, Fach_ID, KursartAllg, WochenStd, Lehrer_ID, Jahrgaenge)
);


CREATE TABLE Schueler (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  GU_ID varchar(40) NOT NULL, 
  SrcID int, 
  IDext varchar(30), 
  Status int, 
  Name varchar(120), 
  Vorname varchar(80), 
  Zusatz varchar(255), 
  Geburtsname varchar(120), 
  Strassenname varchar(55), 
  HausNr varchar(10), 
  HausNrZusatz varchar(30), 
  Ort_ID bigint, 
  Ortsteil_ID bigint, 
  Telefon varchar(20), 
  Email varchar(100), 
  Fax varchar(20), 
  Geburtsdatum date, 
  Geburtsort varchar(100), 
  Volljaehrig varchar(1) DEFAULT '-', 
  Geschlecht smallint, 
  StaatKrz varchar(3), 
  StaatKrz2 varchar(3), 
  Aussiedler varchar(1) DEFAULT '-', 
  Religion_ID bigint, 
  Religionsabmeldung date, 
  Religionsanmeldung date, 
  Bafoeg varchar(1) DEFAULT '-', 
  Sportbefreiung_ID bigint, 
  Fahrschueler_ID bigint, 
  Haltestelle_ID bigint, 
  SchulpflichtErf varchar(1) DEFAULT '-', 
  Aufnahmedatum date, 
  Einschulungsjahr smallint, 
  Einschulungsart_ID bigint, 
  LSSchulNr varchar(6), 
  LSSchulformSIM varchar(3), 
  LSJahrgang varchar(2), 
  LSSchulEntlassDatum date, 
  LSVersetzung varchar(2), 
  LSFachklKennung varchar(10), 
  LSFachklSIM varchar(5), 
  LSEntlassgrund varchar(50), 
  LSEntlassArt varchar(2), 
  LSKlassenart varchar(2), 
  LSRefPaed varchar(1) DEFAULT '-', 
  Entlassjahrgang varchar(2), 
  Entlassjahrgang_ID bigint, 
  Entlassdatum date, 
  Entlassgrund varchar(50), 
  Entlassart varchar(2), 
  SchulwechselNr varchar(6), 
  Schulwechseldatum date, 
  Geloescht varchar(1) DEFAULT '-', 
  Gesperrt varchar(1) DEFAULT '-', 
  ModifiziertAm datetime, 
  ModifiziertVon varchar(20), 
  Markiert varchar(21) DEFAULT '-', 
  FotoVorhanden varchar(1) DEFAULT '-', 
  JVA varchar(1) DEFAULT '-', 
  KeineAuskunft varchar(1) DEFAULT '-', 
  Beruf varchar(100), 
  AbschlussDatum varchar(15), 
  Bemerkungen text, 
  BeginnBildungsgang date, 
  DurchschnittsNote varchar(4), 
  LSSGL varchar(5), 
  LSSchulform varchar(2), 
  KonfDruck varchar(1) DEFAULT '+', 
  DSN_Text varchar(15), 
  Berufsabschluss varchar(1), 
  LSSGL_SIM varchar(3), 
  BerufsschulpflErf varchar(1) DEFAULT '-', 
  StatusNSJ int, 
  FachklasseNSJ_ID bigint, 
  BuchKonto float, 
  VerkehrsspracheFamilie varchar(2) DEFAULT 'de', 
  JahrZuzug int, 
  DauerKindergartenbesuch varchar(1), 
  VerpflichtungSprachfoerderkurs varchar(1) DEFAULT '-', 
  TeilnahmeSprachfoerderkurs varchar(1) DEFAULT '-', 
  SchulbuchgeldBefreit varchar(1) DEFAULT '-', 
  GeburtslandSchueler varchar(10), 
  GeburtslandVater varchar(10), 
  GeburtslandMutter varchar(10), 
  Uebergangsempfehlung_JG5 varchar(10), 
  ErsteSchulform_SI varchar(10), 
  JahrWechsel_SI int, 
  JahrWechsel_SII int, 
  Migrationshintergrund varchar(1) DEFAULT '-', 
  ExterneSchulNr varchar(6), 
  Kindergarten_ID bigint, 
  LetzterBerufsAbschluss varchar(10), 
  LetzterAllgAbschluss varchar(10), 
  Land varchar(2), 
  Duplikat varchar(1) DEFAULT '-', 
  EinschulungsartASD varchar(2), 
  DurchschnittsnoteFHR varchar(4), 
  DSN_FHR_Text varchar(15), 
  Eigenanteil float, 
  BKAZVO int, 
  HatBerufsausbildung varchar(1) DEFAULT '-', 
  Ausweisnummer varchar(30), 
  EPJahre int DEFAULT 2, 
  LSBemerkung varchar(255), 
  WechselBestaetigt varchar(1) DEFAULT '-', 
  DauerBildungsgang int, 
  AnmeldeDatum date, 
  MeisterBafoeg varchar(1) DEFAULT '-', 
  OnlineAnmeldung varchar(1) DEFAULT '-', 
  Dokumentenverzeichnis varchar(255), 
  Berufsqualifikation varchar(100), 
  ZusatzNachname varchar(30), 
  EndeEingliederung date, 
  SchulEmail varchar(100), 
  EndeAnschlussfoerderung date, 
  MasernImpfnachweis varchar(1) DEFAULT '-', 
  Lernstandsbericht varchar(1) DEFAULT '-', 
  SprachfoerderungVon date, 
  SprachfoerderungBis date, 
  EntlassungBemerkung varchar(255), 
  CredentialID bigint, 
  NeuZugewandert int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Schueler PRIMARY KEY (ID),
  CONSTRAINT Schueler_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Einschulungsart_FK FOREIGN KEY (Einschulungsart_ID) REFERENCES K_EinschulungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Entlassjahrgang_FK FOREIGN KEY (Entlassjahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Fachklasse_Naechstes_Schuljahr_FK FOREIGN KEY (FachklasseNSJ_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Fahrschueler_FK FOREIGN KEY (Fahrschueler_ID) REFERENCES K_FahrschuelerArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Haltestelle_FK FOREIGN KEY (Haltestelle_ID) REFERENCES K_Haltestelle(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Kindergarten_ID_FK FOREIGN KEY (Kindergarten_ID) REFERENCES K_Kindergarten(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ort_PLZ_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Religion_FK FOREIGN KEY (Religion_ID) REFERENCES K_Religion(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Sportbefreiung_FK FOREIGN KEY (Sportbefreiung_ID) REFERENCES K_Sportbefreiung(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_1_FK FOREIGN KEY (StaatKrz) REFERENCES Statkue_Nationalitaeten(Schluessel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_2_FK FOREIGN KEY (StaatKrz2) REFERENCES Statkue_Nationalitaeten(Schluessel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Status_FK FOREIGN KEY (Status) REFERENCES SchuelerStatus(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schueler_UC1 UNIQUE (GU_ID)
);


CREATE TABLE EigeneSchule_Abt_Kl (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abteilung_ID bigint NOT NULL, 
  Klassen_ID bigint NOT NULL, 
  Sichtbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Abt_Kl PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abt_Kl_Abteilung_FK FOREIGN KEY (Abteilung_ID) REFERENCES EigeneSchule_Abteilungen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT EigeneSchule_Abt_Kl_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Zwischenergebnisse_Kurs_Schueler (
  Zwischenergebnis_ID bigint NOT NULL, 
  Blockung_Kurs_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  IstKollision int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schueler PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schueler_ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_ErgID_FK FOREIGN KEY (Zwischenergebnis_ID) REFERENCES Gost_Blockung_Zwischenergebnisse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Schueler (
  Schueler_ID bigint NOT NULL, 
  DatumBeratung datetime, 
  DatumRuecklauf datetime, 
  HatSprachPraktischePruefung int DEFAULT 0 NOT NULL, 
  HatSportattest int DEFAULT 0 NOT NULL, 
  Kommentar text, 
  Beratungslehrer_ID bigint, 
  PruefPhase varchar(1), 
  BesondereLernleistung_Art varchar(1), 
  BesondereLernleistung_Punkte int, 
  ZweiteFremdpracheInSekIVorhanden int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Schueler PRIMARY KEY (Schueler_ID),
  CONSTRAINT Gost_Schueler_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Schueler_Fachwahlen (
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  EF1_Kursart varchar(5), 
  EF1_Punkte varchar(2), 
  EF2_Kursart varchar(5), 
  EF2_Punkte varchar(2), 
  Q11_Kursart varchar(5), 
  Q11_Punkte varchar(2), 
  Q12_Kursart varchar(5), 
  Q12_Punkte varchar(2), 
  Q21_Kursart varchar(5), 
  Q21_Punkte varchar(2), 
  Q22_Kursart varchar(5), 
  Q22_Punkte varchar(2), 
  AbiturFach int, 
  Bemerkungen varchar(50), 
  Markiert_Q1 int, 
  Markiert_Q2 int, 
  Markiert_Q3 int, 
  Markiert_Q4 int, 
  ergebnisAbiturpruefung int, 
  hatMuendlichePflichtpruefung int, 
  ergebnisMuendlichePruefung int,
  CONSTRAINT PK_Gost_Schueler_Fachwahlen PRIMARY KEY (Schueler_ID, Fach_ID),
  CONSTRAINT Gost_Schueler_Fachwahlen_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Schueler_Fachwahlen_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE KlassenLehrer (
  Klassen_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Reihenfolge int DEFAULT 1 NOT NULL,
  CONSTRAINT PK_KlassenLehrer PRIMARY KEY (Klassen_ID, Lehrer_ID),
  CONSTRAINT Klassenlehrer_Klasse_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Klassenlehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE KursLehrer (
  Kurs_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Anteil float,
  CONSTRAINT PK_KursLehrer PRIMARY KEY (Kurs_ID, Lehrer_ID),
  CONSTRAINT KursLehrer_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursLehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Kurs_Schueler (
  Kurs_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL,
  CONSTRAINT PK_Kurs_Schueler PRIMARY KEY (Kurs_ID, Schueler_ID),
  CONSTRAINT KursSchueler_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursSchueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAbgaenge (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  BemerkungIntern varchar(30), 
  AbgangsSchulform varchar(2), 
  AbgangsBeschreibung varchar(200), 
  OrganisationsformKrz varchar(1), 
  AbgangsSchule varchar(100), 
  AbgangsSchuleAnschr varchar(100), 
  AbgangsSchulNr varchar(6), 
  LSJahrgang varchar(2), 
  LSEntlassArt varchar(2), 
  LSSchulformSIM varchar(3), 
  LSSchulEntlassDatum date, 
  LSVersetzung varchar(2), 
  LSSGL varchar(5), 
  LSFachklKennung varchar(10), 
  LSFachklSIM varchar(5), 
  FuerSIMExport varchar(1) DEFAULT '-', 
  LSBeginnDatum date, 
  LSBeginnJahrgang varchar(2),
  CONSTRAINT PK_SchuelerAbgaenge PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbgaenge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerAbgaenge_IDX1 ON SchuelerAbgaenge(Schueler_ID, LSSchulEntlassDatum);


CREATE TABLE SchuelerAbiFaecher (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  FachKrz varchar(20), 
  FSortierung int, 
  Kurs_ID bigint, 
  KursartAllg varchar(5), 
  Fachlehrer_ID bigint, 
  AbiFach varchar(1), 
  P11_1 varchar(2), 
  S11_1 varchar(1) DEFAULT '-', 
  P11_2 varchar(2), 
  S11_2 varchar(1) DEFAULT '-', 
  P_FA varchar(2), 
  R_FA varchar(1) DEFAULT '-', 
  W12_1 int, 
  P12_1 varchar(2), 
  H12_1 int, 
  R12_1 varchar(1) DEFAULT '-', 
  S12_1 varchar(1) DEFAULT '-', 
  W12_2 int, 
  P12_2 varchar(2), 
  H12_2 int, 
  R12_2 varchar(1) DEFAULT '-', 
  S12_2 varchar(1) DEFAULT '-', 
  W13_1 int, 
  P13_1 varchar(2), 
  H13_1 int, 
  R13_1 varchar(1) DEFAULT '-', 
  S13_1 varchar(1) DEFAULT '-', 
  W13_2 int, 
  P13_2 varchar(2), 
  H13_2 int, 
  R13_2 varchar(1) DEFAULT '-', 
  S13_2 varchar(1) DEFAULT '-', 
  Zulassung smallint, 
  Durchschnitt float, 
  AbiPruefErgebnis smallint, 
  Zwischenstand smallint, 
  MdlPflichtPruefung varchar(1) DEFAULT '-', 
  MdlBestPruefung varchar(1) DEFAULT '-', 
  MdlFreiwPruefung varchar(1) DEFAULT '-', 
  MdlPruefErgebnis smallint, 
  MdlPruefFolge smallint, 
  AbiErgebnis smallint,
  CONSTRAINT PK_SchuelerAbiFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerAbitur (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  FA_Fach varchar(130), 
  FA_Punkte int, 
  FehlStd int, 
  uFehlStd int, 
  FranzBilingual varchar(1) DEFAULT '-', 
  BesondereLernleistung varchar(1) DEFAULT '-', 
  AnzRelLK smallint, 
  AnzRelGK smallint, 
  AnzRelOK smallint, 
  AnzDefLK smallint, 
  AnzDefGK smallint, 
  Thema_PJK varchar(255), 
  FS2_SekI_Manuell varchar(1) DEFAULT '-', 
  Kurse_I int, 
  Defizite_I int, 
  LK_Defizite_I int, 
  AnzahlKurse_0 int, 
  Punktsumme_I int, 
  Durchschnitt_I float, 
  SummeGK smallint, 
  SummeLK smallint, 
  SummenOK smallint, 
  Zugelassen varchar(1) DEFAULT '-', 
  BLL_Art varchar(1) DEFAULT 'K', 
  BLL_Punkte int, 
  Thema_BLL varchar(255), 
  Punktsumme_II int, 
  Defizite_II int, 
  LK_Defizite_II int, 
  PruefungBestanden varchar(1) DEFAULT '-', 
  Note varchar(3), 
  GesamtPunktzahl smallint, 
  Notensprung smallint, 
  FehlendePunktzahl smallint,
  CONSTRAINT PK_SchuelerAbitur PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbitur_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAbitur_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbitur_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerBKAbschluss (
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  Zulassung char(1), 
  Bestanden char(1), 
  ZertifikatBK char(1), 
  ZulassungErwBK char(1), 
  BestandenErwBK char(1), 
  ZulassungBA char(1), 
  BestandenBA char(1), 
  PraktPrfNote varchar(2), 
  NoteKolloquium varchar(2), 
  ThemaAbschlussarbeit text, 
  BAP_Vorhanden varchar(1), 
  NoteFachpraxis varchar(2), 
  FachPraktAnteilAusr varchar(1),
  CONSTRAINT PK_SchuelerBKAbschluss PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerBKAbschluss_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKAbschluss_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKFaecher (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  Fach_ID bigint NOT NULL, 
  FachKrz varchar(20), 
  FachSchriftlich char(1), 
  FachSchriftlichBA char(1), 
  Vornote varchar(2), 
  NoteSchriftlich varchar(2), 
  MdlPruefung char(1), 
  MdlPruefungFW char(1), 
  NoteMuendlich varchar(2), 
  NoteAbschluss varchar(2), 
  NotePrfGesamt varchar(2), 
  FSortierung int, 
  Fachlehrer_ID bigint, 
  NoteAbschlussBA varchar(2), 
  Kursart varchar(5),
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL, 
  Datenschutz_ID bigint NOT NULL, 
  Status varchar(1) DEFAULT '-' NOT NULL, 
  Abgefragt int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Datenschutz_ID, Schueler_ID),
  CONSTRAINT SchuelerDatenschutz_K_Datenschutz_FK FOREIGN KEY (Datenschutz_ID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerDatenschutz_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerErzAdr (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  ErzieherArt_ID bigint, 
  Anrede1 varchar(20), 
  Titel1 varchar(10), 
  Name1 varchar(120), 
  Vorname1 varchar(80), 
  Anrede2 varchar(20), 
  Titel2 varchar(10), 
  Name2 varchar(120), 
  Vorname2 varchar(80), 
  ErzOrt_ID bigint, 
  ErzStrassenname varchar(55), 
  ErzHausNr varchar(10), 
  ErzOrtsteil_ID bigint, 
  ErzHausNrZusatz varchar(30), 
  ErzAnschreiben varchar(1) DEFAULT '+', 
  Sortierung int, 
  ErzEmail varchar(100), 
  ErzAdrZusatz varchar(50), 
  Erz1StaatKrz varchar(3), 
  Erz2StaatKrz varchar(3), 
  ErzEmail2 varchar(100), 
  Erz1ZusatzNachname varchar(30), 
  Erz2ZusatzNachname varchar(30), 
  Bemerkungen text, 
  CredentialID bigint,
  CONSTRAINT PK_SchuelerErzAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzAdr_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_ErzieherArt_FK FOREIGN KEY (ErzieherArt_ID) REFERENCES K_ErzieherArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ort_FK FOREIGN KEY (ErzOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ortsteil_FK FOREIGN KEY (ErzOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerErzAdr_Staat1_FK FOREIGN KEY (Erz1StaatKrz) REFERENCES Statkue_Nationalitaeten(Schluessel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Staat2_FK FOREIGN KEY (Erz2StaatKrz) REFERENCES Statkue_Nationalitaeten(Schluessel) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX SchuelerErzAdr_IDX1 ON SchuelerErzAdr(Schueler_ID);


CREATE TABLE SchuelerFHR (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FHRErreicht varchar(1) DEFAULT '-', 
  Note varchar(3), 
  GesamtPunktzahl smallint, 
  SummeGK smallint, 
  SummeLK smallint, 
  SummenOK smallint, 
  AnzRelLK smallint, 
  AnzRelGK smallint, 
  AnzRelOK smallint, 
  AnzDefLK smallint, 
  AnzDefGK smallint, 
  AnzDefOK smallint, 
  JSII_2_1 smallint, 
  JSII_2_1_W smallint, 
  JSII_2_2 smallint, 
  JSII_2_2_W smallint, 
  JSII_3_1 smallint, 
  JSII_3_1_W smallint, 
  JSII_3_2 smallint, 
  JSII_3_2_W smallint, 
  ASII_2_1 smallint, 
  ASII_2_2 smallint, 
  ASII_2_1_W smallint, 
  ASII_2_2_W smallint, 
  ASII_3_1 smallint, 
  ASII_3_2 smallint, 
  ASII_3_1_W smallint, 
  ASII_3_2_W smallint, 
  WSII_2_1 varchar(1), 
  WSII_2_2 varchar(1), 
  WSII_2_1_W varchar(1), 
  WSII_2_2_W varchar(1), 
  WSII_3_1 varchar(1), 
  WSII_3_2 varchar(1), 
  WSII_3_1_W varchar(1), 
  WSII_3_2_W varchar(1),
  CONSTRAINT PK_SchuelerFHR PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHR_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHR_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerFHRFaecher (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(5), 
  FachKrz varchar(20), 
  PSII_2_1 varchar(2), 
  HSII_2_1 int, 
  RSII_2_1 varchar(1) DEFAULT '-', 
  PSII_2_2 varchar(2), 
  HSII_2_2 int, 
  RSII_2_2 varchar(1) DEFAULT '-', 
  PSII_2_1_W varchar(2), 
  HSII_2_1_W int, 
  RSII_2_1_W varchar(1) DEFAULT '-', 
  PSII_2_2_W varchar(2), 
  HSII_2_2_W int, 
  RSII_2_2_W varchar(1) DEFAULT '-', 
  PSII_3_1 varchar(2), 
  HSII_3_1 int, 
  RSII_3_1 varchar(1) DEFAULT '-', 
  PSII_3_2 varchar(2), 
  HSII_3_2 int, 
  RSII_3_2 varchar(1) DEFAULT '-', 
  PSII_3_1_W varchar(2), 
  HSII_3_1_W int, 
  RSII_3_1_W varchar(1) DEFAULT '-', 
  PSII_3_2_W varchar(2), 
  HSII_3_2_W int, 
  RSII_3_2_W varchar(1) DEFAULT '-', 
  KSII_2_1 varchar(5), 
  KSII_2_2 varchar(5), 
  KSII_2_1_W varchar(5), 
  KSII_2_2_W varchar(5), 
  KSII_3_1 varchar(5), 
  KSII_3_2 varchar(5), 
  KSII_3_1_W varchar(5), 
  KSII_3_2_W varchar(5), 
  FSortierung int,
  CONSTRAINT PK_SchuelerFHRFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHRFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFotos (
  Schueler_ID bigint NOT NULL, 
  FotoBase64 text,
  CONSTRAINT PK_SchuelerFotos PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerFotos_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerGSDaten (
  Schueler_ID bigint NOT NULL, 
  Note_Sprachgebrauch int, 
  Note_Lesen int, 
  Note_Rechtschreiben int, 
  Note_Sachunterricht int, 
  Note_Mathematik int, 
  Note_Englisch int, 
  Note_KunstTextil int, 
  Note_Musik int, 
  Note_Sport int, 
  Note_Religion int, 
  Durchschnittsnote_Sprache float, 
  Durchschnittsnote_Einfach float, 
  Durchschnittsnote_Gewichtet float, 
  Anrede_Klassenlehrer varchar(10), 
  Nachname_Klassenlehrer varchar(120), 
  GS_Klasse varchar(15), 
  Bemerkungen text, 
  Geschwisterkind varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerGSDaten PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerGSDaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerLernabschnittsdaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  WechselNr smallint, 
  Schulbesuchsjahre smallint, 
  Hochrechnung int, 
  SemesterWertung varchar(1) DEFAULT '+', 
  PruefOrdnung varchar(20), 
  Klassen_ID bigint, 
  Verspaetet smallint, 
  NPV_Fach_ID bigint, 
  NPV_NoteKrz varchar(2), 
  NPV_Datum date, 
  NPAA_Fach_ID bigint, 
  NPAA_NoteKrz varchar(2), 
  NPAA_Datum date, 
  NPBQ_Fach_ID bigint, 
  NPBQ_NoteKrz varchar(2), 
  NPBQ_Datum date, 
  VersetzungKrz varchar(2), 
  AbschlussArt smallint, 
  AbschlIstPrognose varchar(1) DEFAULT '-', 
  Konferenzdatum date, 
  ZeugnisDatum date, 
  ASDSchulgliederung varchar(3), 
  ASDJahrgang varchar(2), 
  Jahrgang_ID bigint, 
  Fachklasse_ID bigint, 
  Schwerpunkt_ID bigint, 
  ZeugnisBem text, 
  Schwerbehinderung varchar(1) DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  OrgFormKrz varchar(1), 
  RefPaed varchar(1) DEFAULT '-', 
  Klassenart varchar(2), 
  SumFehlStd int, 
  SumFehlStdU int, 
  Wiederholung varchar(1) DEFAULT '-', 
  Gesamtnote_GS int, 
  Gesamtnote_NW int, 
  Folgeklasse_ID bigint, 
  Foerderschwerpunkt2_ID bigint, 
  Abschluss varchar(50), 
  Abschluss_B varchar(50), 
  DSNote varchar(4), 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  MoeglNPFaecher text, 
  Zertifikate varchar(30), 
  DatumFHR date, 
  PruefAlgoErgebnis text, 
  Zeugnisart varchar(5), 
  DatumVon date, 
  DatumBis date, 
  FehlstundenGrenzwert int, 
  Sonderpaedagoge_ID bigint, 
  FachPraktAnteilAusr varchar(1) DEFAULT '+' NOT NULL, 
  BilingualerZweig varchar(1), 
  AOSF varchar(1) DEFAULT '-', 
  Autist varchar(1) DEFAULT '-', 
  ZieldifferentesLernen varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerLernabschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLernabschnittsdaten_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernabschnittsdaten_Fach_Nachpruefung_1_FK FOREIGN KEY (NPV_Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Fach_Nachpruefung_2_FK FOREIGN KEY (NPAA_Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Fach_Nachpruefung_3_FK FOREIGN KEY (NPBQ_Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Foerderschwerpunkt2_FK FOREIGN KEY (Foerderschwerpunkt2_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_FolgeKlasse_FK FOREIGN KEY (Folgeklasse_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernabschnittsdaten_Schwerpunkt_FK FOREIGN KEY (Schwerpunkt_ID) REFERENCES K_Schwerpunkt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Sonderpaedagoge_FK FOREIGN KEY (Sonderpaedagoge_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_UC1 UNIQUE (Schueler_ID, Schuljahresabschnitts_ID, WechselNr)
);


CREATE TABLE SchuelerLernplattform (
  SchuelerID bigint NOT NULL, 
  LernplattformID bigint NOT NULL, 
  CredentialID bigint, 
  EinwilligungAbgefragt int DEFAULT 0 NOT NULL, 
  EinwilligungNutzung int DEFAULT 0 NOT NULL, 
  EinwilligungAudiokonferenz int DEFAULT 0 NOT NULL, 
  EinwilligungVideokonferenz int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SchuelerLernplattform PRIMARY KEY (SchuelerID, LernplattformID),
  CONSTRAINT SchuelerLernplattform_Schueler_FK FOREIGN KEY (SchuelerID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernplattform_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernplattform_Credential_FK FOREIGN KEY (CredentialID) REFERENCES CredentialsLernplattformen(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerListe_Inhalt (
  Liste_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL,
  CONSTRAINT PK_SchuelerListe_Inhalt PRIMARY KEY (Liste_ID, Schueler_ID),
  CONSTRAINT SchuelerListeInhalt_Liste_FK FOREIGN KEY (Liste_ID) REFERENCES SchuelerListe(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerListeInhalt_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerMerkmale (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Kurztext varchar(10), 
  DatumVon date, 
  DatumBis date,
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerMerkmale_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerSprachenfolge (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Sprache varchar(2) NOT NULL, 
  ReihenfolgeNr int, 
  ASDJahrgangVon varchar(2), 
  ASDJahrgangBis varchar(2), 
  AbschnittVon smallint, 
  AbschnittBis smallint, 
  Referenzniveau varchar(5), 
  KleinesLatinumErreicht int, 
  LatinumErreicht int, 
  GraecumErreicht int, 
  HebraicumErreicht int,
  CONSTRAINT PK_SchuelerSprachenfolge PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerSprachenfolge_IDX1 ON SchuelerSprachenfolge(Schueler_ID);


CREATE TABLE SchuelerSprachpruefungen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Sprache varchar(2) NOT NULL, 
  ASDJahrgang varchar(2), 
  Anspruchsniveau_ID bigint, 
  Pruefungsdatum date, 
  ErsetzteSprache varchar(2), 
  IstHSUPruefung int, 
  IstFeststellungspruefung int, 
  KannErstePflichtfremdspracheErsetzen int, 
  KannZweitePflichtfremdspracheErsetzen int, 
  KannWahlpflichtfremdspracheErsetzen int, 
  KannBelegungAlsFortgefuehrteSpracheErlauben int, 
  Referenzniveau varchar(5), 
  NotePruefung int,
  CONSTRAINT PK_SchuelerSprachpruefungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachpruefungen_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerTelefone (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  TelefonArt_ID bigint, 
  Telefonnummer varchar(20), 
  Bemerkung varchar(50), 
  Sortierung int DEFAULT 32000, 
  Gesperrt varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerTelefone PRIMARY KEY (ID),
  CONSTRAINT SchuelerTelefone_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerTelefone_Telefonart_FK FOREIGN KEY (TelefonArt_ID) REFERENCES K_TelefonArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX SchuelerTelefone_IDX1 ON SchuelerTelefone(Schueler_ID);


CREATE TABLE SchuelerVermerke (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  VermerkArt_ID bigint, 
  Datum date, 
  Bemerkung text, 
  AngelegtVon varchar(20), 
  GeaendertVon varchar(20),
  CONSTRAINT PK_SchuelerVermerke PRIMARY KEY (ID),
  CONSTRAINT SchuelerVermerke_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerVermerke_VermerkArt_FK FOREIGN KEY (VermerkArt_ID) REFERENCES K_Vermerkart(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerVermerke_IDX1 ON SchuelerVermerke(Schueler_ID);


CREATE TABLE SchuelerZP10 (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  Fach_ID bigint NOT NULL, 
  Vornote varchar(2), 
  NoteSchriftlich varchar(2), 
  MdlPruefung char(1), 
  MdlPruefungFW char(1), 
  NoteMuendlich varchar(2), 
  NoteAbschluss varchar(2), 
  Fachlehrer_ID bigint,
  CONSTRAINT PK_SchuelerZP10 PRIMARY KEY (ID),
  CONSTRAINT SchuelerZP10_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZP10_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZP10_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZP10_UC1 UNIQUE (Schueler_ID, Schuljahresabschnitts_ID, Fach_ID)
);

CREATE INDEX SchuelerZP10_IDX1 ON SchuelerZP10(Schueler_ID);
CREATE INDEX SchuelerZP10_IDX2 ON SchuelerZP10(Schuljahresabschnitts_ID);
CREATE INDEX SchuelerZP10_IDX3 ON SchuelerZP10(Fach_ID);
CREATE INDEX SchuelerZP10_IDX4 ON SchuelerZP10(Fachlehrer_ID);


CREATE TABLE Schueler_AllgAdr (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Adresse_ID bigint NOT NULL, 
  Vertragsart_ID bigint, 
  Vertragsbeginn date, 
  Vertragsende date, 
  Ausbilder varchar(30), 
  AllgAdrAnschreiben varchar(1) DEFAULT '-', 
  Praktikum varchar(1) DEFAULT '-', 
  Sortierung int, 
  Ansprechpartner_ID bigint, 
  Betreuungslehrer_ID bigint,
  CONSTRAINT PK_Schueler_AllgAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerAllgAdr_Adresse_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Ansprech_FK FOREIGN KEY (Ansprechpartner_ID) REFERENCES AllgAdrAnsprechpartner(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Vertragsart_Beschaeftigungsart_FK FOREIGN KEY (Vertragsart_ID) REFERENCES K_BeschaeftigungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX Schueler_AllgAdr_IDX1 ON Schueler_AllgAdr(Schueler_ID);


CREATE TABLE Benutzer (
  ID bigint AUTOINCREMENT NOT NULL, 
  Typ smallint DEFAULT 0 NOT NULL, 
  Allgemein_ID bigint, 
  Lehrer_ID bigint, 
  Schueler_ID bigint, 
  Erzieher_ID bigint, 
  IstAdmin int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Benutzer PRIMARY KEY (ID),
  CONSTRAINT Benutzer_Allgemein_FK FOREIGN KEY (Allgemein_ID) REFERENCES BenutzerAllgemein(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Benutzer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Benutzer_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Benutzer_Erzieher_FK FOREIGN KEY (Erzieher_ID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ErzieherDatenschutz (
  ErzieherID bigint NOT NULL, 
  DatenschutzID bigint NOT NULL, 
  Status int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_ErzieherDatenschutz PRIMARY KEY (ErzieherID, DatenschutzID),
  CONSTRAINT ErzieherDatenschutz_Erzieher_FK FOREIGN KEY (ErzieherID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ErzieherDatenschutz_Datenschutz_FK FOREIGN KEY (DatenschutzID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ErzieherLernplattform (
  ErzieherID bigint NOT NULL, 
  LernplattformID bigint NOT NULL, 
  CredentialID bigint, 
  EinwilligungAbgefragt int DEFAULT 0 NOT NULL, 
  EinwilligungNutzung int DEFAULT 0 NOT NULL, 
  EinwilligungAudiokonferenz int DEFAULT 0 NOT NULL, 
  EinwilligungVideokonferenz int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_ErzieherLernplattform PRIMARY KEY (ErzieherID, LernplattformID),
  CONSTRAINT ErzieherLernplattform_Erzieher_FK FOREIGN KEY (ErzieherID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ErzieherLernplattform_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ErzieherLernplattform_Credential_FK FOREIGN KEY (CredentialID) REFERENCES CredentialsLernplattformen(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerAnkreuzfloskeln (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Floskel_ID bigint NOT NULL, 
  Stufe1 varchar(1) DEFAULT '-', 
  Stufe2 varchar(1) DEFAULT '-', 
  Stufe3 varchar(1) DEFAULT '-', 
  Stufe4 varchar(1) DEFAULT '-', 
  Stufe5 varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerAnkreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT SchuelerAnkreuzfloskeln_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAnkreuzfloskeln_Floskel_FK FOREIGN KEY (Floskel_ID) REFERENCES K_Ankreuzfloskeln(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFehlstunden (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Datum date DEFAULT Date() NOT NULL, 
  Fach_ID bigint, 
  FehlStd float NOT NULL, 
  VonStd int, 
  BisStd int, 
  Entschuldigt varchar(1) DEFAULT '-', 
  Lehrer_ID bigint,
  CONSTRAINT PK_SchuelerFehlstunden PRIMARY KEY (ID),
  CONSTRAINT SchuelerFehlstunden_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFehlstunden_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerFehlstunden_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerFoerderempfehlungen (
  GU_ID varchar(40) NOT NULL, 
  Abschnitt_ID bigint, 
  DatumAngelegt date DEFAULT Date() NOT NULL, 
  Klassen_ID bigint, 
  Lehrer_ID bigint, 
  DatumAenderungSchild datetime, 
  DatumAenderungSchildWeb datetime, 
  Inhaltl_Prozessbez_Komp text, 
  Methodische_Komp text, 
  Lern_Arbeitsverhalten text, 
  Massn_Inhaltl_Prozessbez_Komp text, 
  Massn_Methodische_Komp text, 
  Massn_Lern_Arbeitsverhalten text, 
  Verantwortlichkeit_Eltern text, 
  Verantwortlichkeit_Schueler text, 
  Zeitrahmen_von_Datum date, 
  Zeitrahmen_bis_Datum date, 
  Ueberpruefung_Datum date, 
  Naechstes_Beratungsgespraech date, 
  EingabeFertig varchar(1) DEFAULT '-', 
  Faecher varchar(255), 
  Abgeschlossen varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerFoerderempfehlungen PRIMARY KEY (GU_ID),
  CONSTRAINT SchuelerFoerderempfehlungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFoerderempfehlungen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerFoerderempfehlungen_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerKAoADaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Jahrgang varchar(2), 
  KategorieID bigint NOT NULL, 
  MerkmalID bigint, 
  ZusatzmerkmalID bigint, 
  AnschlussoptionID bigint, 
  BerufsfeldID bigint, 
  SBO_Ebene4ID bigint, 
  Bemerkung varchar(255),
  CONSTRAINT PK_SchuelerKAoADaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerKAoADaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Kategorie_FK FOREIGN KEY (KategorieID) REFERENCES Schildintern_KAoA_Kategorie(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Merkmal_FK FOREIGN KEY (MerkmalID) REFERENCES Schildintern_KAoA_Merkmal(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Zusatzmerkmal_FK FOREIGN KEY (ZusatzmerkmalID) REFERENCES Schildintern_KAoA_Zusatzmerkmal(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Anschlussoption_FK FOREIGN KEY (AnschlussoptionID) REFERENCES Schildintern_KAoA_Anschlussoption(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Berufsfeld_FK FOREIGN KEY (BerufsfeldID) REFERENCES Schildintern_KAoA_Berufsfeld(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_SBO_Ebene4_FK FOREIGN KEY (SBO_Ebene4ID) REFERENCES Schildintern_KAoA_SBO_Ebene4(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerLD_PSFachBem (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  ASV text, 
  LELS text, 
  AUE text, 
  ESF text, 
  BemerkungFSP text, 
  BemerkungVersetzung text,
  CONSTRAINT PK_SchuelerLD_PSFachBem PRIMARY KEY (ID),
  CONSTRAINT SchuelerLD_PSFachBem_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLD_PSFachBem_UC1 UNIQUE (Abschnitt_ID)
);


CREATE TABLE SchuelerLeistungsdaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Hochrechnung int, 
  Fachlehrer_ID bigint, 
  Kursart varchar(5), 
  KursartAllg varchar(5), 
  Kurs_ID bigint, 
  NotenKrz varchar(2), 
  Warnung varchar(1) DEFAULT '-', 
  Warndatum date, 
  AbiFach varchar(1), 
  Wochenstunden smallint, 
  AbiZeugnis varchar(1) DEFAULT '-', 
  Prognose varchar(1), 
  FehlStd smallint, 
  uFehlStd smallint, 
  Sortierung int DEFAULT 32000, 
  Lernentw text, 
  Gekoppelt varchar(1) DEFAULT '-', 
  VorherAbgeschl varchar(1) DEFAULT '-', 
  AbschlussJahrgang varchar(2), 
  HochrechnungStatus varchar(1), 
  SchulNr int, 
  Zusatzkraft_ID bigint, 
  WochenstdZusatzkraft int, 
  Prf10Fach varchar(1) DEFAULT '-', 
  AufZeugnis varchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  NoteAbschlussBA varchar(2), 
  Umfang varchar(1),
  CONSTRAINT PK_SchuelerLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLeistungsdaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_FK FOREIGN KEY (Fachlehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_Zusatzkraft_FK FOREIGN KEY (Zusatzkraft_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_UC1 UNIQUE (Abschnitt_ID, Fach_ID, Fachlehrer_ID, Kursart, Kurs_ID)
);

CREATE INDEX SchuelerLeistungsdaten_IDX1 ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX2 ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX3 ON SchuelerLeistungsdaten(Fachlehrer_ID);


CREATE TABLE SchuelerZuweisungen (
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(5),
  CONSTRAINT PK_SchuelerZuweisungen PRIMARY KEY (Abschnitt_ID, Fach_ID),
  CONSTRAINT SchuelerZuweisungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZuweisungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE BenutzerEmail (
  Benutzer_ID bigint NOT NULL, 
  Email varchar(255) NOT NULL, 
  EmailName varchar(255) NOT NULL, 
  SMTPUsername varchar(255), 
  SMTPPassword varchar(255), 
  EMailSignature varchar(2047), 
  HeartbeatDate bigint, 
  ComputerName varchar(255),
  CONSTRAINT PK_BenutzerEmail PRIMARY KEY (Benutzer_ID),
  CONSTRAINT BenutzerEmail_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE BenutzerKompetenzen (
  Benutzer_ID bigint NOT NULL, 
  Kompetenz_ID bigint NOT NULL,
  CONSTRAINT PK_BenutzerKompetenzen PRIMARY KEY (Benutzer_ID, Kompetenz_ID),
  CONSTRAINT BenutzerKompetenzen_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BenutzerKompetenzen_Kompetenzen_FK FOREIGN KEY (Kompetenz_ID) REFERENCES Kompetenzen(KO_ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE BenutzergruppenMitglieder (
  Gruppe_ID bigint NOT NULL, 
  Benutzer_ID bigint NOT NULL,
  CONSTRAINT PK_BenutzergruppenMitglieder PRIMARY KEY (Gruppe_ID, Benutzer_ID),
  CONSTRAINT BenutzergruppenMitglieder_Benutzergruppen_FK FOREIGN KEY (Gruppe_ID) REFERENCES Benutzergruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BenutzergruppenMitglieder_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL, 
  LI_LoginTime datetime, 
  LI_LogoffTime datetime,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_LoginTime, LI_UserID),
  CONSTRAINT Logins_Benutzer_FK FOREIGN KEY (LI_UserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SVWS_Client_Konfiguration_Benutzer (
  Benutzer_ID bigint NOT NULL, 
  AppName varchar(100) NOT NULL, 
  Schluessel varchar(255) NOT NULL, 
  Wert text NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Benutzer PRIMARY KEY (Benutzer_ID, AppName, Schluessel),
  CONSTRAINT SVWSClientKonfigurationBenutzer_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schild_Verwaltung (
  BackupDatum datetime, 
  AutoBerechnung datetime, 
  DatumStatkue datetime, 
  DatumSchildIntern datetime, 
  Bescheinigung varchar(255), 
  Stammblatt varchar(255), 
  DatenGeprueft varchar(1) DEFAULT '-', 
  Version varchar(10), 
  GU_ID varchar(40) NOT NULL, 
  DatumLoeschfristHinweisDeaktiviert datetime, 
  DatumLoeschfristHinweisDeaktiviertUserID bigint, 
  DatumDatenGeloescht datetime,
  CONSTRAINT PK_Schild_Verwaltung PRIMARY KEY (GU_ID),
  CONSTRAINT Schild_Verwaltung_Loeschfrist_deaktiviert_durch_Benutzer_FK FOREIGN KEY (DatumLoeschfristHinweisDeaktiviertUserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerEinzelleistungen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Datum date, 
  Lehrer_ID bigint, 
  Art_ID bigint, 
  Bemerkung varchar(100), 
  Leistung_ID bigint NOT NULL, 
  NotenKrz varchar(2),
  CONSTRAINT PK_SchuelerEinzelleistungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerEinzelleistungen_Art_FK FOREIGN KEY (Art_ID) REFERENCES K_Einzelleistungen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerEinzelleistungen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerEinzelleistungen_Leistungsdaten_FK FOREIGN KEY (Leistung_ID) REFERENCES SchuelerLeistungsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerReportvorlagen (
  User_ID bigint NOT NULL, 
  Reportvorlage varchar(255), 
  Schueler_IDs text,
  CONSTRAINT PK_SchuelerReportvorlagen PRIMARY KEY (User_ID, Reportvorlage),
  CONSTRAINT SchuelerReportvorlagen_Benutzer_FK FOREIGN KEY (User_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerWiedervorlage (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Bemerkung varchar(255), 
  AngelegtAm datetime, 
  WiedervorlageAm datetime, 
  ErledigtAm datetime, 
  User_ID bigint, 
  Sekretariat varchar(1) DEFAULT '+', 
  Typ varchar(1), 
  NichtLoeschen varchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerWiedervorlage PRIMARY KEY (ID),
  CONSTRAINT SchuelerWiedervorlage_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerWiedervorlage_Benutzer_FK FOREIGN KEY (User_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Statkue_SVWS_SprachpruefungNiveaus (
  ID bigint NOT NULL, 
  Bezeichnung varchar(16) NOT NULL, 
  Beschreibung varchar(200) NOT NULL, 
  Sortierung int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_SprachpruefungNiveaus PRIMARY KEY (ID),
  CONSTRAINT Statkue_SVWS_SprachpruefungNiveaus_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE Statkue_SVWS_ZulaessigeFaecher (
  Fach varchar(2) NOT NULL, 
  Bezeichnung varchar(80) NOT NULL, 
  FachkuerzelAtomar varchar(2) NOT NULL, 
  Kurzbezeichnung varchar(80), 
  Aufgabenfeld int, 
  Fachgruppe_ID bigint, 
  SchulformenUndGliederungen varchar(255), 
  SchulformenAusgelaufen varchar(255), 
  AusgelaufenInSchuljahr varchar(255), 
  AbJahrgang varchar(2), 
  IstFremdsprache int NOT NULL, 
  IstHKFS int NOT NULL, 
  IstAusRegUFach int NOT NULL, 
  IstErsatzPflichtFS int NOT NULL, 
  IstKonfKoop int NOT NULL, 
  NurSII int NOT NULL, 
  ExportASD int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_ZulaessigeFaecher PRIMARY KEY (Fach)
);


CREATE TABLE Statkue_SVWS_ZulaessigeJahrgaenge (
  ID bigint NOT NULL, 
  Schulform varchar(2) NOT NULL, 
  SchulformKuerzel varchar(3) NOT NULL, 
  Jahrgang varchar(2) NOT NULL, 
  Beschreibung varchar(80) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  geaendert datetime, 
  Sortierung int DEFAULT 0, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_ZulaessigeJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SVWS_ZulaessigeKursarten (
  ID varchar(7) NOT NULL, 
  Kuerzel varchar(5) NOT NULL, 
  ASDNummer varchar(2) NOT NULL, 
  Bezeichnung varchar(120) NOT NULL, 
  SchulformenUndGliederungen varchar(255), 
  KuerzelAllg varchar(5), 
  BezeichnungAllg varchar(120), 
  SchulformenAusgelaufen varchar(255), 
  erlaubtGOSt int DEFAULT 0 NOT NULL, 
  AusgelaufenInSchuljahr varchar(255), 
  Bemerkungen varchar(120), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_ZulaessigeKursarten PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerErsteSchulformSekI (
  ID bigint NOT NULL, 
  SF varchar(2), 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerErsteSchulformSekI PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerKindergartenbesuch (
  ID bigint NOT NULL, 
  SF varchar(2), 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerKindergartenbesuch PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerUebergangsempfehlung5Jg (
  ID bigint NOT NULL, 
  SF varchar(2), 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Beginn datetime, 
  Ende datetime, 
  Sort int, 
  HGSEM varchar(4) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerUebergangsempfehlung5Jg PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerVerkehrssprache (
  ID bigint NOT NULL, 
  Kurztext varchar(10) NOT NULL, 
  Langtext varchar(255) NOT NULL, 
  Gesprochen_in varchar(255), 
  Beginn datetime, 
  Ende datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerVerkehrssprache PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Schulformen (
  Schulform varchar(2), 
  SF varchar(2) NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime, 
  Sortierung int DEFAULT 0, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Schulformen PRIMARY KEY (Bezeichnung, SF)
);


CREATE TABLE Statkue_ZulFaecher (
  Schulform varchar(2) NOT NULL, 
  FSP varchar(2), 
  BG varchar(3), 
  Fach varchar(2) NOT NULL, 
  Bezeichnung varchar(80) NOT NULL, 
  KZ_Bereich int DEFAULT 0, 
  Flag varchar(1) DEFAULT '1', 
  Sortierung int DEFAULT 0, 
  Sortierung2 int DEFAULT 0, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulFaecher PRIMARY KEY (Bezeichnung, BG, Fach, Flag, Schulform)
);


CREATE TABLE Statkue_ZulJahrgaenge (
  ID bigint NOT NULL, 
  Schulform varchar(2) NOT NULL, 
  SNR varchar(6), 
  FSP varchar(2), 
  Jahrgang varchar(2), 
  KZ_Bereich int DEFAULT 0, 
  Beschreibung varchar(255), 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_ZulKlArt (
  KlArt varchar(2) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  Bezeichnung varchar(100) NOT NULL, 
  Schulform varchar(2) NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulKlArt PRIMARY KEY (Bezeichnung, FSP, KlArt, Schulform)
);


CREATE TABLE Statkue_ZulKuArt (
  SF varchar(2) NOT NULL, 
  FSP varchar(2) NOT NULL, 
  BG varchar(3) NOT NULL, 
  Kursart varchar(3) NOT NULL, 
  Kursart2 varchar(5) NOT NULL, 
  Bezeichnung varchar(120) NOT NULL, 
  SGLBereich int DEFAULT 0 NOT NULL, 
  Flag varchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulKuArt PRIMARY KEY (Bezeichnung, BG, Flag, FSP, SGLBereich, Kursart, Kursart2, SF)
);


CREATE TABLE Stundenplan (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Beginn date DEFAULT '1899-01-01' NOT NULL, 
  Ende date, 
  Beschreibung varchar(1000) NOT NULL,
  CONSTRAINT PK_Stundenplan PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Stundenplan_Aufsichtsbereiche (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Beschreibung varchar(1000) NOT NULL,
  CONSTRAINT PK_Stundenplan_Aufsichtsbereiche PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Aufsichtsbereiche_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Aufsichtsbereiche_UC1 UNIQUE (Stundenplan_ID, Kuerzel)
);


CREATE TABLE Stundenplan_Pausenzeit (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Tag int NOT NULL, 
  Beginn timestamp DEFAULT Now() NOT NULL, 
  Ende timestamp DEFAULT Now() NOT NULL,
  CONSTRAINT PK_Stundenplan_Pausenzeit PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenzeit_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_UC1 UNIQUE (Stundenplan_ID, Tag, Beginn, Ende)
);


CREATE TABLE Stundenplan_Pausenaufsichten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Pausenzeit_ID bigint NOT NULL, 
  Wochentyp int DEFAULT 0 NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Pausenaufsichten PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenaufsichten_K_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenaufsichten_Pausenzeit_FK FOREIGN KEY (Pausenzeit_ID) REFERENCES Stundenplan_Pausenzeit(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenaufsichten_UC1 UNIQUE (Pausenzeit_ID, Lehrer_ID)
);


CREATE TABLE Stundenplan_PausenaufsichtenBereich (
  ID bigint AUTOINCREMENT NOT NULL, 
  Pausenaufsicht_ID bigint NOT NULL, 
  Aufsichtsbereich_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_PausenaufsichtenBereich PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsichtsbereiche_FK FOREIGN KEY (Aufsichtsbereich_ID) REFERENCES Stundenplan_Aufsichtsbereiche(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsicht_FK FOREIGN KEY (Pausenaufsicht_ID) REFERENCES Stundenplan_Pausenaufsichten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_UC1 UNIQUE (Pausenaufsicht_ID, Aufsichtsbereich_ID)
);


CREATE TABLE Stundenplan_Raeume (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Kuerzel varchar(20) NOT NULL, 
  Beschreibung varchar(1000) NOT NULL, 
  Groesse int DEFAULT 40 NOT NULL,
  CONSTRAINT PK_Stundenplan_Raeume PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Raeume_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Raeume_UC1 UNIQUE (Stundenplan_ID, Kuerzel)
);


CREATE TABLE Stundenplan_Zeitraster (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Tag int NOT NULL, 
  Stunde int NOT NULL, 
  Beginn timestamp DEFAULT Now() NOT NULL, 
  Ende timestamp DEFAULT Now() NOT NULL,
  CONSTRAINT PK_Stundenplan_Zeitraster PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Zeitraster_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Zeitraster_UC1 UNIQUE (Stundenplan_ID, Tag, Stunde)
);


CREATE TABLE Stundenplan_Unterricht (
  ID bigint AUTOINCREMENT NOT NULL, 
  Zeitraster_ID bigint NOT NULL, 
  Wochentyp int DEFAULT 0 NOT NULL, 
  Klasse_ID bigint, 
  Kurs_ID bigint, 
  Fach_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Unterricht PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Unterricht_Klassen_FK FOREIGN KEY (Klasse_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_EigeneSchule_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Stundenplan_Zeitraster_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Stundenplan_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_UC1 UNIQUE (Zeitraster_ID, Klasse_ID, Kurs_ID)
);


CREATE TABLE Stundenplan_UnterrichtLehrer (
  ID bigint AUTOINCREMENT NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtLehrer PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtLehrer_K_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtLehrer_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtLehrer_UC1 UNIQUE (Unterricht_ID, Lehrer_ID)
);


CREATE TABLE Stundenplan_UnterrichtRaum (
  ID bigint AUTOINCREMENT NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Raum_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtRaum PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtRaum_Raeume_FK FOREIGN KEY (Raum_ID) REFERENCES Stundenplan_Raeume(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_UC1 UNIQUE (Unterricht_ID, Raum_ID)
);


CREATE TABLE Stundentafel (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang varchar(2), 
  SGL varchar(3), 
  Fachklasse_ID bigint, 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Stundentafel PRIMARY KEY (ID)
);


CREATE TABLE Stundentafel_Faecher (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundentafel_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(5), 
  WochenStd smallint, 
  Lehrer_ID bigint, 
  EpochenUnterricht varchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1,
  CONSTRAINT PK_Stundentafel_Faecher PRIMARY KEY (ID),
  CONSTRAINT StundentafelFaecher_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT StundentafelFaecher_Stdtafel_FK FOREIGN KEY (Stundentafel_ID) REFERENCES Stundentafel(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundentafel_Faecher_UC1 UNIQUE (Stundentafel_ID, Fach_ID)
);


CREATE TABLE TextExportVorlagen (
  VorlageName varchar(50) NOT NULL, 
  Daten text,
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (VorlageName)
);


CREATE TABLE ZuordnungReportvorlagen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Jahrgang_ID bigint, 
  Abschluss varchar(50), 
  AbschlussBB varchar(50), 
  AbschlussArt int, 
  VersetzungKrz varchar(2), 
  Fachklasse_ID bigint, 
  Reportvorlage varchar(255), 
  Beschreibung varchar(255), 
  Gruppe varchar(50), 
  Zeugnisart varchar(5),
  CONSTRAINT PK_ZuordnungReportvorlagen PRIMARY KEY (ID),
  CONSTRAINT ZuordnungReportvorlagen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT ZuordnungReportvorlagen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL
);








INSERT INTO SVWS_DB_Version(Revision) VALUES (7);


INSERT INTO Credentials(ID, Benutzername, BenutzernamePseudonym, Initialkennwort, PasswordHash, RSAPublicKey, RSAPrivateKey, AES) VALUES (1, 'Admin', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO BenutzerAllgemein(ID,AnzeigeName,CredentialID) VALUES (1,'Administrator',1);

INSERT INTO Benutzer(ID, Typ, Allgemein_ID, Lehrer_ID, Schueler_ID, Erzieher_ID, IstAdmin) VALUES (1, 0, 1, NULL, NULL, NULL, 1)

INSERT INTO Benutzergruppen(ID, Bezeichnung, IstAdmin) VALUES (1, 'Administrator', 1),(2, 'Lehrer', 0),(3, 'Sekretariat', 0);

INSERT INTO BenutzergruppenMitglieder(Gruppe_ID, Benutzer_ID) VALUES (1, 1);

INSERT INTO BenutzergruppenKompetenzen(Gruppe_ID, Kompetenz_ID) VALUES (2, 11), (2, 21), (2, 22), (2, 31), (2, 61), (2, 81),(3, 11),(3, 12),(3, 13),(3, 14),(3, 21),(3, 31),(3, 32),(3, 33),(3, 34),(3, 61),(3, 62),(3, 71),(3, 81),(3, 82),(3, 83),(3, 91),(3, 92),(3, 93),(3, 94),(3, 95);
