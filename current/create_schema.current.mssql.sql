CREATE TABLE Benutzergruppen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  IstAdmin int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Benutzergruppen PRIMARY KEY (ID)
);


CREATE TABLE Credentials (
  ID bigint DEFAULT -1 NOT NULL, 
  Benutzername nvarchar(255) NOT NULL, 
  BenutzernamePseudonym nvarchar(255), 
  Initialkennwort nvarchar(255), 
  PasswordHash nvarchar(255), 
  RSAPublicKey nvarchar(max), 
  RSAPrivateKey nvarchar(max), 
  AES nvarchar(max),
  CONSTRAINT PK_Credentials PRIMARY KEY (ID),
  CONSTRAINT Credentials_UC1 UNIQUE (Benutzername)
);


CREATE TABLE BenutzerAllgemein (
  ID bigint DEFAULT -1 NOT NULL, 
  AnzeigeName nvarchar(255), 
  CredentialID bigint,
  CONSTRAINT PK_BenutzerAllgemein PRIMARY KEY (ID),
  CONSTRAINT BenutzerAllgemein_Credential_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE EigeneSchule_Fachklassen (
  ID bigint DEFAULT -1 NOT NULL, 
  BKIndex smallint, 
  FKS nvarchar(3), 
  AP nvarchar(2), 
  Bezeichnung nvarchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  Kennung nvarchar(10), 
  FKS_AP_SIM nvarchar(5), 
  BKIndexTyp nvarchar(3), 
  Beschreibung_W nvarchar(100), 
  Status nvarchar(20), 
  Lernfelder nvarchar(max), 
  DQR_Niveau int, 
  Ebene1Klartext nvarchar(255), 
  Ebene2Klartext nvarchar(255), 
  Ebene3Klartext nvarchar(255),
  CONSTRAINT PK_EigeneSchule_Fachklassen PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_KAoADaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Curriculum nvarchar(1) DEFAULT '+' NOT NULL, 
  Koordinator nvarchar(1) DEFAULT '+' NOT NULL, 
  Berufsorientierungsbuero nvarchar(1) DEFAULT '+' NOT NULL, 
  KooperationsvereinbarungAA nvarchar(1) DEFAULT '+' NOT NULL, 
  NutzungReflexionsworkshop nvarchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzI nvarchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzII nvarchar(1) DEFAULT '+' NOT NULL,
  CONSTRAINT PK_EigeneSchule_KAoADaten PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Kursart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(120), 
  InternBez nvarchar(20), 
  Kursart nvarchar(5), 
  KursartAllg nvarchar(5), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Kursart PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Kursart_UC1 UNIQUE (Kursart, KursartAllg)
);


CREATE TABLE EigeneSchule_Merkmale (
  ID bigint DEFAULT -1 NOT NULL, 
  Schule nvarchar(1) DEFAULT '+', 
  Schueler nvarchar(1) DEFAULT '+', 
  Kurztext nvarchar(10), 
  Langtext nvarchar(100),
  CONSTRAINT PK_EigeneSchule_Merkmale PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Schulformen (
  ID bigint DEFAULT -1 NOT NULL, 
  SGL nvarchar(3), 
  SF_SGL nvarchar(5), 
  Schulform nvarchar(100), 
  DoppelQualifikation nvarchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  BKIndex int, 
  Schulform2 nvarchar(100),
  CONSTRAINT PK_EigeneSchule_Schulformen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schulformen_UC1 UNIQUE (SGL)
);


CREATE TABLE EigeneSchule_Teilstandorte (
  AdrMerkmal nvarchar(1) NOT NULL, 
  PLZ nvarchar(10), 
  Ort nvarchar(50), 
  Strassenname nvarchar(55), 
  HausNr nvarchar(10), 
  HausNrZusatz nvarchar(30), 
  Bemerkung nvarchar(50), 
  Kuerzel nvarchar(30),
  CONSTRAINT PK_EigeneSchule_Teilstandorte PRIMARY KEY (AdrMerkmal)
);


CREATE TABLE EigeneSchule_Texte (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(50), 
  Inhalt nvarchar(255), 
  Beschreibung nvarchar(100), 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Texte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Zertifikate (
  ID bigint DEFAULT -1 NOT NULL, 
  Kuerzel nvarchar(20) NOT NULL, 
  Bezeichnung nvarchar(100), 
  Fach nvarchar(100), 
  Formatvorlage nvarchar(255),
  CONSTRAINT PK_EigeneSchule_Zertifikate PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Zertifikate_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Fach_Gliederungen (
  Fach_ID bigint NOT NULL, 
  Gliederung nvarchar(3) NOT NULL, 
  Faechergruppe int, 
  GewichtungAB int, 
  GewichtungBB int, 
  SchriftlichAB nvarchar(1) DEFAULT '-', 
  SchriftlichBB nvarchar(1) DEFAULT '-', 
  GymOSFach nvarchar(1) DEFAULT '-', 
  ZeugnisBez nvarchar(130), 
  Lernfelder nvarchar(max), 
  Fachklasse_ID bigint DEFAULT 0 NOT NULL, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Fach_Gliederungen PRIMARY KEY (Fach_ID, Fachklasse_ID)
);


CREATE TABLE Fachgruppen (
  ID bigint NOT NULL, 
  Fachbereich int, 
  SchildFgID bigint, 
  FG_Bezeichnung nvarchar(80) NOT NULL, 
  FG_Kuerzel nvarchar(10), 
  Schulformen nvarchar(255), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  FachKrz nvarchar(20), 
  Bezeichnung nvarchar(255), 
  ZeugnisBez nvarchar(255), 
  UeZeugnisBez nvarchar(255), 
  Zeugnisdatenquelle_ID bigint, 
  StatistikKrz nvarchar(2), 
  BasisFach nvarchar(1) DEFAULT '-', 
  IstSprache nvarchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  SortierungS2 int DEFAULT 32000, 
  NachprErlaubt nvarchar(1) DEFAULT '+', 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  Gewichtung smallint DEFAULT 1, 
  Unterichtssprache nvarchar(1) DEFAULT 'D', 
  IstSchriftlich nvarchar(1) DEFAULT '-', 
  IstSchriftlichBA nvarchar(1) DEFAULT '-', 
  AufZeugnis nvarchar(1) DEFAULT '+', 
  Lernfelder nvarchar(max), 
  LK_Moegl nvarchar(1) DEFAULT '+', 
  Abi_Moegl nvarchar(1) DEFAULT '+', 
  E1 nvarchar(1) DEFAULT '+', 
  E2 nvarchar(1) DEFAULT '+', 
  Q1 nvarchar(1) DEFAULT '+', 
  Q2 nvarchar(1) DEFAULT '+', 
  Q3 nvarchar(1) DEFAULT '+', 
  Q4 nvarchar(1) DEFAULT '+', 
  AlsNeueFSInSII nvarchar(1) DEFAULT '-', 
  Leitfach_ID bigint, 
  Leitfach2_ID bigint, 
  E1_WZE int, 
  E2_WZE int, 
  Q_WZE int, 
  E1_S nvarchar(1) DEFAULT '-', 
  E2_S nvarchar(1) DEFAULT '-', 
  NurMuendlich nvarchar(1) DEFAULT '-', 
  Aufgabenfeld nvarchar(2), 
  AbgeschlFaecherHolen nvarchar(1) DEFAULT '+', 
  GewichtungFHR int, 
  MaxBemZeichen int,
  CONSTRAINT PK_EigeneSchule_Faecher PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Faecher_Zeugnisdatenquellen_FK FOREIGN KEY (Zeugnisdatenquelle_ID) REFERENCES Fachgruppen(SchildFgID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Faecher_UC1 UNIQUE (FachKrz)
);


CREATE TABLE EigeneSchule_FachTeilleistungen (
  Teilleistung_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart nvarchar(5),
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Fach_ID, Kursart, Teilleistung_ID),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Floskelgruppen (
  Kuerzel nvarchar(10) NOT NULL, 
  Hauptgruppe nvarchar(4), 
  Bezeichnung nvarchar(50) NOT NULL, 
  Farbe int,
  CONSTRAINT PK_Floskelgruppen PRIMARY KEY (Kuerzel)
);


CREATE TABLE Floskeln (
  Kuerzel nvarchar(10) NOT NULL, 
  FloskelText nvarchar(max) NOT NULL, 
  FloskelGruppe nvarchar(10), 
  FloskelFach nvarchar(20), 
  FloskelNiveau nvarchar(2), 
  FloskelJahrgang nvarchar(2),
  CONSTRAINT PK_Floskeln PRIMARY KEY (Kuerzel),
  CONSTRAINT Floskeln_Floskelgruppe_Floskelgruppen_FK FOREIGN KEY (FloskelGruppe) REFERENCES Floskelgruppen(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Gost_Jahrgangsdaten (
  Abi_Jahrgang int NOT NULL, 
  ZusatzkursGEVorhanden int DEFAULT 1, 
  ZusatzkursGEErstesHalbjahr nvarchar(4) DEFAULT 'Q2.1', 
  ZusatzkursSWVorhanden int DEFAULT 1, 
  ZusatzkursSWErstesHalbjahr nvarchar(4) DEFAULT 'Q2.1', 
  TextBeratungsbogen nvarchar(2000), 
  TextMailversand nvarchar(2000),
  CONSTRAINT PK_Gost_Jahrgangsdaten PRIMARY KEY (Abi_Jahrgang)
);


CREATE TABLE Gost_Blockung (
  ID bigint DEFAULT -1 NOT NULL, 
  Name nvarchar(255) DEFAULT 'Neue Blockung' NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL,
  CONSTRAINT PK_Gost_Blockung PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgang_Fachkombinationen (
  Abi_Jahrgang int NOT NULL, 
  ID nvarchar(30) NOT NULL, 
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 nvarchar(5), 
  Kursart2 nvarchar(5), 
  Phase nvarchar(10) DEFAULT '-' NOT NULL, 
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
  SchiftlichkeitEF1 nvarchar(1), 
  SchiftlichkeitEF2 nvarchar(1), 
  NurMuendlich int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Faecher PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Faecher_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Faecher_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Kurse (
  ID bigint DEFAULT -1 NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart nvarchar(5) DEFAULT 'GK' NOT NULL, 
  Kursnummer int NOT NULL, 
  IstKoopKurs int DEFAULT 0 NOT NULL, 
  BezeichnungSuffix nvarchar(255), 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Kurse PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Kurse_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Regeln (
  ID bigint DEFAULT -1 NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Typ int NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Regeln PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Regeln_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Schienen (
  ID bigint DEFAULT -1 NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Nummer int NOT NULL, 
  Bezeichnung nvarchar(255) DEFAULT 'Schiene' NOT NULL, 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Schienen PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Schienen_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Zwischenergebnisse (
  ID bigint DEFAULT -1 NOT NULL, 
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
  Title nvarchar(50), 
  DelimiterChar nvarchar(1), 
  TextQuote nvarchar(1), 
  SkipLines smallint DEFAULT 0, 
  DateFormat nvarchar(10), 
  BooleanTrue nvarchar(10), 
  AbkWeiblich nvarchar(10), 
  AbkMaennlich nvarchar(10), 
  MainTable nvarchar(50), 
  InsertMode int, 
  LookupTableDir nvarchar(250), 
  SchuelerIDMode nvarchar(4),
  CONSTRAINT PK_ImpExp_EigeneImporte PRIMARY KEY (ID)
);


CREATE TABLE ImpExp_EigeneImporte_Felder (
  Import_ID int DEFAULT 0 NOT NULL, 
  Field_ID int DEFAULT 0, 
  TableDescription nvarchar(50), 
  FieldDescription nvarchar(50), 
  SrcPosition smallint DEFAULT 0, 
  DstTable nvarchar(50), 
  DstFieldName nvarchar(50), 
  DstFieldType nvarchar(1), 
  DstFieldIsIdentifier int, 
  DstLookupDir nvarchar(250), 
  DstLookupTable nvarchar(50), 
  DstLookupFieldName nvarchar(50), 
  DstLookupTableIDFieldName nvarchar(50), 
  DstResultFieldName nvarchar(50), 
  DstKeyLookupInsert int, 
  DstKeyLookupNameCreateID int, 
  DstForceNumeric int,
  CONSTRAINT PK_ImpExp_EigeneImporte_Felder PRIMARY KEY (Import_ID, Field_ID)
);


CREATE TABLE ImpExp_EigeneImporte_Tabellen (
  Import_ID int DEFAULT 0 NOT NULL, 
  TableName nvarchar(50), 
  DstCreateID int, 
  DstIDFieldName nvarchar(50), 
  Sequence int DEFAULT 0, 
  LookupTable nvarchar(50), 
  LookupFields nvarchar(50), 
  LookupFieldTypes nvarchar(50), 
  LookupFieldPos nvarchar(50), 
  LookupKeyField nvarchar(50), 
  LookupResultField nvarchar(50), 
  LookupResultFieldType nvarchar(10), 
  DstDefaultFieldName nvarchar(50), 
  DstDefaultFieldValue nvarchar(10), 
  GU_ID_Field nvarchar(50),
  CONSTRAINT PK_ImpExp_EigeneImporte_Tabellen PRIMARY KEY (Import_ID, TableName)
);


CREATE TABLE K_Adressart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Adressart PRIMARY KEY (ID),
  CONSTRAINT K_Adressart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ankreuzdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  TextStufe1 nvarchar(100), 
  TextStufe2 nvarchar(100), 
  TextStufe3 nvarchar(100), 
  TextStufe4 nvarchar(100), 
  TextStufe5 nvarchar(100), 
  BezeichnungSONST nvarchar(100),
  CONSTRAINT PK_K_Ankreuzdaten PRIMARY KEY (ID)
);


CREATE TABLE K_Ankreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL, 
  Fach_ID bigint, 
  IstASV int DEFAULT 0 NOT NULL, 
  Jahrgang nvarchar(2) NOT NULL, 
  Gliederung nvarchar(3), 
  FloskelText nvarchar(255) NOT NULL, 
  Sortierung int, 
  FachSortierung int, 
  Abschnitt int, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aktiv nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Ankreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT K_Ankreuzfloskeln_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE K_BeschaeftigungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(250), 
  Sichtbar nvarchar(1) DEFAULT '+' NOT NULL, 
  Schluessel nvarchar(20), 
  Sortierung int DEFAULT 32000 NOT NULL, 
  Beschreibung nvarchar(max), 
  PersonArt nvarchar(1),
  CONSTRAINT PK_K_Datenschutz PRIMARY KEY (ID)
);


CREATE TABLE K_EinschulungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(40) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_EinschulungsArt PRIMARY KEY (ID),
  CONSTRAINT K_EinschulungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Einzelleistungen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Gewichtung float,
  CONSTRAINT PK_K_Einzelleistungen PRIMARY KEY (ID)
);


CREATE TABLE K_EntlassGrund (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_EntlassGrund PRIMARY KEY (ID),
  CONSTRAINT K_EntlassGrund_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  ExportBez nvarchar(20),
  CONSTRAINT PK_K_ErzieherArt PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_ErzieherFunktion PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherFunktion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_FahrschuelerArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_FahrschuelerArt PRIMARY KEY (ID),
  CONSTRAINT K_FahrschuelerArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Foerderschwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  StatistikKrz nvarchar(2), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Foerderschwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Foerderschwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Haltestelle (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  EntfernungSchule float,
  CONSTRAINT PK_K_Haltestelle PRIMARY KEY (ID),
  CONSTRAINT K_Haltestelle_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Kindergarten (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(100), 
  PLZ nvarchar(10), 
  Ort nvarchar(30), 
  Strassenname nvarchar(55), 
  HausNr nvarchar(10), 
  HausNrZusatz nvarchar(30), 
  Tel nvarchar(20), 
  Email nvarchar(40), 
  Bemerkung nvarchar(50), 
  Sichtbar nvarchar(1) DEFAULT '-', 
  Sortierung int,
  CONSTRAINT PK_K_Kindergarten PRIMARY KEY (ID)
);


CREATE TABLE K_Ort (
  ID bigint DEFAULT -1 NOT NULL, 
  PLZ nvarchar(10) NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Kreis nvarchar(3), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  Land nvarchar(2),
  CONSTRAINT PK_K_Ort PRIMARY KEY (ID),
  CONSTRAINT K_Ort_UC1 UNIQUE (PLZ, Bezeichnung)
);

CREATE INDEX K_Ort_IDX1 ON K_Ort(PLZ);


CREATE TABLE K_AllgAdresse (
  ID bigint DEFAULT -1 NOT NULL, 
  AdressArt_ID bigint, 
  AllgAdrName1 nvarchar(50), 
  AllgAdrName2 nvarchar(50), 
  AllgAdrStrassenname nvarchar(55), 
  AllgAdrHausNr nvarchar(10), 
  AllgAdrHausNrZusatz nvarchar(30), 
  AllgAdrOrt_ID bigint, 
  AllgAdrTelefon1 nvarchar(20), 
  AllgAdrTelefon2 nvarchar(20), 
  AllgAdrFax nvarchar(20), 
  AllgAdrEmail nvarchar(100), 
  AllgAdrBemerkungen nvarchar(255), 
  Sortierung int DEFAULT 32000, 
  AllgAdrAusbildungsBetrieb nvarchar(1) DEFAULT '-', 
  AllgAdrBietetPraktika nvarchar(1) DEFAULT '-', 
  AllgAdrBranche nvarchar(50), 
  AllgAdrZusatz1 nvarchar(10), 
  AllgAdrZusatz2 nvarchar(10), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  Massnahmentraeger nvarchar(1) DEFAULT '-', 
  BelehrungISG nvarchar(1) DEFAULT '-', 
  GU_ID nvarchar(40), 
  ErwFuehrungszeugnis nvarchar(1) DEFAULT '-', 
  ExtID nvarchar(50),
  CONSTRAINT PK_K_AllgAdresse PRIMARY KEY (ID),
  CONSTRAINT K_AllgAdresse_K_Adressart_FK FOREIGN KEY (AdressArt_ID) REFERENCES K_Adressart(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE AllgAdrAnsprechpartner (
  ID bigint DEFAULT -1 NOT NULL, 
  Adresse_ID bigint NOT NULL, 
  Name nvarchar(120), 
  Vorname nvarchar(80), 
  Anrede nvarchar(10), 
  Telefon nvarchar(20), 
  Email nvarchar(100), 
  Abteilung nvarchar(50), 
  Titel nvarchar(15), 
  GU_ID nvarchar(40),
  CONSTRAINT PK_AllgAdrAnsprechpartner PRIMARY KEY (ID),
  CONSTRAINT AllgAdrAnsprechpartner_Adr_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE K_Ortsteil (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Ort_ID bigint, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  OrtsteilSchluessel nvarchar(30),
  CONSTRAINT PK_K_Ortsteil PRIMARY KEY (ID),
  CONSTRAINT K_Ortsteil_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT K_Ortsteil_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Religion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  StatistikKrz nvarchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  ExportBez nvarchar(20), 
  ZeugnisBezeichnung nvarchar(50),
  CONSTRAINT PK_K_Religion PRIMARY KEY (ID),
  CONSTRAINT K_Religion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Schule (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNr nvarchar(6) NOT NULL, 
  Name nvarchar(120), 
  SchulformNr nvarchar(3), 
  SchulformKrz nvarchar(3), 
  SchulformBez nvarchar(50), 
  Strassenname nvarchar(55), 
  HausNr nvarchar(10), 
  HausNrZusatz nvarchar(30), 
  PLZ nvarchar(10), 
  Ort nvarchar(50), 
  Telefon nvarchar(20), 
  Fax nvarchar(20), 
  Email nvarchar(40), 
  Schulleiter nvarchar(40), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNr_SIM nvarchar(6), 
  Kuerzel nvarchar(10), 
  KurzBez nvarchar(40),
  CONSTRAINT PK_K_Schule PRIMARY KEY (ID),
  CONSTRAINT K_Schule_UC1 UNIQUE (SchulNr)
);


CREATE TABLE K_Schulfunktionen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50), 
  Sortierung int, 
  Sichtbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Schulfunktionen PRIMARY KEY (ID)
);


CREATE TABLE K_Schwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Schwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Schwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Sportbefreiung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Sportbefreiung PRIMARY KEY (ID),
  CONSTRAINT K_Sportbefreiung_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_TelefonArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_TelefonArt PRIMARY KEY (ID),
  CONSTRAINT K_TelefonArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Textdateien (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(32), 
  Text_ID bigint NOT NULL, 
  Text_Body nvarchar(max), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung smallint,
  CONSTRAINT PK_K_Textdateien PRIMARY KEY (ID)
);


CREATE TABLE K_Vermerkart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Vermerkart PRIMARY KEY (ID),
  CONSTRAINT K_Vermerkart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Zertifikate (
  Kuerzel nvarchar(5) NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL,
  CONSTRAINT PK_K_Zertifikate PRIMARY KEY (Kuerzel)
);


CREATE TABLE Katalog_Aufsichtsbereich (
  ID bigint DEFAULT -1 NOT NULL, 
  Kuerzel nvarchar(20) NOT NULL, 
  Beschreibung nvarchar(1000) NOT NULL,
  CONSTRAINT PK_Katalog_Aufsichtsbereich PRIMARY KEY (ID),
  CONSTRAINT Katalog_Aufsichtsbereich_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Katalog_Pausenzeiten (
  ID bigint DEFAULT -1 NOT NULL, 
  Tag int NOT NULL, 
  Beginn time DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Ende time DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_Katalog_Pausenzeiten PRIMARY KEY (ID),
  CONSTRAINT Katalog_Pausenzeiten_UC1 UNIQUE (Tag, Beginn, Ende)
);


CREATE TABLE Katalog_Raeume (
  ID bigint DEFAULT -1 NOT NULL, 
  Kuerzel nvarchar(20) NOT NULL, 
  Beschreibung nvarchar(1000) NOT NULL, 
  Groesse int DEFAULT 40 NOT NULL,
  CONSTRAINT PK_Katalog_Raeume PRIMARY KEY (ID),
  CONSTRAINT Katalog_Raeume_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Katalog_Zeitraster (
  ID bigint DEFAULT -1 NOT NULL, 
  Tag int NOT NULL, 
  Stunde int NOT NULL, 
  Beginn time DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Ende time DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_Katalog_Zeitraster PRIMARY KEY (ID),
  CONSTRAINT Katalog_Zeitraster_UC1 UNIQUE (Tag, Stunde)
);


CREATE TABLE Kompetenzgruppen (
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL, 
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung nvarchar(50) NOT NULL,
  CONSTRAINT PK_Kompetenzgruppen PRIMARY KEY (KG_ID)
);


CREATE TABLE Kompetenzen (
  KO_ID bigint NOT NULL, 
  KO_Gruppe bigint NOT NULL, 
  KO_Bezeichnung nvarchar(64) NOT NULL,
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
  Kuerzel nvarchar(20) DEFAULT 'N' NOT NULL, 
  Bezeichnung nvarchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_KursFortschreibungsarten PRIMARY KEY (ID),
  CONSTRAINT KursFortschreibungsarten_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Lernplattformen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  BenutzernameSuffixLehrer nvarchar(255), 
  BenutzernameSuffixErzieher nvarchar(255), 
  BenutzernameSuffixSchueler nvarchar(255), 
  Konfiguration nvarchar(max),
  CONSTRAINT PK_Lernplattformen PRIMARY KEY (ID)
);


CREATE TABLE CredentialsLernplattformen (
  ID bigint DEFAULT -1 NOT NULL, 
  LernplattformID bigint NOT NULL, 
  Benutzername nvarchar(255) NOT NULL, 
  BenutzernamePseudonym nvarchar(255), 
  Initialkennwort nvarchar(255), 
  PashwordHash nvarchar(255), 
  RSAPublicKey nvarchar(max), 
  RSAPrivateKey nvarchar(max), 
  AES nvarchar(max),
  CONSTRAINT PK_CredentialsLernplattformen PRIMARY KEY (ID),
  CONSTRAINT CredentialsLernplattformen_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT CredentialsLernplattformen_UC1 UNIQUE (LernplattformID, Benutzername)
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 nvarchar(5), 
  Kursart2 nvarchar(5), 
  PK nvarchar(30) NOT NULL, 
  Sortierung int, 
  Phase nvarchar(10), 
  Typ nvarchar(1),
  CONSTRAINT PK_NichtMoeglAbiFachKombi PRIMARY KEY (PK),
  CONSTRAINT NichtMoeglAbiFachKombi_Fach1_FK FOREIGN KEY (Fach1_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT NichtMoeglAbiFachKombi_Fach2_FK FOREIGN KEY (Fach2_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Noten (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(2) NOT NULL, 
  IstTendenznote int DEFAULT 0 NOT NULL, 
  Text nvarchar(255), 
  AufZeugnis int DEFAULT 0 NOT NULL, 
  Notenpunkte int, 
  TextLaufbahnSII nvarchar(2), 
  AufLaufbahnSII int DEFAULT 0 NOT NULL, 
  Sortierung int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Noten PRIMARY KEY (ID),
  CONSTRAINT Noten_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE PersonalTypen (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(20), 
  Bezeichnung nvarchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_PersonalTypen PRIMARY KEY (ID),
  CONSTRAINT PersonalTypen_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Personengruppen (
  ID bigint DEFAULT -1 NOT NULL, 
  Gruppenname nvarchar(100) NOT NULL, 
  Zusatzinfo nvarchar(100), 
  SammelEmail nvarchar(100), 
  GruppenArt nvarchar(20), 
  XMLExport nvarchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_Personengruppen PRIMARY KEY (ID)
);


CREATE TABLE Personengruppen_Personen (
  ID bigint DEFAULT -1 NOT NULL, 
  Gruppe_ID bigint NOT NULL, 
  Person_ID bigint, 
  PersonNr int, 
  PersonArt nvarchar(1), 
  PersonName nvarchar(120) NOT NULL, 
  PersonVorname nvarchar(80), 
  PersonPLZ nvarchar(10), 
  PersonOrt nvarchar(50), 
  PersonStrassenname nvarchar(55), 
  PersonHausNr nvarchar(10), 
  PersonHausNrZusatz nvarchar(30), 
  PersonTelefon nvarchar(20), 
  PersonMobil nvarchar(20), 
  PersonEmail nvarchar(100), 
  Bemerkung nvarchar(100), 
  Zusatzinfo nvarchar(100), 
  Sortierung int, 
  PersonAnrede nvarchar(10), 
  PersonAkadGrad nvarchar(15),
  CONSTRAINT PK_Personengruppen_Personen PRIMARY KEY (ID),
  CONSTRAINT Personengruppen_Personen_Gruppe FOREIGN KEY (Gruppe_ID) REFERENCES Personengruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SVWS_Client_Konfiguration_Global (
  AppName nvarchar(100) NOT NULL, 
  Schluessel nvarchar(255) NOT NULL, 
  Wert nvarchar(max) NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Global PRIMARY KEY (AppName, Schluessel)
);


CREATE TABLE SVWS_Core_Type_Versionen (
  NameTabelle nvarchar(200) NOT NULL, 
  Name nvarchar(200) NOT NULL, 
  Version bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_Core_Type_Versionen PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_AutoInkremente (
  NameTabelle nvarchar(200) NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_DB_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_Version (
  Revision int DEFAULT 0 NOT NULL, 
  IsTainted int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SVWS_DB_Version PRIMARY KEY (Revision)
);


CREATE TABLE SchildFilter (
  ID bigint DEFAULT -1 NOT NULL, 
  Art nvarchar(1), 
  Name nvarchar(50) NOT NULL, 
  Beschreibung nvarchar(255), 
  Tabellen nvarchar(255), 
  ZusatzTabellen nvarchar(255), 
  Bedingung nvarchar(max), 
  BedingungKlartext nvarchar(max),
  CONSTRAINT PK_SchildFilter PRIMARY KEY (ID),
  CONSTRAINT SchildFilter_UC1 UNIQUE (Name)
);


CREATE TABLE Schildintern_AbiturInfos (
  PrfOrdnung nvarchar(20) NOT NULL, 
  AbiFach nvarchar(1) NOT NULL, 
  Bedingung nvarchar(3), 
  AbiInfoKrz nvarchar(20), 
  AbiInfoBeschreibung nvarchar(255), 
  AbiInfoText nvarchar(max), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_AbiturInfos PRIMARY KEY (AbiFach, AbiInfoKrz, Bedingung, PrfOrdnung)
);


CREATE TABLE Schildintern_Berufsebene (
  Berufsebene int NOT NULL, 
  Kuerzel nvarchar(2) NOT NULL, 
  Klartext nvarchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Berufsebene PRIMARY KEY (Berufsebene, Kuerzel)
);


CREATE TABLE Schildintern_DQR_Niveaus (
  Gliederung nvarchar(4) NOT NULL, 
  FKS nvarchar(8) NOT NULL, 
  DQR_Niveau int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_DQR_Niveaus PRIMARY KEY (Gliederung, FKS, DQR_Niveau)
);


CREATE TABLE Schildintern_Datenart (
  DatenartKrz nvarchar(10) NOT NULL, 
  Datenart nvarchar(50), 
  Tabellenname nvarchar(30), 
  Reihenfolge int, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Datenart PRIMARY KEY (DatenartKrz)
);


CREATE TABLE Schildintern_FaecherSortierung (
  Fach nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(80), 
  Sortierung1 int, 
  Sortierung2 int, 
  Fachgruppe_ID bigint, 
  FachgruppeKrz nvarchar(2), 
  AufgabenbereichAbitur nvarchar(5),
  CONSTRAINT PK_Schildintern_FaecherSortierung PRIMARY KEY (Fach)
);


CREATE TABLE Schildintern_FilterFehlendeEintraege (
  ID bigint NOT NULL, 
  Beschreibung nvarchar(100), 
  Feldname nvarchar(30), 
  Tabellen nvarchar(50), 
  SQLText nvarchar(100), 
  Schulform nvarchar(50), 
  Feldtyp nvarchar(1),
  CONSTRAINT PK_Schildintern_FilterFehlendeEintraege PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_FilterFehlendeEintraegeSchild3 (
  ID bigint NOT NULL, 
  Beschreibung nvarchar(100), 
  Feldname nvarchar(30), 
  Tabellen nvarchar(50), 
  SQLText nvarchar(100), 
  Schulform nvarchar(50), 
  Feldtyp nvarchar(1),
  CONSTRAINT PK_Schildintern_FilterFehlendeEintraegeSchild3 PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_FilterFeldListe (
  ID bigint NOT NULL, 
  Bezeichnung nvarchar(50), 
  DBFeld nvarchar(50), 
  Typ nvarchar(50), 
  Werte nvarchar(20), 
  StdWert nvarchar(5), 
  Operator nvarchar(10), 
  Zusatzbedingung nvarchar(50),
  CONSTRAINT PK_Schildintern_FilterFeldListe PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_HSchStatus (
  StatusNr int NOT NULL, 
  Bezeichnung nvarchar(255), 
  Sortierung int, 
  InSimExp nvarchar(1) DEFAULT '+', 
  SIMAbschnitt nvarchar(1),
  CONSTRAINT PK_Schildintern_HSchStatus PRIMARY KEY (StatusNr)
);


CREATE TABLE Schildintern_KAoA_Anschlussoption (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  AO_Kuerzel nvarchar(10) NOT NULL, 
  AO_Beschreibung nvarchar(255), 
  AO_Stufen nvarchar(10), 
  Zusatzmerkmal_Anzeige nvarchar(50),
  CONSTRAINT PK_Schildintern_KAoA_Anschlussoption PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Anschlussoption_IDX1 ON Schildintern_KAoA_Anschlussoption(AO_Kuerzel);


CREATE TABLE Schildintern_KAoA_Berufsfeld (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  BF_Kuerzel nvarchar(10) NOT NULL, 
  BF_Beschreibung nvarchar(255),
  CONSTRAINT PK_Schildintern_KAoA_Berufsfeld PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Berufsfeld_IDX1 ON Schildintern_KAoA_Berufsfeld(BF_Kuerzel);


CREATE TABLE Schildintern_KAoA_Kategorie (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  K_Kuerzel nvarchar(10) NOT NULL, 
  K_Beschreibung nvarchar(255), 
  K_Jahrgaenge nvarchar(25),
  CONSTRAINT PK_Schildintern_KAoA_Kategorie PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Kategorie_IDX1 ON Schildintern_KAoA_Kategorie(K_Kuerzel);


CREATE TABLE Schildintern_KAoA_Merkmal (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  M_Kuerzel nvarchar(20) NOT NULL, 
  Kategorie_ID bigint NOT NULL, 
  M_Beschreibung nvarchar(255), 
  M_Option nvarchar(25), 
  M_Kategorie nvarchar(10), 
  BK_Anlagen nvarchar(255),
  CONSTRAINT PK_Schildintern_KAoA_Merkmal PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_Merkmal_Kategorie_FK FOREIGN KEY (Kategorie_ID) REFERENCES Schildintern_KAoA_Kategorie(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schildintern_KAoA_Merkmal_IDX1 ON Schildintern_KAoA_Merkmal(M_Kuerzel);


CREATE TABLE Schildintern_KAoA_Zusatzmerkmal (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  ZM_Kuerzel nvarchar(20) NOT NULL, 
  Merkmal_ID bigint NOT NULL, 
  ZM_Beschreibung nvarchar(255), 
  ZM_Option nvarchar(25), 
  ZM_Merkmal nvarchar(20),
  CONSTRAINT PK_Schildintern_KAoA_Zusatzmerkmal PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_Zusatzmerkmal_Merkmal_FK FOREIGN KEY (Merkmal_ID) REFERENCES Schildintern_KAoA_Merkmal(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schildintern_KAoA_Zusatzmerkmal_IDX1 ON Schildintern_KAoA_Zusatzmerkmal(ZM_Kuerzel);


CREATE TABLE Schildintern_KAoA_SBO_Ebene4 (
  ID bigint NOT NULL, 
  gueltigVon int, 
  gueltigBis int, 
  Kuerzel_EB4 nvarchar(20) NOT NULL, 
  Beschreibung_EB4 nvarchar(255), 
  Zusatzmerkmal nvarchar(20), 
  Zusatzmerkmal_ID bigint,
  CONSTRAINT PK_Schildintern_KAoA_SBO_Ebene4 PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_SBO_Ebene4_Zusatzmerkmall_FK FOREIGN KEY (Zusatzmerkmal_ID) REFERENCES Schildintern_KAoA_Zusatzmerkmal(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schildintern_KAoA_SBO_Ebene4_IDX1 ON Schildintern_KAoA_SBO_Ebene4(Kuerzel_EB4);


CREATE TABLE Schildintern_Laender (
  Kurztext nvarchar(2) NOT NULL, 
  Langtext nvarchar(40), 
  Sortierung int, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Laender PRIMARY KEY (Kurztext)
);


CREATE TABLE Schildintern_PrfSemAbschl (
  Nr nvarchar(2) NOT NULL, 
  Klartext nvarchar(50), 
  StatistikKrz nvarchar(1), 
  Sortierung int, 
  Schulform nvarchar(2) NOT NULL, 
  StatistikKrzNeu nvarchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_PrfSemAbschl PRIMARY KEY (Nr, Schulform)
);


CREATE TABLE Schildintern_PruefOrd_Optionen (
  OP_Schulformen nvarchar(20) NOT NULL, 
  OP_POKrz nvarchar(30) NOT NULL, 
  OP_Krz nvarchar(40) NOT NULL, 
  OP_Abgangsart_B nvarchar(2), 
  OP_Abgangsart_NB nvarchar(2), 
  OP_Art nvarchar(1) NOT NULL, 
  OP_Typ nvarchar(5), 
  OP_Bildungsgang nvarchar(1) NOT NULL, 
  OP_Name nvarchar(255) NOT NULL, 
  OP_Kommentar nvarchar(100), 
  OP_Jahrgaenge nvarchar(20) NOT NULL, 
  OP_BKIndex nvarchar(50), 
  OP_BKAnl_Typ nvarchar(50), 
  OP_Reihenfolge int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_PruefOrd_Optionen PRIMARY KEY (OP_Art, OP_Bildungsgang, OP_Jahrgaenge, OP_Krz, OP_Name, OP_POKrz, OP_Reihenfolge, OP_Schulformen)
);


CREATE TABLE Schildintern_PruefungsOrdnung (
  PO_Schulform nvarchar(50) NOT NULL, 
  PO_Krz nvarchar(30) NOT NULL, 
  PO_Name nvarchar(255) NOT NULL, 
  PO_SGL nvarchar(50) NOT NULL, 
  PO_MinJahrgang int DEFAULT 0 NOT NULL, 
  PO_MaxJahrgang int DEFAULT 20 NOT NULL, 
  PO_Jahrgaenge nvarchar(30) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_PruefungsOrdnung PRIMARY KEY (PO_Krz, PO_Schulform, PO_SGL)
);


CREATE TABLE Schildintern_SchuelerImpExp (
  Tabelle nvarchar(50) NOT NULL, 
  TabellenAnzeige nvarchar(50), 
  MasterTable nvarchar(50), 
  ExpCmd nvarchar(250), 
  SrcGetFieldsSQL nvarchar(250), 
  DeleteSQL nvarchar(250), 
  DstGetIDSQL nvarchar(250), 
  HauptFeld nvarchar(50), 
  DetailFeld nvarchar(50), 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_SchuelerImpExp PRIMARY KEY (Tabelle)
);


CREATE TABLE Schildintern_SpezialFilterFelder (
  ID bigint NOT NULL, 
  Gruppe nvarchar(2), 
  KurzBez nvarchar(50), 
  Bezeichnung nvarchar(50), 
  Grundschule nvarchar(1), 
  Tabelle nvarchar(30), 
  DBFeld nvarchar(50), 
  Typ nvarchar(1), 
  Control nvarchar(10), 
  WerteAnzeige nvarchar(20), 
  WerteSQL nvarchar(20), 
  LookupInfo nvarchar(50), 
  OperatorenAnzeige nvarchar(150), 
  OperatorenSQL nvarchar(100), 
  Zusatzbedingung nvarchar(100), 
  ZusatzTabellen nvarchar(50),
  CONSTRAINT PK_Schildintern_SpezialFilterFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_TextExport (
  DatenartKrz nvarchar(10) NOT NULL, 
  Feldname nvarchar(30) NOT NULL, 
  AnzeigeText nvarchar(50) NOT NULL, 
  Feldtyp nvarchar(1), 
  Feldwerte nvarchar(20), 
  ErgebnisWerte nvarchar(100), 
  LookupFeldname nvarchar(100), 
  LookupSQLText nvarchar(max), 
  DBFormat nvarchar(10) DEFAULT 'ALLE' NOT NULL,
  CONSTRAINT PK_Schildintern_TextExport PRIMARY KEY (AnzeigeText, DatenartKrz, DBFormat, Feldname)
);


CREATE TABLE Schildintern_UnicodeUmwandlung (
  ID bigint NOT NULL, 
  Unicodezeichen nvarchar(2), 
  Ersatzzeichen nvarchar(2), 
  DecimalZeichen nvarchar(20), 
  DecimalErsatzzeichen nvarchar(20), 
  Hexzeichen nvarchar(50), 
  HexErsatzzeichen nvarchar(50),
  CONSTRAINT PK_Schildintern_UnicodeUmwandlung PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_VerfImportFelder (
  ID bigint NOT NULL, 
  TableDescription nvarchar(50), 
  FieldDescription nvarchar(50), 
  DstTable nvarchar(50), 
  DstFieldName nvarchar(50), 
  DstFieldType nvarchar(1), 
  DstRequiredState nvarchar(1), 
  DstLookupTable nvarchar(50), 
  DstLookupTableIDFieldName nvarchar(50), 
  DstLookupFieldName nvarchar(50), 
  DstResultFieldName nvarchar(50), 
  DstKeyLookupInsert nvarchar(1), 
  DstKeyLookupNameCreateID nvarchar(1), 
  DstForceNumeric nvarchar(1),
  CONSTRAINT PK_Schildintern_VerfImportFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_VerfImportTabellen (
  TableName nvarchar(50) NOT NULL, 
  DstRequiredFields nvarchar(50), 
  DstIDFieldName nvarchar(50), 
  Sequence int, 
  LookupTable nvarchar(50), 
  LookupFields nvarchar(50), 
  LookupFieldTypes nvarchar(50), 
  LookupResultField nvarchar(50), 
  LookupResultFieldType nvarchar(10), 
  LookupKeyField nvarchar(50), 
  DstDefaultFieldName nvarchar(50), 
  DstDefaultFieldValue nvarchar(20), 
  DstCreateID nvarchar(1), 
  GU_ID_Field nvarchar(50),
  CONSTRAINT PK_Schildintern_VerfImportTabellen PRIMARY KEY (TableName)
);


CREATE TABLE Schildintern_Zusatzinfos (
  SGL_BKAbschl nvarchar(50) NOT NULL, 
  JG_BKAbschl nvarchar(50) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schildintern_Zusatzinfos PRIMARY KEY (JG_BKAbschl, SGL_BKAbschl)
);


CREATE TABLE SchuelerListe (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Erzeuger nvarchar(20), 
  Privat nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerStatus (
  ID int NOT NULL, 
  Bezeichnung nvarchar(255), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_SchuelerStatus PRIMARY KEY (ID),
  CONSTRAINT SchuelerStatus_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuleCredentials (
  Schulnummer int NOT NULL, 
  RSAPublicKey nvarchar(max), 
  RSAPrivateKey nvarchar(max), 
  AES nvarchar(max),
  CONSTRAINT PK_SchuleCredentials PRIMARY KEY (Schulnummer)
);


CREATE TABLE Schuljahresabschnitte (
  ID bigint DEFAULT -1 NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  VorigerAbschnitt_ID bigint, 
  FolgeAbschnitt_ID bigint,
  CONSTRAINT PK_Schuljahresabschnitte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule (
  ID bigint NOT NULL, 
  SchulformNr nvarchar(3), 
  SchulformKrz nvarchar(3), 
  SchulformBez nvarchar(50), 
  SchultraegerArt nvarchar(2), 
  SchultraegerNr nvarchar(6), 
  SchulNr nvarchar(6), 
  Bezeichnung1 nvarchar(50), 
  Bezeichnung2 nvarchar(50), 
  Bezeichnung3 nvarchar(50), 
  Strassenname nvarchar(55), 
  HausNr nvarchar(10), 
  HausNrZusatz nvarchar(30), 
  PLZ nvarchar(10), 
  Ort nvarchar(50), 
  Telefon nvarchar(20), 
  Fax nvarchar(20), 
  Email nvarchar(100), 
  Ganztags nvarchar(1) DEFAULT '+', 
  Schuljahresabschnitts_ID bigint, 
  AnzahlAbschnitte int DEFAULT 2, 
  Fremdsprachen nvarchar(1) DEFAULT '+', 
  JVAZeigen nvarchar(1) DEFAULT '-', 
  RefPaedagogikZeigen nvarchar(1) DEFAULT '-', 
  AnzJGS_Jahr smallint DEFAULT 1, 
  AbschnittBez nvarchar(20) DEFAULT 'Halbjahr', 
  BezAbschnitt1 nvarchar(10) DEFAULT '1. Hj', 
  BezAbschnitt2 nvarchar(10) DEFAULT '2. Hj', 
  IstHauptsitz nvarchar(1) DEFAULT '+', 
  NotenGesperrt nvarchar(1) DEFAULT '-', 
  BezAbschnitt3 nvarchar(10), 
  BezAbschnitt4 nvarchar(10), 
  ZurueckgestelltAnzahl int, 
  ZurueckgestelltWeibl int, 
  ZurueckgestelltAuslaender int, 
  ZurueckgestelltAuslaenderWeibl int, 
  ZurueckgestelltAussiedler int, 
  ZurueckgestelltAussiedlerWeibl int, 
  TeamTeaching nvarchar(1) DEFAULT '+', 
  AbiGruppenprozess nvarchar(1) DEFAULT '+', 
  DauerUnterrichtseinheit int, 
  Gruppen8Bis1 int, 
  Gruppen13Plus int, 
  InternatsplaetzeM int, 
  InternatsplaetzeW int, 
  InternatsplaetzeNeutral int, 
  SchulLogoBase64 nvarchar(max), 
  Einstellungen nvarchar(max), 
  WebAdresse nvarchar(100), 
  Land nvarchar(50),
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchulleitungFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Funktionstext nvarchar(255) NOT NULL, 
  AbSchuljahr int, 
  BisSchuljahr int,
  CONSTRAINT PK_SchulleitungFunktion PRIMARY KEY (ID)
);


CREATE TABLE Schulver_DBS (
  SchulNr nvarchar(6) NOT NULL, 
  RegSchl nvarchar(6), 
  KoRe float, 
  KoHo float, 
  ABez1 nvarchar(40), 
  ABez2 nvarchar(40), 
  ABez3 nvarchar(40), 
  PLZ nvarchar(6), 
  Ort nvarchar(34), 
  Strasse nvarchar(40), 
  TelVorw nvarchar(6), 
  Telefon nvarchar(12), 
  FaxVorw nvarchar(6), 
  Fax nvarchar(15), 
  ModemVorw nvarchar(6), 
  Modem nvarchar(15), 
  SF nvarchar(2), 
  OeffPri nvarchar(1), 
  KurzBez nvarchar(40), 
  SchBetrSchl int, 
  SchBetrSchlDatum nvarchar(8), 
  ArtDerTraegerschaft nvarchar(2), 
  SchultraegerNr nvarchar(6), 
  Schulgliederung nvarchar(3), 
  Schulart nvarchar(3), 
  Ganztagsbetrieb nvarchar(1), 
  FSP nvarchar(2), 
  Verbund nvarchar(1), 
  Bus nvarchar(1), 
  Fachberater int, 
  FachberHauptamtl int, 
  TelNrDBSalt nvarchar(15), 
  RP nvarchar(1), 
  Email nvarchar(100), 
  URL nvarchar(1000), 
  Bemerkung nvarchar(max), 
  CD int, 
  Stift int, 
  OGTS nvarchar(1), 
  SELB nvarchar(1), 
  Internat nvarchar(1), 
  InternatPlaetze int DEFAULT 0, 
  SMail nvarchar(50), 
  SportImAbi nvarchar(1) DEFAULT '0' NOT NULL, 
  Tal nvarchar(1) DEFAULT '0' NOT NULL, 
  KonKop nvarchar(1) DEFAULT '0' NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_DBS PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_Schulformen (
  Schulform nvarchar(2) NOT NULL, 
  SF nvarchar(2), 
  Bezeichnung nvarchar(60), 
  Flag nvarchar(1) DEFAULT '1', 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_Schulformen PRIMARY KEY (Schulform)
);


CREATE TABLE Schulver_Schultraeger (
  SchulNr nvarchar(255) NOT NULL, 
  RegSchl nvarchar(255), 
  KoRe nvarchar(255), 
  KoHo nvarchar(255), 
  ABez1 nvarchar(255), 
  ABez2 nvarchar(255), 
  ABez3 nvarchar(255), 
  PLZ nvarchar(255), 
  Ort nvarchar(255), 
  Strasse nvarchar(255), 
  TelVorw nvarchar(255), 
  Telefon nvarchar(255), 
  SF nvarchar(255), 
  OeffPri nvarchar(255), 
  KurzBez nvarchar(255), 
  SchBetrSchl int, 
  SchBetrSchlDatum nvarchar(255), 
  SchuelerZahlASD int DEFAULT 0, 
  SchuelerZahlVS int DEFAULT 0, 
  ArtDerTraegerschaft nvarchar(255), 
  SchultraegerNr nvarchar(255), 
  Schulgliederung nvarchar(255), 
  Ganztagsbetrieb nvarchar(255), 
  Aktiv int DEFAULT 1 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_Schultraeger PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_WeitereSF (
  SNR nvarchar(6) NOT NULL, 
  SGL nvarchar(3) DEFAULT '   ' NOT NULL, 
  FSP nvarchar(2) DEFAULT '  ' NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulver_WeitereSF PRIMARY KEY (SNR, SGL, FSP)
);


CREATE TABLE Statkue_Abgangsart (
  SF nvarchar(2) NOT NULL, 
  Art nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(200), 
  KZ_Bereich int DEFAULT 0, 
  KZ_Bereich_JG int DEFAULT 0, 
  AbgangsJG nvarchar(2), 
  Flag nvarchar(1) DEFAULT '1', 
  geaendert datetime2, 
  Sortierung int DEFAULT 0, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Abgangsart PRIMARY KEY (AbgangsJG, Art, KZ_Bereich, SF)
);


CREATE TABLE Statkue_AllgMerkmale (
  ID bigint NOT NULL, 
  SF nvarchar(2) NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  StatistikKrz nvarchar(5), 
  Langtext nvarchar(255) NOT NULL, 
  Schule int, 
  Schueler int, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_AllgMerkmale PRIMARY KEY (ID, Kurztext)
);


CREATE TABLE Statkue_AndereGrundschulen (
  SNR nvarchar(6) NOT NULL, 
  SF nvarchar(2), 
  ABez1 nvarchar(40), 
  Strasse nvarchar(40), 
  Ort nvarchar(40), 
  Auswahl int, 
  RegSchl nvarchar(6), 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_AndereGrundschulen PRIMARY KEY (SNR)
);


CREATE TABLE Statkue_Bilingual (
  SF nvarchar(2) NOT NULL, 
  Fach nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(100), 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Bilingual PRIMARY KEY (Fach, SF)
);


CREATE TABLE Statkue_Einschulungsart (
  Art nvarchar(2) NOT NULL, 
  Sortierung int DEFAULT 0, 
  Beschreibung nvarchar(100), 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Einschulungsart PRIMARY KEY (Art)
);


CREATE TABLE Statkue_Fachklasse (
  BKIndex int DEFAULT 0 NOT NULL, 
  Flag nvarchar(1), 
  FKS nvarchar(3) NOT NULL, 
  AP nvarchar(2) NOT NULL, 
  BGrp nvarchar(1), 
  BFeld nvarchar(2), 
  Ebene3 nvarchar(2), 
  BAKLALT nvarchar(2), 
  BAGRALT nvarchar(4), 
  Sortierung int DEFAULT 0, 
  Status nvarchar(20), 
  Flag_APOBK nvarchar(1), 
  Beschreibung nvarchar(100), 
  Beschreibung_W nvarchar(100), 
  Beschreibung_MW nvarchar(100), 
  geaendert datetime2, 
  BAKL nvarchar(5), 
  BAGR nvarchar(8), 
  Ebene1 nvarchar(2), 
  Ebene2 nvarchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Fachklasse PRIMARY KEY (AP, BKIndex, FKS)
);


CREATE TABLE Statkue_Foerderschwerpunkt (
  Beschreibung nvarchar(100), 
  Flag nvarchar(1) DEFAULT '1', 
  FSP nvarchar(2) NOT NULL, 
  geaendert datetime2, 
  SF nvarchar(2) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Foerderschwerpunkt PRIMARY KEY (FSP, SF)
);


CREATE TABLE Statkue_Gliederung (
  SF nvarchar(2) NOT NULL, 
  Flag nvarchar(1) NOT NULL, 
  BKAnlage nvarchar(1) NOT NULL, 
  BKTyp nvarchar(2) NOT NULL, 
  BKIndex int DEFAULT 0, 
  Beschreibung nvarchar(100), 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Gliederung PRIMARY KEY (BKAnlage, BKTyp, Flag, SF)
);


CREATE TABLE Statkue_Herkunftsart (
  SF nvarchar(2) NOT NULL, 
  Art nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(255) NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  Sortierung int DEFAULT 0 NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Herkunftsart PRIMARY KEY (Art, SF)
);


CREATE TABLE Statkue_Herkunftsschulform (
  SF nvarchar(2) NOT NULL, 
  HSF nvarchar(3) NOT NULL, 
  Beschreibung nvarchar(150) NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Herkunftsschulform PRIMARY KEY (HSF, SF)
);


CREATE TABLE Statkue_LehrerAbgang (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel nvarchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerAbgang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerAnrechnung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  GueltigAbSJ int, 
  GueltigBisSJ int, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerAnrechnung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerBeschaeftigungsart (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerBeschaeftigungsart PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerEinsatzstatus (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerEinsatzstatus PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerFachrAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrichtung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerFachrichtung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramt (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehramt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramtAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehramtAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehrbefAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefaehigung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerLehrbefaehigung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMehrleistung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerMehrleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMinderleistung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerMinderleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerRechtsverhaeltnis (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerRechtsverhaeltnis PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerZugang (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel nvarchar(2), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_LehrerZugang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Nationalitaeten (
  Schluessel nvarchar(3) NOT NULL, 
  Land nvarchar(255) NOT NULL, 
  Nationalitaet nvarchar(255) NOT NULL, 
  Flag nvarchar(1), 
  geaendert datetime2, 
  Beginn datetime2, 
  Ende datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Nationalitaeten PRIMARY KEY (Schluessel)
);


CREATE TABLE K_Lehrer (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID nvarchar(40), 
  Kuerzel nvarchar(10) NOT NULL, 
  LIDKrz nvarchar(4), 
  Nachname nvarchar(120) NOT NULL, 
  Vorname nvarchar(80), 
  PersonTyp nvarchar(20) DEFAULT 'LEHRKRAFT', 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  FuerExport nvarchar(1) DEFAULT '+', 
  Statistik nvarchar(1) DEFAULT '+', 
  Strassenname nvarchar(55), 
  HausNr nvarchar(10), 
  HausNrZusatz nvarchar(30), 
  Ort_ID bigint, 
  Ortsteil_ID bigint, 
  Tel nvarchar(20), 
  Handy nvarchar(20), 
  Email nvarchar(100), 
  EmailDienstlich nvarchar(100), 
  StaatKrz nvarchar(3), 
  Geburtsdatum date, 
  Geschlecht nvarchar(1), 
  Anrede nvarchar(10), 
  Amtsbezeichnung nvarchar(15), 
  Titel nvarchar(20), 
  Faecher nvarchar(100), 
  IdentNr1 nvarchar(10), 
  SerNr nvarchar(5), 
  PANr nvarchar(20), 
  LBVNr nvarchar(15), 
  VSchluessel nvarchar(1), 
  DatumZugang date, 
  GrundZugang nvarchar(10), 
  DatumAbgang date, 
  GrundAbgang nvarchar(10), 
  PflichtstdSoll float, 
  Rechtsverhaeltnis nvarchar(1), 
  Beschaeftigungsart nvarchar(2), 
  Einsatzstatus nvarchar(1), 
  StammschulNr nvarchar(6), 
  MasernImpfnachweis nvarchar(1) DEFAULT '-', 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  LPassword nvarchar(255), 
  PWAktuell nvarchar(3) DEFAULT '-;5', 
  SchILDweb_FL nvarchar(1) DEFAULT '+', 
  SchILDweb_KL nvarchar(1) DEFAULT '+', 
  SchILDweb_Config nvarchar(max), 
  KennwortTools nvarchar(255), 
  Antwort1 nvarchar(255), 
  Antwort2 nvarchar(255), 
  KennwortToolsAktuell nvarchar(3) DEFAULT '-;5', 
  XNMPassword nvarchar(255), 
  XNMPassword2 nvarchar(255), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Schuljahresabschnitts_ID bigint DEFAULT -1 NOT NULL, 
  AbteilungsLeiter_ID bigint, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Raum nvarchar(20), 
  Email nvarchar(100), 
  Durchwahl nvarchar(20), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Rechtsverhaeltnis nvarchar(1), 
  Beschaeftigungsart nvarchar(2), 
  Einsatzstatus nvarchar(1), 
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
  FotoBase64 nvarchar(max),
  CONSTRAINT PK_LehrerFotos PRIMARY KEY (Lehrer_ID),
  CONSTRAINT LehrerFotos_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramt (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10), 
  LehramtAnerkennungKrz nvarchar(10),
  CONSTRAINT PK_LehrerLehramt PRIMARY KEY (Lehrer_ID, LehramtKrz),
  CONSTRAINT LehrerLehramt_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramtFachr (
  Lehrer_ID bigint NOT NULL, 
  FachrKrz nvarchar(10), 
  FachrAnerkennungKrz nvarchar(10),
  CONSTRAINT PK_LehrerLehramtFachr PRIMARY KEY (Lehrer_ID, FachrKrz),
  CONSTRAINT LehrerLehramtFachr_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramtLehrbef (
  Lehrer_ID bigint NOT NULL, 
  LehrbefKrz nvarchar(10), 
  LehrbefAnerkennungKrz nvarchar(10),
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
  ID bigint DEFAULT -1 NOT NULL, 
  LeitungsfunktionID bigint NOT NULL, 
  Funktionstext nvarchar(255) NOT NULL, 
  LehrerID bigint NOT NULL, 
  Von datetime2, 
  Bis datetime2,
  CONSTRAINT PK_Schulleitung PRIMARY KEY (ID),
  CONSTRAINT Schulleitung_Leitungsfunktion_FK FOREIGN KEY (LeitungsfunktionID) REFERENCES SchulleitungFunktion(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schulleitung_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAnrechnung (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  AnrechnungsgrundKrz nvarchar(10), 
  AnrechnungStd float,
  CONSTRAINT PK_LehrerAnrechnung PRIMARY KEY (ID),
  CONSTRAINT LehrerAnrechnung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAnrechnung_UC1 UNIQUE (Abschnitt_ID, AnrechnungsgrundKrz)
);


CREATE TABLE LehrerEntlastung (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  EntlastungsgrundKrz nvarchar(10), 
  EntlastungStd float,
  CONSTRAINT PK_LehrerEntlastung PRIMARY KEY (ID),
  CONSTRAINT LehrerEntlastung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerEntlastung_UC1 UNIQUE (Abschnitt_ID, EntlastungsgrundKrz)
);


CREATE TABLE LehrerFunktionen (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Funktion_ID bigint NOT NULL,
  CONSTRAINT PK_LehrerFunktionen PRIMARY KEY (ID),
  CONSTRAINT LehrerFunktionen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_Schulfunktionen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_UC1 UNIQUE (Abschnitt_ID, Funktion_ID)
);


CREATE TABLE LehrerMehrleistung (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  MehrleistungsgrundKrz nvarchar(10) NOT NULL, 
  MehrleistungStd float,
  CONSTRAINT PK_LehrerMehrleistung PRIMARY KEY (ID),
  CONSTRAINT LehrerMehrleistung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerMehrleistung_UC1 UNIQUE (Abschnitt_ID, MehrleistungsgrundKrz)
);


CREATE TABLE Statkue_Organisationsform (
  SF nvarchar(2) NOT NULL, 
  OrgForm nvarchar(1) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(100) NOT NULL, 
  Flag nvarchar(1), 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Organisationsform PRIMARY KEY (FSP, OrgForm, SF)
);


CREATE TABLE Statkue_PLZOrt (
  ID bigint NOT NULL, 
  PLZ nvarchar(50), 
  RegSchl nvarchar(50), 
  Ort nvarchar(50), 
  Sortierung int DEFAULT 1, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_PLZOrt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Reformpaedagogik (
  SF nvarchar(2) NOT NULL, 
  RPG nvarchar(1) NOT NULL, 
  Beschreibung nvarchar(100) NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Reformpaedagogik PRIMARY KEY (RPG, SF)
);


CREATE TABLE Statkue_Religionen (
  Schluessel nvarchar(2) NOT NULL, 
  Klartext nvarchar(50) NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Religionen PRIMARY KEY (Schluessel)
);


CREATE TABLE Statkue_SVWS_BKAnlagen (
  BKAnlage nvarchar(1) NOT NULL, 
  Beschreibung nvarchar(120) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_BKAnlagen PRIMARY KEY (BKAnlage)
);


CREATE TABLE Statkue_SVWS_Schulgliederungen (
  SGL nvarchar(3) NOT NULL, 
  istBK int DEFAULT 0 NOT NULL, 
  Schulformen nvarchar(120) NOT NULL, 
  istAuslaufend int DEFAULT 0 NOT NULL, 
  istAusgelaufen int DEFAULT 0 NOT NULL, 
  Beschreibung nvarchar(120) NOT NULL, 
  BKAnlage nvarchar(1), 
  BKTyp nvarchar(2), 
  BKIndex nvarchar(10), 
  istVZ int DEFAULT 0, 
  BKAbschlussBeruf nvarchar(10), 
  BKAbschlussAllg nvarchar(10),
  CONSTRAINT PK_Statkue_SVWS_Schulgliederungen PRIMARY KEY (SGL)
);


CREATE TABLE EigeneSchule_Jahrgaenge (
  ID bigint DEFAULT -1 NOT NULL, 
  InternKrz nvarchar(20), 
  GueltigVon bigint, 
  GueltigBis bigint, 
  ASDJahrgang nvarchar(2), 
  ASDBezeichnung nvarchar(100), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  IstChronologisch nvarchar(1) DEFAULT '+', 
  Spaltentitel nvarchar(2), 
  SekStufe nvarchar(6), 
  SGL nvarchar(3), 
  Restabschnitte int, 
  Folgejahrgang_ID bigint,
  CONSTRAINT PK_EigeneSchule_Jahrgaenge PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Jahrgaenge_GueltigVon_FK FOREIGN KEY (GueltigVon) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_GueltigBis_FK FOREIGN KEY (GueltigBis) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_Schulgliederung_FK FOREIGN KEY (SGL) REFERENCES Statkue_SVWS_Schulgliederungen(SGL) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
);


CREATE TABLE Klassen (
  ID bigint DEFAULT -1 NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Bezeichnung nvarchar(150), 
  ASDKlasse nvarchar(6), 
  Klasse nvarchar(15) NOT NULL, 
  Jahrgang_ID bigint, 
  FKlasse nvarchar(15), 
  VKlasse nvarchar(15), 
  OrgFormKrz nvarchar(1), 
  ASDSchulformNr nvarchar(3), 
  Fachklasse_ID bigint, 
  PruefOrdnung nvarchar(20), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Klassenart nvarchar(2), 
  SommerSem nvarchar(1) DEFAULT '-', 
  NotenGesperrt nvarchar(1) DEFAULT '-', 
  AdrMerkmal nvarchar(1) DEFAULT 'A', 
  KoopKlasse nvarchar(1) DEFAULT '-', 
  Ankreuzzeugnisse nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_Klassen PRIMARY KEY (ID),
  CONSTRAINT Klassen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_UC1 UNIQUE (Schuljahresabschnitts_ID, Klasse)
);


CREATE TABLE Kurse (
  ID bigint DEFAULT -1 NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  KurzBez nvarchar(20) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2), 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5), 
  WochenStd smallint, 
  Lehrer_ID bigint, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Schienen nvarchar(20), 
  Fortschreibungsart nvarchar(1), 
  WochenstdKL float, 
  SchulNr int, 
  EpochU nvarchar(1) DEFAULT '-', 
  ZeugnisBez nvarchar(130), 
  Jahrgaenge nvarchar(50),
  CONSTRAINT PK_Kurse PRIMARY KEY (ID),
  CONSTRAINT Kurse_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Kurse_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Kurse_Fortschreibungsart_FK FOREIGN KEY (Fortschreibungsart) REFERENCES KursFortschreibungsarten(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_UC1 UNIQUE (Schuljahresabschnitts_ID, KurzBez, ASDJahrgang, Fach_ID, KursartAllg, WochenStd, Lehrer_ID, Jahrgaenge)
);


CREATE TABLE Schueler (
  ID bigint DEFAULT -1 NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  GU_ID nvarchar(40) NOT NULL, 
  SrcID int, 
  IDext nvarchar(30), 
  Status int, 
  Name nvarchar(120), 
  Vorname nvarchar(80), 
  Zusatz nvarchar(255), 
  Geburtsname nvarchar(120), 
  Strassenname nvarchar(55), 
  HausNr nvarchar(10), 
  HausNrZusatz nvarchar(30), 
  Ort_ID bigint, 
  Ortsteil_ID bigint, 
  Telefon nvarchar(20), 
  Email nvarchar(100), 
  Fax nvarchar(20), 
  Geburtsdatum date, 
  Geburtsort nvarchar(100), 
  Volljaehrig nvarchar(1) DEFAULT '-', 
  Geschlecht smallint, 
  StaatKrz nvarchar(3), 
  StaatKrz2 nvarchar(3), 
  Aussiedler nvarchar(1) DEFAULT '-', 
  Religion_ID bigint, 
  Religionsabmeldung date, 
  Religionsanmeldung date, 
  Bafoeg nvarchar(1) DEFAULT '-', 
  Sportbefreiung_ID bigint, 
  Fahrschueler_ID bigint, 
  Haltestelle_ID bigint, 
  SchulpflichtErf nvarchar(1) DEFAULT '-', 
  Aufnahmedatum date, 
  Einschulungsjahr smallint, 
  Einschulungsart_ID bigint, 
  LSSchulNr nvarchar(6), 
  LSSchulformSIM nvarchar(3), 
  LSJahrgang nvarchar(2), 
  LSSchulEntlassDatum date, 
  LSVersetzung nvarchar(2), 
  LSFachklKennung nvarchar(10), 
  LSFachklSIM nvarchar(5), 
  LSEntlassgrund nvarchar(50), 
  LSEntlassArt nvarchar(2), 
  LSKlassenart nvarchar(2), 
  LSRefPaed nvarchar(1) DEFAULT '-', 
  Entlassjahrgang nvarchar(2), 
  Entlassjahrgang_ID bigint, 
  Entlassdatum date, 
  Entlassgrund nvarchar(50), 
  Entlassart nvarchar(2), 
  SchulwechselNr nvarchar(6), 
  Schulwechseldatum date, 
  Geloescht nvarchar(1) DEFAULT '-', 
  Gesperrt nvarchar(1) DEFAULT '-', 
  ModifiziertAm datetime2, 
  ModifiziertVon nvarchar(20), 
  Markiert nvarchar(21) DEFAULT '-', 
  FotoVorhanden nvarchar(1) DEFAULT '-', 
  JVA nvarchar(1) DEFAULT '-', 
  KeineAuskunft nvarchar(1) DEFAULT '-', 
  Beruf nvarchar(100), 
  AbschlussDatum nvarchar(15), 
  Bemerkungen nvarchar(max), 
  BeginnBildungsgang date, 
  DurchschnittsNote nvarchar(4), 
  LSSGL nvarchar(5), 
  LSSchulform nvarchar(2), 
  KonfDruck nvarchar(1) DEFAULT '+', 
  DSN_Text nvarchar(15), 
  Berufsabschluss nvarchar(1), 
  LSSGL_SIM nvarchar(3), 
  BerufsschulpflErf nvarchar(1) DEFAULT '-', 
  StatusNSJ int, 
  FachklasseNSJ_ID bigint, 
  BuchKonto float, 
  VerkehrsspracheFamilie nvarchar(2) DEFAULT 'de', 
  JahrZuzug int, 
  DauerKindergartenbesuch nvarchar(1), 
  VerpflichtungSprachfoerderkurs nvarchar(1) DEFAULT '-', 
  TeilnahmeSprachfoerderkurs nvarchar(1) DEFAULT '-', 
  SchulbuchgeldBefreit nvarchar(1) DEFAULT '-', 
  GeburtslandSchueler nvarchar(10), 
  GeburtslandVater nvarchar(10), 
  GeburtslandMutter nvarchar(10), 
  Uebergangsempfehlung_JG5 nvarchar(10), 
  ErsteSchulform_SI nvarchar(10), 
  JahrWechsel_SI int, 
  JahrWechsel_SII int, 
  Migrationshintergrund nvarchar(1) DEFAULT '-', 
  ExterneSchulNr nvarchar(6), 
  Kindergarten_ID bigint, 
  LetzterBerufsAbschluss nvarchar(10), 
  LetzterAllgAbschluss nvarchar(10), 
  Land nvarchar(2), 
  Duplikat nvarchar(1) DEFAULT '-', 
  EinschulungsartASD nvarchar(2), 
  DurchschnittsnoteFHR nvarchar(4), 
  DSN_FHR_Text nvarchar(15), 
  Eigenanteil float, 
  BKAZVO int, 
  HatBerufsausbildung nvarchar(1) DEFAULT '-', 
  Ausweisnummer nvarchar(30), 
  EPJahre int DEFAULT 2, 
  LSBemerkung nvarchar(255), 
  WechselBestaetigt nvarchar(1) DEFAULT '-', 
  DauerBildungsgang int, 
  AnmeldeDatum date, 
  MeisterBafoeg nvarchar(1) DEFAULT '-', 
  OnlineAnmeldung nvarchar(1) DEFAULT '-', 
  Dokumentenverzeichnis nvarchar(255), 
  Berufsqualifikation nvarchar(100), 
  ZusatzNachname nvarchar(30), 
  EndeEingliederung date, 
  SchulEmail nvarchar(100), 
  EndeAnschlussfoerderung date, 
  MasernImpfnachweis nvarchar(1) DEFAULT '-', 
  Lernstandsbericht nvarchar(1) DEFAULT '-', 
  SprachfoerderungVon date, 
  SprachfoerderungBis date, 
  EntlassungBemerkung nvarchar(255), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Abteilung_ID bigint NOT NULL, 
  Klassen_ID bigint NOT NULL, 
  Sichtbar nvarchar(1) DEFAULT '+',
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
  DatumBeratung datetime2, 
  DatumRuecklauf datetime2, 
  HatSprachPraktischePruefung int DEFAULT 0 NOT NULL, 
  HatSportattest int DEFAULT 0 NOT NULL, 
  Kommentar nvarchar(max), 
  Beratungslehrer_ID bigint, 
  PruefPhase nvarchar(1), 
  BesondereLernleistung_Art nvarchar(1), 
  BesondereLernleistung_Punkte int, 
  ZweiteFremdpracheInSekIVorhanden int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Schueler PRIMARY KEY (Schueler_ID),
  CONSTRAINT Gost_Schueler_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Schueler_Fachwahlen (
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  EF1_Kursart nvarchar(5), 
  EF1_Punkte nvarchar(2), 
  EF2_Kursart nvarchar(5), 
  EF2_Punkte nvarchar(2), 
  Q11_Kursart nvarchar(5), 
  Q11_Punkte nvarchar(2), 
  Q12_Kursart nvarchar(5), 
  Q12_Punkte nvarchar(2), 
  Q21_Kursart nvarchar(5), 
  Q21_Punkte nvarchar(2), 
  Q22_Kursart nvarchar(5), 
  Q22_Punkte nvarchar(2), 
  AbiturFach int, 
  Bemerkungen nvarchar(50), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  BemerkungIntern nvarchar(30), 
  AbgangsSchulform nvarchar(2), 
  AbgangsBeschreibung nvarchar(200), 
  OrganisationsformKrz nvarchar(1), 
  AbgangsSchule nvarchar(100), 
  AbgangsSchuleAnschr nvarchar(100), 
  AbgangsSchulNr nvarchar(6), 
  LSJahrgang nvarchar(2), 
  LSEntlassArt nvarchar(2), 
  LSSchulformSIM nvarchar(3), 
  LSSchulEntlassDatum date, 
  LSVersetzung nvarchar(2), 
  LSSGL nvarchar(5), 
  LSFachklKennung nvarchar(10), 
  LSFachklSIM nvarchar(5), 
  FuerSIMExport nvarchar(1) DEFAULT '-', 
  LSBeginnDatum date, 
  LSBeginnJahrgang nvarchar(2),
  CONSTRAINT PK_SchuelerAbgaenge PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbgaenge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerAbgaenge_IDX1 ON SchuelerAbgaenge(Schueler_ID, LSSchulEntlassDatum);


CREATE TABLE SchuelerAbiFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  FachKrz nvarchar(20), 
  FSortierung int, 
  Kurs_ID bigint, 
  KursartAllg nvarchar(5), 
  Fachlehrer_ID bigint, 
  AbiFach nvarchar(1), 
  P11_1 nvarchar(2), 
  S11_1 nvarchar(1) DEFAULT '-', 
  P11_2 nvarchar(2), 
  S11_2 nvarchar(1) DEFAULT '-', 
  P_FA nvarchar(2), 
  R_FA nvarchar(1) DEFAULT '-', 
  W12_1 int, 
  P12_1 nvarchar(2), 
  H12_1 int, 
  R12_1 nvarchar(1) DEFAULT '-', 
  S12_1 nvarchar(1) DEFAULT '-', 
  W12_2 int, 
  P12_2 nvarchar(2), 
  H12_2 int, 
  R12_2 nvarchar(1) DEFAULT '-', 
  S12_2 nvarchar(1) DEFAULT '-', 
  W13_1 int, 
  P13_1 nvarchar(2), 
  H13_1 int, 
  R13_1 nvarchar(1) DEFAULT '-', 
  S13_1 nvarchar(1) DEFAULT '-', 
  W13_2 int, 
  P13_2 nvarchar(2), 
  H13_2 int, 
  R13_2 nvarchar(1) DEFAULT '-', 
  S13_2 nvarchar(1) DEFAULT '-', 
  Zulassung smallint, 
  Durchschnitt float, 
  AbiPruefErgebnis smallint, 
  Zwischenstand smallint, 
  MdlPflichtPruefung nvarchar(1) DEFAULT '-', 
  MdlBestPruefung nvarchar(1) DEFAULT '-', 
  MdlFreiwPruefung nvarchar(1) DEFAULT '-', 
  MdlPruefErgebnis smallint, 
  MdlPruefFolge smallint, 
  AbiErgebnis smallint,
  CONSTRAINT PK_SchuelerAbiFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerAbitur (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  FA_Fach nvarchar(130), 
  FA_Punkte int, 
  FehlStd int, 
  uFehlStd int, 
  FranzBilingual nvarchar(1) DEFAULT '-', 
  BesondereLernleistung nvarchar(1) DEFAULT '-', 
  AnzRelLK smallint, 
  AnzRelGK smallint, 
  AnzRelOK smallint, 
  AnzDefLK smallint, 
  AnzDefGK smallint, 
  Thema_PJK nvarchar(255), 
  FS2_SekI_Manuell nvarchar(1) DEFAULT '-', 
  Kurse_I int, 
  Defizite_I int, 
  LK_Defizite_I int, 
  AnzahlKurse_0 int, 
  Punktsumme_I int, 
  Durchschnitt_I float, 
  SummeGK smallint, 
  SummeLK smallint, 
  SummenOK smallint, 
  Zugelassen nvarchar(1) DEFAULT '-', 
  BLL_Art nvarchar(1) DEFAULT 'K', 
  BLL_Punkte int, 
  Thema_BLL nvarchar(255), 
  Punktsumme_II int, 
  Defizite_II int, 
  LK_Defizite_II int, 
  PruefungBestanden nvarchar(1) DEFAULT '-', 
  Note nvarchar(3), 
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
  Zulassung nchar(1), 
  Bestanden nchar(1), 
  ZertifikatBK nchar(1), 
  ZulassungErwBK nchar(1), 
  BestandenErwBK nchar(1), 
  ZulassungBA nchar(1), 
  BestandenBA nchar(1), 
  PraktPrfNote nvarchar(2), 
  NoteKolloquium nvarchar(2), 
  ThemaAbschlussarbeit nvarchar(max), 
  BAP_Vorhanden nvarchar(1), 
  NoteFachpraxis nvarchar(2), 
  FachPraktAnteilAusr nvarchar(1),
  CONSTRAINT PK_SchuelerBKAbschluss PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerBKAbschluss_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKAbschluss_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  Fach_ID bigint NOT NULL, 
  FachKrz nvarchar(20), 
  FachSchriftlich nchar(1), 
  FachSchriftlichBA nchar(1), 
  Vornote nvarchar(2), 
  NoteSchriftlich nvarchar(2), 
  MdlPruefung nchar(1), 
  MdlPruefungFW nchar(1), 
  NoteMuendlich nvarchar(2), 
  NoteAbschluss nvarchar(2), 
  NotePrfGesamt nvarchar(2), 
  FSortierung int, 
  Fachlehrer_ID bigint, 
  NoteAbschlussBA nvarchar(2), 
  Kursart nvarchar(5),
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL, 
  Datenschutz_ID bigint NOT NULL, 
  Status nvarchar(1) DEFAULT '-' NOT NULL, 
  Abgefragt int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Datenschutz_ID, Schueler_ID),
  CONSTRAINT SchuelerDatenschutz_K_Datenschutz_FK FOREIGN KEY (Datenschutz_ID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerDatenschutz_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerErzAdr (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  ErzieherArt_ID bigint, 
  Anrede1 nvarchar(20), 
  Titel1 nvarchar(10), 
  Name1 nvarchar(120), 
  Vorname1 nvarchar(80), 
  Anrede2 nvarchar(20), 
  Titel2 nvarchar(10), 
  Name2 nvarchar(120), 
  Vorname2 nvarchar(80), 
  ErzOrt_ID bigint, 
  ErzStrassenname nvarchar(55), 
  ErzHausNr nvarchar(10), 
  ErzOrtsteil_ID bigint, 
  ErzHausNrZusatz nvarchar(30), 
  ErzAnschreiben nvarchar(1) DEFAULT '+', 
  Sortierung int, 
  ErzEmail nvarchar(100), 
  ErzAdrZusatz nvarchar(50), 
  Erz1StaatKrz nvarchar(3), 
  Erz2StaatKrz nvarchar(3), 
  ErzEmail2 nvarchar(100), 
  Erz1ZusatzNachname nvarchar(30), 
  Erz2ZusatzNachname nvarchar(30), 
  Bemerkungen nvarchar(max), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FHRErreicht nvarchar(1) DEFAULT '-', 
  Note nvarchar(3), 
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
  WSII_2_1 nvarchar(1), 
  WSII_2_2 nvarchar(1), 
  WSII_2_1_W nvarchar(1), 
  WSII_2_2_W nvarchar(1), 
  WSII_3_1 nvarchar(1), 
  WSII_3_2 nvarchar(1), 
  WSII_3_1_W nvarchar(1), 
  WSII_3_2_W nvarchar(1),
  CONSTRAINT PK_SchuelerFHR PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHR_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHR_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerFHRFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5), 
  FachKrz nvarchar(20), 
  PSII_2_1 nvarchar(2), 
  HSII_2_1 int, 
  RSII_2_1 nvarchar(1) DEFAULT '-', 
  PSII_2_2 nvarchar(2), 
  HSII_2_2 int, 
  RSII_2_2 nvarchar(1) DEFAULT '-', 
  PSII_2_1_W nvarchar(2), 
  HSII_2_1_W int, 
  RSII_2_1_W nvarchar(1) DEFAULT '-', 
  PSII_2_2_W nvarchar(2), 
  HSII_2_2_W int, 
  RSII_2_2_W nvarchar(1) DEFAULT '-', 
  PSII_3_1 nvarchar(2), 
  HSII_3_1 int, 
  RSII_3_1 nvarchar(1) DEFAULT '-', 
  PSII_3_2 nvarchar(2), 
  HSII_3_2 int, 
  RSII_3_2 nvarchar(1) DEFAULT '-', 
  PSII_3_1_W nvarchar(2), 
  HSII_3_1_W int, 
  RSII_3_1_W nvarchar(1) DEFAULT '-', 
  PSII_3_2_W nvarchar(2), 
  HSII_3_2_W int, 
  RSII_3_2_W nvarchar(1) DEFAULT '-', 
  KSII_2_1 nvarchar(5), 
  KSII_2_2 nvarchar(5), 
  KSII_2_1_W nvarchar(5), 
  KSII_2_2_W nvarchar(5), 
  KSII_3_1 nvarchar(5), 
  KSII_3_2 nvarchar(5), 
  KSII_3_1_W nvarchar(5), 
  KSII_3_2_W nvarchar(5), 
  FSortierung int,
  CONSTRAINT PK_SchuelerFHRFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHRFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFotos (
  Schueler_ID bigint NOT NULL, 
  FotoBase64 nvarchar(max),
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
  Anrede_Klassenlehrer nvarchar(10), 
  Nachname_Klassenlehrer nvarchar(120), 
  GS_Klasse nvarchar(15), 
  Bemerkungen nvarchar(max), 
  Geschwisterkind nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerGSDaten PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerGSDaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerLernabschnittsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  WechselNr smallint, 
  Schulbesuchsjahre smallint, 
  Hochrechnung int, 
  SemesterWertung nvarchar(1) DEFAULT '+', 
  PruefOrdnung nvarchar(20), 
  Klassen_ID bigint, 
  Verspaetet smallint, 
  NPV_Fach_ID bigint, 
  NPV_NoteKrz nvarchar(2), 
  NPV_Datum date, 
  NPAA_Fach_ID bigint, 
  NPAA_NoteKrz nvarchar(2), 
  NPAA_Datum date, 
  NPBQ_Fach_ID bigint, 
  NPBQ_NoteKrz nvarchar(2), 
  NPBQ_Datum date, 
  VersetzungKrz nvarchar(2), 
  AbschlussArt smallint, 
  AbschlIstPrognose nvarchar(1) DEFAULT '-', 
  Konferenzdatum date, 
  ZeugnisDatum date, 
  ASDSchulgliederung nvarchar(3), 
  ASDJahrgang nvarchar(2), 
  Jahrgang_ID bigint, 
  Fachklasse_ID bigint, 
  Schwerpunkt_ID bigint, 
  ZeugnisBem nvarchar(max), 
  Schwerbehinderung nvarchar(1) DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  OrgFormKrz nvarchar(1), 
  RefPaed nvarchar(1) DEFAULT '-', 
  Klassenart nvarchar(2), 
  SumFehlStd int, 
  SumFehlStdU int, 
  Wiederholung nvarchar(1) DEFAULT '-', 
  Gesamtnote_GS int, 
  Gesamtnote_NW int, 
  Folgeklasse_ID bigint, 
  Foerderschwerpunkt2_ID bigint, 
  Abschluss nvarchar(50), 
  Abschluss_B nvarchar(50), 
  DSNote nvarchar(4), 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  MoeglNPFaecher nvarchar(max), 
  Zertifikate nvarchar(30), 
  DatumFHR date, 
  PruefAlgoErgebnis nvarchar(max), 
  Zeugnisart nvarchar(5), 
  DatumVon date, 
  DatumBis date, 
  FehlstundenGrenzwert int, 
  Sonderpaedagoge_ID bigint, 
  FachPraktAnteilAusr nvarchar(1) DEFAULT '+' NOT NULL, 
  BilingualerZweig nvarchar(1), 
  AOSF nvarchar(1) DEFAULT '-', 
  Autist nvarchar(1) DEFAULT '-', 
  ZieldifferentesLernen nvarchar(1) DEFAULT '-',
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
  Kurztext nvarchar(10), 
  DatumVon date, 
  DatumBis date,
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerMerkmale_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerSprachenfolge (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Sprache nvarchar(2) NOT NULL, 
  ReihenfolgeNr int, 
  ASDJahrgangVon nvarchar(2), 
  ASDJahrgangBis nvarchar(2), 
  AbschnittVon smallint, 
  AbschnittBis smallint, 
  Referenzniveau nvarchar(5), 
  KleinesLatinumErreicht int, 
  LatinumErreicht int, 
  GraecumErreicht int, 
  HebraicumErreicht int,
  CONSTRAINT PK_SchuelerSprachenfolge PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerSprachenfolge_IDX1 ON SchuelerSprachenfolge(Schueler_ID);


CREATE TABLE SchuelerSprachpruefungen (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Sprache nvarchar(2) NOT NULL, 
  ASDJahrgang nvarchar(2), 
  Anspruchsniveau_ID bigint, 
  Pruefungsdatum date, 
  ErsetzteSprache nvarchar(2), 
  IstHSUPruefung int, 
  IstFeststellungspruefung int, 
  KannErstePflichtfremdspracheErsetzen int, 
  KannZweitePflichtfremdspracheErsetzen int, 
  KannWahlpflichtfremdspracheErsetzen int, 
  KannBelegungAlsFortgefuehrteSpracheErlauben int, 
  Referenzniveau nvarchar(5), 
  NotePruefung int,
  CONSTRAINT PK_SchuelerSprachpruefungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachpruefungen_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerTelefone (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  TelefonArt_ID bigint, 
  Telefonnummer nvarchar(20), 
  Bemerkung nvarchar(50), 
  Sortierung int DEFAULT 32000, 
  Gesperrt nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerTelefone PRIMARY KEY (ID),
  CONSTRAINT SchuelerTelefone_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerTelefone_Telefonart_FK FOREIGN KEY (TelefonArt_ID) REFERENCES K_TelefonArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX SchuelerTelefone_IDX1 ON SchuelerTelefone(Schueler_ID);


CREATE TABLE SchuelerVermerke (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  VermerkArt_ID bigint, 
  Datum date, 
  Bemerkung nvarchar(max), 
  AngelegtVon nvarchar(20), 
  GeaendertVon nvarchar(20),
  CONSTRAINT PK_SchuelerVermerke PRIMARY KEY (ID),
  CONSTRAINT SchuelerVermerke_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerVermerke_VermerkArt_FK FOREIGN KEY (VermerkArt_ID) REFERENCES K_Vermerkart(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerVermerke_IDX1 ON SchuelerVermerke(Schueler_ID);


CREATE TABLE SchuelerZP10 (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint, 
  Fach_ID bigint NOT NULL, 
  Vornote nvarchar(2), 
  NoteSchriftlich nvarchar(2), 
  MdlPruefung nchar(1), 
  MdlPruefungFW nchar(1), 
  NoteMuendlich nvarchar(2), 
  NoteAbschluss nvarchar(2), 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Adresse_ID bigint NOT NULL, 
  Vertragsart_ID bigint, 
  Vertragsbeginn date, 
  Vertragsende date, 
  Ausbilder nvarchar(30), 
  AllgAdrAnschreiben nvarchar(1) DEFAULT '-', 
  Praktikum nvarchar(1) DEFAULT '-', 
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
  ID bigint DEFAULT -1 NOT NULL, 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Floskel_ID bigint NOT NULL, 
  Stufe1 nvarchar(1) DEFAULT '-', 
  Stufe2 nvarchar(1) DEFAULT '-', 
  Stufe3 nvarchar(1) DEFAULT '-', 
  Stufe4 nvarchar(1) DEFAULT '-', 
  Stufe5 nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerAnkreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT SchuelerAnkreuzfloskeln_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAnkreuzfloskeln_Floskel_FK FOREIGN KEY (Floskel_ID) REFERENCES K_Ankreuzfloskeln(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFehlstunden (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Datum date DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Fach_ID bigint, 
  FehlStd float NOT NULL, 
  VonStd int, 
  BisStd int, 
  Entschuldigt nvarchar(1) DEFAULT '-', 
  Lehrer_ID bigint,
  CONSTRAINT PK_SchuelerFehlstunden PRIMARY KEY (ID),
  CONSTRAINT SchuelerFehlstunden_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFehlstunden_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerFehlstunden_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerFoerderempfehlungen (
  GU_ID nvarchar(40) NOT NULL, 
  Abschnitt_ID bigint, 
  DatumAngelegt date DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Klassen_ID bigint, 
  Lehrer_ID bigint, 
  DatumAenderungSchild datetime2, 
  DatumAenderungSchildWeb datetime2, 
  Inhaltl_Prozessbez_Komp nvarchar(max), 
  Methodische_Komp nvarchar(max), 
  Lern_Arbeitsverhalten nvarchar(max), 
  Massn_Inhaltl_Prozessbez_Komp nvarchar(max), 
  Massn_Methodische_Komp nvarchar(max), 
  Massn_Lern_Arbeitsverhalten nvarchar(max), 
  Verantwortlichkeit_Eltern nvarchar(max), 
  Verantwortlichkeit_Schueler nvarchar(max), 
  Zeitrahmen_von_Datum date, 
  Zeitrahmen_bis_Datum date, 
  Ueberpruefung_Datum date, 
  Naechstes_Beratungsgespraech date, 
  EingabeFertig nvarchar(1) DEFAULT '-', 
  Faecher nvarchar(255), 
  Abgeschlossen nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerFoerderempfehlungen PRIMARY KEY (GU_ID),
  CONSTRAINT SchuelerFoerderempfehlungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFoerderempfehlungen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerFoerderempfehlungen_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerKAoADaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Jahrgang nvarchar(2), 
  KategorieID bigint NOT NULL, 
  MerkmalID bigint, 
  ZusatzmerkmalID bigint, 
  AnschlussoptionID bigint, 
  BerufsfeldID bigint, 
  SBO_Ebene4ID bigint, 
  Bemerkung nvarchar(255),
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
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  ASV nvarchar(max), 
  LELS nvarchar(max), 
  AUE nvarchar(max), 
  ESF nvarchar(max), 
  BemerkungFSP nvarchar(max), 
  BemerkungVersetzung nvarchar(max),
  CONSTRAINT PK_SchuelerLD_PSFachBem PRIMARY KEY (ID),
  CONSTRAINT SchuelerLD_PSFachBem_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLD_PSFachBem_UC1 UNIQUE (Abschnitt_ID)
);


CREATE TABLE SchuelerLeistungsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Hochrechnung int, 
  Fachlehrer_ID bigint, 
  Kursart nvarchar(5), 
  KursartAllg nvarchar(5), 
  Kurs_ID bigint, 
  NotenKrz nvarchar(2), 
  Warnung nvarchar(1) DEFAULT '-', 
  Warndatum date, 
  AbiFach nvarchar(1), 
  Wochenstunden smallint, 
  AbiZeugnis nvarchar(1) DEFAULT '-', 
  Prognose nvarchar(1), 
  FehlStd smallint, 
  uFehlStd smallint, 
  Sortierung int DEFAULT 32000, 
  Lernentw nvarchar(max), 
  Gekoppelt nvarchar(1) DEFAULT '-', 
  VorherAbgeschl nvarchar(1) DEFAULT '-', 
  AbschlussJahrgang nvarchar(2), 
  HochrechnungStatus nvarchar(1), 
  SchulNr int, 
  Zusatzkraft_ID bigint, 
  WochenstdZusatzkraft int, 
  Prf10Fach nvarchar(1) DEFAULT '-', 
  AufZeugnis nvarchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  NoteAbschlussBA nvarchar(2), 
  Umfang nvarchar(1),
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
  Kursart nvarchar(5),
  CONSTRAINT PK_SchuelerZuweisungen PRIMARY KEY (Abschnitt_ID, Fach_ID),
  CONSTRAINT SchuelerZuweisungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZuweisungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE BenutzerEmail (
  Benutzer_ID bigint NOT NULL, 
  Email nvarchar(255) NOT NULL, 
  EmailName nvarchar(255) NOT NULL, 
  SMTPUsername nvarchar(255), 
  SMTPPassword nvarchar(255), 
  EMailSignature nvarchar(2047), 
  HeartbeatDate bigint, 
  ComputerName nvarchar(255),
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
  LI_LoginTime datetime2, 
  LI_LogoffTime datetime2,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_LoginTime, LI_UserID),
  CONSTRAINT Logins_Benutzer_FK FOREIGN KEY (LI_UserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SVWS_Client_Konfiguration_Benutzer (
  Benutzer_ID bigint NOT NULL, 
  AppName nvarchar(100) NOT NULL, 
  Schluessel nvarchar(255) NOT NULL, 
  Wert nvarchar(max) NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Benutzer PRIMARY KEY (Benutzer_ID, AppName, Schluessel),
  CONSTRAINT SVWSClientKonfigurationBenutzer_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schild_Verwaltung (
  BackupDatum datetime2, 
  AutoBerechnung datetime2, 
  DatumStatkue datetime2, 
  DatumSchildIntern datetime2, 
  Bescheinigung nvarchar(255), 
  Stammblatt nvarchar(255), 
  DatenGeprueft nvarchar(1) DEFAULT '-', 
  Version nvarchar(10), 
  GU_ID nvarchar(40) NOT NULL, 
  DatumLoeschfristHinweisDeaktiviert datetime2, 
  DatumLoeschfristHinweisDeaktiviertUserID bigint, 
  DatumDatenGeloescht datetime2,
  CONSTRAINT PK_Schild_Verwaltung PRIMARY KEY (GU_ID),
  CONSTRAINT Schild_Verwaltung_Loeschfrist_deaktiviert_durch_Benutzer_FK FOREIGN KEY (DatumLoeschfristHinweisDeaktiviertUserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE SchuelerEinzelleistungen (
  ID bigint DEFAULT -1 NOT NULL, 
  Datum date, 
  Lehrer_ID bigint, 
  Art_ID bigint, 
  Bemerkung nvarchar(100), 
  Leistung_ID bigint NOT NULL, 
  NotenKrz nvarchar(2),
  CONSTRAINT PK_SchuelerEinzelleistungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerEinzelleistungen_Art_FK FOREIGN KEY (Art_ID) REFERENCES K_Einzelleistungen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerEinzelleistungen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerEinzelleistungen_Leistungsdaten_FK FOREIGN KEY (Leistung_ID) REFERENCES SchuelerLeistungsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerReportvorlagen (
  User_ID bigint NOT NULL, 
  Reportvorlage nvarchar(255), 
  Schueler_IDs nvarchar(max),
  CONSTRAINT PK_SchuelerReportvorlagen PRIMARY KEY (User_ID, Reportvorlage),
  CONSTRAINT SchuelerReportvorlagen_Benutzer_FK FOREIGN KEY (User_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerWiedervorlage (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Bemerkung nvarchar(255), 
  AngelegtAm datetime2, 
  WiedervorlageAm datetime2, 
  ErledigtAm datetime2, 
  User_ID bigint, 
  Sekretariat nvarchar(1) DEFAULT '+', 
  Typ nvarchar(1), 
  NichtLoeschen nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerWiedervorlage PRIMARY KEY (ID),
  CONSTRAINT SchuelerWiedervorlage_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerWiedervorlage_Benutzer_FK FOREIGN KEY (User_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Statkue_SVWS_SprachpruefungNiveaus (
  ID bigint NOT NULL, 
  Bezeichnung nvarchar(16) NOT NULL, 
  Beschreibung nvarchar(200) NOT NULL, 
  Sortierung int NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_SprachpruefungNiveaus PRIMARY KEY (ID),
  CONSTRAINT Statkue_SVWS_SprachpruefungNiveaus_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE Statkue_SVWS_ZulaessigeFaecher (
  Fach nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(80) NOT NULL, 
  FachkuerzelAtomar nvarchar(2) NOT NULL, 
  Kurzbezeichnung nvarchar(80), 
  Aufgabenfeld int, 
  Fachgruppe_ID bigint, 
  SchulformenUndGliederungen nvarchar(255), 
  SchulformenAusgelaufen nvarchar(255), 
  AusgelaufenInSchuljahr nvarchar(255), 
  AbJahrgang nvarchar(2), 
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
  Schulform nvarchar(2) NOT NULL, 
  SchulformKuerzel nvarchar(3) NOT NULL, 
  Jahrgang nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(80) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  geaendert datetime2, 
  Sortierung int DEFAULT 0, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_ZulaessigeJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SVWS_ZulaessigeKursarten (
  ID nvarchar(7) NOT NULL, 
  Kuerzel nvarchar(5) NOT NULL, 
  ASDNummer nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(120) NOT NULL, 
  SchulformenUndGliederungen nvarchar(255), 
  KuerzelAllg nvarchar(5), 
  BezeichnungAllg nvarchar(120), 
  SchulformenAusgelaufen nvarchar(255), 
  erlaubtGOSt int DEFAULT 0 NOT NULL, 
  AusgelaufenInSchuljahr nvarchar(255), 
  Bemerkungen nvarchar(120), 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SVWS_ZulaessigeKursarten PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerErsteSchulformSekI (
  ID bigint NOT NULL, 
  SF nvarchar(2), 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerErsteSchulformSekI PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerKindergartenbesuch (
  ID bigint NOT NULL, 
  SF nvarchar(2), 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerKindergartenbesuch PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerUebergangsempfehlung5Jg (
  ID bigint NOT NULL, 
  SF nvarchar(2), 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int, 
  HGSEM nvarchar(4) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerUebergangsempfehlung5Jg PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerVerkehrssprache (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Gesprochen_in nvarchar(255), 
  Beginn datetime2, 
  Ende datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_SchuelerVerkehrssprache PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Schulformen (
  Schulform nvarchar(2), 
  SF nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime2, 
  Sortierung int DEFAULT 0, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_Schulformen PRIMARY KEY (Bezeichnung, SF)
);


CREATE TABLE Statkue_ZulFaecher (
  Schulform nvarchar(2) NOT NULL, 
  FSP nvarchar(2), 
  BG nvarchar(3), 
  Fach nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(80) NOT NULL, 
  KZ_Bereich int DEFAULT 0, 
  Flag nvarchar(1) DEFAULT '1', 
  Sortierung int DEFAULT 0, 
  Sortierung2 int DEFAULT 0, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulFaecher PRIMARY KEY (Bezeichnung, BG, Fach, Flag, Schulform)
);


CREATE TABLE Statkue_ZulJahrgaenge (
  ID bigint NOT NULL, 
  Schulform nvarchar(2) NOT NULL, 
  SNR nvarchar(6), 
  FSP nvarchar(2), 
  Jahrgang nvarchar(2), 
  KZ_Bereich int DEFAULT 0, 
  Beschreibung nvarchar(255), 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_ZulKlArt (
  KlArt nvarchar(2) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(100) NOT NULL, 
  Schulform nvarchar(2) NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulKlArt PRIMARY KEY (Bezeichnung, FSP, KlArt, Schulform)
);


CREATE TABLE Statkue_ZulKuArt (
  SF nvarchar(2) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  BG nvarchar(3) NOT NULL, 
  Kursart nvarchar(3) NOT NULL, 
  Kursart2 nvarchar(5) NOT NULL, 
  Bezeichnung nvarchar(120) NOT NULL, 
  SGLBereich int DEFAULT 0 NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime2, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Statkue_ZulKuArt PRIMARY KEY (Bezeichnung, BG, Flag, FSP, SGLBereich, Kursart, Kursart2, SF)
);


CREATE TABLE Stundenplan (
  ID bigint DEFAULT -1 NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Beginn date DEFAULT '1899-01-01' NOT NULL, 
  Ende date, 
  Beschreibung nvarchar(1000) NOT NULL,
  CONSTRAINT PK_Stundenplan PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Stundenplan_Aufsichtsbereiche (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Kuerzel nvarchar(20) NOT NULL, 
  Beschreibung nvarchar(1000) NOT NULL,
  CONSTRAINT PK_Stundenplan_Aufsichtsbereiche PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Aufsichtsbereiche_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Aufsichtsbereiche_UC1 UNIQUE (Stundenplan_ID, Kuerzel)
);


CREATE TABLE Stundenplan_Pausenzeit (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Tag int NOT NULL, 
  Beginn time DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Ende time DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_Stundenplan_Pausenzeit PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenzeit_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_UC1 UNIQUE (Stundenplan_ID, Tag, Beginn, Ende)
);


CREATE TABLE Stundenplan_Pausenaufsichten (
  ID bigint DEFAULT -1 NOT NULL, 
  Pausenzeit_ID bigint NOT NULL, 
  Wochentyp int DEFAULT 0 NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Pausenaufsichten PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenaufsichten_K_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenaufsichten_Pausenzeit_FK FOREIGN KEY (Pausenzeit_ID) REFERENCES Stundenplan_Pausenzeit(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenaufsichten_UC1 UNIQUE (Pausenzeit_ID, Lehrer_ID)
);


CREATE TABLE Stundenplan_PausenaufsichtenBereich (
  ID bigint DEFAULT -1 NOT NULL, 
  Pausenaufsicht_ID bigint NOT NULL, 
  Aufsichtsbereich_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_PausenaufsichtenBereich PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsichtsbereiche_FK FOREIGN KEY (Aufsichtsbereich_ID) REFERENCES Stundenplan_Aufsichtsbereiche(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsicht_FK FOREIGN KEY (Pausenaufsicht_ID) REFERENCES Stundenplan_Pausenaufsichten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_UC1 UNIQUE (Pausenaufsicht_ID, Aufsichtsbereich_ID)
);


CREATE TABLE Stundenplan_Raeume (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Kuerzel nvarchar(20) NOT NULL, 
  Beschreibung nvarchar(1000) NOT NULL, 
  Groesse int DEFAULT 40 NOT NULL,
  CONSTRAINT PK_Stundenplan_Raeume PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Raeume_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Raeume_UC1 UNIQUE (Stundenplan_ID, Kuerzel)
);


CREATE TABLE Stundenplan_Zeitraster (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Tag int NOT NULL, 
  Stunde int NOT NULL, 
  Beginn time DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Ende time DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_Stundenplan_Zeitraster PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Zeitraster_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Zeitraster_UC1 UNIQUE (Stundenplan_ID, Tag, Stunde)
);


CREATE TABLE Stundenplan_Unterricht (
  ID bigint DEFAULT -1 NOT NULL, 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtLehrer PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtLehrer_K_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtLehrer_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtLehrer_UC1 UNIQUE (Unterricht_ID, Lehrer_ID)
);


CREATE TABLE Stundenplan_UnterrichtRaum (
  ID bigint DEFAULT -1 NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Raum_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtRaum PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtRaum_Raeume_FK FOREIGN KEY (Raum_ID) REFERENCES Stundenplan_Raeume(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_UC1 UNIQUE (Unterricht_ID, Raum_ID)
);


CREATE TABLE Stundentafel (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2), 
  SGL nvarchar(3), 
  Fachklasse_ID bigint, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Stundentafel PRIMARY KEY (ID)
);


CREATE TABLE Stundentafel_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundentafel_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5), 
  WochenStd smallint, 
  Lehrer_ID bigint, 
  EpochenUnterricht nvarchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1,
  CONSTRAINT PK_Stundentafel_Faecher PRIMARY KEY (ID),
  CONSTRAINT StundentafelFaecher_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT StundentafelFaecher_Stdtafel_FK FOREIGN KEY (Stundentafel_ID) REFERENCES Stundentafel(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundentafel_Faecher_UC1 UNIQUE (Stundentafel_ID, Fach_ID)
);


CREATE TABLE TextExportVorlagen (
  VorlageName nvarchar(50) NOT NULL, 
  Daten nvarchar(max),
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (VorlageName)
);


CREATE TABLE ZuordnungReportvorlagen (
  ID bigint DEFAULT -1 NOT NULL, 
  Jahrgang_ID bigint, 
  Abschluss nvarchar(50), 
  AbschlussBB nvarchar(50), 
  AbschlussArt int, 
  VersetzungKrz nvarchar(2), 
  Fachklasse_ID bigint, 
  Reportvorlage nvarchar(255), 
  Beschreibung nvarchar(255), 
  Gruppe nvarchar(50), 
  Zeugnisart nvarchar(5),
  CONSTRAINT PK_ZuordnungReportvorlagen PRIMARY KEY (ID),
  CONSTRAINT ZuordnungReportvorlagen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT ZuordnungReportvorlagen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL
);



GO

exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Benutzergruppen ON Benutzergruppen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Benutzergruppen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Benutzergruppen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Benutzergruppen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Benutzergruppen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Benutzergruppen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Benutzergruppen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Benutzergruppen ON Benutzergruppen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Benutzergruppen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Benutzergruppen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Benutzergruppen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Benutzergruppen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Credentials ON Credentials INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Credentials
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Credentials'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Credentials)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Credentials'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Credentials
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Credentials''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Credentials ON Credentials AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Credentials'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Credentials)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Credentials'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Credentials''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_BenutzerAllgemein ON BenutzerAllgemein INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO BenutzerAllgemein
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''BenutzerAllgemein'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM BenutzerAllgemein)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''BenutzerAllgemein'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO BenutzerAllgemein
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''BenutzerAllgemein''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_BenutzerAllgemein ON BenutzerAllgemein AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''BenutzerAllgemein'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM BenutzerAllgemein)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''BenutzerAllgemein'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''BenutzerAllgemein''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Fachklassen ON EigeneSchule_Fachklassen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Fachklassen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Fachklassen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Fachklassen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Fachklassen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Fachklassen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Fachklassen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Fachklassen ON EigeneSchule_Fachklassen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Fachklassen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Fachklassen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Fachklassen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Fachklassen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_KAoADaten ON EigeneSchule_KAoADaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_KAoADaten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_KAoADaten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_KAoADaten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_KAoADaten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_KAoADaten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_KAoADaten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_KAoADaten ON EigeneSchule_KAoADaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_KAoADaten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_KAoADaten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_KAoADaten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_KAoADaten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Kursart ON EigeneSchule_Kursart INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Kursart
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Kursart'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Kursart)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Kursart'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Kursart
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Kursart''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Kursart ON EigeneSchule_Kursart AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Kursart'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Kursart)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Kursart'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Kursart''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Merkmale ON EigeneSchule_Merkmale INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Merkmale
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Merkmale'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Merkmale)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Merkmale'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Merkmale
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Merkmale''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Merkmale ON EigeneSchule_Merkmale AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Merkmale'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Merkmale)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Merkmale'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Merkmale''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Schulformen ON EigeneSchule_Schulformen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Schulformen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Schulformen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Schulformen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Schulformen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Schulformen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Schulformen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Schulformen ON EigeneSchule_Schulformen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Schulformen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Schulformen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Schulformen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Schulformen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Zertifikate ON EigeneSchule_Zertifikate INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Zertifikate
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Zertifikate'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Zertifikate)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Zertifikate'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Zertifikate
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Zertifikate''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Zertifikate ON EigeneSchule_Zertifikate AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Zertifikate'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Zertifikate)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Zertifikate'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Zertifikate''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Faecher ON EigeneSchule_Faecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Faecher
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Faecher'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Faecher)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Faecher'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Faecher
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Faecher''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Faecher ON EigeneSchule_Faecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Faecher'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Faecher)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Faecher'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Faecher''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Blockung ON Gost_Blockung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Blockung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Blockung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Blockung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Blockung ON Gost_Blockung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Blockung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Blockung_Kurse ON Gost_Blockung_Kurse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Blockung_Kurse
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Kurse'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Kurse)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Kurse'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Blockung_Kurse
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Kurse''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Blockung_Kurse ON Gost_Blockung_Kurse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Kurse'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Kurse)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Kurse'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Kurse''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Blockung_Regeln ON Gost_Blockung_Regeln INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Blockung_Regeln
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Regeln'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Regeln)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Regeln'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Blockung_Regeln
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Regeln''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Blockung_Regeln ON Gost_Blockung_Regeln AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Regeln'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Regeln)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Regeln'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Regeln''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Blockung_Schienen ON Gost_Blockung_Schienen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Blockung_Schienen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Schienen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Schienen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Schienen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Blockung_Schienen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Schienen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Blockung_Schienen ON Gost_Blockung_Schienen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Schienen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Schienen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Schienen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Schienen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Blockung_Zwischenergebnisse ON Gost_Blockung_Zwischenergebnisse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Blockung_Zwischenergebnisse
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Zwischenergebnisse'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Zwischenergebnisse)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Zwischenergebnisse'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Blockung_Zwischenergebnisse
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Zwischenergebnisse''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Blockung_Zwischenergebnisse ON Gost_Blockung_Zwischenergebnisse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Blockung_Zwischenergebnisse'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Blockung_Zwischenergebnisse)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Blockung_Zwischenergebnisse'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Blockung_Zwischenergebnisse''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Adressart ON K_Adressart INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Adressart
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Adressart'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Adressart)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Adressart'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Adressart
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Adressart''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Adressart ON K_Adressart AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Adressart'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Adressart)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Adressart'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Adressart''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzdaten ON K_Ankreuzdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Ankreuzdaten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ankreuzdaten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ankreuzdaten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ankreuzdaten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Ankreuzdaten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ankreuzdaten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzdaten ON K_Ankreuzdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ankreuzdaten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ankreuzdaten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ankreuzdaten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ankreuzdaten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzfloskeln ON K_Ankreuzfloskeln INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Ankreuzfloskeln
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ankreuzfloskeln'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ankreuzfloskeln)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ankreuzfloskeln'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Ankreuzfloskeln
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ankreuzfloskeln''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzfloskeln ON K_Ankreuzfloskeln AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ankreuzfloskeln'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ankreuzfloskeln)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ankreuzfloskeln'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ankreuzfloskeln''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_BeschaeftigungsArt ON K_BeschaeftigungsArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_BeschaeftigungsArt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_BeschaeftigungsArt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_BeschaeftigungsArt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_BeschaeftigungsArt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_BeschaeftigungsArt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_BeschaeftigungsArt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_BeschaeftigungsArt ON K_BeschaeftigungsArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_BeschaeftigungsArt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_BeschaeftigungsArt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_BeschaeftigungsArt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_BeschaeftigungsArt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Datenschutz ON K_Datenschutz INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Datenschutz
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Datenschutz'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Datenschutz)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Datenschutz'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Datenschutz
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Datenschutz''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Datenschutz ON K_Datenschutz AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Datenschutz'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Datenschutz)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Datenschutz'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Datenschutz''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_EinschulungsArt ON K_EinschulungsArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_EinschulungsArt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_EinschulungsArt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_EinschulungsArt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_EinschulungsArt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_EinschulungsArt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_EinschulungsArt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_EinschulungsArt ON K_EinschulungsArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_EinschulungsArt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_EinschulungsArt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_EinschulungsArt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_EinschulungsArt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Einzelleistungen ON K_Einzelleistungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Einzelleistungen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Einzelleistungen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Einzelleistungen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Einzelleistungen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Einzelleistungen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Einzelleistungen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Einzelleistungen ON K_Einzelleistungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Einzelleistungen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Einzelleistungen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Einzelleistungen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Einzelleistungen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_EntlassGrund ON K_EntlassGrund INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_EntlassGrund
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_EntlassGrund'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_EntlassGrund)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_EntlassGrund'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_EntlassGrund
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_EntlassGrund''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_EntlassGrund ON K_EntlassGrund AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_EntlassGrund'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_EntlassGrund)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_EntlassGrund'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_EntlassGrund''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherArt ON K_ErzieherArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_ErzieherArt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_ErzieherArt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_ErzieherArt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_ErzieherArt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_ErzieherArt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_ErzieherArt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherArt ON K_ErzieherArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_ErzieherArt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_ErzieherArt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_ErzieherArt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_ErzieherArt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherFunktion ON K_ErzieherFunktion INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_ErzieherFunktion
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_ErzieherFunktion'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_ErzieherFunktion)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_ErzieherFunktion'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_ErzieherFunktion
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_ErzieherFunktion''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherFunktion ON K_ErzieherFunktion AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_ErzieherFunktion'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_ErzieherFunktion)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_ErzieherFunktion'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_ErzieherFunktion''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_FahrschuelerArt ON K_FahrschuelerArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_FahrschuelerArt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_FahrschuelerArt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_FahrschuelerArt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_FahrschuelerArt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_FahrschuelerArt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_FahrschuelerArt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_FahrschuelerArt ON K_FahrschuelerArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_FahrschuelerArt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_FahrschuelerArt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_FahrschuelerArt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_FahrschuelerArt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Foerderschwerpunkt ON K_Foerderschwerpunkt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Foerderschwerpunkt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Foerderschwerpunkt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Foerderschwerpunkt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Foerderschwerpunkt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Foerderschwerpunkt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Foerderschwerpunkt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Foerderschwerpunkt ON K_Foerderschwerpunkt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Foerderschwerpunkt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Foerderschwerpunkt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Foerderschwerpunkt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Foerderschwerpunkt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Haltestelle ON K_Haltestelle INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Haltestelle
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Haltestelle'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Haltestelle)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Haltestelle'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Haltestelle
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Haltestelle''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Haltestelle ON K_Haltestelle AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Haltestelle'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Haltestelle)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Haltestelle'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Haltestelle''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Kindergarten ON K_Kindergarten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Kindergarten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Kindergarten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Kindergarten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Kindergarten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Kindergarten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Kindergarten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Kindergarten ON K_Kindergarten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Kindergarten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Kindergarten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Kindergarten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Kindergarten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ort ON K_Ort INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Ort
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ort'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ort)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ort'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Ort
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ort''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ort ON K_Ort AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ort'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ort)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ort'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ort''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_AllgAdresse ON K_AllgAdresse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_AllgAdresse
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_AllgAdresse'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_AllgAdresse)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_AllgAdresse'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_AllgAdresse
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_AllgAdresse''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_AllgAdresse ON K_AllgAdresse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_AllgAdresse'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_AllgAdresse)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_AllgAdresse'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_AllgAdresse''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_AllgAdrAnsprechpartner ON AllgAdrAnsprechpartner INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO AllgAdrAnsprechpartner
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''AllgAdrAnsprechpartner'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM AllgAdrAnsprechpartner)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''AllgAdrAnsprechpartner'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO AllgAdrAnsprechpartner
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''AllgAdrAnsprechpartner''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_AllgAdrAnsprechpartner ON AllgAdrAnsprechpartner AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''AllgAdrAnsprechpartner'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM AllgAdrAnsprechpartner)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''AllgAdrAnsprechpartner'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''AllgAdrAnsprechpartner''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ortsteil ON K_Ortsteil INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Ortsteil
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ortsteil'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ortsteil)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ortsteil'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Ortsteil
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ortsteil''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ortsteil ON K_Ortsteil AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Ortsteil'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ortsteil)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Ortsteil'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Ortsteil''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Religion ON K_Religion INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Religion
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Religion'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Religion)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Religion'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Religion
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Religion''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Religion ON K_Religion AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Religion'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Religion)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Religion'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Religion''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schule ON K_Schule INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Schule
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Schule'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Schule)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Schule'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Schule
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Schule''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schule ON K_Schule AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Schule'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Schule)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Schule'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Schule''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schulfunktionen ON K_Schulfunktionen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Schulfunktionen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Schulfunktionen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Schulfunktionen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Schulfunktionen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Schulfunktionen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Schulfunktionen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schulfunktionen ON K_Schulfunktionen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Schulfunktionen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Schulfunktionen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Schulfunktionen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Schulfunktionen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schwerpunkt ON K_Schwerpunkt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Schwerpunkt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Schwerpunkt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Schwerpunkt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Schwerpunkt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Schwerpunkt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Schwerpunkt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schwerpunkt ON K_Schwerpunkt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Schwerpunkt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Schwerpunkt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Schwerpunkt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Schwerpunkt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Sportbefreiung ON K_Sportbefreiung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Sportbefreiung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Sportbefreiung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Sportbefreiung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Sportbefreiung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Sportbefreiung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Sportbefreiung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Sportbefreiung ON K_Sportbefreiung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Sportbefreiung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Sportbefreiung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Sportbefreiung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Sportbefreiung''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_TelefonArt ON K_TelefonArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_TelefonArt
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_TelefonArt'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_TelefonArt)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_TelefonArt'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_TelefonArt
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_TelefonArt''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_TelefonArt ON K_TelefonArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_TelefonArt'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_TelefonArt)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_TelefonArt'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_TelefonArt''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Textdateien ON K_Textdateien INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Textdateien
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Textdateien'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Textdateien)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Textdateien'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Textdateien
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Textdateien''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Textdateien ON K_Textdateien AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Textdateien'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Textdateien)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Textdateien'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Textdateien''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Vermerkart ON K_Vermerkart INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Vermerkart
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Vermerkart'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Vermerkart)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Vermerkart'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Vermerkart
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Vermerkart''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Vermerkart ON K_Vermerkart AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Vermerkart'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Vermerkart)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Vermerkart'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Vermerkart''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Aufsichtsbereich ON Katalog_Aufsichtsbereich INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Katalog_Aufsichtsbereich
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Aufsichtsbereich'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Aufsichtsbereich)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Aufsichtsbereich'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Katalog_Aufsichtsbereich
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Aufsichtsbereich''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Aufsichtsbereich ON Katalog_Aufsichtsbereich AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Aufsichtsbereich'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Aufsichtsbereich)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Aufsichtsbereich'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Aufsichtsbereich''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Pausenzeiten ON Katalog_Pausenzeiten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Katalog_Pausenzeiten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Pausenzeiten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Pausenzeiten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Pausenzeiten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Katalog_Pausenzeiten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Pausenzeiten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Pausenzeiten ON Katalog_Pausenzeiten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Pausenzeiten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Pausenzeiten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Pausenzeiten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Pausenzeiten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Raeume ON Katalog_Raeume INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Katalog_Raeume
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Raeume'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Raeume)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Raeume'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Katalog_Raeume
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Raeume''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Raeume ON Katalog_Raeume AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Raeume'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Raeume)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Raeume'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Raeume''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Zeitraster ON Katalog_Zeitraster INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Katalog_Zeitraster
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Zeitraster'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Zeitraster)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Zeitraster'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Katalog_Zeitraster
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Zeitraster''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Zeitraster ON Katalog_Zeitraster AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Katalog_Zeitraster'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Zeitraster)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Katalog_Zeitraster'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Katalog_Zeitraster''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Lernplattformen ON Lernplattformen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Lernplattformen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Lernplattformen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Lernplattformen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Lernplattformen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Lernplattformen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Lernplattformen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Lernplattformen ON Lernplattformen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Lernplattformen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Lernplattformen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Lernplattformen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Lernplattformen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_CredentialsLernplattformen ON CredentialsLernplattformen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO CredentialsLernplattformen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''CredentialsLernplattformen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM CredentialsLernplattformen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''CredentialsLernplattformen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO CredentialsLernplattformen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''CredentialsLernplattformen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_CredentialsLernplattformen ON CredentialsLernplattformen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''CredentialsLernplattformen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM CredentialsLernplattformen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''CredentialsLernplattformen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''CredentialsLernplattformen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen ON Personengruppen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Personengruppen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Personengruppen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Personengruppen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Personengruppen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Personengruppen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Personengruppen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen ON Personengruppen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Personengruppen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Personengruppen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Personengruppen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Personengruppen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen_Personen ON Personengruppen_Personen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Personengruppen_Personen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Personengruppen_Personen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Personengruppen_Personen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Personengruppen_Personen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Personengruppen_Personen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Personengruppen_Personen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen_Personen ON Personengruppen_Personen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Personengruppen_Personen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Personengruppen_Personen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Personengruppen_Personen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Personengruppen_Personen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchildFilter ON SchildFilter INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchildFilter
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchildFilter'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchildFilter)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchildFilter'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchildFilter
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchildFilter''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchildFilter ON SchildFilter AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchildFilter'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchildFilter)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchildFilter'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchildFilter''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerListe ON SchuelerListe INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerListe
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerListe'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerListe)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerListe'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerListe
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerListe''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerListe ON SchuelerListe AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerListe'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerListe)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerListe'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerListe''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Schuljahresabschnitte ON Schuljahresabschnitte INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Schuljahresabschnitte
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schuljahresabschnitte'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Schuljahresabschnitte)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schuljahresabschnitte'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Schuljahresabschnitte
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schuljahresabschnitte''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Schuljahresabschnitte ON Schuljahresabschnitte AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schuljahresabschnitte'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Schuljahresabschnitte)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schuljahresabschnitte'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schuljahresabschnitte''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchulleitungFunktion ON SchulleitungFunktion INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchulleitungFunktion
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchulleitungFunktion'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchulleitungFunktion)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchulleitungFunktion'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchulleitungFunktion
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchulleitungFunktion''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchulleitungFunktion ON SchulleitungFunktion AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchulleitungFunktion'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchulleitungFunktion)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchulleitungFunktion'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchulleitungFunktion''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_K_Lehrer ON K_Lehrer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO K_Lehrer
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Lehrer'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Lehrer)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Lehrer'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO K_Lehrer
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Lehrer''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Lehrer ON K_Lehrer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''K_Lehrer'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Lehrer)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''K_Lehrer'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''K_Lehrer''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abteilungen ON EigeneSchule_Abteilungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Abteilungen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Abteilungen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abteilungen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Abteilungen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Abteilungen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Abteilungen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abteilungen ON EigeneSchule_Abteilungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Abteilungen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abteilungen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Abteilungen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Abteilungen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerAbschnittsdaten ON LehrerAbschnittsdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO LehrerAbschnittsdaten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerAbschnittsdaten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM LehrerAbschnittsdaten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerAbschnittsdaten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO LehrerAbschnittsdaten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerAbschnittsdaten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerAbschnittsdaten ON LehrerAbschnittsdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerAbschnittsdaten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM LehrerAbschnittsdaten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerAbschnittsdaten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerAbschnittsdaten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Schulleitung ON Schulleitung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Schulleitung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schulleitung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Schulleitung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schulleitung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Schulleitung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schulleitung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Schulleitung ON Schulleitung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schulleitung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Schulleitung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schulleitung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schulleitung''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerAnrechnung ON LehrerAnrechnung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO LehrerAnrechnung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerAnrechnung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM LehrerAnrechnung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerAnrechnung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO LehrerAnrechnung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerAnrechnung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerAnrechnung ON LehrerAnrechnung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerAnrechnung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM LehrerAnrechnung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerAnrechnung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerAnrechnung''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerEntlastung ON LehrerEntlastung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO LehrerEntlastung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerEntlastung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM LehrerEntlastung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerEntlastung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO LehrerEntlastung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerEntlastung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerEntlastung ON LehrerEntlastung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerEntlastung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM LehrerEntlastung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerEntlastung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerEntlastung''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerFunktionen ON LehrerFunktionen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO LehrerFunktionen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerFunktionen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM LehrerFunktionen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerFunktionen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO LehrerFunktionen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerFunktionen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerFunktionen ON LehrerFunktionen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerFunktionen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM LehrerFunktionen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerFunktionen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerFunktionen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerMehrleistung ON LehrerMehrleistung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO LehrerMehrleistung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerMehrleistung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM LehrerMehrleistung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerMehrleistung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO LehrerMehrleistung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerMehrleistung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerMehrleistung ON LehrerMehrleistung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''LehrerMehrleistung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM LehrerMehrleistung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''LehrerMehrleistung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''LehrerMehrleistung''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Jahrgaenge ON EigeneSchule_Jahrgaenge INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Jahrgaenge
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Jahrgaenge'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Jahrgaenge)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Jahrgaenge'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Jahrgaenge
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Jahrgaenge''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Jahrgaenge ON EigeneSchule_Jahrgaenge AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Jahrgaenge'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Jahrgaenge)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Jahrgaenge'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Jahrgaenge''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Klassen ON Klassen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Klassen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Klassen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Klassen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Klassen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Klassen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Klassen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Klassen ON Klassen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Klassen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Klassen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Klassen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Klassen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Kurse ON Kurse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Kurse
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Kurse'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Kurse)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Kurse'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Kurse
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Kurse''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Kurse ON Kurse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Kurse'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Kurse)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Kurse'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Kurse''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Schueler ON Schueler INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Schueler
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schueler'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Schueler)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schueler'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Schueler
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schueler''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler ON Schueler AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schueler'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Schueler)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schueler'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schueler''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abt_Kl ON EigeneSchule_Abt_Kl INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO EigeneSchule_Abt_Kl
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Abt_Kl'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abt_Kl)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Abt_Kl'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO EigeneSchule_Abt_Kl
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Abt_Kl''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abt_Kl ON EigeneSchule_Abt_Kl AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''EigeneSchule_Abt_Kl'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abt_Kl)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''EigeneSchule_Abt_Kl'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''EigeneSchule_Abt_Kl''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbgaenge ON SchuelerAbgaenge INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerAbgaenge
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAbgaenge'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAbgaenge)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAbgaenge'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerAbgaenge
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAbgaenge''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbgaenge ON SchuelerAbgaenge AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAbgaenge'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAbgaenge)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAbgaenge'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAbgaenge''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbiFaecher ON SchuelerAbiFaecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerAbiFaecher
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAbiFaecher'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAbiFaecher)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAbiFaecher'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerAbiFaecher
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAbiFaecher''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbiFaecher ON SchuelerAbiFaecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAbiFaecher'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAbiFaecher)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAbiFaecher'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAbiFaecher''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbitur ON SchuelerAbitur INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerAbitur
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAbitur'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAbitur)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAbitur'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerAbitur
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAbitur''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbitur ON SchuelerAbitur AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAbitur'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAbitur)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAbitur'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAbitur''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerBKFaecher ON SchuelerBKFaecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerBKFaecher
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerBKFaecher'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerBKFaecher)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerBKFaecher'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerBKFaecher
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerBKFaecher''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerBKFaecher ON SchuelerBKFaecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerBKFaecher'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerBKFaecher)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerBKFaecher'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerBKFaecher''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerErzAdr ON SchuelerErzAdr INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerErzAdr
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerErzAdr'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerErzAdr)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerErzAdr'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerErzAdr
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerErzAdr''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerErzAdr ON SchuelerErzAdr AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerErzAdr'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerErzAdr)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerErzAdr'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerErzAdr''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHR ON SchuelerFHR INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerFHR
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerFHR'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerFHR)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerFHR'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerFHR
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerFHR''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHR ON SchuelerFHR AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerFHR'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerFHR)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerFHR'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerFHR''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHRFaecher ON SchuelerFHRFaecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerFHRFaecher
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerFHRFaecher'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerFHRFaecher)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerFHRFaecher'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerFHRFaecher
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerFHRFaecher''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHRFaecher ON SchuelerFHRFaecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerFHRFaecher'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerFHRFaecher)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerFHRFaecher'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerFHRFaecher''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLernabschnittsdaten ON SchuelerLernabschnittsdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerLernabschnittsdaten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerLernabschnittsdaten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerLernabschnittsdaten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerLernabschnittsdaten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerLernabschnittsdaten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerLernabschnittsdaten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLernabschnittsdaten ON SchuelerLernabschnittsdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerLernabschnittsdaten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerLernabschnittsdaten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerLernabschnittsdaten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerLernabschnittsdaten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerSprachenfolge ON SchuelerSprachenfolge INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerSprachenfolge
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerSprachenfolge'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerSprachenfolge)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerSprachenfolge'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerSprachenfolge
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerSprachenfolge''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerSprachenfolge ON SchuelerSprachenfolge AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerSprachenfolge'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerSprachenfolge)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerSprachenfolge'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerSprachenfolge''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerSprachpruefungen ON SchuelerSprachpruefungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerSprachpruefungen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerSprachpruefungen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerSprachpruefungen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerSprachpruefungen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerSprachpruefungen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerSprachpruefungen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerSprachpruefungen ON SchuelerSprachpruefungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerSprachpruefungen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerSprachpruefungen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerSprachpruefungen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerSprachpruefungen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerTelefone ON SchuelerTelefone INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerTelefone
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerTelefone'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerTelefone)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerTelefone'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerTelefone
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerTelefone''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerTelefone ON SchuelerTelefone AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerTelefone'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerTelefone)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerTelefone'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerTelefone''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerVermerke ON SchuelerVermerke INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerVermerke
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerVermerke'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerVermerke)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerVermerke'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerVermerke
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerVermerke''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerVermerke ON SchuelerVermerke AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerVermerke'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerVermerke)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerVermerke'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerVermerke''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerZP10 ON SchuelerZP10 INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerZP10
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerZP10'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerZP10)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerZP10'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerZP10
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerZP10''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerZP10 ON SchuelerZP10 AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerZP10'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerZP10)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerZP10'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerZP10''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Schueler_AllgAdr ON Schueler_AllgAdr INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Schueler_AllgAdr
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schueler_AllgAdr'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Schueler_AllgAdr)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schueler_AllgAdr'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Schueler_AllgAdr
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schueler_AllgAdr''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler_AllgAdr ON Schueler_AllgAdr AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Schueler_AllgAdr'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Schueler_AllgAdr)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Schueler_AllgAdr'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Schueler_AllgAdr''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Benutzer ON Benutzer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Benutzer
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Benutzer'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Benutzer)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Benutzer'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Benutzer
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Benutzer''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Benutzer ON Benutzer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Benutzer'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Benutzer)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Benutzer'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Benutzer''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAnkreuzfloskeln ON SchuelerAnkreuzfloskeln INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerAnkreuzfloskeln
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAnkreuzfloskeln'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAnkreuzfloskeln)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAnkreuzfloskeln'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerAnkreuzfloskeln
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAnkreuzfloskeln''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAnkreuzfloskeln ON SchuelerAnkreuzfloskeln AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerAnkreuzfloskeln'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAnkreuzfloskeln)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerAnkreuzfloskeln'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerAnkreuzfloskeln''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFehlstunden ON SchuelerFehlstunden INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerFehlstunden
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerFehlstunden'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerFehlstunden)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerFehlstunden'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerFehlstunden
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerFehlstunden''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFehlstunden ON SchuelerFehlstunden AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerFehlstunden'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerFehlstunden)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerFehlstunden'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerFehlstunden''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerKAoADaten ON SchuelerKAoADaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerKAoADaten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerKAoADaten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerKAoADaten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerKAoADaten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerKAoADaten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerKAoADaten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerKAoADaten ON SchuelerKAoADaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerKAoADaten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerKAoADaten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerKAoADaten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerKAoADaten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLD_PSFachBem ON SchuelerLD_PSFachBem INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerLD_PSFachBem
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerLD_PSFachBem'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerLD_PSFachBem)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerLD_PSFachBem'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerLD_PSFachBem
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerLD_PSFachBem''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLD_PSFachBem ON SchuelerLD_PSFachBem AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerLD_PSFachBem'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerLD_PSFachBem)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerLD_PSFachBem'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerLD_PSFachBem''
    END
END;
')

GO


CREATE TRIGGER t_INSERT_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER
ON SchuelerLeistungsdaten AFTER INSERT AS
BEGIN
	INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID)
		SELECT 
			i.Kurs_ID, sla.Schueler_ID 
		FROM
	  		Inserted i JOIN SchuelerLernabschnittsdaten sla ON i.Abschnitt_ID = sla.ID
		WHERE
	  		i.Kurs_ID IS NOT NULL
END;
GO


CREATE TRIGGER t_UPDATE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER
ON SchuelerLeistungsdaten AFTER UPDATE AS
BEGIN	
	DELETE Kurs_Schueler FROM  
		Inserted i JOIN Deleted d ON i.ID = d.ID AND i.Kurs_ID IS NULL AND d.Kurs_ID IS NOT NULL
			JOIN SchuelerLernabschnittsdaten sla ON sla.ID = d.Abschnitt_ID
			JOIN Kurs_Schueler ks ON ks.Kurs_ID = d.Kurs_ID AND ks.Schueler_ID = sla.Schueler_ID
	INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID)
		SELECT 
			i.Kurs_ID, sla.Schueler_ID 
		FROM
			Inserted i JOIN Deleted d ON i.ID = d.ID AND i.Kurs_ID IS NOT NULL AND d.Kurs_ID IS NULL
				JOIN SchuelerLernabschnittsdaten sla ON sla.ID = i.Abschnitt_ID
	UPDATE Kurs_Schueler
		SET Kurs_ID = i.Kurs_ID, Schueler_ID = sla.Schueler_ID
		FROM 
			Inserted i JOIN Deleted d ON i.ID = d.ID AND i.Kurs_ID IS NOT NULL AND d.Kurs_ID IS NOT NULL AND i.Kurs_ID <> d.Kurs_ID AND i.Abschnitt_ID = d.Abschnitt_ID
				JOIN SchuelerLernabschnittsdaten sla ON sla.ID = d.Abschnitt_ID
	UPDATE Kurs_Schueler
		SET Kurs_ID = i.Kurs_ID, Schueler_ID = sla.Schueler_ID
		FROM 
			Inserted i JOIN Deleted d ON i.ID = d.ID AND i.Kurs_ID IS NOT NULL AND d.Kurs_ID IS NOT NULL AND i.Kurs_ID <> d.Kurs_ID AND i.Abschnitt_ID <> d.Abschnitt_ID
				JOIN SchuelerLernabschnittsdaten sla ON sla.ID = i.Abschnitt_ID
END;
GO


CREATE TRIGGER t_DELETE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER
ON SchuelerLeistungsdaten AFTER DELETE AS
BEGIN
	DELETE Kurs_Schueler FROM  
		Deleted d 
			JOIN SchuelerLernabschnittsdaten sla ON sla.ID = d.Abschnitt_ID AND d.Kurs_ID IS NOT NULL
			JOIN Kurs_Schueler ks ON ks.Kurs_ID = d.Kurs_ID AND ks.Schueler_ID = sla.Schueler_ID
END;
GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLeistungsdaten ON SchuelerLeistungsdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerLeistungsdaten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerLeistungsdaten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerLeistungsdaten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerLeistungsdaten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerLeistungsdaten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerLeistungsdaten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLeistungsdaten ON SchuelerLeistungsdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerLeistungsdaten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerLeistungsdaten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerLeistungsdaten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerLeistungsdaten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerEinzelleistungen ON SchuelerEinzelleistungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerEinzelleistungen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerEinzelleistungen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerEinzelleistungen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerEinzelleistungen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerEinzelleistungen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerEinzelleistungen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerEinzelleistungen ON SchuelerEinzelleistungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerEinzelleistungen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerEinzelleistungen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerEinzelleistungen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerEinzelleistungen''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerWiedervorlage ON SchuelerWiedervorlage INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO SchuelerWiedervorlage
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerWiedervorlage'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerWiedervorlage)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerWiedervorlage'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO SchuelerWiedervorlage
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerWiedervorlage''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerWiedervorlage ON SchuelerWiedervorlage AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''SchuelerWiedervorlage'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerWiedervorlage)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''SchuelerWiedervorlage'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''SchuelerWiedervorlage''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan ON Stundenplan INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan ON Stundenplan AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Aufsichtsbereiche ON Stundenplan_Aufsichtsbereiche INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Aufsichtsbereiche
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Aufsichtsbereiche'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Aufsichtsbereiche)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Aufsichtsbereiche'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Aufsichtsbereiche
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Aufsichtsbereiche''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Aufsichtsbereiche ON Stundenplan_Aufsichtsbereiche AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Aufsichtsbereiche'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Aufsichtsbereiche)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Aufsichtsbereiche'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Aufsichtsbereiche''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenzeit ON Stundenplan_Pausenzeit INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Pausenzeit
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Pausenzeit'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenzeit)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Pausenzeit'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Pausenzeit
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Pausenzeit''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenzeit ON Stundenplan_Pausenzeit AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Pausenzeit'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenzeit)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Pausenzeit'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Pausenzeit''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenaufsichten ON Stundenplan_Pausenaufsichten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Pausenaufsichten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Pausenaufsichten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenaufsichten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Pausenaufsichten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Pausenaufsichten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Pausenaufsichten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenaufsichten ON Stundenplan_Pausenaufsichten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Pausenaufsichten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenaufsichten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Pausenaufsichten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Pausenaufsichten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_PausenaufsichtenBereich ON Stundenplan_PausenaufsichtenBereich INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_PausenaufsichtenBereich
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_PausenaufsichtenBereich'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_PausenaufsichtenBereich)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_PausenaufsichtenBereich'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_PausenaufsichtenBereich
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_PausenaufsichtenBereich''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_PausenaufsichtenBereich ON Stundenplan_PausenaufsichtenBereich AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_PausenaufsichtenBereich'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_PausenaufsichtenBereich)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_PausenaufsichtenBereich'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_PausenaufsichtenBereich''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Raeume ON Stundenplan_Raeume INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Raeume
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Raeume'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Raeume)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Raeume'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Raeume
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Raeume''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Raeume ON Stundenplan_Raeume AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Raeume'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Raeume)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Raeume'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Raeume''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Zeitraster ON Stundenplan_Zeitraster INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Zeitraster
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Zeitraster'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Zeitraster)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Zeitraster'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Zeitraster
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Zeitraster''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Zeitraster ON Stundenplan_Zeitraster AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Zeitraster'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Zeitraster)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Zeitraster'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Zeitraster''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Unterricht ON Stundenplan_Unterricht INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Unterricht
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Unterricht'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Unterricht)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Unterricht'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Unterricht
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Unterricht''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Unterricht ON Stundenplan_Unterricht AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Unterricht'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Unterricht)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Unterricht'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Unterricht''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtLehrer ON Stundenplan_UnterrichtLehrer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_UnterrichtLehrer
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtLehrer'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtLehrer)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtLehrer'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_UnterrichtLehrer
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtLehrer''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtLehrer ON Stundenplan_UnterrichtLehrer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtLehrer'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtLehrer)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtLehrer'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtLehrer''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtRaum ON Stundenplan_UnterrichtRaum INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_UnterrichtRaum
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtRaum'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtRaum)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtRaum'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_UnterrichtRaum
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtRaum''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtRaum ON Stundenplan_UnterrichtRaum AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtRaum'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtRaum)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtRaum'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtRaum''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel ON Stundentafel INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundentafel
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundentafel'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundentafel)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundentafel'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundentafel
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundentafel''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel ON Stundentafel AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundentafel'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundentafel)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundentafel'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundentafel''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel_Faecher ON Stundentafel_Faecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundentafel_Faecher
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundentafel_Faecher'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundentafel_Faecher)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundentafel_Faecher'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundentafel_Faecher
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundentafel_Faecher''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel_Faecher ON Stundentafel_Faecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundentafel_Faecher'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundentafel_Faecher)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundentafel_Faecher'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundentafel_Faecher''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_ZuordnungReportvorlagen ON ZuordnungReportvorlagen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO ZuordnungReportvorlagen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''ZuordnungReportvorlagen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM ZuordnungReportvorlagen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''ZuordnungReportvorlagen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO ZuordnungReportvorlagen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''ZuordnungReportvorlagen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_ZuordnungReportvorlagen ON ZuordnungReportvorlagen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''ZuordnungReportvorlagen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM ZuordnungReportvorlagen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''ZuordnungReportvorlagen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''ZuordnungReportvorlagen''
    END
END;
')

GO





INSERT INTO SVWS_DB_Version(Revision) VALUES (7);


INSERT INTO Credentials(ID, Benutzername, BenutzernamePseudonym, Initialkennwort, PasswordHash, RSAPublicKey, RSAPrivateKey, AES) VALUES (1, 'Admin', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO BenutzerAllgemein(ID,AnzeigeName,CredentialID) VALUES (1,'Administrator',1);

INSERT INTO Benutzer(ID, Typ, Allgemein_ID, Lehrer_ID, Schueler_ID, Erzieher_ID, IstAdmin) VALUES (1, 0, 1, NULL, NULL, NULL, 1)

INSERT INTO Benutzergruppen(ID, Bezeichnung, IstAdmin) VALUES (1, 'Administrator', 1),(2, 'Lehrer', 0),(3, 'Sekretariat', 0);

INSERT INTO BenutzergruppenMitglieder(Gruppe_ID, Benutzer_ID) VALUES (1, 1);

INSERT INTO BenutzergruppenKompetenzen(Gruppe_ID, Kompetenz_ID) VALUES (2, 11), (2, 21), (2, 22), (2, 31), (2, 61), (2, 81),(3, 11),(3, 12),(3, 13),(3, 14),(3, 21),(3, 31),(3, 32),(3, 33),(3, 34),(3, 61),(3, 62),(3, 71),(3, 81),(3, 82),(3, 83),(3, 91),(3, 92),(3, 93),(3, 94),(3, 95);
