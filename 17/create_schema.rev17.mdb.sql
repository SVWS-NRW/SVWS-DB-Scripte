CREATE TABLE AllgemeineMerkmaleKatalog_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_AllgemeineMerkmaleKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Benutzergruppen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  IstAdmin int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Benutzergruppen PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Anlagen (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Anlagen PRIMARY KEY (ID),
  CONSTRAINT Berufskolleg_Anlagen_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Berufskolleg_Berufsebenen1 (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Berufsebenen1 PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Berufsebenen2 (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Berufsebenen2 PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Berufsebenen3 (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Berufsebenen3 PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Fachklassen_Keys (
  FachklassenIndex int NOT NULL, 
  Schluessel varchar(3) NOT NULL, 
  Schluessel2 varchar(2) NOT NULL,
  CONSTRAINT PK_Berufskolleg_Fachklassen_Keys PRIMARY KEY (FachklassenIndex, Schluessel, Schluessel2)
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
  Kursart varchar(10), 
  KursartAllg varchar(10), 
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


CREATE TABLE EinschulungsartKatalog_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_EinschulungsartKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE FachKatalog (
  ID bigint NOT NULL, 
  KuerzelASD varchar(10) NOT NULL, 
  Bezeichnung varchar(255) NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Aufgabenfeld int, 
  Fachgruppe varchar(10), 
  JahrgangAb varchar(10), 
  IstFremdsprache int DEFAULT 0 NOT NULL, 
  IstHKFS int DEFAULT 0 NOT NULL, 
  IstAusRegUFach int DEFAULT 0 NOT NULL, 
  IstErsatzPflichtFS int DEFAULT 0 NOT NULL, 
  IstKonfKoop int DEFAULT 0 NOT NULL, 
  NurSII int DEFAULT 0 NOT NULL, 
  ExportASD int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_FachKatalog PRIMARY KEY (ID)
);


CREATE TABLE FachKatalog_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_FachKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE FachKatalog_Schulformen (
  Fach_ID bigint NOT NULL, 
  Schulform_Kuerzel varchar(10) NOT NULL, 
  Schulgliederung_Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_FachKatalog_Schulformen PRIMARY KEY (Fach_ID, Schulform_Kuerzel, Schulgliederung_Kuerzel)
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
  IstPruefungsordnungsRelevant smallint DEFAULT 1 NOT NULL, 
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
  Kursart varchar(10),
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Teilleistung_ID, Fach_ID, Kursart),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgangsdaten (
  Abi_Jahrgang int NOT NULL, 
  ZusatzkursGEVorhanden int DEFAULT 1, 
  ZusatzkursGEErstesHalbjahr varchar(4) DEFAULT 'Q2.1', 
  ZusatzkursSWVorhanden int DEFAULT 1, 
  ZusatzkursSWErstesHalbjahr varchar(4) DEFAULT 'Q2.1', 
  TextBeratungsbogen varchar(2000), 
  TextMailversand varchar(2000),
  CONSTRAINT PK_Gost_Jahrgangsdaten PRIMARY KEY (Abi_Jahrgang),
  CONSTRAINT Gost_Jahrgangsdaten_UC_Abi_Jahrgang UNIQUE (Abi_Jahrgang)
);


CREATE TABLE Gost_Jahrgang_Fachwahlen (
  Abi_Jahrgang int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  EF1_Kursart varchar(10), 
  EF2_Kursart varchar(10), 
  Q11_Kursart varchar(10), 
  Q12_Kursart varchar(10), 
  Q21_Kursart varchar(10), 
  Q22_Kursart varchar(10), 
  AbiturFach int, 
  Bemerkungen varchar(50),
  CONSTRAINT PK_Gost_Jahrgang_Fachwahlen PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Fachwahlen_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachwahlen_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Jahrgang_Fachwahlen_IDX_Abi_Jahrgang ON Gost_Jahrgang_Fachwahlen(Abi_Jahrgang);
CREATE INDEX Gost_Jahrgang_Fachwahlen_IDX_Abi_Jahrgang_Fach_ID ON Gost_Jahrgang_Fachwahlen(Abi_Jahrgang, Fach_ID);


CREATE TABLE Gost_Blockung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Name varchar(255) DEFAULT 'Neue Blockung' NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL, 
  IstAktiv int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Blockung PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgang_Fachkombinationen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abi_Jahrgang int DEFAULT -1 NOT NULL, 
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 varchar(10), 
  Kursart2 varchar(10), 
  EF1 int DEFAULT 1 NOT NULL, 
  EF2 int DEFAULT 1 NOT NULL, 
  Q11 int DEFAULT 1 NOT NULL, 
  Q12 int DEFAULT 1 NOT NULL, 
  Q21 int DEFAULT 1 NOT NULL, 
  Q22 int DEFAULT 1 NOT NULL, 
  Typ int DEFAULT 0 NOT NULL, 
  Hinweistext varchar(255) DEFAULT '' NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Fachkombinationen PRIMARY KEY (ID),
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Fach1_ID_FK FOREIGN KEY (Fach1_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Fach2_ID_FK FOREIGN KEY (Fach2_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Jahrgang_Fachkombinationen_IDX_Abi_Jahrgang ON Gost_Jahrgang_Fachkombinationen(Abi_Jahrgang);


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
  WochenstundenQPhase int,
  CONSTRAINT PK_Gost_Jahrgang_Faecher PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Faecher_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Faecher_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Jahrgang_Faecher_IDX_Abi_Jahrgang ON Gost_Jahrgang_Faecher(Abi_Jahrgang);
CREATE INDEX Gost_Jahrgang_Faecher_IDX_Abi_Jahrgang_Fach_ID ON Gost_Jahrgang_Faecher(Abi_Jahrgang, Fach_ID);


CREATE TABLE Gost_Blockung_Kurse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(10) DEFAULT 'GK' NOT NULL, 
  Kursnummer int NOT NULL, 
  IstKoopKurs int DEFAULT 0 NOT NULL, 
  BezeichnungSuffix varchar(255), 
  Schienenanzahl int DEFAULT 1 NOT NULL, 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Kurse PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Kurse_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Kurse_IDX_Blockung_ID ON Gost_Blockung_Kurse(Blockung_ID);


CREATE TABLE Gost_Blockung_Regeln (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Typ int NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Regeln PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Regeln_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Regeln_IDX_Blockung_ID ON Gost_Blockung_Regeln(Blockung_ID);
CREATE INDEX Gost_Blockung_Regeln_IDX_Blockung_ID_Typ ON Gost_Blockung_Regeln(Blockung_ID, Typ);


CREATE TABLE Gost_Blockung_Schienen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Nummer int NOT NULL, 
  Bezeichnung varchar(255) DEFAULT 'Schiene' NOT NULL, 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Schienen PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Schienen_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Schienen_IDX_Blockung_ID ON Gost_Blockung_Schienen(Blockung_ID);
CREATE INDEX Gost_Blockung_Schienen_IDX_Blockung_ID_Nummer ON Gost_Blockung_Schienen(Blockung_ID, Nummer);


CREATE TABLE Gost_Blockung_Zwischenergebnisse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  IstAktiv int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Blockung_FK FOREIGN KEY (Blockung_ID) REFERENCES Gost_Blockung(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Zwischenergebnisse_IDX_Blockung_ID ON Gost_Blockung_Zwischenergebnisse(Blockung_ID);


CREATE TABLE Gost_Blockung_Regelparameter (
  Regel_ID bigint NOT NULL, 
  Nummer int NOT NULL, 
  Parameter bigint NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Regelparameter PRIMARY KEY (Regel_ID, Nummer),
  CONSTRAINT Gost_Blockung_Regelparameter_Regel_FK FOREIGN KEY (Regel_ID) REFERENCES Gost_Blockung_Regeln(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Regelparameter_IDX_Regel_ID ON Gost_Blockung_Regelparameter(Regel_ID);
CREATE INDEX Gost_Blockung_Regelparameter_IDX_Regel_ID_Nummer ON Gost_Blockung_Regelparameter(Regel_ID, Nummer);
CREATE INDEX Gost_Blockung_Regelparameter_IDX_Regel_ID_Nummer_Parameter ON Gost_Blockung_Regelparameter(Regel_ID, Nummer, Parameter);


CREATE TABLE Gost_Blockung_Zwischenergebnisse_Kurs_Schienen (
  Zwischenergebnis_ID bigint NOT NULL, 
  Blockung_Kurs_ID bigint NOT NULL, 
  Schienen_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schienen PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schienen_ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_ErgID_FK FOREIGN KEY (Zwischenergebnis_ID) REFERENCES Gost_Blockung_Zwischenergebnisse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_Schiene_FK FOREIGN KEY (Schienen_ID) REFERENCES Gost_Blockung_Schienen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_IDX1 ON Gost_Blockung_Zwischenergebnisse_Kurs_Schienen(Zwischenergebnis_ID);
CREATE INDEX Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_IDX2 ON Gost_Blockung_Zwischenergebnisse_Kurs_Schienen(Zwischenergebnis_ID, Blockung_Kurs_ID);
CREATE INDEX Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_IDX3 ON Gost_Blockung_Zwischenergebnisse_Kurs_Schienen(Zwischenergebnis_ID, Schienen_ID);


CREATE TABLE Herkunft (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Beschreibung varchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Herkunft PRIMARY KEY (ID)
);


CREATE TABLE Herkunft_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_Herkunft_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Herkunft_Schulformen (
  Herkunft_ID bigint NOT NULL, 
  Schulform_Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_Herkunft_Schulformen PRIMARY KEY (Herkunft_ID, Schulform_Kuerzel)
);


CREATE TABLE Herkunftsart (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Herkunftsart PRIMARY KEY (ID)
);


CREATE TABLE Herkunftsart_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_Herkunftsart_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Herkunftsart_Schulformen (
  Herkunftsart_ID bigint NOT NULL, 
  Schulform_Kuerzel varchar(10) NOT NULL, 
  KurzBezeichnung varchar(255) NOT NULL, 
  Bezeichnung varchar(255) NOT NULL,
  CONSTRAINT PK_Herkunftsart_Schulformen PRIMARY KEY (Herkunftsart_ID, Schulform_Kuerzel)
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


CREATE TABLE Jahrgaenge_Keys (
  Kuerzel varchar(2) NOT NULL,
  CONSTRAINT PK_Jahrgaenge_Keys PRIMARY KEY (Kuerzel)
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
  Bezeichnung varchar(100) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar varchar(1) DEFAULT '+', 
  Aenderbar varchar(1) DEFAULT '+',
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(250) NOT NULL, 
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
  CONSTRAINT K_Ortsteil_UC1 UNIQUE (Bezeichnung, Ort_ID)
);


CREATE TABLE K_AllgAdresse (
  ID bigint AUTOINCREMENT NOT NULL, 
  AdressArt_ID bigint, 
  AllgAdrName1 varchar(50), 
  AllgAdrName2 varchar(50), 
  AllgAdrStrassenname varchar(55), 
  AllgAdrHausNr varchar(10), 
  AllgAdrHausNrZusatz varchar(30), 
  AllgAdrOrt_ID bigint, 
  AllgOrtsteil_ID bigint, 
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
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_AllgAdresse_Ortsteil_FK FOREIGN KEY (AllgOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL
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
  Bezeichnung varchar(40) DEFAULT 'Pause' NOT NULL,
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


CREATE TABLE KlassenartenKatalog_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_KlassenartenKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Kompetenzgruppen (
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung varchar(50) NOT NULL, 
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL,
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


CREATE TABLE KursartenKatalog_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_KursartenKatalog_Keys PRIMARY KEY (Kuerzel)
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


CREATE TABLE Nationalitaeten_Keys (
  DEStatisCode varchar(3) NOT NULL,
  CONSTRAINT PK_Nationalitaeten_Keys PRIMARY KEY (DEStatisCode)
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 varchar(10), 
  Kursart2 varchar(10), 
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


CREATE TABLE OrganisationsformenKatalog_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_OrganisationsformenKatalog_Keys PRIMARY KEY (Kuerzel)
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
  KennwortTools varchar(255), 
  KennwortToolsAktuell varchar(3) DEFAULT '-;5', 
  CredentialID bigint,
  CONSTRAINT PK_K_Lehrer PRIMARY KEY (ID),
  CONSTRAINT K_Lehrer_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_PersonTyp_FK FOREIGN KEY (PersonTyp) REFERENCES PersonalTypen(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Statkue_Nationalitaeten_FK FOREIGN KEY (StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Gost_Blockung_Kurslehrer (
  Blockung_Kurs_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Reihenfolge int DEFAULT 1 NOT NULL, 
  Wochenstunden int DEFAULT 3 NOT NULL,
  CONSTRAINT PK_Gost_Blockung_Kurslehrer PRIMARY KEY (Blockung_Kurs_ID, Lehrer_ID),
  CONSTRAINT Gost_Blockung_Kurslehrer_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Kurslehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Kurslehrer_IDX_Blockung_Kurs_ID ON Gost_Blockung_Kurslehrer(Blockung_Kurs_ID);


CREATE TABLE Gost_Jahrgang_Beratungslehrer (
  Abi_Jahrgang int NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Beratungslehrer PRIMARY KEY (Abi_Jahrgang, Lehrer_ID),
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Lehrer_ID_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Jahrgang_Beratungslehrer_IDX_Abi_Jahrgang ON Gost_Jahrgang_Beratungslehrer(Abi_Jahrgang);


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


CREATE TABLE Religionen_Keys (
  Kuerzel varchar(10) NOT NULL,
  CONSTRAINT PK_Religionen_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Client_Konfiguration_Global (
  AppName varchar(100) NOT NULL, 
  Schluessel varchar(255) NOT NULL, 
  Wert text NOT NULL,
  CONSTRAINT PK_Client_Konfiguration_Global PRIMARY KEY (AppName, Schluessel)
);


CREATE TABLE Schema_Core_Type_Versionen (
  NameTabelle varchar(255) NOT NULL, 
  Name varchar(1023) NOT NULL, 
  Version bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_Schema_Core_Type_Versionen PRIMARY KEY (NameTabelle)
);


CREATE TABLE Schema_AutoInkremente (
  NameTabelle varchar(200) NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_Schema_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE Schema_Status (
  Revision bigint DEFAULT 0 NOT NULL, 
  IsTainted int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Schema_Status PRIMARY KEY (Revision)
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


CREATE TABLE KAoA_Anschlussoption_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_KAoA_Anschlussoption_Keys PRIMARY KEY (ID)
);


CREATE TABLE KAoA_Berufsfeld_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_KAoA_Berufsfeld_Keys PRIMARY KEY (ID)
);


CREATE TABLE KAoA_Kategorie_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_KAoA_Kategorie_Keys PRIMARY KEY (ID)
);


CREATE TABLE KAoA_Merkmal_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_KAoA_Merkmal_Keys PRIMARY KEY (ID)
);


CREATE TABLE KAoA_Zusatzmerkmal_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_KAoA_Zusatzmerkmal_Keys PRIMARY KEY (ID)
);


CREATE TABLE KAoA_SBO_Ebene4_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_KAoA_SBO_Ebene4_Keys PRIMARY KEY (ID)
);


CREATE TABLE SchuelerListe (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(50) NOT NULL, 
  Erzeuger varchar(20), 
  Privat varchar(1) DEFAULT '+',
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerStatus_Keys (
  ID int NOT NULL,
  CONSTRAINT PK_SchuelerStatus_Keys PRIMARY KEY (ID)
);


CREATE TABLE SchuleCredentials (
  Schulnummer int NOT NULL, 
  RSAPublicKey text, 
  RSAPrivateKey text, 
  AES text,
  CONSTRAINT PK_SchuleCredentials PRIMARY KEY (Schulnummer)
);


CREATE TABLE SchuleOAuthSecrets (
  ID bigint NOT NULL, 
  AuthServer varchar(255) NOT NULL, 
  ClientID text NOT NULL, 
  ClientSecret text NOT NULL,
  CONSTRAINT PK_SchuleOAuthSecrets PRIMARY KEY (ID)
);


CREATE TABLE Schulformen (
  ID bigint NOT NULL, 
  Kuerzel varchar(10) NOT NULL, 
  Nummer varchar(2), 
  Bezeichnung varchar(255) NOT NULL, 
  HatGymOb int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulformen PRIMARY KEY (ID)
);


CREATE TABLE Schuljahresabschnitte (
  ID bigint AUTOINCREMENT NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  VorigerAbschnitt_ID bigint, 
  FolgeAbschnitt_ID bigint,
  CONSTRAINT PK_Schuljahresabschnitte PRIMARY KEY (ID)
);

CREATE INDEX Schuljahresabschnitte_IDX_Jahr_Abschnitt ON Schuljahresabschnitte(Jahr, Abschnitt);


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
  AbschnittBez varchar(20) DEFAULT 'Halbjahr', 
  BezAbschnitt1 varchar(12) DEFAULT '1. Hj', 
  BezAbschnitt2 varchar(12) DEFAULT '2. Hj', 
  BezAbschnitt3 varchar(12), 
  BezAbschnitt4 varchar(12), 
  Fremdsprachen varchar(1) DEFAULT '+', 
  JVAZeigen varchar(1) DEFAULT '-', 
  RefPaedagogikZeigen varchar(1) DEFAULT '-', 
  AnzJGS_Jahr smallint DEFAULT 1, 
  IstHauptsitz varchar(1) DEFAULT '+', 
  NotenGesperrt varchar(1) DEFAULT '-', 
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
  WebAdresse varchar(100), 
  Land varchar(50),
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE EigeneSchule_Logo (
  EigeneSchule_ID bigint NOT NULL, 
  LogoBase64 text,
  CONSTRAINT PK_EigeneSchule_Logo PRIMARY KEY (EigeneSchule_ID),
  CONSTRAINT EigeneSchule_Logo_FK FOREIGN KEY (EigeneSchule_ID) REFERENCES EigeneSchule(ID) ON UPDATE CASCADE ON DELETE CASCADE
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
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
);

CREATE INDEX EigeneSchule_Jahrgaenge_IDX_ASDJahrgang ON EigeneSchule_Jahrgaenge(ASDJahrgang);


CREATE TABLE LehrerAbschnittsdaten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Rechtsverhaeltnis varchar(1), 
  Beschaeftigungsart varchar(2), 
  Einsatzstatus varchar(1), 
  StammschulNr varchar(6), 
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
  Ankreuzzeugnisse varchar(1) DEFAULT '-',
  CONSTRAINT PK_Klassen PRIMARY KEY (ID),
  CONSTRAINT Klassen_Schuljahresabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Klassen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_UC1 UNIQUE (Schuljahresabschnitts_ID, Klasse)
);

CREATE INDEX Klassen_IDX_Schuljahresabschnitts_ID ON Klassen(Schuljahresabschnitts_ID);


CREATE TABLE Kurse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  KurzBez varchar(20) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang varchar(2), 
  Fach_ID bigint NOT NULL, 
  KursartAllg varchar(10), 
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
  CONSTRAINT Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT Kurse_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_Fortschreibungsart_FK FOREIGN KEY (Fortschreibungsart) REFERENCES KursFortschreibungsarten(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_UC1 UNIQUE (Schuljahresabschnitts_ID, KurzBez, ASDJahrgang, Fach_ID, KursartAllg, WochenStd, Lehrer_ID, Jahrgaenge)
);

CREATE INDEX Kurse_IDX_Schuljahresabschnitts_ID ON Kurse(Schuljahresabschnitts_ID);
CREATE INDEX Kurse_IDX_Fach_ID ON Kurse(Fach_ID);
CREATE INDEX Kurse_IDX_Jahrgang_ID ON Kurse(Jahrgang_ID);
CREATE INDEX Kurse_IDX_Lehrer_ID ON Kurse(Lehrer_ID);


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


CREATE TABLE LehrerNotenmodulCredentials (
  ,
  CONSTRAINT PK_LehrerNotenmodulCredentials PRIMARY KEY (Lehrer_ID)
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
  LSVersetzung varchar(10), 
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
  VerkehrsspracheFamilie varchar(3) DEFAULT 'deu', 
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
  CONSTRAINT Schueler_Status_FK FOREIGN KEY (Status) REFERENCES SchuelerStatus_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_1_FK FOREIGN KEY (StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_2_FK FOREIGN KEY (StaatKrz2) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_3_FK FOREIGN KEY (GeburtslandSchueler) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_4_FK FOREIGN KEY (GeburtslandVater) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_5_FK FOREIGN KEY (GeburtslandMutter) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_UC1 UNIQUE (GU_ID)
);

CREATE INDEX Schueler_IDX_Geloescht_Status_Entlassjahrgang_ID ON Schueler(Status, Entlassjahrgang_ID, Geloescht);


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
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schueler PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schueler_ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_ErgID_FK FOREIGN KEY (Zwischenergebnis_ID) REFERENCES Gost_Blockung_Zwischenergebnisse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_IDX1 ON Gost_Blockung_Zwischenergebnisse_Kurs_Schueler(Zwischenergebnis_ID);
CREATE INDEX Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_IDX2 ON Gost_Blockung_Zwischenergebnisse_Kurs_Schueler(Zwischenergebnis_ID, Blockung_Kurs_ID);
CREATE INDEX Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_IDX3 ON Gost_Blockung_Zwischenergebnisse_Kurs_Schueler(Zwischenergebnis_ID, Schueler_ID);


CREATE TABLE Gost_Schueler (
  Schueler_ID bigint NOT NULL, 
  DatumBeratung datetime, 
  DatumRuecklauf datetime, 
  HatSportattest int DEFAULT 0 NOT NULL, 
  Kommentar text, 
  Beratungslehrer_ID bigint, 
  PruefPhase varchar(1), 
  BesondereLernleistung_Art varchar(1), 
  BesondereLernleistung_Punkte int,
  CONSTRAINT PK_Gost_Schueler PRIMARY KEY (Schueler_ID),
  CONSTRAINT Gost_Schueler_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Schueler_Fachwahlen (
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  EF1_Kursart varchar(10), 
  EF1_Punkte varchar(2), 
  EF2_Kursart varchar(10), 
  EF2_Punkte varchar(2), 
  Q11_Kursart varchar(10), 
  Q11_Punkte varchar(2), 
  Q12_Kursart varchar(10), 
  Q12_Punkte varchar(2), 
  Q21_Kursart varchar(10), 
  Q21_Punkte varchar(2), 
  Q22_Kursart varchar(10), 
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
  CONSTRAINT Gost_Schueler_Fachwahlen_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE INDEX Gost_Schueler_Fachwahlen_IDX_Schueler_ID ON Gost_Schueler_Fachwahlen(Schueler_ID);


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
  LernabschnittWechselNr smallint DEFAULT 0,
  CONSTRAINT PK_Kurs_Schueler PRIMARY KEY (Kurs_ID, Schueler_ID, LernabschnittWechselNr),
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
  KursartAllg varchar(10), 
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
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX SchuelerAbiFaecher_IDX_Schueler_ID ON SchuelerAbiFaecher(Schueler_ID);


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
  Kursart varchar(10),
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL, 
  Datenschutz_ID bigint NOT NULL, 
  Status varchar(1) DEFAULT '-' NOT NULL, 
  Abgefragt int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Schueler_ID, Datenschutz_ID),
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
  Bemerkungen text, 
  CredentialID bigint,
  CONSTRAINT PK_SchuelerErzAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzAdr_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_ErzieherArt_FK FOREIGN KEY (ErzieherArt_ID) REFERENCES K_ErzieherArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ort_FK FOREIGN KEY (ErzOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ortsteil_FK FOREIGN KEY (ErzOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerErzAdr_Staat1_FK FOREIGN KEY (Erz1StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Staat2_FK FOREIGN KEY (Erz2StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL
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
  KursartAllg varchar(10), 
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
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
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
  WechselNr smallint DEFAULT 0, 
  Schulbesuchsjahre smallint, 
  Hochrechnung int, 
  SemesterWertung varchar(1) DEFAULT '+', 
  PruefOrdnung varchar(20), 
  Klassen_ID bigint, 
  Tutor_ID bigint, 
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
  meldungBAN int DEFAULT 0 NOT NULL,
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
  CONSTRAINT SchuelerLernabschnittsdaten_Tutor_FK FOREIGN KEY (Tutor_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_UC1 UNIQUE (Schueler_ID, Schuljahresabschnitts_ID, WechselNr)
);

CREATE INDEX SchuelerLernabschnittsdaten_IDX_Schueler_ID ON SchuelerLernabschnittsdaten(Schueler_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX1_Schuljahresabschnitts_ID ON SchuelerLernabschnittsdaten(Schuljahresabschnitts_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX_Klassen_ID ON SchuelerLernabschnittsdaten(Klassen_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX_Jahrgang_ID ON SchuelerLernabschnittsdaten(Jahrgang_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX2_Schuljahresabschnitts_ID ON SchuelerLernabschnittsdaten(Schuljahresabschnitts_ID, WechselNr);


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
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (ID),
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
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_UC1 UNIQUE (Schueler_ID, Sprache)
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

CREATE INDEX SchuelerSprachpruefungen_IDX1 ON SchuelerSprachpruefungen(Schueler_ID);
CREATE INDEX SchuelerSprachpruefungen_IDX2 ON SchuelerSprachpruefungen(Schueler_ID, Sprache);


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
  CONSTRAINT SchuelerZP10_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
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
  CONSTRAINT SchuelerKAoADaten_Kategorie_FK FOREIGN KEY (KategorieID) REFERENCES KAoA_Kategorie_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Merkmal_FK FOREIGN KEY (MerkmalID) REFERENCES KAoA_Merkmal_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Zusatzmerkmal_FK FOREIGN KEY (ZusatzmerkmalID) REFERENCES KAoA_Zusatzmerkmal_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Anschlussoption_FK FOREIGN KEY (AnschlussoptionID) REFERENCES KAoA_Anschlussoption_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Berufsfeld_FK FOREIGN KEY (BerufsfeldID) REFERENCES KAoA_Berufsfeld_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_SBO_Ebene4_FK FOREIGN KEY (SBO_Ebene4ID) REFERENCES KAoA_SBO_Ebene4_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL
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
  Kursart varchar(10), 
  KursartAllg varchar(10), 
  Kurs_ID bigint, 
  NotenKrz varchar(2), 
  NotenKrzQuartal varchar(2), 
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
  CONSTRAINT SchuelerLeistungsdaten_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_FK FOREIGN KEY (Fachlehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_Zusatzkraft_FK FOREIGN KEY (Zusatzkraft_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_UC1 UNIQUE (Abschnitt_ID, Fach_ID, Fachlehrer_ID, Kursart, Kurs_ID)
);

CREATE INDEX SchuelerLeistungsdaten_IDX1 ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX2 ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX3 ON SchuelerLeistungsdaten(Fachlehrer_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Abschnitt_ID ON SchuelerLeistungsdaten(Abschnitt_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Fach_ID ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Kurs_ID ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Fachlehrer_ID ON SchuelerLeistungsdaten(Fachlehrer_ID);


CREATE TABLE SchuelerZuweisungen (
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(10),
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


CREATE TABLE DavRessourceCollections (
  Benutzer_ID bigint NOT NULL, 
  ID bigint AUTOINCREMENT NOT NULL, 
  Typ int NOT NULL, 
  Anzeigename varchar(120) NOT NULL, 
  Beschreibung varchar(2047), 
  SyncToken datetime DEFAULT Time() NOT NULL, 
  geloeschtam datetime,
  CONSTRAINT PK_DavRessourceCollections PRIMARY KEY (ID),
  CONSTRAINT DavRessourceCollection_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE DavRessourceCollectionsACL (
  ID bigint AUTOINCREMENT NOT NULL, 
  Benutzer_ID bigint NOT NULL, 
  RessourceCollection_ID bigint NOT NULL, 
  berechtigungen varchar(20) NOT NULL,
  CONSTRAINT PK_DavRessourceCollectionsACL PRIMARY KEY (ID),
  CONSTRAINT DavRessourceCollectionsACL_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT DavRessourceCollectionsACL_RessourceCollection_FK FOREIGN KEY (RessourceCollection_ID) REFERENCES DavRessourceCollections(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL, 
  LI_LoginTime datetime, 
  LI_LogoffTime datetime,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_UserID, LI_LoginTime),
  CONSTRAINT Logins_Benutzer_FK FOREIGN KEY (LI_UserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Client_Konfiguration_Benutzer (
  Benutzer_ID bigint NOT NULL, 
  AppName varchar(100) NOT NULL, 
  Schluessel varchar(255) NOT NULL, 
  Wert text NOT NULL,
  CONSTRAINT PK_Client_Konfiguration_Benutzer PRIMARY KEY (Benutzer_ID, AppName, Schluessel),
  CONSTRAINT ClientKonfigurationBenutzer_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
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


CREATE TABLE LehrerLeitungsfunktion_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_LehrerLeitungsfunktion_Keys PRIMARY KEY (ID)
);


CREATE TABLE Schulleitung (
  ID bigint AUTOINCREMENT NOT NULL, 
  LeitungsfunktionID bigint NOT NULL, 
  Funktionstext varchar(255) NOT NULL, 
  LehrerID bigint NOT NULL, 
  Von datetime, 
  Bis datetime,
  CONSTRAINT PK_Schulleitung PRIMARY KEY (ID),
  CONSTRAINT Schulleitung_Leitungsfunktion_FK FOREIGN KEY (LeitungsfunktionID) REFERENCES LehrerLeitungsfunktion_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schulleitung_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Stundenplan (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Beginn date DEFAULT '1899-01-01' NOT NULL, 
  Ende date, 
  Beschreibung varchar(1000) NOT NULL, 
  WochentypModell int DEFAULT 0 NOT NULL,
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
  Bezeichnung varchar(40) DEFAULT 'Pause' NOT NULL,
  CONSTRAINT PK_Stundenplan_Pausenzeit PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenzeit_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_UC1 UNIQUE (Stundenplan_ID, Tag, Beginn, Ende)
);


CREATE TABLE Stundenplan_Pausenaufsichten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Pausenzeit_ID bigint NOT NULL, 
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
  Wochentyp int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Stundenplan_PausenaufsichtenBereich PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsichtsbereiche_FK FOREIGN KEY (Aufsichtsbereich_ID) REFERENCES Stundenplan_Aufsichtsbereiche(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsicht_FK FOREIGN KEY (Pausenaufsicht_ID) REFERENCES Stundenplan_Pausenaufsichten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_UC1 UNIQUE (Pausenaufsicht_ID, Aufsichtsbereich_ID, Wochentyp)
);

CREATE INDEX Stundenplan_PausenaufsichtenBereich_Pausenaufsicht_ID ON Stundenplan_PausenaufsichtenBereich(Pausenaufsicht_ID);
CREATE INDEX Stundenplan_PausenaufsichtenBereich_Aufsichtsbereich_ID ON Stundenplan_PausenaufsichtenBereich(Aufsichtsbereich_ID);


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


CREATE TABLE Stundenplan_Schienen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Jahrgang_ID bigint, 
  Nummer int NOT NULL, 
  Bezeichnung varchar(100) NOT NULL,
  CONSTRAINT PK_Stundenplan_Schienen PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Schienen_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Schienen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Stundenplan_Schienen_UC1 UNIQUE (Stundenplan_ID, Jahrgang_ID, Nummer)
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
  Kurs_ID bigint, 
  Fach_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Unterricht PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Unterricht_EigeneSchule_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Stundenplan_Zeitraster_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Stundenplan_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Stundenplan_UnterrichtKlasse (
  ID bigint AUTOINCREMENT NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Klasse_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtKlasse PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtKlasse_Klasse_FK FOREIGN KEY (Klasse_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtKlasse_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtKlasse_UC1 UNIQUE (Unterricht_ID, Klasse_ID)
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


CREATE TABLE Stundenplan_UnterrichtSchiene (
  ID bigint AUTOINCREMENT NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Schiene_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtSchiene PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtSchiene_Schienen_FK FOREIGN KEY (Schiene_ID) REFERENCES Stundenplan_Schienen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtSchiene_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtSchiene_UC1 UNIQUE (Unterricht_ID, Schiene_ID)
);


CREATE TABLE Stundenplan_Kalenderwochen_Zuordnung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  KW int NOT NULL, 
  Wochentyp int NOT NULL,
  CONSTRAINT PK_Stundenplan_Kalenderwochen_Zuordnung PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Kalenderwochen_Zuordnung_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Kalenderwochen_Zuordnung_UC1 UNIQUE (Stundenplan_ID, Jahr, KW)
);


CREATE TABLE Stundenplan_Pausenzeit_Klassenzuordnung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Pausenzeit_ID bigint NOT NULL, 
  Klassen_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Pausenzeit_Klassenzuordnung PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenzeit_Klassenzuordnung_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_Klassenzuordnung_Pausenzeit_FK FOREIGN KEY (Pausenzeit_ID) REFERENCES Stundenplan_Pausenzeit(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_Klassenzuordnung_UC1 UNIQUE (Pausenzeit_ID, Klassen_ID)
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
  KursartAllg varchar(10), 
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


CREATE TABLE TextExportVorlagen (
  VorlageName varchar(50) NOT NULL, 
  Daten text,
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (VorlageName)
);


CREATE TABLE Usergroups (
  UG_ID bigint NOT NULL, 
  UG_Bezeichnung varchar(64), 
  UG_Kompetenzen varchar(255), 
  UG_Nr int, 
  SchulnrEigner int,
  CONSTRAINT PK_Usergroups PRIMARY KEY (UG_ID),
  CONSTRAINT Usergroups_UC1 UNIQUE (UG_Bezeichnung)
);


CREATE TABLE Users (
  ID bigint AUTOINCREMENT NOT NULL, 
  US_Name varchar(50) NOT NULL, 
  US_LoginName varchar(20) NOT NULL, 
  US_Password varchar(20), 
  US_UserGroups varchar(50), 
  US_Privileges varchar(255), 
  SchulnrEigner int, 
  Email varchar(100), 
  EmailName varchar(100), 
  SMTPUsername varchar(100), 
  SMTPPassword varchar(100), 
  EmailSignature text, 
  HeartbeatDate int, 
  ComputerName varchar(50), 
  US_PasswordHash varchar(255),
  CONSTRAINT PK_Users PRIMARY KEY (ID),
  CONSTRAINT Users_UC1 UNIQUE (US_LoginName)
);


CREATE TABLE Versetzung (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung varchar(150), 
  ASDKlasse varchar(6), 
  Klasse varchar(15) NOT NULL, 
  Jahrgang_ID bigint, 
  FKlasse varchar(15), 
  VKlasse varchar(15), 
  OrgFormKrz varchar(1), 
  KlassenlehrerKrz varchar(10), 
  StvKlassenlehrerKrz varchar(10), 
  Restabschnitte smallint, 
  ASDSchulformNr varchar(3), 
  Fachklasse_ID bigint, 
  PruefOrdnung varchar(20), 
  Sichtbar varchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Klassenart varchar(2), 
  SommerSem varchar(1) DEFAULT '-', 
  NotenGesperrt varchar(1) DEFAULT '-', 
  SchulnrEigner int, 
  AdrMerkmal varchar(1) DEFAULT 'A', 
  WebNotenGesperrt varchar(1) DEFAULT '-', 
  KoopKlasse varchar(1) DEFAULT '-', 
  Ankreuzzeugnisse varchar(1) DEFAULT '-',
  CONSTRAINT PK_Versetzung PRIMARY KEY (ID)
);


CREATE TABLE DavRessources (
  ID bigint AUTOINCREMENT NOT NULL, 
  DavRessourceCollection_ID bigint NOT NULL, 
  UID varchar(120) NOT NULL, 
  lastModified datetime DEFAULT Time() NOT NULL, 
  KalenderTyp varchar(120) NOT NULL, 
  KalenderStart datetime DEFAULT Time() NOT NULL, 
  KalenderEnde datetime DEFAULT Time() NOT NULL, 
  ressource varbinary(16777216) NOT NULL, 
  geloeschtam datetime,
  CONSTRAINT PK_DavRessources PRIMARY KEY (ID),
  CONSTRAINT DavRessources_Collection_FK FOREIGN KEY (DavRessourceCollection_ID) REFERENCES DavRessourceCollections(ID) ON UPDATE CASCADE ON DELETE CASCADE
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


CREATE TABLE DavSyncTokenSchueler (
  ID bigint AUTOINCREMENT NOT NULL, 
  SyncToken datetime DEFAULT Time() NOT NULL,
  CONSTRAINT PK_DavSyncTokenSchueler PRIMARY KEY (ID),
  CONSTRAINT DavSyncTokenSchueler_FK FOREIGN KEY (ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE DavSyncTokenLehrer (
  ID bigint AUTOINCREMENT NOT NULL, 
  SyncToken datetime DEFAULT Time() NOT NULL,
  CONSTRAINT PK_DavSyncTokenLehrer PRIMARY KEY (ID),
  CONSTRAINT DavSyncTokenLehrer_FK FOREIGN KEY (ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EnmLeistungsdaten (
  ID bigint NOT NULL, 
  tsNotenKrz datetime DEFAULT Time() NOT NULL, 
  tsNotenKrzQuartal datetime DEFAULT Time() NOT NULL, 
  tsFehlStd datetime DEFAULT Time() NOT NULL, 
  tsuFehlStd datetime DEFAULT Time() NOT NULL, 
  tsLernentw datetime DEFAULT Time() NOT NULL, 
  tsWarnung datetime DEFAULT Time() NOT NULL,
  CONSTRAINT PK_EnmLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT EnmLeistungsdaten_FK FOREIGN KEY (ID) REFERENCES SchuelerLeistungsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EnmLernabschnittsdaten (
  ID bigint NOT NULL, 
  tsSumFehlStd datetime DEFAULT Time() NOT NULL, 
  tsSumFehlStdU datetime DEFAULT Time() NOT NULL, 
  tsZeugnisBem datetime DEFAULT Time() NOT NULL, 
  tsASV datetime DEFAULT Time() NOT NULL, 
  tsAUE datetime DEFAULT Time() NOT NULL, 
  tsBemerkungVersetzung datetime DEFAULT Time() NOT NULL,
  CONSTRAINT PK_EnmLernabschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT EnmLernabschnittsdaten_FK FOREIGN KEY (ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EnmTeilleistungen (
  ID bigint NOT NULL, 
  tsDatum datetime DEFAULT Time() NOT NULL, 
  tsLehrer_ID datetime DEFAULT Time() NOT NULL, 
  tsArt_ID datetime DEFAULT Time() NOT NULL, 
  tsBemerkung datetime DEFAULT Time() NOT NULL, 
  tsNotenKrz datetime DEFAULT Time() NOT NULL,
  CONSTRAINT PK_EnmTeilleistungen PRIMARY KEY (ID),
  CONSTRAINT EnmTeilleistungen_FK FOREIGN KEY (ID) REFERENCES SchuelerEinzelleistungen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schulbewerbung_Importe (
  Schueler_ID bigint NOT NULL, 
  LastSync datetime DEFAULT Time() NOT NULL, 
  LastXML text NOT NULL,
  CONSTRAINT PK_Schulbewerbung_Importe PRIMARY KEY (Schueler_ID),
  CONSTRAINT Schulbewerbung_Importe_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Vorgaben (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL, 
  Quartal int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart varchar(10) DEFAULT 'GK' NOT NULL, 
  Dauer int NOT NULL, 
  Auswahlzeit int NOT NULL, 
  IstMdlPruefung int DEFAULT 0 NOT NULL, 
  IstAudioNotwendig int DEFAULT 0 NOT NULL, 
  IstVideoNotwendig int DEFAULT 0 NOT NULL, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Vorgaben PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Vorgaben_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Vorgaben_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Vorgaben_UC1 UNIQUE (Abi_Jahrgang, Halbjahr, Quartal, Fach_ID, Kursart)
);

CREATE INDEX Gost_Klausuren_Vorgaben_IDX_Abi_Jahrgang ON Gost_Klausuren_Vorgaben(Abi_Jahrgang);


CREATE TABLE Gost_Klausuren_Termine (
  ID bigint AUTOINCREMENT NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL, 
  Quartal int NOT NULL, 
  Datum date, 
  Startzeit timestamp, 
  Bezeichnung text, 
  Bemerkungen text, 
  IstHaupttermin int DEFAULT 1 NOT NULL, 
  NachschreiberZugelassen int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Klausuren_Termine PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Termine_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Klausuren_Termine_IDX_Abi_Jahrgang ON Gost_Klausuren_Termine(Abi_Jahrgang);


CREATE TABLE Gost_Klausuren_Termine_Jahrgaenge (
  Termin_ID bigint NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Quartal int NOT NULL, 
  Bezeichnung text, 
  Bemerkungen text, 
  IstHaupttermin int DEFAULT 1 NOT NULL, 
  NachschreiberZugelassen int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Klausuren_Termine_Jahrgaenge PRIMARY KEY (Termin_ID, Abi_Jahrgang),
  CONSTRAINT Gost_Klausuren_Termine_Jahrgaenge_Termin_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Termine_Jahrgaenge_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Klausuren_Termine_Jahrgaenge_IDX_Abi_Jahrgang ON Gost_Klausuren_Termine_Jahrgaenge(Abi_Jahrgang);


CREATE TABLE Gost_Klausuren_Kursklausuren (
  ID bigint AUTOINCREMENT NOT NULL, 
  Vorgabe_ID bigint NOT NULL, 
  Kurs_ID bigint NOT NULL, 
  Termin_ID bigint, 
  Startzeit timestamp, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Kursklausuren PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Kursklausuren_Vorgabe_ID_FK FOREIGN KEY (Vorgabe_ID) REFERENCES Gost_Klausuren_Vorgaben(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT Gost_Klausuren_Kursklausuren_Kurs_ID_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Kursklausuren_Termin_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Gost_Klausuren_Kursklausuren_UC1 UNIQUE (Vorgabe_ID, Kurs_ID)
);

CREATE INDEX Gost_Klausuren_Kursklausuren_IDX_Vorgabe_ID ON Gost_Klausuren_Kursklausuren(Vorgabe_ID);
CREATE INDEX Gost_Klausuren_Kursklausuren_IDX_Termin_ID ON Gost_Klausuren_Kursklausuren(Termin_ID);


CREATE TABLE Gost_Klausuren_Schuelerklausuren (
  ID bigint AUTOINCREMENT NOT NULL, 
  Kursklausur_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Schuelerklausuren PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Kursklausur_ID_FK FOREIGN KEY (Kursklausur_ID) REFERENCES Gost_Klausuren_Kursklausuren(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_UC1 UNIQUE (Kursklausur_ID, Schueler_ID)
);

CREATE INDEX Gost_Klausuren_Schuelerklausuren_IDX_Kursklausur_ID ON Gost_Klausuren_Schuelerklausuren(Kursklausur_ID);
CREATE INDEX Gost_Klausuren_Schuelerklausuren_IDX_Schueler_ID ON Gost_Klausuren_Schuelerklausuren(Schueler_ID);
CREATE INDEX Gost_Klausuren_Schuelerklausuren_IDX_Schueler_ID_Kursklausur_ID ON Gost_Klausuren_Schuelerklausuren(Kursklausur_ID, Schueler_ID);


CREATE TABLE Gost_Klausuren_Schuelerklausuren_Termine (
  ID bigint AUTOINCREMENT NOT NULL, 
  Schuelerklausur_ID bigint NOT NULL, 
  Folge_Nr smallint DEFAULT 0 NOT NULL, 
  Termin_ID bigint, 
  Startzeit timestamp, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Schuelerklausuren_Termine PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Termine_Schuelerklausur_ID_FK FOREIGN KEY (Schuelerklausur_ID) REFERENCES Gost_Klausuren_Schuelerklausuren(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Termine_Termine_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Termine_UC1 UNIQUE (Schuelerklausur_ID, Termin_ID),
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Termine_UC2 UNIQUE (Schuelerklausur_ID, Folge_Nr)
);

CREATE INDEX Gost_Klausuren_Schuelerklausuren_Termine_IDX_Schuelerklausur_ID ON Gost_Klausuren_Schuelerklausuren_Termine(Schuelerklausur_ID);
CREATE INDEX Gost_Klausuren_Schuelerklausuren_Termine_IDX_Termin_ID ON Gost_Klausuren_Schuelerklausuren_Termine(Termin_ID);


CREATE TABLE Gost_Klausuren_NtaZeiten (
  Schueler_ID bigint NOT NULL, 
  Vorgabe_ID bigint NOT NULL, 
  Zeitzugabe int NOT NULL, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_NtaZeiten PRIMARY KEY (Schueler_ID, Vorgabe_ID),
  CONSTRAINT Gost_Klausuren_NtaZeiten_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_NtaZeiten_Vorgabe_ID_FK FOREIGN KEY (Vorgabe_ID) REFERENCES Gost_Klausuren_Vorgaben(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Raeume (
  ID bigint AUTOINCREMENT NOT NULL, 
  Termin_ID bigint NOT NULL, 
  Stundenplan_Raum_ID bigint, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Raeume PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Raeume_Stundenplan_Raum_ID_FK FOREIGN KEY (Stundenplan_Raum_ID) REFERENCES Stundenplan_Raeume(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Gost_Klausuren_Raeume_Termin_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Raume_UC1 UNIQUE (Termin_ID, Stundenplan_Raum_ID)
);

CREATE INDEX Gost_Klausuren_Raume_IDX_Termin_ID ON Gost_Klausuren_Raeume(Termin_ID);


CREATE TABLE Gost_Klausuren_Raumstunden (
  ID bigint AUTOINCREMENT NOT NULL, 
  Klausurraum_ID bigint NOT NULL, 
  Zeitraster_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Klausuren_Raumstunden PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Raumstunden_Klausurraum_ID_FK FOREIGN KEY (Klausurraum_ID) REFERENCES Gost_Klausuren_Raeume(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Raumstunden_Zeitraster_ID_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Stundenplan_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT unique_Gost_Klausuren_Raumstunden_UC1 UNIQUE (Klausurraum_ID, Zeitraster_ID)
);

CREATE INDEX Gost_Klausuren_Raumstunden_IDX_Klausurraum_ID ON Gost_Klausuren_Raumstunden(Klausurraum_ID);


CREATE TABLE Gost_Klausuren_SchuelerklausurenTermine_Raumstunden (
  Schuelerklausurtermin_ID bigint NOT NULL, 
  Raumstunde_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Klausuren_SchuelerklausurenTermine_Raumstunden PRIMARY KEY (Schuelerklausurtermin_ID, Raumstunde_ID),
  CONSTRAINT Gost_Klausuren_SKT_Raumstunden_SK_ID_FK FOREIGN KEY (Schuelerklausurtermin_ID) REFERENCES Gost_Klausuren_Schuelerklausuren_Termine(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_SKT_Raumstunden_KRS_ID_FK FOREIGN KEY (Raumstunde_ID) REFERENCES Gost_Klausuren_Raumstunden(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Gost_Klausuren_SKT_Raumstunden_IDX_Schuelerklausurtermin_ID ON Gost_Klausuren_SchuelerklausurenTermine_Raumstunden(Schuelerklausurtermin_ID);
CREATE INDEX Gost_Klausuren_SKT_Raumstunden_IDX_KlausurRaumStunde_ID ON Gost_Klausuren_SchuelerklausurenTermine_Raumstunden(Raumstunde_ID);


CREATE TABLE Gost_Klausuren_Raumstunden_Aufsichten (
  ID bigint AUTOINCREMENT NOT NULL, 
  Raumstunde_ID bigint NOT NULL, 
  Lehrer_ID bigint, 
  Startzeit timestamp, 
  Endzeit timestamp, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Raumstunden_Aufsichten PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Raumstunden_Aufsichten_KlausurRaumStunde_ID_FK FOREIGN KEY (Raumstunde_ID) REFERENCES Gost_Klausuren_Raumstunden(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Raumstunden_Aufsichten_Lehrer_ID_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Gost_Klausuren_Kalenderinformationen (
  ID bigint AUTOINCREMENT NOT NULL, 
  Bezeichnung text, 
  Startdatum date, 
  Startzeit timestamp, 
  Enddatum date, 
  Endzeit timestamp, 
  IstSperrtermin int DEFAULT 0 NOT NULL, 
  Bemerkungen text,
  CONSTRAINT PK_Gost_Klausuren_Kalenderinformationen PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Email (
  ID bigint AUTOINCREMENT NOT NULL, 
  Domain varchar(255), 
  SMTPServer varchar(255) NOT NULL, 
  SMTPPort int DEFAULT 25 NOT NULL, 
  SMTPStartTLS int DEFAULT 1 NOT NULL, 
  SMTPUseTLS int DEFAULT 0 NOT NULL, 
  SMTPTrustTLSHost varchar(255),
  CONSTRAINT PK_EigeneSchule_Email PRIMARY KEY (ID)
);






INSERT INTO Schema_Status(Revision) VALUES (17);

INSERT INTO Berufskolleg_Anlagen(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (1000,'A','Fachklassen duales System und Ausbildungsvorbereitung',null,null), (2000,'B','Berufsfachschule',null,null), (3000,'C','Berufsfachschule und Fachoberschule',null,null), (4000,'D','Berufliches Gymnasium und Fachoberschule',null,null), (5000,'E','Fachschule',null,null), (6000,'H','Bildungsgänge an freien Waldorfschulen / Hiberniakolleg',null,null), (24000,'X','Ehemalige Kollegschule',null,null), (26000,'Z','Kooperationsklasse Hauptschule',null,null);


INSERT INTO Berufskolleg_Berufsebenen1(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (100001000,'AW','Agrarwirtschaft',null,null), (100002000,'AB','Agrarwirtschaft, Bio- und Umwelttechnologie',null,null), (100003000,'ER','Ernährung',null,null), (100004000,'EU','Ernährung und Hauswirtschaft',null,null), (100005000,'EH','Ernährung/Hauswirtschaft',null,null), (100006000,'EV','Ernährungs- und Versorgungsmanagement',null,null), (100007000,'GT','Gestaltung',null,null), (100008000,'GU','Gesundheit und Soziales',null,null), (100009000,'GE','Gesundheit/Erziehung und Soziales',null,null), (100010000,'GS','Gesundheit/Soziales',null,null), (100011000,'IF','Informatik',null,null), (100012000,'OZ','ohne besondere Zuordnung',null,null), (100013000,'SV','ohne Fachbereich / Schulversuch',null,null), (100014000,'SW','Sozialwesen',null,null), (100015000,'TE','Technik',null,null), (100016000,'TN','Technik/Naturwissenschaften',null,null), (100017000,'WI','Wirtschaft',null,null), (100018000,'WV','Wirtschaft und Verwaltung',null,null);


INSERT INTO Berufskolleg_Berufsebenen2(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (200001000,'EV','Assistent/-in für Ernährung und Versorgung',null,null), (200002000,'AA','Aufbaubildungsgang Augenoptik',null,null), (200003000,'AB','Aufbaubildungsgang Betriebswirtschaft',null,null), (200004000,'BG','Aufbaubildungsgang Bewegung und Gesundheit',null,null), (200005000,'BS','Aufbaubildungsgang Bildung und Schulvorbereitung in Tageseinrichtungen f. Kinder',null,null), (200006000,'BE','Aufbaubildungsgang Bildung, Erziehung u. Betreuung von Kindern unter drei Jahren',null,null), (200007000,'CO','Aufbaubildungsgang Controlling',null,null), (200008000,'XT','Aufbaubildungsgang Existenzgründung',null,null), (200009000,'XS','Aufbaubildungsgang Existenzgründung (Schulversuch)',null,null), (200010000,'BA','Aufbaubildungsgang Fachkraft für Beratung und Anleitung in der Pflege',null,null), (200011000,'HF','Aufbaubildungsgang Fachkraft für heilpädagogische Förderung mit dem Pferd',null,null), (200012000,'IP','Aufbaubildungsgang Inklusive Pädagogik',null,null), (200013000,'MK','Aufbaubildungsgang Medienkompetenz in der Kinder- und Jugendhilfe',null,null), (200014000,'MF','Aufbaubildungsgang Musikalische Förderung im sozialpädagogischen Arbeitsfeld',null,null), (200015000,'NF','Aufbaubildungsgang Naturwissenschaftlich-technische Früherziehung',null,null), (200016000,'OG','Aufbaubildungsgang Offene Ganztagsschule',null,null), (200017000,'PA','Aufbaubildungsgang Praxisanleitung',null,null), (200018000,'PL','Aufbaubildungsgang Produktionslogistik (Schulversuch)',null,null), (200019000,'SM','Aufbaubildungsgang Sozialmanagement',null,null), (200020000,'SF','Aufbaubildungsgang Sprachförderung',null,null), (200021000,'TU','Aufbaubildungsgang Technischer Umweltschutz',null,null), (200022000,'UM','Aufbaubildungsgang Unternehmensmanagement',null,null), (200023000,'AU','Augenoptik',null,null), (200024000,'BH','Bau und Holztechnik',null,null), (200025000,'BP','Baudenkmalpflege u. Altbau.',null,null), (200026000,'BT','Bautechnik',null,null), (200027000,'BK','Bekleidungstechnik',null,null), (200028000,'BB','Bergbautechnik',null,null), (200029000,'BW','Betriebswirtschaft',null,null), (200030000,'BO','Biogentechnik',null,null), (200031000,'BI','Biologietechnik',null,null), (200032000,'CT','Chemietechnik',null,null), (200033000,'DM','Druck- und Medientechnik',null,null), (200034000,'DT','Drucktechnik',null,null), (200035000,'EM','Edelmetallgestaltung',null,null), (200036000,'ET','Elektrotechnik',null,null), (200037000,'FT','Fahrzeugtechnik',null,null), (200038000,'FL','Farb- und Lacktechnik',null,null), (200039000,'FG','Farbe, Gestaltung, Werbung',null,null), (200040000,'FR','Farbtechnik und Raumgestaltung',null,null), (200041000,'GT','Galvanotechnik',null,null), (200042000,'GB','Gartenbau',null,null), (200043000,'GD','Gebäudesystemtechnik',null,null), (200044000,'GS','Gesundheit',null,null), (200045000,'GW','Gesundheitswesen',null,null), (200046000,'GR','Gießereitechnik',null,null), (200047000,'GL','Glastechnik',null,null), (200048000,'GO','Großhaushalt',null,null), (200049000,'HP','Heilerziehungspflege',null,null), (200050000,'HD','Heilpädagogik',null,null), (200051000,'HL','Heizungs-, Lüftungs-, Klimatechnik',null,null), (200052000,'HT','Holztechnik',null,null), (200053000,'HG','Hotel und Gaststätten',null,null), (200054000,'HB','Hotel- und Gaststättengewerbe',null,null), (200055000,'IF','Informatik',null,null), (200056000,'IT','Informations- und Telekommunikationstechnik',null,null), (200057000,'KT','Kältetechnik',null,null), (200058000,'KF','Karosserie- und Fahrzeugbautechnik',null,null), (200059000,'KI','Kinderpfleger/-in',null,null), (200060000,'KP','Körperpflege',null,null), (200061000,'KO','Korrosionsschutztechnik',null,null), (200062000,'KK','Kunststoff- und Kautschuktechnik',null,null), (200063000,'LV','Labor- und Verfahrentechnik',null,null), (200064000,'LW','Landwirtschaft',null,null), (200065000,'LT','Lebensmitteltechnik',null,null), (200066000,'LF','Luftfahrttechnik',null,null), (200067000,'MG','Marketing',null,null), (200068000,'MB','Maschinenbautechnik',null,null), (200069000,'MT','Mechatronik',null,null), (200070000,'MN','Medien',null,null), (200071000,'MM','Medien/Medientechnologie',null,null), (200072000,'MD','Medizintechnik',null,null), (200073000,'ML','Metallbautechnik',null,null), (200074000,'ME','Metalltechnik',null,null), (200075000,'MH','Möbelhandel',null,null), (200076000,'MO','Mode',null,null), (200077000,'MI','Motopädie',null,null), (200078000,'PG','Pädagogik',null,null), (200079000,'PU','Physik, Chemie und Biologie',null,null), (200080000,'PB','Physik, Chemie, Biologie',null,null), (200081000,'PC','Physik/Chemie/Biologie',null,null), (200082000,'PT','Physiktechnik',null,null), (200083000,'SA','Sozialassistent/-in',null,null), (200084000,'SH','Sozialassistent/-in - Heilerziehung',null,null), (200085000,'SP','Sozialpädagogik',null,null), (200086000,'SW','Sozialwesen',null,null), (200087000,'SI','Spreng- und Sicherheitstechnik',null,null), (200088000,'TI','Technische Informatik',null,null), (200089000,'TT','Textiltechnik',null,null), (200090000,'TB','Textiltechnik und Bekleidung',null,null), (200091000,'TO','Tourismus',null,null), (200092000,'US','Umweltschutztechnik',null,null), (200093000,'UT','Umwelttechnik',null,null), (200094000,'VT','Vermessungstechnik',null,null), (200095000,'WT','Werkstofftechnik',null,null), (200096000,'WI','Wirtschaftsinformatik',null,null), (200097000,'WR','Wohnungswirtschaft und Realkredit',null,null);


INSERT INTO Berufskolleg_Berufsebenen3(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (300001000,'AB','Absatzwirtschaft',null,null), (300002000,'AS','Agrarservice',null,null), (300003000,'BH','Allgemeine Hochschulreife / Bautechnik',null,null), (300004000,'BW','Allgemeine Hochschulreife / Betriebswirtschaftslehre',null,null), (300005000,'BC','Allgemeine Hochschulreife / Biologie, Chemie',null,null), (300006000,'CC','Allgemeine Hochschulreife / Chemie, Chemietechnik',null,null), (300007000,'DE','Allgemeine Hochschulreife / Deutsch, Englisch',null,null), (300008000,'ET','Allgemeine Hochschulreife / Elektrotechnik',null,null), (300009000,'ER','Allgemeine Hochschulreife / Ernährung',null,null), (300010000,'EW','Allgemeine Hochschulreife / Erziehungswissenschaften',null,null), (300011000,'FL','Allgemeine Hochschulreife / Freizeitsportleiter (Sport/Gesundheitsförderung/Biologie)',null,null), (300012000,'FK','Allgemeine Hochschulreife / Fremdsprachenkorrespondent',null,null), (300013000,'GE','Allgemeine Hochschulreife / Gesundheit',null,null), (300014000,'IW','Allgemeine Hochschulreife / Ingenieurwissenschaften',null,null), (300015000,'KE','Allgemeine Hochschulreife / Kunst/Englisch',null,null), (300016000,'MT','Allgemeine Hochschulreife / Maschinenbautechnik',null,null), (300017000,'MI','Allgemeine Hochschulreife / Mathematik, Informatik',null,null), (300018000,'BP','angewandte Baudenkmalpflege',null,null), (300019000,'AK','Assistent(in) für Konstruktions- und Fertigungstechnik / AHR',null,null), (300020000,'AU','Ausbau',null,null), (300021000,'AH','Außenhandel',null,null), (300022000,'AI','Avionik',null,null), (300023000,'BA','Bautechnischer Assistent / AHR',null,null), (300024000,'BT','Betriebstechnik',null,null), (300025000,'BS','Biologisch-technische(r) Assistent(in) / AHR',null,null), (300026000,'CA','Chemisch-technische(r) Assistent(in) / AHR',null,null), (300027000,'CS','CNC-Systemtechnik',null,null), (300028000,'CK','Computer- und Kommunikationst.',null,null), (300029000,'DG','Dienstleistungsgartenbau',null,null), (300030000,'EA','Elektrotechnische(r) Assistent(in) / AHR',null,null), (300031000,'AE','energieeffiziente-ökologische Altbauerneuerung',null,null), (300032000,'EZ','Erzieher/Erzieherin / AHR',null,null), (300033000,'FD','Finanzdienstleistungen',null,null), (300034000,'FW','Finanzwirtschaft',null,null), (300035000,'FT','Flugwerk/Triebwerk',null,null), (300036000,'FS','Fremdsprachen',null,null), (300037000,'GA','Gestaltungstechnische(r) Assistent(in)/AHR',null,null), (300038000,'GM','Gesundheitsökonomie und -management',null,null), (300039000,'GD','Grafik-Design',null,null), (300040000,'HM','Handelsmanagement (Schulversuch)',null,null), (300041000,'HE','Heilerziehung',null,null), (300042000,'HB','Hochbau',null,null), (300043000,'IA','Informationstechnische(r) Assistent(in) / AHR',null,null), (300044000,'KA','Kaufmännische(r) Assistent(in) / AHR',null,null), (300045000,'KO','Kokerei/Aufbereitungstechnik',null,null), (300046000,'LT','Labortechnik',null,null), (300047000,'LO','Logistik',null,null), (300048000,'MK','Marketing-Kommunikation',null,null), (300049000,'ME','Medien- und Eventmanagement',null,null), (300050000,'MV','Medizinische Verwaltung',null,null), (300051000,'OL','Ökologischer Landbau',null,null), (300052000,'PE','Personalwirtschaft',null,null), (300053000,'PT','Physikalisch-technische(r) Assistent(in) / AHR',null,null), (300054000,'PF','Praktikanten mit Förderverträgen',null,null), (300055000,'PV','Produktion u. Vermarktung',null,null), (300056000,'PW','Produktionswirtschaft',null,null), (300057000,'RW','Rechnungswesen',null,null), (300058000,'RE','Recht',null,null), (300059000,'RT','Reiseverkehr/Touristik',null,null), (300060000,'AV','Schüler/-innen in berufsvorb. Maßn. der AV u. fr. Träger',null,null), (300061000,'AP','Schüler/-innen m. Arbeitsverh. u. Praktikant.',null,null), (300062000,'OA','Schüler/-innen ohne Arbeitsverhältnis',null,null), (300063000,'SV','Service',null,null), (300064000,'SF','Sport und Freizeit (Schulversuch)',null,null), (300065000,'ST','Steuern',null,null), (300066000,'TG','Tagebautechnik',null,null), (300067000,'TA','Technische(r) Assistent(in) für Betriebsinformatik / AHR',null,null), (300068000,'TB','Tiefbau',null,null), (300069000,'TT','Tiefbautechnik',null,null), (300070000,'UA','Umwelttechnische(r) Assistent(in) / AHR',null,null), (300071000,'WJ','Werkstattjahr',null,null), (300072000,'WI','Wirtschaftsinformatik',null,null), (300073000,'A2','Anerkannter Ausbildungsberuf (2-jährig)',null,null), (300074000,'A3','Anerkannter Ausbildungsberuf (3-jährig)',null,null), (300075000,'A4','Anerkannter Ausbildungsberuf (3 1/2-jährig)',null,null), (300076000,'MB','Ausbildungsberuf für Menschen mit Behinderungen',null,null);


INSERT INTO Berufskolleg_Fachklassen_Keys(FachklassenIndex, Schluessel, Schluessel2) VALUES (10,'101','00'), (10,'101','01'), (10,'101','02'), (10,'101','03'), (10,'101','04'), (10,'102','00'), (10,'103','00'), (10,'104','00'), (10,'105','00'), (10,'105','01'), (10,'105','02'), (10,'105','03'), (10,'105','04'), (10,'105','05'), (10,'106','00'), (10,'107','00'), (10,'107','50'), (10,'107','51'), (10,'107','52'), (10,'107','53'), (10,'107','54'), (10,'107','55'), (10,'108','00'), (10,'109','00'), (10,'110','00'), (10,'111','00'), (10,'112','00'), (10,'113','00'), (10,'114','00'), (10,'115','00'), (10,'115','01'), (10,'115','02'), (10,'115','03'), (10,'115','04'), (10,'115','05'), (10,'115','06'), (10,'116','00'), (10,'117','00'), (10,'117','01'), (10,'117','02'), (10,'117','03'), (10,'118','00'), (10,'119','00'), (10,'120','00'), (10,'121','00'), (10,'122','01'), (10,'122','02'), (10,'123','00'), (10,'124','00'), (10,'125','00'), (10,'125','01'), (10,'125','02'), (10,'126','00'), (10,'127','00'), (10,'128','00'), (10,'129','00'), (10,'130','00'), (10,'131','00'), (10,'132','00'), (10,'133','00'), (10,'134','00'), (10,'134','01'), (10,'134','02'), (10,'135','00'), (10,'136','00'), (10,'137','00'), (10,'138','00'), (10,'139','00'), (10,'140','00'), (10,'140','01'), (10,'140','02'), (10,'140','03'), (10,'141','00'), (10,'142','00'), (10,'143','00'), (10,'144','00'), (10,'145','00'), (10,'145','01'), (10,'145','02'), (10,'146','00'), (10,'147','00'), (10,'147','01'), (10,'147','02'), (10,'147','03'), (10,'147','04'), (10,'148','00'), (10,'149','00'), (10,'150','00'), (10,'151','00'), (10,'152','00'), (10,'152','01'), (10,'152','02'), (10,'152','03'), (10,'152','04'), (10,'152','05'), (10,'152','06'), (10,'153','00'), (10,'154','00'), (10,'155','00'), (10,'156','00'), (10,'157','00'), (10,'157','01'), (10,'157','02'), (10,'157','03'), (10,'157','04'), (10,'158','00'), (10,'159','00'), (10,'160','00'), (10,'161','00'), (10,'161','01'), (10,'161','02'), (10,'162','00'), (10,'163','00'), (10,'164','00'), (10,'164','01'), (10,'164','02'), (10,'164','03'), (10,'164','04'), (10,'165','00'), (10,'166','00'), (10,'167','00'), (10,'168','00'), (10,'169','00'), (10,'170','00'), (10,'171','00'), (10,'171','01'), (10,'171','02'), (10,'172','00'), (10,'173','00'), (10,'174','00'), (10,'175','00'), (10,'176','00'), (10,'177','00'), (10,'177','01'), (10,'177','02'), (10,'177','03'), (10,'177','04'), (10,'177','05'), (10,'177','06'), (10,'177','07'), (10,'177','08'), (10,'177','09'), (10,'177','10'), (10,'177','11'), (10,'178','00'), (10,'179','01'), (10,'179','02'), (10,'180','00'), (10,'181','00'), (10,'182','00'), (10,'183','01'), (10,'183','02'), (10,'183','03'), (10,'183','04'), (10,'183','05'), (10,'184','00'), (10,'185','00'), (10,'186','00'), (10,'187','01'), (10,'187','02'), (10,'187','03'), (10,'187','04'), (10,'188','00'), (10,'189','00'), (10,'190','00'), (10,'191','00'), (10,'191','01'), (10,'191','02'), (10,'191','03'), (10,'191','04'), (10,'192','00'), (10,'193','00'), (10,'194','00'), (10,'195','00'), (10,'196','00'), (10,'197','00'), (10,'198','00'), (10,'199','00'), (10,'200','00'), (10,'201','00'), (10,'202','01'), (10,'202','02'), (10,'203','00'), (10,'204','00'), (10,'205','00'), (10,'206','00'), (10,'207','00'), (10,'208','00'), (10,'209','00'), (10,'210','00'), (10,'211','00'), (10,'212','00'), (10,'212','01'), (10,'212','02'), (10,'213','00'), (10,'214','00'), (10,'214','01'), (10,'214','02'), (10,'214','03'), (10,'215','00'), (10,'216','00'), (10,'217','00'), (10,'218','00'), (10,'219','00'), (10,'220','00'), (10,'220','01'), (10,'220','02'), (10,'220','03'), (10,'221','00'), (10,'222','00'), (10,'223','00'), (10,'224','00'), (10,'225','00'), (10,'226','00'), (10,'227','00'), (10,'228','00'), (10,'229','00'), (10,'230','00'), (10,'231','00'), (10,'232','01'), (10,'232','02'), (10,'232','03'), (10,'232','04'), (10,'232','05'), (10,'232','06'), (10,'232','07'), (10,'232','08'), (10,'233','00'), (10,'234','00'), (10,'235','00'), (10,'236','00'), (10,'237','00'), (10,'238','00'), (10,'238','01'), (10,'238','02'), (10,'238','03'), (10,'239','00'), (10,'240','00'), (10,'241','00'), (10,'241','01'), (10,'241','02'), (10,'241','03'), (10,'242','00'), (10,'242','01'), (10,'242','02'), (10,'243','00'), (10,'244','00'), (10,'245','00'), (10,'246','00'), (10,'246','01'), (10,'246','02'), (10,'247','00'), (10,'248','00'), (10,'248','01'), (10,'248','02'), (10,'248','03'), (10,'249','00'), (10,'250','00'), (10,'250','01'), (10,'250','02'), (10,'250','03'), (10,'251','00'), (10,'252','00'), (10,'253','00'), (10,'254','00'), (10,'255','00'), (10,'256','00'), (10,'257','00'), (10,'257','01'), (10,'257','02'), (10,'258','00'), (10,'259','00'), (10,'260','00'), (10,'260','50'), (10,'260','51'), (10,'260','52'), (10,'261','00'), (10,'262','00'), (10,'262','01'), (10,'262','02'), (10,'262','03'), (10,'262','04'), (10,'263','00'), (10,'264','00'), (10,'265','01'), (10,'265','02'), (10,'265','03'), (10,'265','04'), (10,'265','05'), (10,'265','06'), (10,'265','07'), (10,'265','08'), (10,'265','09'), (10,'265','10'), (10,'265','11'), (10,'265','12'), (10,'266','00'), (10,'267','00'), (10,'268','00'), (10,'269','00'), (10,'270','00'), (10,'271','01'), (10,'271','02'), (10,'272','00'), (10,'272','01'), (10,'272','02'), (10,'272','03'), (10,'272','04'), (10,'272','05'), (10,'272','06'), (10,'273','01'), (10,'273','02'), (10,'273','03'), (10,'274','00'), (10,'275','00'), (10,'276','00'), (10,'276','01'), (10,'276','02'), (10,'276','03'), (10,'276','04'), (10,'277','00'), (10,'278','00'), (10,'279','00'), (10,'280','00'), (10,'281','00'), (10,'282','00'), (10,'283','00'), (10,'284','00'), (10,'285','00'), (10,'286','00'), (10,'287','00'), (10,'288','00'), (10,'289','00'), (10,'290','00'), (10,'291','01'), (10,'291','02'), (10,'292','00'), (10,'293','00'), (10,'294','00'), (10,'295','00'), (10,'296','00'), (10,'297','00'), (10,'298','00'), (10,'299','00'), (10,'299','01'), (10,'299','02'), (10,'299','03'), (10,'299','04'), (10,'300','00'), (10,'301','00'), (10,'302','00'), (10,'302','01'), (10,'302','02'), (10,'302','03'), (10,'303','00'), (10,'304','00'), (10,'305','00'), (10,'305','01'), (10,'305','02'), (10,'306','00'), (10,'307','00'), (10,'308','00'), (10,'309','01'), (10,'309','02'), (10,'309','03'), (10,'310','00'), (10,'311','00'), (10,'311','01'), (10,'311','02'), (10,'311','03'), (10,'311','04'), (10,'312','00'), (10,'312','01'), (10,'312','02'), (10,'313','00'), (10,'314','01'), (10,'314','02'), (10,'314','03'), (10,'315','00'), (10,'316','00'), (10,'317','00'), (10,'318','00'), (10,'319','00'), (10,'320','00'), (10,'321','01'), (10,'321','02'), (10,'322','00'), (10,'323','00'), (10,'324','00'), (10,'325','00'), (10,'326','00'), (10,'327','00'), (10,'328','00'), (10,'329','01'), (10,'329','02'), (10,'329','03'), (10,'329','04'), (10,'329','05'), (10,'329','06'), (10,'329','07'), (10,'329','08'), (10,'329','09'), (10,'330','00'), (10,'331','00'), (10,'332','00'), (10,'333','00'), (10,'334','00'), (10,'335','00'), (10,'336','00'), (10,'337','00'), (10,'337','01'), (10,'337','02'), (10,'337','03'), (10,'337','04'), (10,'337','05'), (10,'337','06'), (10,'337','07'), (10,'338','00'), (10,'338','01'), (10,'338','02'), (10,'338','03'), (10,'339','01'), (10,'339','02'), (10,'339','03'), (10,'339','04'), (10,'339','05'), (10,'339','06'), (10,'340','00'), (10,'340','01'), (10,'340','02'), (10,'340','03'), (10,'340','04'), (10,'340','05'), (10,'341','00'), (10,'342','00'), (10,'343','00'), (10,'344','00'), (10,'344','01'), (10,'344','02'), (10,'345','00'), (10,'346','00'), (10,'346','01'), (10,'346','02'), (10,'347','00'), (10,'347','01'), (10,'347','02'), (10,'348','00'), (10,'349','00'), (10,'350','00'), (10,'351','00'), (10,'352','00'), (10,'353','00'), (10,'354','00'), (10,'355','00'), (10,'356','00'), (10,'357','00'), (10,'357','01'), (10,'357','02'), (10,'357','03'), (10,'358','00'), (10,'359','00'), (10,'359','01'), (10,'359','02'), (10,'360','00'), (10,'361','00'), (10,'362','00'), (10,'363','00'), (10,'364','00'), (10,'364','01'), (10,'364','02'), (10,'365','00'), (10,'366','00'), (10,'367','00'), (10,'368','00'), (10,'368','01'), (10,'368','02'), (10,'368','03'), (10,'368','04'), (10,'368','05'), (10,'368','06'), (10,'368','07'), (10,'368','08'), (10,'368','09'), (10,'368','10'), (10,'369','00'), (10,'370','00'), (10,'371','00'), (10,'372','00'), (10,'373','00'), (10,'374','00'), (10,'375','00'), (10,'376','00'), (10,'377','00'), (10,'378','00'), (10,'379','00'), (10,'380','00'), (10,'381','00'), (10,'382','00'), (10,'383','00'), (10,'384','00'), (10,'385','00'), (10,'385','01'), (10,'385','02'), (10,'386','00'), (10,'387','00'), (10,'388','00'), (10,'389','00'), (10,'390','00'), (10,'391','00'), (10,'392','00'), (10,'393','00'), (10,'393','01'), (10,'393','02'), (10,'393','03'), (10,'394','00'), (10,'395','00'), (10,'396','00'), (10,'396','01'), (10,'396','02'), (10,'397','00'), (10,'398','00'), (10,'399','00'), (10,'400','00'), (10,'401','00'), (10,'402','00'), (10,'403','00'), (10,'404','00'), (10,'405','00'), (10,'406','00'), (10,'407','00'), (10,'408','00'), (10,'409','00'), (10,'410','00'), (10,'411','00'), (10,'412','00'), (10,'413','00'), (10,'414','00'), (10,'415','00'), (10,'416','00'), (10,'416','01'), (10,'416','02'), (10,'416','03'), (10,'416','04'), (10,'416','05'), (10,'417','00'), (10,'418','00'), (10,'419','00'), (10,'420','00'), (10,'421','00'), (10,'422','00'), (10,'423','00'), (10,'424','00'), (10,'425','00'), (10,'426','00'), (10,'427','00'), (10,'428','00'), (10,'429','00'), (10,'430','00'), (10,'431','00'), (10,'432','00'), (10,'433','00'), (10,'434','00'), (10,'435','00'), (10,'436','00'), (10,'437','00'), (10,'438','00'), (10,'439','01'), (10,'439','02'), (10,'439','03'), (10,'439','04'), (10,'439','05'), (10,'439','06'), (10,'439','07'), (10,'439','08'), (10,'440','00'), (10,'441','00'), (10,'442','00'), (10,'442','01'), (10,'442','02'), (10,'443','01'), (10,'443','02'), (10,'443','03'), (10,'443','04'), (10,'443','05'), (10,'443','06'), (10,'444','01'), (10,'444','02'), (10,'444','03'), (10,'444','04'), (10,'444','05'), (10,'444','06'), (10,'444','07'), (10,'444','08'), (10,'444','09'), (10,'445','00'), (10,'446','00'), (10,'447','00'), (10,'448','00'), (10,'448','01'), (10,'448','02'), (10,'448','03'), (10,'448','04'), (10,'449','00'), (10,'449','01'), (10,'449','02'), (10,'450','00'), (10,'450','50'), (10,'450','51'), (10,'450','52'), (10,'450','53'), (10,'450','54'), (10,'451','00'), (10,'452','00'), (10,'452','01'), (10,'452','02'), (10,'452','03'), (10,'453','00'), (10,'453','01'), (10,'453','02'), (10,'453','03'), (10,'453','04'), (10,'453','05'), (10,'454','00'), (10,'455','00'), (10,'456','00'), (10,'457','00'), (10,'458','00'), (10,'458','01'), (10,'458','02'), (10,'458','03'), (10,'459','01'), (10,'459','02'), (10,'459','03'), (10,'460','00'), (10,'461','00'), (10,'461','01'), (10,'461','02'), (10,'461','03'), (10,'461','04'), (10,'461','05'), (10,'461','06'), (10,'461','07'), (10,'462','00'), (10,'463','00'), (10,'464','00'), (10,'465','00'), (10,'465','01'), (10,'465','02'), (10,'466','00'), (10,'467','00'), (10,'468','01'), (10,'468','02'), (10,'468','03'), (10,'468','04'), (10,'468','05'), (10,'468','06'), (10,'468','07'), (10,'468','08'), (10,'468','09'), (10,'469','00'), (10,'470','00'), (10,'470','01'), (10,'470','02'), (10,'471','00'), (10,'472','00'), (10,'473','00'), (10,'474','00'), (10,'475','00'), (10,'476','00'), (10,'477','00'), (10,'478','00'), (10,'479','00'), (10,'480','00'), (10,'480','01'), (10,'480','02'), (10,'480','03'), (10,'480','04'), (10,'481','01'), (10,'481','02'), (10,'482','00'), (10,'482','01'), (10,'482','02'), (10,'482','03'), (10,'483','00'), (10,'484','00'), (10,'485','00'), (10,'486','00'), (10,'487','00'), (10,'487','01'), (10,'487','02'), (10,'487','03'), (10,'487','04'), (10,'488','00'), (10,'489','00'), (10,'490','00'), (10,'491','00'), (10,'491','01'), (10,'491','02'), (10,'492','00'), (10,'492','01'), (10,'492','02'), (10,'493','00'), (10,'493','01'), (10,'493','02'), (10,'494','00'), (10,'495','00'), (10,'496','00'), (10,'497','00'), (10,'498','00'), (10,'499','00'), (10,'500','00'), (10,'501','00'), (10,'502','00'), (10,'503','00'), (10,'504','00'), (10,'505','00'), (10,'506','00'), (10,'507','00'), (10,'508','00'), (10,'509','00'), (10,'509','01'), (10,'509','02'), (10,'509','03'), (10,'509','04'), (10,'510','00'), (10,'511','00'), (10,'512','00'), (10,'513','00'), (10,'514','00'), (10,'515','00'), (10,'516','00'), (10,'516','01'), (10,'516','02'), (10,'516','03'), (10,'516','04'), (10,'516','05'), (10,'517','00'), (10,'518','01'), (10,'518','02'), (10,'518','03'), (10,'518','04'), (10,'519','01'), (10,'519','02'), (10,'519','03'), (10,'519','04'), (10,'519','05'), (10,'519','06'), (10,'520','00'), (10,'521','01'), (10,'521','02'), (10,'521','03'), (10,'521','04'), (10,'522','00'), (10,'523','00'), (10,'523','01'), (10,'523','02'), (10,'524','00'), (10,'525','00'), (10,'526','00'), (10,'527','00'), (10,'528','00'), (10,'529','00'), (10,'530','00'), (10,'531','00'), (10,'531','01'), (10,'531','02'), (10,'531','03'), (10,'531','04'), (10,'531','05'), (10,'531','50'), (10,'531','51'), (10,'531','52'), (10,'531','53'), (10,'531','54'), (10,'532','00'), (10,'533','01'), (10,'533','02'), (10,'534','00'), (10,'535','00'), (10,'536','00'), (10,'537','00'), (10,'538','00'), (10,'539','00'), (10,'540','00'), (10,'541','00'), (10,'542','00'), (10,'543','00'), (10,'544','00'), (10,'545','00'), (10,'545','01'), (10,'545','02'), (10,'546','00'), (10,'547','00'), (10,'548','00'), (10,'549','00'), (10,'550','00'), (10,'550','01'), (10,'550','02'), (10,'551','00'), (10,'552','00'), (10,'553','00'), (10,'553','50'), (10,'553','51'), (10,'553','52'), (10,'553','53'), (10,'554','00'), (10,'555','00'), (10,'556','01'), (10,'556','02'), (10,'557','00'), (10,'558','00'), (10,'559','00'), (10,'560','00'), (10,'561','00'), (10,'562','00'), (10,'563','00'), (10,'564','00'), (10,'565','00'), (10,'565','01'), (10,'565','02'), (10,'566','00'), (10,'567','00'), (10,'568','01'), (10,'568','02'), (10,'569','01'), (10,'569','02'), (10,'570','00'), (10,'571','00'), (10,'572','00'), (10,'573','00'), (10,'573','01'), (10,'573','02'), (10,'574','00'), (10,'575','00'), (10,'576','00'), (10,'577','00'), (10,'578','00'), (10,'579','00'), (10,'580','00'), (10,'581','00'), (10,'582','00'), (10,'583','00'), (10,'584','00'), (10,'585','01'), (10,'585','02'), (10,'586','01'), (10,'586','02'), (10,'587','01'), (10,'587','02'), (10,'587','03'), (10,'588','00'), (10,'589','00'), (10,'590','00'), (10,'591','00'), (10,'592','00'), (10,'593','00'), (10,'594','00'), (10,'595','00'), (10,'596','00'), (10,'597','01'), (10,'597','02'), (10,'597','03'), (10,'597','04'), (10,'597','05'), (10,'597','06'), (10,'598','01'), (10,'598','02'), (10,'598','03'), (10,'599','00'), (10,'600','00'), (10,'601','01'), (10,'601','02'), (10,'601','03'), (10,'601','04'), (10,'602','00'), (10,'603','00'), (10,'604','00'), (10,'605','00'), (10,'606','00'), (10,'607','00'), (10,'608','00'), (10,'609','00'), (10,'610','00'), (10,'611','01'), (10,'611','02'), (10,'612','00'), (10,'613','00'), (10,'614','00'), (10,'615','00'), (10,'616','00'), (10,'617','00'), (10,'618','01'), (10,'618','02'), (10,'618','03'), (10,'618','04'), (10,'619','00'), (10,'620','01'), (10,'620','02'), (10,'621','01'), (10,'621','02'), (10,'622','00'), (10,'623','00'), (10,'624','00'), (10,'625','00'), (10,'626','00'), (10,'627','00'), (10,'628','00'), (10,'629','01'), (10,'629','02'), (10,'630','00'), (10,'631','00'), (10,'632','00'), (10,'633','00'), (10,'801','00'), (10,'802','00'), (10,'803','00'), (10,'804','00'), (10,'805','00'), (10,'806','00'), (10,'807','00'), (10,'808','00'), (10,'809','00'), (10,'810','00'), (10,'811','00'), (10,'812','00'), (10,'813','00'), (10,'814','00'), (10,'815','00'), (10,'816','00'), (10,'817','00'), (10,'818','00'), (10,'819','00'), (10,'820','00'), (10,'821','00'), (10,'822','00'), (10,'823','00'), (10,'824','00'), (10,'825','00'), (10,'826','00'), (10,'827','00'), (10,'828','00'), (10,'829','00'), (10,'830','00'), (10,'831','00'), (10,'832','00'), (10,'833','00'), (10,'834','00'), (10,'835','00'), (10,'836','00'), (10,'837','00'), (10,'838','00'), (10,'839','00'), (10,'840','00'), (10,'841','00'), (10,'842','00'), (10,'843','00'), (10,'844','00'), (10,'845','00'), (10,'846','00'), (10,'847','01'), (10,'847','02'), (10,'848','00'), (10,'849','00'), (10,'850','00'), (10,'851','00'), (10,'852','01'), (10,'852','02'), (10,'853','00'), (10,'854','01'), (10,'854','02'), (10,'854','03'), (10,'854','04'), (10,'855','00'), (10,'856','00'), (10,'857','00'), (10,'858','00'), (10,'859','00'), (10,'860','00'), (10,'861','00'), (10,'862','00'), (10,'863','00'), (10,'864','00'), (10,'865','00'), (10,'866','00'), (10,'867','00'), (10,'868','00'), (10,'869','00'), (10,'870','00'), (10,'871','00'), (10,'872','00'), (10,'873','00'), (10,'874','00'), (10,'875','00'), (10,'876','00'), (10,'877','00'), (10,'878','00'), (10,'879','00'), (10,'880','00'), (10,'881','00'), (10,'882','00'), (10,'883','00'), (10,'884','00'), (10,'885','00'), (10,'886','00'), (10,'887','00'), (10,'888','00'), (10,'889','00'), (10,'890','00'), (10,'891','00'), (10,'892','00'), (10,'893','00'), (10,'894','00'), (10,'895','00'), (10,'896','00'), (10,'897','00'), (10,'898','00'), (10,'899','00'), (10,'900','00'), (10,'999','01'), (10,'999','02'), (10,'999','03'), (10,'999','04'), (10,'999','05'), (10,'999','06'), (10,'999','07'), (10,'999','08'), (10,'999','09'), (10,'999','10'), (10,'999','11'), (10,'999','12'), (10,'999','13'), (20,'101','00'), (20,'102','00'), (20,'103','00'), (20,'104','00'), (20,'105','00'), (20,'106','00'), (20,'107','00'), (20,'108','00'), (20,'109','00'), (20,'110','00'), (20,'111','00'), (20,'112','00'), (20,'113','00'), (20,'114','00'), (20,'115','00'), (20,'116','00'), (20,'117','00'), (20,'118','00'), (20,'119','00'), (20,'120','00'), (20,'999','00'), (30,'101','00'), (30,'102','00'), (30,'103','00'), (30,'104','00'), (30,'105','00'), (30,'106','00'), (30,'107','00'), (30,'108','00'), (30,'109','00'), (30,'110','00'), (30,'111','00'), (30,'112','00'), (30,'113','00'), (30,'114','00'), (30,'115','00'), (30,'116','00'), (30,'117','00'), (30,'118','00'), (30,'119','00'), (30,'120','00'), (30,'121','00'), (30,'122','00'), (30,'999','00'), (40,'101','01'), (40,'101','02'), (40,'101','03'), (40,'101','04'), (40,'101','05'), (40,'101','06'), (40,'101','07'), (40,'101','08'), (40,'101','09'), (40,'101','10'), (40,'101','11'), (40,'101','12'), (40,'101','13'), (40,'101','14'), (40,'101','15'), (40,'101','16'), (40,'101','17'), (40,'101','18'), (40,'101','21'), (40,'101','22'), (40,'101','23'), (40,'102','01'), (40,'102','02'), (40,'102','03'), (40,'102','04'), (40,'102','05'), (40,'102','06'), (40,'102','07'), (40,'102','08'), (40,'102','09'), (40,'102','10'), (40,'102','11'), (40,'102','12'), (40,'102','13'), (40,'102','14'), (40,'102','15'), (40,'102','16'), (40,'102','17'), (40,'102','18'), (40,'103','01'), (40,'103','02'), (40,'103','03'), (40,'103','04'), (40,'103','05'), (40,'103','06'), (40,'103','07'), (40,'103','08'), (40,'103','09'), (40,'103','10'), (40,'103','11'), (40,'103','12'), (40,'103','13'), (40,'103','14'), (40,'103','15'), (40,'103','16'), (40,'103','17'), (40,'103','18'), (40,'104','01'), (40,'104','02'), (40,'104','03'), (40,'104','04'), (40,'104','05'), (40,'104','06'), (40,'104','07'), (40,'104','08'), (40,'104','09'), (40,'104','10'), (40,'104','11'), (40,'104','12'), (40,'104','13'), (40,'104','14'), (40,'104','15'), (40,'104','16'), (40,'104','17'), (40,'104','18'), (40,'999','00'), (40,'999','01'), (40,'999','02'), (50,'101','00'), (50,'102','00'), (50,'999','00'), (55,'101','00'), (55,'102','00'), (55,'104','00'), (55,'105','00'), (55,'106','00'), (55,'107','00'), (55,'108','00'), (55,'109','00'), (55,'110','00'), (55,'112','00'), (55,'113','00'), (55,'114','00'), (55,'116','00'), (55,'117','00'), (55,'118','00'), (55,'120','00'), (55,'121','00'), (55,'122','00'), (55,'123','04'), (55,'123','12'), (55,'999','00'), (56,'177','02'), (56,'177','05'), (56,'217','00'), (56,'228','00'), (56,'242','02'), (56,'248','01'), (56,'248','02'), (56,'248','03'), (56,'257','00'), (56,'276','00'), (56,'279','00'), (56,'335','00'), (56,'339','03'), (56,'456','00'), (56,'463','00'), (56,'482','00'), (56,'487','00'), (56,'515','00'), (56,'527','00'), (56,'528','00'), (56,'531','00'), (56,'532','00'), (56,'538','00'), (56,'541','00'), (56,'607','00'), (56,'999','00'), (57,'101','00'), (57,'102','00'), (57,'103','01'), (57,'103','02'), (57,'104','01'), (57,'104','02'), (57,'104','03'), (57,'105','00'), (57,'106','01'), (57,'106','02'), (57,'106','03'), (57,'106','04'), (57,'106','05'), (57,'106','06'), (57,'106','07'), (57,'106','08'), (57,'107','00'), (57,'108','01'), (57,'108','02'), (57,'109','00'), (57,'110','00'), (57,'999','00'), (58,'101','00'), (58,'102','00'), (58,'103','01'), (58,'103','02'), (58,'104','01'), (58,'104','02'), (58,'104','03'), (58,'105','00'), (58,'106','01'), (58,'106','02'), (58,'106','03'), (58,'106','04'), (58,'106','05'), (58,'106','06'), (58,'106','07'), (58,'106','08'), (58,'107','00'), (58,'201','00'), (58,'202','00'), (58,'203','01'), (58,'203','02'), (58,'204','01'), (58,'204','02'), (58,'204','03'), (58,'205','00'), (58,'206','01'), (58,'206','02'), (58,'206','03'), (58,'206','04'), (58,'206','05'), (58,'206','06'), (58,'206','07'), (58,'206','08'), (58,'207','00'), (58,'301','00'), (58,'302','00'), (58,'303','01'), (58,'303','02'), (58,'304','01'), (58,'304','02'), (58,'304','03'), (58,'305','00'), (58,'306','01'), (58,'306','02'), (58,'306','03'), (58,'306','04'), (58,'306','05'), (58,'306','06'), (58,'306','07'), (58,'306','08'), (58,'307','00'), (58,'401','00'), (58,'402','00'), (58,'403','01'), (58,'403','02'), (58,'404','01'), (58,'404','02'), (58,'404','03'), (58,'405','00'), (58,'406','01'), (58,'406','02'), (58,'406','03'), (58,'406','04'), (58,'406','05'), (58,'406','06'), (58,'406','07'), (58,'406','08'), (58,'407','00'), (58,'500','00'), (58,'601','00'), (58,'602','00'), (58,'603','01'), (58,'603','02'), (58,'604','01'), (58,'604','02'), (58,'604','03'), (58,'605','00'), (58,'606','01'), (58,'606','02'), (58,'606','03'), (58,'606','04'), (58,'606','05'), (58,'606','06'), (58,'606','07'), (58,'606','08'), (58,'607','00'), (58,'999','00'), (60,'102','00'), (60,'105','00'), (60,'107','00'), (60,'110','00'), (60,'117','00'), (60,'120','00'), (60,'121','00'), (60,'122','00'), (60,'125','00'), (60,'133','00'), (60,'134','00'), (60,'135','00'), (60,'146','00'), (60,'147','00'), (60,'148','00'), (60,'149','00'), (60,'150','01'), (60,'151','00'), (60,'151','01'), (60,'999','00'), (60,'999','01'), (60,'999','02'), (61,'242','02'), (61,'248','01'), (61,'248','02'), (61,'248','03'), (61,'276','00'), (61,'456','00'), (61,'527','00'), (61,'531','00'), (61,'538','00'), (61,'607','00'), (61,'999','00'), (62,'177','02'), (62,'242','02'), (62,'248','01'), (62,'248','02'), (62,'248','03'), (62,'276','00'), (62,'279','00'), (62,'335','00'), (62,'531','00'), (62,'999','00'), (63,'177','01'), (63,'177','02'), (63,'177','05'), (63,'180','00'), (63,'187','02'), (63,'217','00'), (63,'228','00'), (63,'257','00'), (63,'276','00'), (63,'279','00'), (63,'308','00'), (63,'335','00'), (63,'339','03'), (63,'456','00'), (63,'463','00'), (63,'482','00'), (63,'487','00'), (63,'515','00'), (63,'527','00'), (63,'528','00'), (63,'531','00'), (63,'532','00'), (63,'538','00'), (63,'541','00'), (63,'544','00'), (63,'607','00'), (63,'999','00'), (70,'101','00'), (70,'102','00'), (70,'103','00'), (70,'104','00'), (70,'105','00'), (70,'107','00'), (70,'108','00'), (70,'109','00'), (70,'110','00'), (70,'111','00'), (70,'112','00'), (70,'113','00'), (70,'113','01'), (70,'113','02'), (70,'113','03'), (70,'114','00'), (70,'115','00'), (70,'115','01'), (70,'115','02'), (70,'116','00'), (70,'117','00'), (70,'118','00'), (70,'999','00'), (70,'999','01'), (80,'101','00'), (80,'102','00'), (80,'103','00'), (80,'104','00'), (80,'105','00'), (80,'106','00'), (80,'107','00'), (80,'108','00'), (80,'109','00'), (80,'110','00'), (80,'111','00'), (80,'112','00'), (80,'113','00'), (80,'113','01'), (80,'113','02'), (80,'113','03'), (80,'114','00'), (80,'115','00'), (80,'115','01'), (80,'115','02'), (80,'116','00'), (80,'117','00'), (80,'118','00'), (80,'119','00'), (80,'999','00'), (80,'999','01'), (90,'101','00'), (90,'102','00'), (90,'103','00'), (90,'104','00'), (90,'105','00'), (90,'105','01'), (90,'105','02'), (90,'106','01'), (90,'106','02'), (90,'106','03'), (90,'106','04'), (90,'106','05'), (90,'106','06'), (90,'107','00'), (90,'108','00'), (90,'109','00'), (90,'110','00'), (90,'111','00'), (90,'112','01'), (90,'112','02'), (90,'112','03'), (90,'112','04'), (90,'112','05'), (90,'112','06'), (90,'112','07'), (90,'113','00'), (90,'113','01'), (90,'113','02'), (90,'113','03'), (90,'113','04'), (90,'114','00'), (90,'114','01'), (90,'114','02'), (90,'114','03'), (90,'115','00'), (90,'116','00'), (90,'117','00'), (90,'118','00'), (90,'119','00'), (90,'120','00'), (90,'121','00'), (90,'122','00'), (90,'123','00'), (90,'124','00'), (90,'125','00'), (90,'126','00'), (90,'127','00'), (90,'128','00'), (90,'129','00'), (90,'130','00'), (90,'131','00'), (90,'132','00'), (90,'133','00'), (90,'134','00'), (90,'135','00'), (90,'136','00'), (90,'137','01'), (90,'137','02'), (90,'137','03'), (90,'138','00'), (90,'139','00'), (90,'140','00'), (90,'141','00'), (90,'999','00'), (90,'999','01'), (91,'101','00'), (91,'102','00'), (91,'103','01'), (91,'103','02'), (91,'104','01'), (91,'104','02'), (91,'104','03'), (91,'105','00'), (91,'106','01'), (91,'106','02'), (91,'106','03'), (91,'106','04'), (91,'106','05'), (91,'106','06'), (91,'106','07'), (91,'106','08'), (91,'106','09'), (91,'107','00'), (91,'999','00'), (92,'101','00'), (92,'102','00'), (92,'103','01'), (92,'103','02'), (92,'104','01'), (92,'104','02'), (92,'104','03'), (92,'105','00'), (92,'106','01'), (92,'106','02'), (92,'106','03'), (92,'106','04'), (92,'106','05'), (92,'106','06'), (92,'106','07'), (92,'106','08'), (92,'106','09'), (92,'107','00'), (92,'999','00'), (93,'101','00'), (93,'102','00'), (93,'102','01'), (93,'103','00'), (93,'103','01'), (93,'103','02'), (93,'103','03'), (93,'999','00'), (94,'102','00'), (100,'101','00'), (100,'102','00'), (100,'102','01'), (100,'102','02'), (100,'103','00'), (100,'104','00'), (100,'105','00'), (100,'106','00'), (100,'107','00'), (100,'108','00'), (100,'109','00'), (100,'110','00'), (100,'111','00'), (100,'112','00'), (100,'113','01'), (100,'113','02'), (100,'113','03'), (100,'113','04'), (100,'113','05'), (100,'114','00'), (100,'115','00'), (100,'116','00'), (100,'117','01'), (100,'117','02'), (100,'117','03'), (100,'117','04'), (100,'117','05'), (100,'118','00'), (100,'119','00'), (100,'120','00'), (100,'121','00'), (100,'122','00'), (100,'123','00'), (100,'124','00'), (100,'124','01'), (100,'125','01'), (100,'125','02'), (100,'125','03'), (100,'126','00'), (100,'127','00'), (100,'128','00'), (100,'129','00'), (100,'130','00'), (100,'131','00'), (100,'131','01'), (100,'131','02'), (100,'131','03'), (100,'131','04'), (100,'132','00'), (100,'133','01'), (100,'999','00'), (100,'999','01'), (110,'101','00'), (110,'102','00'), (110,'102','01'), (110,'102','02'), (110,'103','00'), (110,'104','00'), (110,'105','00'), (110,'106','00'), (110,'107','00'), (110,'108','00'), (110,'109','00'), (110,'110','01'), (110,'110','02'), (110,'110','03'), (110,'110','04'), (110,'110','05'), (110,'111','00'), (110,'112','00'), (110,'113','00'), (110,'114','01'), (110,'114','02'), (110,'114','03'), (110,'114','04'), (110,'114','05'), (110,'115','00'), (110,'116','00'), (110,'117','01'), (110,'117','02'), (110,'117','03'), (110,'117','04'), (110,'117','05'), (110,'118','00'), (110,'119','00'), (110,'120','00'), (110,'121','00'), (110,'122','00'), (110,'123','00'), (110,'123','01'), (110,'124','01'), (110,'124','02'), (110,'124','03'), (110,'125','00'), (110,'126','00'), (110,'127','00'), (110,'128','00'), (110,'129','01'), (110,'999','00'), (110,'999','01'), (120,'101','00'), (120,'102','00'), (120,'103','00'), (120,'104','00'), (120,'105','00'), (120,'106','00'), (120,'107','00'), (120,'108','00'), (120,'109','00'), (120,'110','00'), (120,'111','00'), (120,'112','00'), (120,'113','00'), (120,'114','00'), (120,'115','00'), (120,'999','00'), (120,'999','01'), (130,'101','00'), (130,'102','00'), (130,'103','00'), (130,'104','00'), (130,'105','00'), (130,'106','00'), (130,'107','00'), (130,'108','00'), (130,'109','00'), (130,'110','00'), (130,'111','00'), (130,'112','00'), (130,'113','00'), (130,'999','00'), (140,'101','00'), (140,'102','00'), (140,'103','00'), (140,'104','00'), (140,'105','00'), (140,'106','00'), (140,'107','00'), (140,'107','01'), (140,'108','00'), (140,'109','00'), (140,'110','00'), (140,'111','00'), (140,'112','00'), (140,'112','01'), (140,'113','00'), (140,'114','00'), (140,'115','00'), (140,'999','00'), (140,'999','01'), (141,'101','00'), (141,'102','00'), (141,'103','00'), (141,'104','00'), (141,'105','00'), (141,'106','00'), (141,'107','00'), (141,'108','00'), (141,'109','00'), (141,'111','00'), (141,'112','00'), (141,'999','00'), (145,'102','01'), (145,'102','02'), (145,'103','00'), (145,'104','00'), (145,'105','00'), (145,'109','00'), (145,'113','02'), (145,'113','05'), (145,'114','00'), (145,'116','00'), (145,'117','01'), (145,'117','03'), (145,'117','04'), (145,'117','05'), (145,'120','00'), (145,'121','00'), (145,'122','00'), (145,'124','00'), (145,'124','01'), (145,'125','01'), (145,'125','02'), (145,'125','03'), (145,'128','00'), (145,'129','00'), (145,'131','02'), (145,'132','00'), (145,'133','01'), (145,'999','00'), (146,'110','00'), (146,'110','10'), (146,'110','11'), (146,'110','12'), (150,'101','00'), (160,'101','00'), (160,'102','00'), (160,'103','00'), (160,'104','00'), (160,'105','00'), (160,'106','00'), (160,'107','00'), (160,'108','00'), (160,'109','00'), (160,'110','00'), (160,'111','00'), (160,'112','00'), (160,'113','00'), (160,'114','00'), (160,'115','00'), (160,'999','00'), (160,'999','01'), (170,'101','00'), (170,'102','00'), (170,'103','00'), (170,'104','00'), (170,'105','00'), (170,'106','00'), (170,'107','00'), (170,'108','00'), (170,'109','00'), (170,'110','00'), (170,'111','00'), (170,'112','00'), (170,'113','00'), (170,'114','00'), (170,'115','00'), (170,'116','00'), (170,'117','00'), (170,'118','00'), (170,'119','00'), (170,'120','00'), (170,'121','00'), (170,'999','00'), (170,'999','01'), (180,'101','00'), (180,'102','00'), (180,'103','00'), (180,'104','00'), (180,'105','00'), (180,'106','00'), (180,'107','00'), (180,'108','00'), (180,'109','00'), (180,'110','00'), (180,'111','00'), (180,'112','00'), (180,'113','00'), (180,'999','00'), (190,'101','00'), (190,'999','00'), (200,'101','00'), (200,'102','00'), (200,'103','00'), (200,'104','00'), (200,'105','00'), (200,'106','00'), (200,'107','00'), (200,'108','00'), (200,'109','00'), (200,'110','00'), (200,'111','00'), (200,'999','00'), (210,'101','01'), (210,'101','02'), (210,'101','03'), (210,'101','04'), (210,'102','00'), (210,'103','00'), (210,'104','01'), (210,'104','02'), (210,'105','00'), (210,'106','00'), (210,'107','00'), (210,'108','00'), (210,'109','00'), (210,'110','00'), (210,'110','01'), (210,'110','02'), (210,'110','03'), (210,'111','01'), (210,'111','02'), (210,'112','00'), (210,'113','00'), (210,'114','01'), (210,'114','02'), (210,'114','03'), (210,'114','04'), (210,'114','05'), (210,'114','06'), (210,'115','01'), (210,'115','02'), (210,'115','03'), (210,'116','00'), (210,'116','01'), (210,'116','02'), (210,'117','00'), (210,'117','01'), (210,'117','02'), (210,'117','03'), (210,'117','04'), (210,'117','05'), (210,'117','06'), (210,'118','00'), (210,'119','01'), (210,'119','02'), (210,'120','00'), (210,'121','00'), (210,'122','00'), (210,'123','00'), (210,'123','01'), (210,'123','02'), (210,'123','03'), (210,'123','04'), (210,'123','05'), (210,'124','00'), (210,'125','00'), (210,'126','00'), (210,'126','01'), (210,'126','02'), (210,'127','00'), (210,'128','00'), (210,'129','00'), (210,'130','00'), (210,'130','01'), (210,'130','02'), (210,'130','03'), (210,'131','00'), (210,'132','00'), (210,'133','00'), (210,'134','00'), (210,'135','00'), (210,'136','00'), (210,'136','01'), (210,'136','02'), (210,'136','03'), (210,'136','04'), (210,'137','00'), (210,'137','01'), (210,'137','02'), (210,'137','03'), (210,'137','04'), (210,'137','05'), (210,'138','00'), (210,'139','00'), (210,'140','00'), (210,'141','00'), (210,'142','00'), (210,'143','00'), (210,'143','01'), (210,'143','02'), (210,'144','00'), (210,'145','00'), (210,'146','00'), (210,'147','00'), (210,'148','01'), (210,'148','02'), (210,'148','03'), (210,'148','04'), (210,'148','05'), (210,'148','06'), (210,'148','07'), (210,'148','08'), (210,'148','09'), (210,'148','10'), (210,'148','11'), (210,'148','12'), (210,'148','13'), (210,'148','14'), (210,'148','15'), (210,'148','16'), (210,'148','17'), (210,'148','18'), (210,'148','19'), (210,'148','20'), (210,'148','21'), (210,'148','22'), (210,'148','23'), (210,'149','00'), (210,'150','00'), (210,'151','00'), (210,'152','00'), (210,'153','00'), (210,'154','00'), (210,'154','01'), (210,'155','00'), (210,'156','00'), (210,'157','00'), (210,'158','00'), (210,'159','00'), (210,'160','00'), (210,'161','00'), (210,'162','00'), (210,'163','00'), (210,'164','00'), (210,'165','00'), (210,'166','00'), (210,'167','00'), (210,'167','01'), (210,'167','02'), (210,'168','00'), (210,'168','01'), (210,'168','02'), (210,'168','03'), (210,'169','00'), (210,'170','00'), (210,'171','00'), (210,'172','00'), (210,'173','01'), (210,'173','02'), (210,'173','03'), (210,'173','04'), (210,'174','00'), (210,'174','01'), (210,'175','00'), (210,'176','00'), (210,'999','00'), (210,'999','01'), (210,'999','02'), (220,'101','01'), (220,'101','02'), (220,'101','03'), (220,'101','04'), (220,'101','05'), (220,'101','06'), (220,'101','07'), (220,'101','08'), (220,'101','09'), (220,'101','10'), (220,'101','11'), (220,'101','12'), (220,'101','13'), (220,'102','01'), (220,'102','02'), (220,'103','01'), (220,'103','02'), (220,'104','01'), (220,'104','02'), (220,'104','03'), (220,'105','00'), (220,'106','00'), (220,'107','00'), (220,'108','00'), (220,'109','00'), (220,'110','00'), (220,'111','00'), (220,'111','02'), (220,'112','00'), (220,'113','00'), (220,'114','00'), (220,'115','00'), (220,'116','00'), (220,'117','00'), (220,'118','00'), (220,'119','00'), (220,'120','00'), (220,'121','00'), (220,'122','00'), (220,'123','00'), (220,'124','00'), (220,'125','00'), (220,'126','00'), (220,'127','00'), (220,'128','00'), (220,'129','00'), (220,'130','00'), (220,'131','00'), (220,'132','00'), (220,'133','00'), (220,'134','00'), (220,'135','00'), (220,'136','00'), (220,'137','00'), (220,'138','00'), (220,'139','00'), (220,'140','00'), (220,'141','00'), (220,'142','00'), (220,'143','00'), (220,'144','00'), (220,'145','00'), (220,'146','00'), (220,'147','00'), (220,'148','00'), (220,'175','00'), (220,'999','00'), (220,'999','01'), (230,'101','00'), (230,'101','01'), (230,'101','02'), (230,'101','05'), (230,'102','00'), (230,'102','01'), (230,'102','02'), (230,'102','05'), (230,'103','01'), (230,'103','02'), (230,'999','00'), (230,'999','01'), (240,'101','00'), (240,'102','00'), (240,'999','00'), (250,'101','00'), (250,'102','01'), (250,'102','02'), (250,'102','03'), (250,'103','00'), (250,'104','00'), (250,'104','01'), (250,'105','00'), (250,'999','00'), (260,'101','00'), (260,'999','00'), (270,'101','00'), (270,'102','00'), (280,'086','00'), (280,'087','00'), (280,'088','00'), (280,'089','00'), (280,'090','00'), (290,'081','00'), (290,'082','00'), (290,'083','00'), (290,'084','00'), (290,'085','00'), (290,'086','00'), (290,'087','00'), (290,'088','00'), (290,'089','00'), (290,'090','00'), (300,'083','00'), (300,'084','00'), (300,'085','00'), (300,'086','00'), (300,'087','00'), (300,'088','00'), (300,'089','00'), (300,'090','00'), (310,'090','00'), (320,'090','00'), (330,'088','00'), (330,'089','00'), (330,'090','00'), (340,'089','00'), (340,'090','00'), (350,'087','00'), (350,'088','00'), (350,'089','00'), (350,'090','00'), (370,'101','00'), (940,'134','00'), (940,'177','03'), (940,'454','00'), (940,'509','00'), (940,'532','00'), (960,'106','00'), (970,'108','00'), (980,'998','00');


INSERT INTO Kompetenzgruppen(KG_ID, KG_Bezeichnung, KG_Spalte, KG_Zeile) VALUES (-2,'keine',-2,-2), (-1,'admin',-1,-1), (100,'Schüler Individualdaten',1,1), (200,'Schüler Leistungsdaten',1,2), (300,'Berichte',2,3), (400,'Import/Export',3,1), (500,'Blockoperationen',3,2), (600,'Schulbezogene Daten',3,3), (700,'Extras',3,4), (800,'Katalog-Einträge',1,3), (900,'Lehrerdaten',2,2), (1000,'Verfahren Schulpflichtverletzung',2,3), (1100,'Stundenplanung',4,1), (1300,'Notenmodul',4,2), (1400,'Datenbank-Management',4,3), (1600,'Oberstufe - Laufbahnplanung',5,1), (1700,'Oberstufe - Kursplanung',5,2), (1800,'Oberstufe - Klausurplanung',5,3), (1900,'Abitur',5,4), (2000,'Addressbuch (CardDAV)',1,4), (3000,'Kalender (CalDAV)',1,5), (4000,'Abschlussberechnung Sek I',2,1), (5000,'Abschlussberechnung berufsbildende Schule',2,2);


INSERT INTO Kompetenzen(KO_ID, KO_Gruppe, KO_Bezeichnung) VALUES (-2,-2,'keine'), (-1,-1,'admin'), (11,100,'Ansehen'), (12,100,'Ändern'), (13,100,'Löschen'), (14,100,'Vermerke ändern'), (15,100,'KAoA-Daten ändern'), (16,100,'Einwilligungen ändern (DSGVO, Lernplattformen)'), (21,200,'Ansehen'), (22,200,'Funktionsbezogen ändern'), (23,200,'Alle ändern'), (31,300,'Alle Formulare drucken'), (32,300,'Standard-Formulare drucken'), (33,300,'Ändern'), (34,300,'Löschen'), (41,400,'Daten importieren'), (42,400,'Schülerdaten exportieren'), (43,400,'Lehrerdaten exportieren'), (44,400,'Schnittstelle SchILD-NRW verwenden'), (45,400,'Access-DB-Export durchführen'), (46,400,'Export über XML-Schnittstellen'), (47,400,'Datenaustausch mit Schulbewerbung.de'), (61,600,'Ansehen'), (62,600,'Ändern'), (71,700,'Backup durchführen'), (72,700,'Gelöschte Daten zurückholen'), (73,700,'Farben für Fachgruppen ändern'), (74,700,'Daten aus Kurs42 importieren'), (75,700,'Personengruppen bearbeiten'), (81,800,'Ansehen'), (82,800,'Ändern'), (83,800,'Löschen'), (91,900,'Ansehen'), (92,900,'Ändern'), (93,900,'Löschen'), (94,900,'Detaildaten ansehen'), (95,900,'Detaildaten ändern'), (101,1000,'Ansehen'), (102,1000,'Ändern'), (103,1000,'Löschen'), (111,1100,'Stundenplan ansehen (allgemein)'), (112,1100,'Stundneplan ansehen (funktionsbezogen)'), (113,1100,'Stundenpläne importieren'), (114,1100,'Stundenpläne exportieren'), (115,1100,'Stundenpläne erstellen'), (116,1100,'Stundenpläne aktivieren'), (131,1300,'Administration Notenmodul'), (132,1300,'Noten ändern (allgemein)'), (133,1300,'Noten ändern (funktionsbezogen)'), (134,1300,'Noten ansehen (allgemein)'), (135,1300,'Noten ansehen (funktionsbezogen)'), (141,1400,'Schema erstellen und migrieren'), (142,1400,'SQLite importieren (Backup einspielen)'), (143,1400,'SQLite exportieren (Backup erstellen)'), (161,1600,'Laufbahnplanung (allgemein)'), (162,1600,'Laufbahnplanung (funktionsbezogen)'), (163,1600,'Laufbahnplanung aus LuPO importieren'), (171,1700,'Kursverwaltung - Blocken (allgemein)'), (172,1700,'Kursverwaltung - Blocken (funktionsbezogen)'), (173,1700,'Kursverwaltung - Blockung aktivieren'), (181,1800,'Klausurplanung ändern'), (182,1800,'Klausurplanung ansehen (allgemein)'), (183,1800,'Klausurplanung ansehen (funktionsbezogen)'), (191,1900,'Abiturdaten ansehen (allgemein)'), (192,1900,'Abiturdaten ansehen (funktionsbezogen)'), (193,1900,'Abiturdaten ändern (allgemein)'), (194,1900,'Abiturdaten ändern (funktionsbezogen)'), (195,1900,'Prüfungsergebnisse eingeben (allgemein)'), (196,1900,'Prüfungsergebnisse eingeben (funktionsbezogen)'), (201,2000,'Ansehen'), (202,2000,'Ansehen'), (301,3000,'Ansehen'), (302,3000,'Bearbeiten'), (303,3000,'Ansehen'), (401,4000,'Abschlussdaten ansehen (allgemein)'), (402,4000,'Abschlussdaten ansehen (funktionsbezogen)'), (403,4000,'Abschlussdaten ändern (allgemein)'), (404,4000,'Abschlussdaten ändern (funktionsbezogen)'), (405,4000,'Prüfungsergebnisse eingeben (allgemein)'), (406,4000,'Prüfungsergebnisse eingeben (funktionsbezogen)'), (501,5000,'Abschlussdaten ansehen (allgemein)'), (502,5000,'Abschlussdaten ansehen (funktionsbezogen)'), (503,5000,'Abschlussdaten ändern (allgemein)'), (504,5000,'Abschlussdaten ändern (funktionsbezogen)'), (505,5000,'Prüfungsergebnisse eingeben (allgemein)'), (506,5000,'Prüfungsergebnisse eingeben (funktionsbezogen)');


INSERT INTO KAoA_Anschlussoption_Keys(ID) VALUES (22), (23), (24), (25), (26), (27), (28), (29), (30), (31), (32), (33), (34), (35), (36), (37), (38), (39), (40), (41), (42), (43), (44), (45), (46), (47), (48), (49), (50), (51), (52), (53), (54), (55), (56), (57), (58);


INSERT INTO KAoA_Berufsfeld_Keys(ID) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16);


INSERT INTO KAoA_Kategorie_Keys(ID) VALUES (6), (7), (8), (9), (10), (11), (12), (13), (14);


INSERT INTO KAoA_Merkmal_Keys(ID) VALUES (35), (36), (37), (38), (39), (40), (41), (42), (43), (44), (45), (46), (47), (48), (49), (50), (51), (52), (53), (54), (55), (56), (57), (58), (59), (60), (61), (62), (63), (64), (65), (66), (67), (68), (69);


INSERT INTO KAoA_Zusatzmerkmal_Keys(ID) VALUES (13), (14), (15), (16), (17), (18), (19), (20), (21), (22), (23), (24), (25), (26), (27), (28), (29), (30), (31), (32), (33), (34), (35), (36), (37), (38), (39), (40), (41), (42), (43), (44), (45), (46), (47), (48), (49), (50), (51), (52), (53), (54), (55), (56), (57), (58), (59), (60), (61), (62), (63), (64), (65), (66), (67), (68), (69), (70), (71), (72), (73), (74), (75), (76), (77), (78), (79), (80), (81), (82), (83), (84), (85), (86), (87), (88), (89), (90), (91), (92), (93), (94), (95), (96), (97), (98), (99), (100), (101), (102), (103), (104), (105), (106), (107), (108), (109), (110), (111), (112), (113), (114), (115), (116), (117), (118), (119), (120), (121), (122), (123), (124), (125), (126), (127), (128), (129);


INSERT INTO KAoA_SBO_Ebene4_Keys(ID) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20), (21), (22), (23), (24);


INSERT INTO SchuelerStatus_Keys(ID) VALUES (0), (1), (2), (3), (6), (8), (9), (10);



INSERT INTO Credentials(ID, Benutzername, BenutzernamePseudonym, Initialkennwort, PasswordHash, RSAPublicKey, RSAPrivateKey, AES) VALUES (1, 'Admin', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO BenutzerAllgemein(ID,AnzeigeName,CredentialID) VALUES (1,'Administrator',1);

INSERT INTO Benutzer(ID, Typ, Allgemein_ID, Lehrer_ID, Schueler_ID, Erzieher_ID, IstAdmin) VALUES (1, 0, 1, NULL, NULL, NULL, 1);

INSERT INTO Benutzergruppen(ID, Bezeichnung, IstAdmin) VALUES (1, 'Administrator', 1),(2, 'Lehrer', 0),(3, 'Sekretariat', 0);

INSERT INTO BenutzergruppenMitglieder(Gruppe_ID, Benutzer_ID) VALUES (1, 1);

INSERT INTO BenutzergruppenKompetenzen(Gruppe_ID, Kompetenz_ID) VALUES (2, 11), (2, 21), (2, 22), (2, 31), (2, 61), (2, 81),(3, 11),(3, 12),(3, 13),(3, 14),(3, 21),(3, 31),(3, 32),(3, 33),(3, 34),(3, 61),(3, 62),(3, 71),(3, 81),(3, 82),(3, 83),(3, 91),(3, 92),(3, 93),(3, 94),(3, 95);
