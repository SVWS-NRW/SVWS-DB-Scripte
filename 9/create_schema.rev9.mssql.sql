CREATE TABLE AllgemeineMerkmaleKatalog_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_AllgemeineMerkmaleKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Benutzergruppen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  IstAdmin int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Benutzergruppen PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Anlagen (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Anlagen PRIMARY KEY (ID),
  CONSTRAINT Berufskolleg_Anlagen_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE Berufskolleg_Berufsebenen1 (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Berufsebenen1 PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Berufsebenen2 (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Berufsebenen2 PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Berufsebenen3 (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Berufskolleg_Berufsebenen3 PRIMARY KEY (ID)
);


CREATE TABLE Berufskolleg_Fachklassen_Keys (
  FachklassenIndex int NOT NULL, 
  Schluessel nvarchar(3) NOT NULL, 
  Schluessel2 nvarchar(2) NOT NULL,
  CONSTRAINT PK_Berufskolleg_Fachklassen_Keys PRIMARY KEY (FachklassenIndex, Schluessel, Schluessel2)
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
  Kursart nvarchar(10), 
  KursartAllg nvarchar(10), 
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


CREATE TABLE EinschulungsartKatalog_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_EinschulungsartKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE FachKatalog (
  ID bigint NOT NULL, 
  KuerzelASD nvarchar(10) NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Aufgabenfeld int, 
  Fachgruppe nvarchar(10), 
  JahrgangAb nvarchar(10), 
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
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_FachKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE FachKatalog_Schulformen (
  Fach_ID bigint NOT NULL, 
  Schulform_Kuerzel nvarchar(10) NOT NULL, 
  Schulgliederung_Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_FachKatalog_Schulformen PRIMARY KEY (Fach_ID, Schulform_Kuerzel, Schulgliederung_Kuerzel)
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
  Kursart nvarchar(10),
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Teilleistung_ID, Fach_ID, Kursart),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
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
  IstAktiv int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Gost_Blockung PRIMARY KEY (ID),
  CONSTRAINT Gost_Blockung_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Jahrgang_Fachkombinationen (
  ID bigint DEFAULT -1 NOT NULL, 
  Abi_Jahrgang int DEFAULT -1 NOT NULL, 
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 nvarchar(10), 
  Kursart2 nvarchar(10), 
  EF1 int DEFAULT 1 NOT NULL, 
  EF2 int DEFAULT 1 NOT NULL, 
  Q11 int DEFAULT 1 NOT NULL, 
  Q12 int DEFAULT 1 NOT NULL, 
  Q21 int DEFAULT 1 NOT NULL, 
  Q22 int DEFAULT 1 NOT NULL, 
  Typ int DEFAULT 0 NOT NULL, 
  Hinweistext nvarchar(255) DEFAULT '' NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Fachkombinationen PRIMARY KEY (ID),
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
  WochenstundenQPhase int,
  CONSTRAINT PK_Gost_Jahrgang_Faecher PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Faecher_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Faecher_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Blockung_Kurse (
  ID bigint DEFAULT -1 NOT NULL, 
  Blockung_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart nvarchar(10) DEFAULT 'GK' NOT NULL, 
  Kursnummer int NOT NULL, 
  IstKoopKurs int DEFAULT 0 NOT NULL, 
  BezeichnungSuffix nvarchar(255), 
  Schienenanzahl int DEFAULT 1 NOT NULL, 
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
  IstMarkiert int DEFAULT 0 NOT NULL, 
  IstVorlage int DEFAULT 0 NOT NULL,
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
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schienen PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schienen_ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_ErgID_FK FOREIGN KEY (Zwischenergebnis_ID) REFERENCES Gost_Blockung_Zwischenergebnisse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schienen_Schiene_FK FOREIGN KEY (Schienen_ID) REFERENCES Gost_Blockung_Schienen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Herkunft (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Beschreibung nvarchar(255) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Herkunft PRIMARY KEY (ID)
);


CREATE TABLE Herkunft_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_Herkunft_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Herkunft_Schulformen (
  Herkunft_ID bigint NOT NULL, 
  Schulform_Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_Herkunft_Schulformen PRIMARY KEY (Herkunft_ID, Schulform_Kuerzel)
);


CREATE TABLE Herkunftsart (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Herkunftsart PRIMARY KEY (ID)
);


CREATE TABLE Herkunftsart_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_Herkunftsart_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Herkunftsart_Schulformen (
  Herkunftsart_ID bigint NOT NULL, 
  Schulform_Kuerzel nvarchar(10) NOT NULL, 
  KurzBezeichnung nvarchar(255) NOT NULL, 
  Bezeichnung nvarchar(255) NOT NULL,
  CONSTRAINT PK_Herkunftsart_Schulformen PRIMARY KEY (Herkunftsart_ID, Schulform_Kuerzel)
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


CREATE TABLE Jahrgaenge_Keys (
  Kuerzel nvarchar(2) NOT NULL,
  CONSTRAINT PK_Jahrgaenge_Keys PRIMARY KEY (Kuerzel)
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
  Bezeichnung nvarchar(100) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(250) NOT NULL, 
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


CREATE TABLE KlassenartenKatalog_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_KlassenartenKatalog_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE Kompetenzgruppen (
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung nvarchar(50) NOT NULL, 
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL,
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


CREATE TABLE KursartenKatalog_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_KursartenKatalog_Keys PRIMARY KEY (Kuerzel)
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


CREATE TABLE Nationalitaeten_Keys (
  DEStatisCode nvarchar(3) NOT NULL,
  CONSTRAINT PK_Nationalitaeten_Keys PRIMARY KEY (DEStatisCode)
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 nvarchar(10), 
  Kursart2 nvarchar(10), 
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


CREATE TABLE OrganisationsformenKatalog_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_OrganisationsformenKatalog_Keys PRIMARY KEY (Kuerzel)
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


CREATE TABLE Gost_Jahrgang_Beratungslehrer (
  Abi_Jahrgang int NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Jahrgang_Beratungslehrer PRIMARY KEY (Abi_Jahrgang, Lehrer_ID),
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Lehrer_ID_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
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


CREATE TABLE Religionen_Keys (
  Kuerzel nvarchar(10) NOT NULL,
  CONSTRAINT PK_Religionen_Keys PRIMARY KEY (Kuerzel)
);


CREATE TABLE SVWS_Client_Konfiguration_Global (
  AppName nvarchar(100) NOT NULL, 
  Schluessel nvarchar(255) NOT NULL, 
  Wert nvarchar(max) NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Global PRIMARY KEY (AppName, Schluessel)
);


CREATE TABLE SVWS_Core_Type_Versionen (
  NameTabelle nvarchar(255) NOT NULL, 
  Name nvarchar(1023) NOT NULL, 
  Version bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_Core_Type_Versionen PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_AutoInkremente (
  NameTabelle nvarchar(200) NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_DB_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_Version (
  Revision bigint DEFAULT 0 NOT NULL, 
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
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Erzeuger nvarchar(20), 
  Privat nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerStatus_Keys (
  ID int NOT NULL,
  CONSTRAINT PK_SchuelerStatus_Keys PRIMARY KEY (ID)
);


CREATE TABLE SchuleCredentials (
  Schulnummer int NOT NULL, 
  RSAPublicKey nvarchar(max), 
  RSAPrivateKey nvarchar(max), 
  AES nvarchar(max),
  CONSTRAINT PK_SchuleCredentials PRIMARY KEY (Schulnummer)
);


CREATE TABLE Schulformen (
  ID bigint NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  Nummer nvarchar(2), 
  Bezeichnung nvarchar(255) NOT NULL, 
  HatGymOb int DEFAULT 0 NOT NULL, 
  gueltigVon int, 
  gueltigBis int,
  CONSTRAINT PK_Schulformen PRIMARY KEY (ID)
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
  AbschnittBez nvarchar(20) DEFAULT 'Halbjahr', 
  BezAbschnitt1 nvarchar(12) DEFAULT '1. Hj', 
  BezAbschnitt2 nvarchar(12) DEFAULT '2. Hj', 
  BezAbschnitt3 nvarchar(12), 
  BezAbschnitt4 nvarchar(12), 
  Fremdsprachen nvarchar(1) DEFAULT '+', 
  JVAZeigen nvarchar(1) DEFAULT '-', 
  RefPaedagogikZeigen nvarchar(1) DEFAULT '-', 
  AnzJGS_Jahr smallint DEFAULT 1, 
  IstHauptsitz nvarchar(1) DEFAULT '+', 
  NotenGesperrt nvarchar(1) DEFAULT '-', 
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
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
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
  KursartAllg nvarchar(10), 
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
  CONSTRAINT Kurse_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_Fortschreibungsart_FK FOREIGN KEY (Fortschreibungsart) REFERENCES KursFortschreibungsarten(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_UC1 UNIQUE (Schuljahresabschnitts_ID, KurzBez, ASDJahrgang, Fach_ID, KursartAllg, WochenStd, Lehrer_ID, Jahrgaenge)
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
  LSVersetzung nvarchar(10), 
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
  VerkehrsspracheFamilie nvarchar(3) DEFAULT 'deu', 
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
  CONSTRAINT Schueler_Status_FK FOREIGN KEY (Status) REFERENCES SchuelerStatus_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_1_FK FOREIGN KEY (StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_2_FK FOREIGN KEY (StaatKrz2) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_3_FK FOREIGN KEY (GeburtslandSchueler) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_4_FK FOREIGN KEY (GeburtslandVater) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_5_FK FOREIGN KEY (GeburtslandMutter) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
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
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schueler PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schueler_ID),
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_ErgID_FK FOREIGN KEY (Zwischenergebnis_ID) REFERENCES Gost_Blockung_Zwischenergebnisse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_Kurs_FK FOREIGN KEY (Blockung_Kurs_ID) REFERENCES Gost_Blockung_Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Blockung_Zwischenergebnisse_Kurs_Schueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Schueler (
  Schueler_ID bigint NOT NULL, 
  DatumBeratung datetime2, 
  DatumRuecklauf datetime2, 
  HatSportattest int DEFAULT 0 NOT NULL, 
  Kommentar nvarchar(max), 
  Beratungslehrer_ID bigint, 
  PruefPhase nvarchar(1), 
  BesondereLernleistung_Art nvarchar(1), 
  BesondereLernleistung_Punkte int,
  CONSTRAINT PK_Gost_Schueler PRIMARY KEY (Schueler_ID),
  CONSTRAINT Gost_Schueler_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Schueler_Fachwahlen (
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  EF1_Kursart nvarchar(10), 
  EF1_Punkte nvarchar(2), 
  EF2_Kursart nvarchar(10), 
  EF2_Punkte nvarchar(2), 
  Q11_Kursart nvarchar(10), 
  Q11_Punkte nvarchar(2), 
  Q12_Kursart nvarchar(10), 
  Q12_Punkte nvarchar(2), 
  Q21_Kursart nvarchar(10), 
  Q21_Punkte nvarchar(2), 
  Q22_Kursart nvarchar(10), 
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
  KursartAllg nvarchar(10), 
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
  Kursart nvarchar(10),
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
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Schueler_ID, Datenschutz_ID),
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
  CONSTRAINT SchuelerErzAdr_Staat1_FK FOREIGN KEY (Erz1StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Staat2_FK FOREIGN KEY (Erz2StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL
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
  KursartAllg nvarchar(10), 
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
  Tutor_ID bigint, 
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
  CONSTRAINT SchuelerLernabschnittsdaten_Tutor_FK FOREIGN KEY (Tutor_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
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
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (ID),
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
  CONSTRAINT SchuelerKAoADaten_Kategorie_FK FOREIGN KEY (KategorieID) REFERENCES KAoA_Kategorie_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Merkmal_FK FOREIGN KEY (MerkmalID) REFERENCES KAoA_Merkmal_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Zusatzmerkmal_FK FOREIGN KEY (ZusatzmerkmalID) REFERENCES KAoA_Zusatzmerkmal_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Anschlussoption_FK FOREIGN KEY (AnschlussoptionID) REFERENCES KAoA_Anschlussoption_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Berufsfeld_FK FOREIGN KEY (BerufsfeldID) REFERENCES KAoA_Berufsfeld_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_SBO_Ebene4_FK FOREIGN KEY (SBO_Ebene4ID) REFERENCES KAoA_SBO_Ebene4_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL
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
  Kursart nvarchar(10), 
  KursartAllg nvarchar(10), 
  Kurs_ID bigint, 
  NotenKrz nvarchar(2), 
  NotenKrzQuartal nvarchar(2), 
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
  Kursart nvarchar(10),
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


CREATE TABLE DavRessourceCollections (
  Benutzer_ID bigint NOT NULL, 
  ID bigint DEFAULT -1 NOT NULL, 
  Typ int NOT NULL, 
  Anzeigename nvarchar(120) NOT NULL, 
  Beschreibung nvarchar(2047), 
  SyncToken datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  geloeschtam datetime2,
  CONSTRAINT PK_DavRessourceCollections PRIMARY KEY (ID),
  CONSTRAINT DavRessourceCollection_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE DavRessourceCollectionsACL (
  ID bigint DEFAULT -1 NOT NULL, 
  Benutzer_ID bigint NOT NULL, 
  RessourceCollection_ID bigint NOT NULL, 
  berechtigungen nvarchar(20) NOT NULL,
  CONSTRAINT PK_DavRessourceCollectionsACL PRIMARY KEY (ID),
  CONSTRAINT DavRessourceCollectionsACL_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT DavRessourceCollectionsACL_RessourceCollection_FK FOREIGN KEY (RessourceCollection_ID) REFERENCES DavRessourceCollections(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL, 
  LI_LoginTime datetime2, 
  LI_LogoffTime datetime2,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_UserID, LI_LoginTime),
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


CREATE TABLE LehrerLeitungsfunktion_Keys (
  ID bigint NOT NULL,
  CONSTRAINT PK_LehrerLeitungsfunktion_Keys PRIMARY KEY (ID)
);


CREATE TABLE Schulleitung (
  ID bigint DEFAULT -1 NOT NULL, 
  LeitungsfunktionID bigint NOT NULL, 
  Funktionstext nvarchar(255) NOT NULL, 
  LehrerID bigint NOT NULL, 
  Von datetime2, 
  Bis datetime2,
  CONSTRAINT PK_Schulleitung PRIMARY KEY (ID),
  CONSTRAINT Schulleitung_Leitungsfunktion_FK FOREIGN KEY (LeitungsfunktionID) REFERENCES LehrerLeitungsfunktion_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schulleitung_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Stundenplan (
  ID bigint DEFAULT -1 NOT NULL, 
  Schuljahresabschnitts_ID bigint NOT NULL, 
  Beginn date DEFAULT '1899-01-01' NOT NULL, 
  Ende date, 
  Beschreibung nvarchar(1000) NOT NULL, 
  WochentypModell int DEFAULT 0 NOT NULL,
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


CREATE TABLE Stundenplan_Schienen (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Jahrgang_ID bigint, 
  Nummer int NOT NULL, 
  Bezeichnung nvarchar(100) NOT NULL,
  CONSTRAINT PK_Stundenplan_Schienen PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Schienen_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Schienen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Stundenplan_Schienen_UC1 UNIQUE (Stundenplan_ID, Jahrgang_ID, Nummer)
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
  Kurs_ID bigint, 
  Fach_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Unterricht PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Unterricht_EigeneSchule_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Stundenplan_Zeitraster_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Stundenplan_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Stundenplan_UnterrichtKlasse (
  ID bigint DEFAULT -1 NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Klasse_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtKlasse PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtKlasse_Klasse_FK FOREIGN KEY (Klasse_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtKlasse_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtKlasse_UC1 UNIQUE (Unterricht_ID, Klasse_ID)
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


CREATE TABLE Stundenplan_UnterrichtSchiene (
  ID bigint DEFAULT -1 NOT NULL, 
  Unterricht_ID bigint NOT NULL, 
  Schiene_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_UnterrichtSchiene PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtSchiene_Schienen_FK FOREIGN KEY (Schiene_ID) REFERENCES Stundenplan_Schienen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtSchiene_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtSchiene_UC1 UNIQUE (Unterricht_ID, Schiene_ID)
);


CREATE TABLE Stundenplan_Kalenderwochen_Zuordnung (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundenplan_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  KW int NOT NULL, 
  Wochentyp int NOT NULL,
  CONSTRAINT PK_Stundenplan_Kalenderwochen_Zuordnung PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Kalenderwochen_Zuordnung_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Kalenderwochen_Zuordnung_UC1 UNIQUE (Stundenplan_ID, Jahr, KW)
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
  KursartAllg nvarchar(10), 
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


CREATE TABLE TextExportVorlagen (
  VorlageName nvarchar(50) NOT NULL, 
  Daten nvarchar(max),
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (VorlageName)
);


CREATE TABLE Usergroups (
  UG_ID bigint NOT NULL, 
  UG_Bezeichnung nvarchar(64), 
  UG_Kompetenzen nvarchar(255), 
  UG_Nr int, 
  SchulnrEigner int,
  CONSTRAINT PK_Usergroups PRIMARY KEY (UG_ID),
  CONSTRAINT Usergroups_UC1 UNIQUE (UG_Bezeichnung)
);


CREATE TABLE Users (
  ID bigint DEFAULT -1 NOT NULL, 
  US_Name nvarchar(50) NOT NULL, 
  US_LoginName nvarchar(20) NOT NULL, 
  US_Password nvarchar(20), 
  US_UserGroups nvarchar(50), 
  US_Privileges nvarchar(255), 
  SchulnrEigner int, 
  Email nvarchar(100), 
  EmailName nvarchar(100), 
  SMTPUsername nvarchar(100), 
  SMTPPassword nvarchar(100), 
  EmailSignature nvarchar(max), 
  HeartbeatDate int, 
  ComputerName nvarchar(50), 
  US_PasswordHash nvarchar(255),
  CONSTRAINT PK_Users PRIMARY KEY (ID),
  CONSTRAINT Users_UC1 UNIQUE (US_LoginName)
);


CREATE TABLE Versetzung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(150), 
  ASDKlasse nvarchar(6), 
  Klasse nvarchar(15) NOT NULL, 
  Jahrgang_ID bigint, 
  FKlasse nvarchar(15), 
  VKlasse nvarchar(15), 
  OrgFormKrz nvarchar(1), 
  KlassenlehrerKrz nvarchar(10), 
  StvKlassenlehrerKrz nvarchar(10), 
  Restabschnitte smallint, 
  ASDSchulformNr nvarchar(3), 
  Fachklasse_ID bigint, 
  PruefOrdnung nvarchar(20), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Klassenart nvarchar(2), 
  SommerSem nvarchar(1) DEFAULT '-', 
  NotenGesperrt nvarchar(1) DEFAULT '-', 
  SchulnrEigner int, 
  AdrMerkmal nvarchar(1) DEFAULT 'A', 
  WebNotenGesperrt nvarchar(1) DEFAULT '-', 
  KoopKlasse nvarchar(1) DEFAULT '-', 
  Ankreuzzeugnisse nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_Versetzung PRIMARY KEY (ID)
);


CREATE TABLE DavRessources (
  ID bigint DEFAULT -1 NOT NULL, 
  DavRessourceCollection_ID bigint NOT NULL, 
  UID nvarchar(120) NOT NULL, 
  lastModified datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  KalenderTyp nvarchar(120) NOT NULL, 
  KalenderStart datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  KalenderEnde datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  ressource varbinary(max) NOT NULL, 
  geloeschtam datetime2,
  CONSTRAINT PK_DavRessources PRIMARY KEY (ID),
  CONSTRAINT DavRessources_Collection_FK FOREIGN KEY (DavRessourceCollection_ID) REFERENCES DavRessourceCollections(ID) ON UPDATE CASCADE ON DELETE CASCADE
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


CREATE TABLE DavSyncTokenSchueler (
  ID bigint DEFAULT -1 NOT NULL, 
  SyncToken datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_DavSyncTokenSchueler PRIMARY KEY (ID),
  CONSTRAINT DavSyncTokenSchueler_FK FOREIGN KEY (ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE DavSyncTokenLehrer (
  ID bigint DEFAULT -1 NOT NULL, 
  SyncToken datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_DavSyncTokenLehrer PRIMARY KEY (ID),
  CONSTRAINT DavSyncTokenLehrer_FK FOREIGN KEY (ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EnmLeistungsdaten (
  ID bigint NOT NULL, 
  tsNotenKrz datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsFehlStd datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsuFehlStd datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsLernentw datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsWarnung datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_EnmLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT EnmLeistungsdaten_FK FOREIGN KEY (ID) REFERENCES SchuelerLeistungsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EnmLernabschnittsdaten (
  ID bigint NOT NULL, 
  tsSumFehlStd datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsSumFehlStdU datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsZeugnisBem datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsASV datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsAUE datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  tsBemerkungVersetzung datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT PK_EnmLernabschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT EnmLernabschnittsdaten_FK FOREIGN KEY (ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Vorgaben (
  ID bigint DEFAULT -1 NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL, 
  Quartal int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart nvarchar(10) DEFAULT 'GK' NOT NULL, 
  Dauer int NOT NULL, 
  Auswahlzeit int NOT NULL, 
  IstMdlPruefung int DEFAULT 0 NOT NULL, 
  IstAudioNotwendig int DEFAULT 0 NOT NULL, 
  IstVideoNotwendig int DEFAULT 0 NOT NULL, 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_Gost_Klausuren_Vorgaben PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Vorgaben_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Vorgaben_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Vorgaben_UC1 UNIQUE (Abi_Jahrgang, Halbjahr, Quartal, Fach_ID, Kursart)
);


CREATE TABLE Gost_Klausuren_Termine (
  ID bigint DEFAULT -1 NOT NULL, 
  Abi_Jahrgang int NOT NULL, 
  Halbjahr int NOT NULL, 
  Quartal int NOT NULL, 
  Datum date, 
  Startzeit time, 
  Bezeichnung nvarchar(max), 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_Gost_Klausuren_Termine PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Termine_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Kursklausuren (
  ID bigint DEFAULT -1 NOT NULL, 
  Vorgabe_ID bigint NOT NULL, 
  Kurs_ID bigint NOT NULL, 
  Termin_ID bigint, 
  Startzeit time,
  CONSTRAINT PK_Gost_Klausuren_Kursklausuren PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Kursklausuren_Vorgabe_ID_FK FOREIGN KEY (Vorgabe_ID) REFERENCES Gost_Klausuren_Vorgaben(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT Gost_Klausuren_Kursklausuren_Kurs_ID_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Kursklausuren_Termin_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Gost_Klausuren_Kursklausuren_UC1 UNIQUE (Vorgabe_ID, Kurs_ID)
);


CREATE TABLE Gost_Klausuren_Schuelerklausuren (
  ID bigint DEFAULT -1 NOT NULL, 
  Kursklausur_ID bigint NOT NULL, 
  Termin_ID bigint, 
  Schueler_ID bigint NOT NULL, 
  Startzeit time,
  CONSTRAINT PK_Gost_Klausuren_Schuelerklausuren PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Kursklausur_ID_FK FOREIGN KEY (Kursklausur_ID) REFERENCES Gost_Klausuren_Kursklausuren(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_Termin_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Gost_Klausuren_Schuelerklausuren_UC1 UNIQUE (Kursklausur_ID, Schueler_ID)
);


CREATE TABLE Gost_Klausuren_NtaZeiten (
  Schueler_ID bigint NOT NULL, 
  Vorgabe_ID bigint NOT NULL, 
  Zeitzugabe int NOT NULL, 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_Gost_Klausuren_NtaZeiten PRIMARY KEY (Schueler_ID, Vorgabe_ID),
  CONSTRAINT Gost_Klausuren_NtaZeiten_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_NtaZeiten_Vorgabe_ID_FK FOREIGN KEY (Vorgabe_ID) REFERENCES Gost_Klausuren_Vorgaben(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Raeume (
  ID bigint DEFAULT -1 NOT NULL, 
  Termin_ID bigint, 
  Katalog_Raum_ID bigint, 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_Gost_Klausuren_Raeume PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Raeume_Katalog_Raum_ID_FK FOREIGN KEY (Katalog_Raum_ID) REFERENCES Katalog_Raeume(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Gost_Klausuren_Raeume_Termin_ID_FK FOREIGN KEY (Termin_ID) REFERENCES Gost_Klausuren_Termine(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Raeume_Stunden (
  ID bigint DEFAULT -1 NOT NULL, 
  Klausurraum_ID bigint NOT NULL, 
  Zeitraster_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Klausuren_Raeume_Stunden PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Raeume_Stunden_Klausurraum_ID_FK FOREIGN KEY (Klausurraum_ID) REFERENCES Gost_Klausuren_Raeume(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Raeume_Stunden_Zeitraster_ID_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Katalog_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Schuelerklausuren_Raeume_Stunden (
  Schuelerklausur_ID bigint NOT NULL, 
  KlausurRaumStunde_ID bigint NOT NULL,
  CONSTRAINT PK_Gost_Klausuren_Schuelerklausuren_Raeume_Stunden PRIMARY KEY (Schuelerklausur_ID, KlausurRaumStunde_ID),
  CONSTRAINT Gost_Klausuren_SKlausuren_Raeume_Stunden_SK_ID_FK FOREIGN KEY (Schuelerklausur_ID) REFERENCES Gost_Klausuren_Schuelerklausuren(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_SKlausuren_Raeume_Stunden_KRS_ID_FK FOREIGN KEY (KlausurRaumStunde_ID) REFERENCES Gost_Klausuren_Raeume_Stunden(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Gost_Klausuren_Raeume_Stunden_Aufsichten (
  ID bigint DEFAULT -1 NOT NULL, 
  KlausurRaumStunde_ID bigint NOT NULL, 
  Lehrer_ID bigint, 
  Startzeit time, 
  Endzeit time, 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_Gost_Klausuren_Raeume_Stunden_Aufsichten PRIMARY KEY (ID),
  CONSTRAINT Gost_Klausuren_Raeume_Stunden_Aufsichten_KlausurRaumStunde_ID_FK FOREIGN KEY (KlausurRaumStunde_ID) REFERENCES Gost_Klausuren_Raeume_Stunden(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Klausuren_Raeume_Stunden_Aufsichten_Lehrer_ID_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Gost_Klausuren_Kalenderinformationen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(max), 
  Startdatum date, 
  Startzeit time, 
  Enddatum date, 
  Endzeit time, 
  IstSperrtermin int DEFAULT 0 NOT NULL, 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_Gost_Klausuren_Kalenderinformationen PRIMARY KEY (ID)
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
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Jahrgang_Fachkombinationen ON Gost_Jahrgang_Fachkombinationen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Jahrgang_Fachkombinationen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Jahrgang_Fachkombinationen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Jahrgang_Fachkombinationen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Jahrgang_Fachkombinationen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Jahrgang_Fachkombinationen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Jahrgang_Fachkombinationen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Jahrgang_Fachkombinationen ON Gost_Jahrgang_Fachkombinationen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Jahrgang_Fachkombinationen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Jahrgang_Fachkombinationen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Jahrgang_Fachkombinationen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Jahrgang_Fachkombinationen''
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


CREATE TRIGGER t_INSERT_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER ON SchuelerLeistungsdaten AFTER INSERT AS
BEGIN
INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID)
	SELECT i.Kurs_ID, sla.Schueler_ID
	FROM Inserted i JOIN SchuelerLernabschnittsdaten sla ON i.Abschnitt_ID = sla.ID
	WHERE i.Kurs_ID IS NOT NULL
END;

GO


CREATE TRIGGER t_UPDATE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER ON SchuelerLeistungsdaten AFTER UPDATE AS
BEGIN
	DELETE Kurs_Schueler FROM
		Inserted i JOIN Deleted d ON i.ID = d.ID AND i.Kurs_ID IS NULL AND d.Kurs_ID IS NOT NULL
		JOIN SchuelerLernabschnittsdaten sla ON sla.ID = d.Abschnitt_ID
		JOIN Kurs_Schueler ks ON ks.Kurs_ID = d.Kurs_ID AND ks.Schueler_ID = sla.Schueler_ID
	INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID)
		SELECT i.Kurs_ID, sla.Schueler_ID FROM
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


CREATE TRIGGER t_DELETE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER ON SchuelerLeistungsdaten AFTER DELETE AS
BEGIN
	DELETE Kurs_Schueler FROM
		Deleted d
		JOIN SchuelerLernabschnittsdaten sla ON sla.ID = d.Abschnitt_ID AND d.Kurs_ID IS NOT NULL
		JOIN Kurs_Schueler ks ON ks.Kurs_ID = d.Kurs_ID AND ks.Schueler_ID = sla.Schueler_ID
END;

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
CREATE TRIGGER t_AutoIncrement_INSERT_DavRessourceCollections ON DavRessourceCollections INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO DavRessourceCollections
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavRessourceCollections'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM DavRessourceCollections)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavRessourceCollections'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO DavRessourceCollections
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavRessourceCollections''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_DavRessourceCollections ON DavRessourceCollections AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavRessourceCollections'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM DavRessourceCollections)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavRessourceCollections'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavRessourceCollections''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_DavRessourceCollectionsACL ON DavRessourceCollectionsACL INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO DavRessourceCollectionsACL
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavRessourceCollectionsACL'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM DavRessourceCollectionsACL)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavRessourceCollectionsACL'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO DavRessourceCollectionsACL
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavRessourceCollectionsACL''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_DavRessourceCollectionsACL ON DavRessourceCollectionsACL AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavRessourceCollectionsACL'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM DavRessourceCollectionsACL)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavRessourceCollectionsACL'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavRessourceCollectionsACL''
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
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Schienen ON Stundenplan_Schienen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Schienen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Schienen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Schienen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Schienen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Schienen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Schienen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Schienen ON Stundenplan_Schienen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Schienen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Schienen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Schienen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Schienen''
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
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtKlasse ON Stundenplan_UnterrichtKlasse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_UnterrichtKlasse
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtKlasse'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtKlasse)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtKlasse'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_UnterrichtKlasse
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtKlasse''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtKlasse ON Stundenplan_UnterrichtKlasse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtKlasse'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtKlasse)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtKlasse'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtKlasse''
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
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtSchiene ON Stundenplan_UnterrichtSchiene INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_UnterrichtSchiene
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtSchiene'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtSchiene)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtSchiene'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_UnterrichtSchiene
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtSchiene''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtSchiene ON Stundenplan_UnterrichtSchiene AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_UnterrichtSchiene'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtSchiene)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_UnterrichtSchiene'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_UnterrichtSchiene''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Kalenderwochen_Zuordnung ON Stundenplan_Kalenderwochen_Zuordnung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Stundenplan_Kalenderwochen_Zuordnung
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Kalenderwochen_Zuordnung'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Kalenderwochen_Zuordnung)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Kalenderwochen_Zuordnung'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Stundenplan_Kalenderwochen_Zuordnung
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Kalenderwochen_Zuordnung''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Kalenderwochen_Zuordnung ON Stundenplan_Kalenderwochen_Zuordnung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Stundenplan_Kalenderwochen_Zuordnung'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Kalenderwochen_Zuordnung)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Stundenplan_Kalenderwochen_Zuordnung'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Stundenplan_Kalenderwochen_Zuordnung''
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
CREATE TRIGGER t_AutoIncrement_INSERT_DavRessources ON DavRessources INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO DavRessources
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavRessources'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM DavRessources)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavRessources'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO DavRessources
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavRessources''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_DavRessources ON DavRessources AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavRessources'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM DavRessources)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavRessources'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavRessources''
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


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_DavSyncTokenSchueler ON DavSyncTokenSchueler INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO DavSyncTokenSchueler
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavSyncTokenSchueler'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM DavSyncTokenSchueler)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavSyncTokenSchueler'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO DavSyncTokenSchueler
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavSyncTokenSchueler''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_DavSyncTokenSchueler ON DavSyncTokenSchueler AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavSyncTokenSchueler'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM DavSyncTokenSchueler)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavSyncTokenSchueler'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavSyncTokenSchueler''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_DavSyncTokenLehrer ON DavSyncTokenLehrer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO DavSyncTokenLehrer
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavSyncTokenLehrer'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM DavSyncTokenLehrer)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavSyncTokenLehrer'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO DavSyncTokenLehrer
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavSyncTokenLehrer''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_DavSyncTokenLehrer ON DavSyncTokenLehrer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''DavSyncTokenLehrer'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM DavSyncTokenLehrer)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''DavSyncTokenLehrer'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''DavSyncTokenLehrer''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Vorgaben ON Gost_Klausuren_Vorgaben INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Vorgaben
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Vorgaben'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Vorgaben)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Vorgaben'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Vorgaben
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Vorgaben''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Vorgaben ON Gost_Klausuren_Vorgaben AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Vorgaben'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Vorgaben)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Vorgaben'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Vorgaben''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Termine ON Gost_Klausuren_Termine INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Termine
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Termine'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Termine)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Termine'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Termine
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Termine''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Termine ON Gost_Klausuren_Termine AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Termine'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Termine)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Termine'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Termine''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Kursklausuren ON Gost_Klausuren_Kursklausuren INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Kursklausuren
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Kursklausuren'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Kursklausuren)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Kursklausuren'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Kursklausuren
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Kursklausuren''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Kursklausuren ON Gost_Klausuren_Kursklausuren AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Kursklausuren'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Kursklausuren)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Kursklausuren'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Kursklausuren''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Schuelerklausuren ON Gost_Klausuren_Schuelerklausuren INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Schuelerklausuren
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Schuelerklausuren'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Schuelerklausuren)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Schuelerklausuren'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Schuelerklausuren
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Schuelerklausuren''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Schuelerklausuren ON Gost_Klausuren_Schuelerklausuren AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Schuelerklausuren'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Schuelerklausuren)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Schuelerklausuren'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Schuelerklausuren''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Raeume ON Gost_Klausuren_Raeume INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Raeume
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Raeume'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Raeume)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Raeume'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Raeume
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Raeume''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Raeume ON Gost_Klausuren_Raeume AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Raeume'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Raeume)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Raeume'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Raeume''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Raeume_Stunden ON Gost_Klausuren_Raeume_Stunden INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Raeume_Stunden
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Raeume_Stunden)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Raeume_Stunden'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Raeume_Stunden
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Raeume_Stunden ON Gost_Klausuren_Raeume_Stunden AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Raeume_Stunden)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Raeume_Stunden'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Raeume_Stunden_Aufsichten ON Gost_Klausuren_Raeume_Stunden_Aufsichten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Raeume_Stunden_Aufsichten
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden_Aufsichten'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Raeume_Stunden_Aufsichten)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Raeume_Stunden_Aufsichten'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Raeume_Stunden_Aufsichten
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden_Aufsichten''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Raeume_Stunden_Aufsichten ON Gost_Klausuren_Raeume_Stunden_Aufsichten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden_Aufsichten'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Raeume_Stunden_Aufsichten)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Raeume_Stunden_Aufsichten'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Raeume_Stunden_Aufsichten''
    END
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Klausuren_Kalenderinformationen ON Gost_Klausuren_Kalenderinformationen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
  INSERT INTO Gost_Klausuren_Kalenderinformationen
    SELECT * FROM inserted WHERE ID >= 0
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Kalenderinformationen'')
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Kalenderinformationen)
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0
        END
      SET NOCOUNT ON
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Kalenderinformationen'', @tmpID)
      SET NOCOUNT OFF
    END
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1
      INSERT INTO Gost_Klausuren_Kalenderinformationen
        SELECT * FROM #tmp
      DROP TABLE #tmp
    END
  
  SET NOCOUNT ON
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID
	 END
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Kalenderinformationen''
  SET NOCOUNT OFF
END;
')

GO


exec('
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Klausuren_Kalenderinformationen ON Gost_Klausuren_Kalenderinformationen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0)
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = ''Gost_Klausuren_Kalenderinformationen'')
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Gost_Klausuren_Kalenderinformationen)
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0
            END
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES (''Gost_Klausuren_Kalenderinformationen'', @tmpID)
        END    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID
	      END
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = ''Gost_Klausuren_Kalenderinformationen''
    END
END;
')

GO



INSERT INTO SVWS_DB_Version(Revision) VALUES (9);

INSERT INTO Berufskolleg_Anlagen(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (1000,'A','Fachklassen duales System und Ausbildungsvorbereitung',null,null), (2000,'B','Berufsfachschule',null,null), (3000,'C','Berufsfachschule und Fachoberschule',null,null), (4000,'D','Berufliches Gymnasium und Fachoberschule',null,null), (5000,'E','Fachschule',null,null), (6000,'H','Bildungsgänge an freien Waldorfschulen / Hiberniakolleg',null,null), (24000,'X','Ehemalige Kollegschule',null,null), (26000,'Z','Kooperationsklasse Hauptschule',null,null);


INSERT INTO Berufskolleg_Berufsebenen1(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (100001000,'AW','Agrarwirtschaft',null,null), (100002000,'AB','Agrarwirtschaft, Bio- und Umwelttechnologie',null,null), (100003000,'ER','Ernährung',null,null), (100004000,'EU','Ernährung und Hauswirtschaft',null,null), (100005000,'EH','Ernährung/Hauswirtschaft',null,null), (100006000,'EV','Ernährungs- und Versorgungsmanagement',null,null), (100007000,'GT','Gestaltung',null,null), (100008000,'GU','Gesundheit und Soziales',null,null), (100009000,'GE','Gesundheit/Erziehung und Soziales',null,null), (100010000,'GS','Gesundheit/Soziales',null,null), (100011000,'IF','Informatik',null,null), (100012000,'OZ','ohne besondere Zuordnung',null,null), (100013000,'SV','ohne Fachbereich / Schulversuch',null,null), (100014000,'SW','Sozialwesen',null,null), (100015000,'TE','Technik',null,null), (100016000,'TN','Technik/Naturwissenschaften',null,null), (100017000,'WI','Wirtschaft',null,null), (100018000,'WV','Wirtschaft und Verwaltung',null,null);


INSERT INTO Berufskolleg_Berufsebenen2(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (200001000,'EV','Assistent/-in für Ernährung und Versorgung',null,null), (200002000,'AA','Aufbaubildungsgang Augenoptik',null,null), (200003000,'AB','Aufbaubildungsgang Betriebswirtschaft',null,null), (200004000,'BG','Aufbaubildungsgang Bewegung und Gesundheit',null,null), (200005000,'BS','Aufbaubildungsgang Bildung und Schulvorbereitung in Tageseinrichtungen f. Kinder',null,null), (200006000,'BE','Aufbaubildungsgang Bildung, Erziehung u. Betreuung von Kindern unter drei Jahren',null,null), (200007000,'CO','Aufbaubildungsgang Controlling',null,null), (200008000,'XT','Aufbaubildungsgang Existenzgründung',null,null), (200009000,'XS','Aufbaubildungsgang Existenzgründung (Schulversuch)',null,null), (200010000,'BA','Aufbaubildungsgang Fachkraft für Beratung und Anleitung in der Pflege',null,null), (200011000,'HF','Aufbaubildungsgang Fachkraft für heilpädagogische Förderung mit dem Pferd',null,null), (200012000,'IP','Aufbaubildungsgang Inklusive Pädagogik',null,null), (200013000,'MK','Aufbaubildungsgang Medienkompetenz in der Kinder- und Jugendhilfe',null,null), (200014000,'MF','Aufbaubildungsgang Musikalische Förderung im sozialpädagogischen Arbeitsfeld',null,null), (200015000,'NF','Aufbaubildungsgang Naturwissenschaftlich-technische Früherziehung',null,null), (200016000,'OG','Aufbaubildungsgang Offene Ganztagsschule',null,null), (200017000,'PA','Aufbaubildungsgang Praxisanleitung',null,null), (200018000,'PL','Aufbaubildungsgang Produktionslogistik (Schulversuch)',null,null), (200019000,'SM','Aufbaubildungsgang Sozialmanagement',null,null), (200020000,'SF','Aufbaubildungsgang Sprachförderung',null,null), (200021000,'TU','Aufbaubildungsgang Technischer Umweltschutz',null,null), (200022000,'UM','Aufbaubildungsgang Unternehmensmanagement',null,null), (200023000,'AU','Augenoptik',null,null), (200024000,'BH','Bau und Holztechnik',null,null), (200025000,'BP','Baudenkmalpflege u. Altbau.',null,null), (200026000,'BT','Bautechnik',null,null), (200027000,'BK','Bekleidungstechnik',null,null), (200028000,'BB','Bergbautechnik',null,null), (200029000,'BW','Betriebswirtschaft',null,null), (200030000,'BO','Biogentechnik',null,null), (200031000,'BI','Biologietechnik',null,null), (200032000,'CT','Chemietechnik',null,null), (200033000,'DM','Druck- und Medientechnik',null,null), (200034000,'DT','Drucktechnik',null,null), (200035000,'EM','Edelmetallgestaltung',null,null), (200036000,'ET','Elektrotechnik',null,null), (200037000,'FT','Fahrzeugtechnik',null,null), (200038000,'FL','Farb- und Lacktechnik',null,null), (200039000,'FG','Farbe, Gestaltung, Werbung',null,null), (200040000,'FR','Farbtechnik und Raumgestaltung',null,null), (200041000,'GT','Galvanotechnik',null,null), (200042000,'GB','Gartenbau',null,null), (200043000,'GD','Gebäudesystemtechnik',null,null), (200044000,'GS','Gesundheit',null,null), (200045000,'GW','Gesundheitswesen',null,null), (200046000,'GR','Gießereitechnik',null,null), (200047000,'GL','Glastechnik',null,null), (200048000,'GO','Großhaushalt',null,null), (200049000,'HP','Heilerziehungspflege',null,null), (200050000,'HD','Heilpädagogik',null,null), (200051000,'HL','Heizungs-, Lüftungs-, Klimatechnik',null,null), (200052000,'HT','Holztechnik',null,null), (200053000,'HG','Hotel und Gaststätten',null,null), (200054000,'HB','Hotel- und Gaststättengewerbe',null,null), (200055000,'IF','Informatik',null,null), (200056000,'IT','Informations- und Telekommunikationstechnik',null,null), (200057000,'KT','Kältetechnik',null,null), (200058000,'KF','Karosserie- und Fahrzeugbautechnik',null,null), (200059000,'KI','Kinderpfleger/-in',null,null), (200060000,'KP','Körperpflege',null,null), (200061000,'KO','Korrosionsschutztechnik',null,null), (200062000,'KK','Kunststoff- und Kautschuktechnik',null,null), (200063000,'LV','Labor- und Verfahrentechnik',null,null), (200064000,'LW','Landwirtschaft',null,null), (200065000,'LT','Lebensmitteltechnik',null,null), (200066000,'LF','Luftfahrttechnik',null,null), (200067000,'MG','Marketing',null,null), (200068000,'MB','Maschinenbautechnik',null,null), (200069000,'MT','Mechatronik',null,null), (200070000,'MN','Medien',null,null), (200071000,'MM','Medien/Medientechnologie',null,null), (200072000,'MD','Medizintechnik',null,null), (200073000,'ML','Metallbautechnik',null,null), (200074000,'ME','Metalltechnik',null,null), (200075000,'MH','Möbelhandel',null,null), (200076000,'MO','Mode',null,null), (200077000,'MI','Motopädie',null,null), (200078000,'PG','Pädagogik',null,null), (200079000,'PU','Physik, Chemie und Biologie',null,null), (200080000,'PB','Physik, Chemie, Biologie',null,null), (200081000,'PC','Physik/Chemie/Biologie',null,null), (200082000,'PT','Physiktechnik',null,null), (200083000,'SA','Sozialassistent/-in',null,null), (200084000,'SH','Sozialassistent/-in - Heilerziehung',null,null), (200085000,'SP','Sozialpädagogik',null,null), (200086000,'SW','Sozialwesen',null,null), (200087000,'SI','Spreng- und Sicherheitstechnik',null,null), (200088000,'TI','Technische Informatik',null,null), (200089000,'TT','Textiltechnik',null,null), (200090000,'TB','Textiltechnik und Bekleidung',null,null), (200091000,'TO','Tourismus',null,null), (200092000,'US','Umweltschutztechnik',null,null), (200093000,'UT','Umwelttechnik',null,null), (200094000,'VT','Vermessungstechnik',null,null), (200095000,'WT','Werkstofftechnik',null,null), (200096000,'WI','Wirtschaftsinformatik',null,null), (200097000,'WR','Wohnungswirtschaft und Realkredit',null,null);


INSERT INTO Berufskolleg_Berufsebenen3(ID, Kuerzel, Bezeichnung, gueltigVon, gueltigBis) VALUES (300001000,'AB','Absatzwirtschaft',null,null), (300002000,'AS','Agrarservice',null,null), (300003000,'BH','Allgemeine Hochschulreife / Bautechnik',null,null), (300004000,'BW','Allgemeine Hochschulreife / Betriebswirtschaftslehre',null,null), (300005000,'BC','Allgemeine Hochschulreife / Biologie, Chemie',null,null), (300006000,'CC','Allgemeine Hochschulreife / Chemie, Chemietechnik',null,null), (300007000,'DE','Allgemeine Hochschulreife / Deutsch, Englisch',null,null), (300008000,'ET','Allgemeine Hochschulreife / Elektrotechnik',null,null), (300009000,'ER','Allgemeine Hochschulreife / Ernährung',null,null), (300010000,'EW','Allgemeine Hochschulreife / Erziehungswissenschaften',null,null), (300011000,'FL','Allgemeine Hochschulreife / Freizeitsportleiter (Sport/Gesundheitsförderung/Biologie)',null,null), (300012000,'FK','Allgemeine Hochschulreife / Fremdsprachenkorrespondent',null,null), (300013000,'GE','Allgemeine Hochschulreife / Gesundheit',null,null), (300014000,'IW','Allgemeine Hochschulreife / Ingenieurwissenschaften',null,null), (300015000,'KE','Allgemeine Hochschulreife / Kunst/Englisch',null,null), (300016000,'MT','Allgemeine Hochschulreife / Maschinenbautechnik',null,null), (300017000,'MI','Allgemeine Hochschulreife / Mathematik, Informatik',null,null), (300018000,'BP','angewandte Baudenkmalpflege',null,null), (300019000,'AK','Assistent(in) für Konstruktions- und Fertigungstechnik / AHR',null,null), (300020000,'AU','Ausbau',null,null), (300021000,'AH','Außenhandel',null,null), (300022000,'AI','Avionik',null,null), (300023000,'BA','Bautechnischer Assistent / AHR',null,null), (300024000,'BT','Betriebstechnik',null,null), (300025000,'BS','Biologisch-technische(r) Assistent(in) / AHR',null,null), (300026000,'CA','Chemisch-technische(r) Assistent(in) / AHR',null,null), (300027000,'CS','CNC-Systemtechnik',null,null), (300028000,'CK','Computer- und Kommunikationst.',null,null), (300029000,'DG','Dienstleistungsgartenbau',null,null), (300030000,'EA','Elektrotechnische(r) Assistent(in) / AHR',null,null), (300031000,'AE','energieeffiziente-ökologische Altbauerneuerung',null,null), (300032000,'EZ','Erzieher/Erzieherin / AHR',null,null), (300033000,'FD','Finanzdienstleistungen',null,null), (300034000,'FW','Finanzwirtschaft',null,null), (300035000,'FT','Flugwerk/Triebwerk',null,null), (300036000,'FS','Fremdsprachen',null,null), (300037000,'GA','Gestaltungstechnische(r) Assistent(in)/AHR',null,null), (300038000,'GM','Gesundheitsökonomie und -management',null,null), (300039000,'GD','Grafik-Design',null,null), (300040000,'HM','Handelsmanagement (Schulversuch)',null,null), (300041000,'HE','Heilerziehung',null,null), (300042000,'HB','Hochbau',null,null), (300043000,'IA','Informationstechnische(r) Assistent(in) / AHR',null,null), (300044000,'KA','Kaufmännische(r) Assistent(in) / AHR',null,null), (300045000,'KO','Kokerei/Aufbereitungstechnik',null,null), (300046000,'LT','Labortechnik',null,null), (300047000,'LO','Logistik',null,null), (300048000,'MK','Marketing-Kommunikation',null,null), (300049000,'ME','Medien- und Eventmanagement',null,null), (300050000,'MV','Medizinische Verwaltung',null,null), (300051000,'OL','Ökologischer Landbau',null,null), (300052000,'PE','Personalwirtschaft',null,null), (300053000,'PT','Physikalisch-technische(r) Assistent(in) / AHR',null,null), (300054000,'PF','Praktikanten mit Förderverträgen',null,null), (300055000,'PV','Produktion u. Vermarktung',null,null), (300056000,'PW','Produktionswirtschaft',null,null), (300057000,'RW','Rechnungswesen',null,null), (300058000,'RE','Recht',null,null), (300059000,'RT','Reiseverkehr/Touristik',null,null), (300060000,'AV','Schüler/-innen in berufsvorb. Maßn. der AV u. fr. Träger',null,null), (300061000,'AP','Schüler/-innen m. Arbeitsverh. u. Praktikant.',null,null), (300062000,'OA','Schüler/-innen ohne Arbeitsverhältnis',null,null), (300063000,'SV','Service',null,null), (300064000,'SF','Sport und Freizeit (Schulversuch)',null,null), (300065000,'ST','Steuern',null,null), (300066000,'TG','Tagebautechnik',null,null), (300067000,'TA','Technische(r) Assistent(in) für Betriebsinformatik / AHR',null,null), (300068000,'TB','Tiefbau',null,null), (300069000,'TT','Tiefbautechnik',null,null), (300070000,'UA','Umwelttechnische(r) Assistent(in) / AHR',null,null), (300071000,'WJ','Werkstattjahr',null,null), (300072000,'WI','Wirtschaftsinformatik',null,null), (300073000,'A2','Anerkannter Ausbildungsberuf (2-jährig)',null,null), (300074000,'A3','Anerkannter Ausbildungsberuf (3-jährig)',null,null), (300075000,'A4','Anerkannter Ausbildungsberuf (3 1/2-jährig)',null,null), (300076000,'MB','Ausbildungsberuf für Menschen mit Behinderungen',null,null);


INSERT INTO Berufskolleg_Fachklassen_Keys(FachklassenIndex, Schluessel, Schluessel2) VALUES (10,'101','00'), (10,'101','01'), (10,'101','02'), (10,'101','03'), (10,'101','04'), (10,'102','00'), (10,'103','00'), (10,'104','00'), (10,'105','00'), (10,'105','01'), (10,'105','02'), (10,'105','03'), (10,'105','04'), (10,'105','05'), (10,'106','00'), (10,'107','00'), (10,'107','50'), (10,'107','51'), (10,'107','52'), (10,'107','53'), (10,'107','54'), (10,'107','55'), (10,'108','00'), (10,'109','00'), (10,'110','00'), (10,'111','00'), (10,'112','00'), (10,'113','00'), (10,'114','00'), (10,'115','00'), (10,'115','01'), (10,'115','02'), (10,'115','03'), (10,'115','04'), (10,'115','05'), (10,'115','06'), (10,'116','00'), (10,'117','00'), (10,'117','01'), (10,'117','02'), (10,'117','03'), (10,'118','00'), (10,'119','00'), (10,'120','00'), (10,'121','00'), (10,'122','01'), (10,'122','02'), (10,'123','00'), (10,'124','00'), (10,'125','00'), (10,'125','01'), (10,'125','02'), (10,'126','00'), (10,'127','00'), (10,'128','00'), (10,'129','00'), (10,'130','00'), (10,'131','00'), (10,'132','00'), (10,'133','00'), (10,'134','00'), (10,'134','01'), (10,'134','02'), (10,'135','00'), (10,'136','00'), (10,'137','00'), (10,'138','00'), (10,'139','00'), (10,'140','00'), (10,'140','01'), (10,'140','02'), (10,'140','03'), (10,'141','00'), (10,'142','00'), (10,'143','00'), (10,'144','00'), (10,'145','00'), (10,'145','01'), (10,'145','02'), (10,'146','00'), (10,'147','00'), (10,'147','01'), (10,'147','02'), (10,'147','03'), (10,'147','04'), (10,'148','00'), (10,'149','00'), (10,'150','00'), (10,'151','00'), (10,'152','00'), (10,'152','01'), (10,'152','02'), (10,'152','03'), (10,'152','04'), (10,'152','05'), (10,'152','06'), (10,'153','00'), (10,'154','00'), (10,'155','00'), (10,'156','00'), (10,'157','00'), (10,'157','01'), (10,'157','02'), (10,'157','03'), (10,'157','04'), (10,'158','00'), (10,'159','00'), (10,'160','00'), (10,'161','00'), (10,'161','01'), (10,'161','02'), (10,'162','00'), (10,'163','00'), (10,'164','00'), (10,'164','01'), (10,'164','02'), (10,'164','03'), (10,'164','04'), (10,'165','00'), (10,'166','00'), (10,'167','00'), (10,'168','00'), (10,'169','00'), (10,'170','00'), (10,'171','00'), (10,'171','01'), (10,'171','02'), (10,'172','00'), (10,'173','00'), (10,'174','00'), (10,'175','00'), (10,'176','00'), (10,'177','00'), (10,'177','01'), (10,'177','02'), (10,'177','03'), (10,'177','04'), (10,'177','05'), (10,'177','06'), (10,'177','07'), (10,'177','08'), (10,'177','09'), (10,'177','10'), (10,'177','11'), (10,'178','00'), (10,'179','01'), (10,'179','02'), (10,'180','00'), (10,'181','00'), (10,'182','00'), (10,'183','01'), (10,'183','02'), (10,'183','03'), (10,'183','04'), (10,'183','05'), (10,'184','00'), (10,'185','00'), (10,'186','00'), (10,'187','01'), (10,'187','02'), (10,'187','03'), (10,'187','04'), (10,'188','00'), (10,'189','00'), (10,'190','00'), (10,'191','00'), (10,'191','01'), (10,'191','02'), (10,'191','03'), (10,'191','04'), (10,'192','00'), (10,'193','00'), (10,'194','00'), (10,'195','00'), (10,'196','00'), (10,'197','00'), (10,'198','00'), (10,'199','00'), (10,'200','00'), (10,'201','00'), (10,'202','01'), (10,'202','02'), (10,'203','00'), (10,'204','00'), (10,'205','00'), (10,'206','00'), (10,'207','00'), (10,'208','00'), (10,'209','00'), (10,'210','00'), (10,'211','00'), (10,'212','00'), (10,'212','01'), (10,'212','02'), (10,'213','00'), (10,'214','00'), (10,'214','01'), (10,'214','02'), (10,'214','03'), (10,'215','00'), (10,'216','00'), (10,'217','00'), (10,'218','00'), (10,'219','00'), (10,'220','00'), (10,'220','01'), (10,'220','02'), (10,'220','03'), (10,'221','00'), (10,'222','00'), (10,'223','00'), (10,'224','00'), (10,'225','00'), (10,'226','00'), (10,'227','00'), (10,'228','00'), (10,'229','00'), (10,'230','00'), (10,'231','00'), (10,'232','01'), (10,'232','02'), (10,'232','03'), (10,'232','04'), (10,'232','05'), (10,'232','06'), (10,'232','07'), (10,'232','08'), (10,'233','00'), (10,'234','00'), (10,'235','00'), (10,'236','00'), (10,'237','00'), (10,'238','00'), (10,'238','01'), (10,'238','02'), (10,'238','03'), (10,'239','00'), (10,'240','00'), (10,'241','00'), (10,'241','01'), (10,'241','02'), (10,'241','03'), (10,'242','00'), (10,'242','01'), (10,'242','02'), (10,'243','00'), (10,'244','00'), (10,'245','00'), (10,'246','00'), (10,'246','01'), (10,'246','02'), (10,'247','00'), (10,'248','00'), (10,'248','01'), (10,'248','02'), (10,'248','03'), (10,'249','00'), (10,'250','00'), (10,'250','01'), (10,'250','02'), (10,'250','03'), (10,'251','00'), (10,'252','00'), (10,'253','00'), (10,'254','00'), (10,'255','00'), (10,'256','00'), (10,'257','00'), (10,'257','01'), (10,'257','02'), (10,'258','00'), (10,'259','00'), (10,'260','00'), (10,'260','50'), (10,'260','51'), (10,'260','52'), (10,'261','00'), (10,'262','00'), (10,'262','01'), (10,'262','02'), (10,'262','03'), (10,'262','04'), (10,'263','00'), (10,'264','00'), (10,'265','01'), (10,'265','02'), (10,'265','03'), (10,'265','04'), (10,'265','05'), (10,'265','06'), (10,'265','07'), (10,'265','08'), (10,'265','09'), (10,'265','10'), (10,'265','11'), (10,'265','12'), (10,'266','00'), (10,'267','00'), (10,'268','00'), (10,'269','00'), (10,'270','00'), (10,'271','01'), (10,'271','02'), (10,'272','00'), (10,'272','01'), (10,'272','02'), (10,'272','03'), (10,'272','04'), (10,'272','05'), (10,'272','06'), (10,'273','01'), (10,'273','02'), (10,'273','03'), (10,'274','00'), (10,'275','00'), (10,'276','00'), (10,'276','01'), (10,'276','02'), (10,'276','03'), (10,'276','04'), (10,'277','00'), (10,'278','00'), (10,'279','00'), (10,'280','00'), (10,'281','00'), (10,'282','00'), (10,'283','00'), (10,'284','00'), (10,'285','00'), (10,'286','00'), (10,'287','00'), (10,'288','00'), (10,'289','00'), (10,'290','00'), (10,'291','01'), (10,'291','02'), (10,'292','00'), (10,'293','00'), (10,'294','00'), (10,'295','00'), (10,'296','00'), (10,'297','00'), (10,'298','00'), (10,'299','00'), (10,'299','01'), (10,'299','02'), (10,'299','03'), (10,'299','04'), (10,'300','00'), (10,'301','00'), (10,'302','00'), (10,'302','01'), (10,'302','02'), (10,'302','03'), (10,'303','00'), (10,'304','00'), (10,'305','00'), (10,'305','01'), (10,'305','02'), (10,'306','00'), (10,'307','00'), (10,'308','00'), (10,'309','01'), (10,'309','02'), (10,'309','03'), (10,'310','00'), (10,'311','00'), (10,'311','01'), (10,'311','02'), (10,'311','03'), (10,'311','04'), (10,'312','00'), (10,'312','01'), (10,'312','02'), (10,'313','00'), (10,'314','01'), (10,'314','02'), (10,'314','03'), (10,'315','00'), (10,'316','00'), (10,'317','00'), (10,'318','00'), (10,'319','00'), (10,'320','00'), (10,'321','01'), (10,'321','02'), (10,'322','00'), (10,'323','00'), (10,'324','00'), (10,'325','00'), (10,'326','00'), (10,'327','00'), (10,'328','00'), (10,'329','01'), (10,'329','02'), (10,'329','03'), (10,'329','04'), (10,'329','05'), (10,'329','06'), (10,'329','07'), (10,'329','08'), (10,'329','09'), (10,'330','00'), (10,'331','00'), (10,'332','00'), (10,'333','00'), (10,'334','00'), (10,'335','00'), (10,'336','00'), (10,'337','00'), (10,'337','01'), (10,'337','02'), (10,'337','03'), (10,'337','04'), (10,'337','05'), (10,'337','06'), (10,'337','07'), (10,'338','00'), (10,'338','01'), (10,'338','02'), (10,'338','03'), (10,'339','01'), (10,'339','02'), (10,'339','03'), (10,'339','04'), (10,'339','05'), (10,'339','06'), (10,'340','00'), (10,'340','01'), (10,'340','02'), (10,'340','03'), (10,'340','04'), (10,'340','05'), (10,'341','00'), (10,'342','00'), (10,'343','00'), (10,'344','00'), (10,'344','01'), (10,'344','02'), (10,'345','00'), (10,'346','00'), (10,'346','01'), (10,'346','02'), (10,'347','00'), (10,'347','01'), (10,'347','02'), (10,'348','00'), (10,'349','00'), (10,'350','00'), (10,'351','00'), (10,'352','00'), (10,'353','00'), (10,'354','00'), (10,'355','00'), (10,'356','00'), (10,'357','00'), (10,'357','01'), (10,'357','02'), (10,'357','03'), (10,'358','00'), (10,'359','00'), (10,'359','01'), (10,'359','02'), (10,'360','00'), (10,'361','00'), (10,'362','00'), (10,'363','00'), (10,'364','00'), (10,'364','01'), (10,'364','02'), (10,'365','00'), (10,'366','00'), (10,'367','00'), (10,'368','00'), (10,'368','01'), (10,'368','02'), (10,'368','03'), (10,'368','04'), (10,'368','05'), (10,'368','06'), (10,'368','07'), (10,'368','08'), (10,'368','09'), (10,'368','10'), (10,'369','00'), (10,'370','00'), (10,'371','00'), (10,'372','00'), (10,'373','00'), (10,'374','00'), (10,'375','00'), (10,'376','00'), (10,'377','00'), (10,'378','00'), (10,'379','00'), (10,'380','00'), (10,'381','00'), (10,'382','00'), (10,'383','00'), (10,'384','00'), (10,'385','00'), (10,'385','01'), (10,'385','02'), (10,'386','00'), (10,'387','00'), (10,'388','00'), (10,'389','00'), (10,'390','00'), (10,'391','00'), (10,'392','00'), (10,'393','00'), (10,'393','01'), (10,'393','02'), (10,'393','03'), (10,'394','00'), (10,'395','00'), (10,'396','00'), (10,'396','01'), (10,'396','02'), (10,'397','00'), (10,'398','00'), (10,'399','00'), (10,'400','00'), (10,'401','00'), (10,'402','00'), (10,'403','00'), (10,'404','00'), (10,'405','00'), (10,'406','00'), (10,'407','00'), (10,'408','00'), (10,'409','00'), (10,'410','00'), (10,'411','00'), (10,'412','00'), (10,'413','00'), (10,'414','00'), (10,'415','00'), (10,'416','00'), (10,'416','01'), (10,'416','02'), (10,'416','03'), (10,'416','04'), (10,'416','05'), (10,'417','00'), (10,'418','00'), (10,'419','00'), (10,'420','00'), (10,'421','00'), (10,'422','00'), (10,'423','00'), (10,'424','00'), (10,'425','00'), (10,'426','00'), (10,'427','00'), (10,'428','00'), (10,'429','00'), (10,'430','00'), (10,'431','00'), (10,'432','00'), (10,'433','00'), (10,'434','00'), (10,'435','00'), (10,'436','00'), (10,'437','00'), (10,'438','00'), (10,'439','01'), (10,'439','02'), (10,'439','03'), (10,'439','04'), (10,'439','05'), (10,'439','06'), (10,'439','07'), (10,'439','08'), (10,'440','00'), (10,'441','00'), (10,'442','00'), (10,'442','01'), (10,'442','02'), (10,'443','01'), (10,'443','02'), (10,'443','03'), (10,'443','04'), (10,'443','05'), (10,'443','06'), (10,'444','01'), (10,'444','02'), (10,'444','03'), (10,'444','04'), (10,'444','05'), (10,'444','06'), (10,'444','07'), (10,'444','08'), (10,'444','09'), (10,'445','00'), (10,'446','00'), (10,'447','00'), (10,'448','00'), (10,'448','01'), (10,'448','02'), (10,'448','03'), (10,'448','04'), (10,'449','00'), (10,'449','01'), (10,'449','02'), (10,'450','00'), (10,'450','50'), (10,'450','51'), (10,'450','52'), (10,'450','53'), (10,'450','54'), (10,'451','00'), (10,'452','00'), (10,'452','01'), (10,'452','02'), (10,'452','03'), (10,'453','00'), (10,'453','01'), (10,'453','02'), (10,'453','03'), (10,'453','04'), (10,'453','05'), (10,'454','00'), (10,'455','00'), (10,'456','00'), (10,'457','00'), (10,'458','00'), (10,'458','01'), (10,'458','02'), (10,'458','03'), (10,'459','01'), (10,'459','02'), (10,'459','03'), (10,'460','00'), (10,'461','00'), (10,'461','01'), (10,'461','02'), (10,'461','03'), (10,'461','04'), (10,'461','05'), (10,'461','06'), (10,'461','07'), (10,'462','00'), (10,'463','00'), (10,'464','00'), (10,'465','00'), (10,'465','01'), (10,'465','02'), (10,'466','00'), (10,'467','00'), (10,'468','01'), (10,'468','02'), (10,'468','03'), (10,'468','04'), (10,'468','05'), (10,'468','06'), (10,'468','07'), (10,'468','08'), (10,'468','09'), (10,'469','00'), (10,'470','00'), (10,'470','01'), (10,'470','02'), (10,'471','00'), (10,'472','00'), (10,'473','00'), (10,'474','00'), (10,'475','00'), (10,'476','00'), (10,'477','00'), (10,'478','00'), (10,'479','00'), (10,'480','00'), (10,'480','01'), (10,'480','02'), (10,'480','03'), (10,'480','04'), (10,'481','01'), (10,'481','02'), (10,'482','00'), (10,'482','01'), (10,'482','02'), (10,'482','03'), (10,'483','00'), (10,'484','00'), (10,'485','00'), (10,'486','00'), (10,'487','00'), (10,'487','01'), (10,'487','02'), (10,'487','03'), (10,'487','04'), (10,'488','00'), (10,'489','00'), (10,'490','00'), (10,'491','00'), (10,'491','01'), (10,'491','02'), (10,'492','00'), (10,'492','01'), (10,'492','02'), (10,'493','00'), (10,'493','01'), (10,'493','02'), (10,'494','00'), (10,'495','00'), (10,'496','00'), (10,'497','00'), (10,'498','00'), (10,'499','00'), (10,'500','00'), (10,'501','00'), (10,'502','00'), (10,'503','00'), (10,'504','00'), (10,'505','00'), (10,'506','00'), (10,'507','00'), (10,'508','00'), (10,'509','00'), (10,'509','01'), (10,'509','02'), (10,'509','03'), (10,'509','04'), (10,'510','00'), (10,'511','00'), (10,'512','00'), (10,'513','00'), (10,'514','00'), (10,'515','00'), (10,'516','00'), (10,'516','01'), (10,'516','02'), (10,'516','03'), (10,'516','04'), (10,'516','05'), (10,'517','00'), (10,'518','01'), (10,'518','02'), (10,'518','03'), (10,'518','04'), (10,'519','01'), (10,'519','02'), (10,'519','03'), (10,'519','04'), (10,'519','05'), (10,'519','06'), (10,'520','00'), (10,'521','01'), (10,'521','02'), (10,'521','03'), (10,'521','04'), (10,'522','00'), (10,'523','00'), (10,'523','01'), (10,'523','02'), (10,'524','00'), (10,'525','00'), (10,'526','00'), (10,'527','00'), (10,'528','00'), (10,'529','00'), (10,'530','00'), (10,'531','00'), (10,'531','01'), (10,'531','02'), (10,'531','03'), (10,'531','04'), (10,'531','05'), (10,'531','50'), (10,'531','51'), (10,'531','52'), (10,'531','53'), (10,'531','54'), (10,'532','00'), (10,'533','01'), (10,'533','02'), (10,'534','00'), (10,'535','00'), (10,'536','00'), (10,'537','00'), (10,'538','00'), (10,'539','00'), (10,'540','00'), (10,'541','00'), (10,'542','00'), (10,'543','00'), (10,'544','00'), (10,'545','00'), (10,'545','01'), (10,'545','02'), (10,'546','00'), (10,'547','00'), (10,'548','00'), (10,'549','00'), (10,'550','00'), (10,'550','01'), (10,'550','02'), (10,'551','00'), (10,'552','00'), (10,'553','00'), (10,'553','50'), (10,'553','51'), (10,'553','52'), (10,'553','53'), (10,'554','00'), (10,'555','00'), (10,'556','01'), (10,'556','02'), (10,'557','00'), (10,'558','00'), (10,'559','00'), (10,'560','00'), (10,'561','00'), (10,'562','00'), (10,'563','00'), (10,'564','00'), (10,'565','00'), (10,'565','01'), (10,'565','02'), (10,'566','00'), (10,'567','00'), (10,'568','01'), (10,'568','02'), (10,'569','01'), (10,'569','02'), (10,'570','00'), (10,'571','00'), (10,'572','00'), (10,'573','00'), (10,'573','01'), (10,'573','02'), (10,'574','00'), (10,'575','00'), (10,'576','00'), (10,'577','00'), (10,'578','00'), (10,'579','00'), (10,'580','00'), (10,'581','00'), (10,'582','00'), (10,'583','00'), (10,'584','00'), (10,'585','01'), (10,'585','02'), (10,'586','01'), (10,'586','02'), (10,'587','01'), (10,'587','02'), (10,'587','03'), (10,'588','00'), (10,'589','00'), (10,'590','00'), (10,'591','00'), (10,'592','00'), (10,'593','00'), (10,'594','00'), (10,'595','00'), (10,'596','00'), (10,'597','01'), (10,'597','02'), (10,'597','03'), (10,'597','04'), (10,'597','05'), (10,'597','06'), (10,'598','01'), (10,'598','02'), (10,'598','03'), (10,'599','00'), (10,'600','00'), (10,'601','01'), (10,'601','02'), (10,'601','03'), (10,'601','04'), (10,'602','00'), (10,'603','00'), (10,'604','00'), (10,'605','00'), (10,'606','00'), (10,'607','00'), (10,'608','00'), (10,'609','00'), (10,'610','00'), (10,'611','01'), (10,'611','02'), (10,'612','00'), (10,'613','00'), (10,'614','00'), (10,'615','00'), (10,'616','00'), (10,'617','00'), (10,'618','01'), (10,'618','02'), (10,'618','03'), (10,'618','04'), (10,'619','00'), (10,'620','01'), (10,'620','02'), (10,'621','01'), (10,'621','02'), (10,'622','00'), (10,'623','00'), (10,'624','00'), (10,'625','00'), (10,'626','00'), (10,'627','00'), (10,'628','00'), (10,'629','01'), (10,'629','02'), (10,'630','00'), (10,'631','00'), (10,'632','00'), (10,'633','00'), (10,'801','00'), (10,'802','00'), (10,'803','00'), (10,'804','00'), (10,'805','00'), (10,'806','00'), (10,'807','00'), (10,'808','00'), (10,'809','00'), (10,'810','00'), (10,'811','00'), (10,'812','00'), (10,'813','00'), (10,'814','00'), (10,'815','00'), (10,'816','00'), (10,'817','00'), (10,'818','00'), (10,'819','00'), (10,'820','00'), (10,'821','00'), (10,'822','00'), (10,'823','00'), (10,'824','00'), (10,'825','00'), (10,'826','00'), (10,'827','00'), (10,'828','00'), (10,'829','00'), (10,'830','00'), (10,'831','00'), (10,'832','00'), (10,'833','00'), (10,'834','00'), (10,'835','00'), (10,'836','00'), (10,'837','00'), (10,'838','00'), (10,'839','00'), (10,'840','00'), (10,'841','00'), (10,'842','00'), (10,'843','00'), (10,'844','00'), (10,'845','00'), (10,'846','00'), (10,'847','01'), (10,'847','02'), (10,'848','00'), (10,'849','00'), (10,'850','00'), (10,'851','00'), (10,'852','01'), (10,'852','02'), (10,'853','00'), (10,'854','01'), (10,'854','02'), (10,'854','03'), (10,'854','04'), (10,'855','00'), (10,'856','00'), (10,'857','00'), (10,'858','00'), (10,'859','00'), (10,'860','00'), (10,'861','00'), (10,'862','00'), (10,'863','00'), (10,'864','00'), (10,'865','00'), (10,'866','00'), (10,'867','00'), (10,'868','00'), (10,'869','00'), (10,'870','00'), (10,'871','00'), (10,'872','00'), (10,'873','00'), (10,'874','00'), (10,'875','00'), (10,'876','00'), (10,'877','00'), (10,'878','00'), (10,'879','00'), (10,'880','00'), (10,'881','00'), (10,'882','00'), (10,'883','00'), (10,'884','00'), (10,'885','00'), (10,'886','00'), (10,'887','00'), (10,'888','00'), (10,'889','00'), (10,'890','00'), (10,'891','00'), (10,'892','00'), (10,'893','00'), (10,'894','00'), (10,'895','00'), (10,'896','00'), (10,'897','00'), (10,'898','00'), (10,'899','00'), (10,'900','00'), (10,'999','01'), (10,'999','02'), (10,'999','03'), (10,'999','04'), (10,'999','05'), (10,'999','06'), (10,'999','07'), (10,'999','08'), (10,'999','09'), (10,'999','10'), (10,'999','11'), (10,'999','12'), (10,'999','13'), (20,'101','00'), (20,'102','00'), (20,'103','00'), (20,'104','00'), (20,'105','00'), (20,'106','00'), (20,'107','00'), (20,'108','00'), (20,'109','00'), (20,'110','00'), (20,'111','00'), (20,'112','00'), (20,'113','00'), (20,'114','00'), (20,'115','00'), (20,'116','00'), (20,'117','00'), (20,'118','00'), (20,'119','00'), (20,'120','00'), (20,'999','00'), (30,'101','00'), (30,'102','00'), (30,'103','00'), (30,'104','00'), (30,'105','00'), (30,'106','00'), (30,'107','00'), (30,'108','00'), (30,'109','00'), (30,'110','00'), (30,'111','00'), (30,'112','00'), (30,'113','00'), (30,'114','00'), (30,'115','00'), (30,'116','00'), (30,'117','00'), (30,'118','00'), (30,'119','00'), (30,'120','00'), (30,'121','00'), (30,'122','00'), (30,'999','00'), (40,'101','01'), (40,'101','02'), (40,'101','03'), (40,'101','04'), (40,'101','05'), (40,'101','06'), (40,'101','07'), (40,'101','08'), (40,'101','09'), (40,'101','10'), (40,'101','11'), (40,'101','12'), (40,'101','13'), (40,'101','14'), (40,'101','15'), (40,'101','16'), (40,'101','17'), (40,'101','18'), (40,'101','21'), (40,'101','22'), (40,'101','23'), (40,'102','01'), (40,'102','02'), (40,'102','03'), (40,'102','04'), (40,'102','05'), (40,'102','06'), (40,'102','07'), (40,'102','08'), (40,'102','09'), (40,'102','10'), (40,'102','11'), (40,'102','12'), (40,'102','13'), (40,'102','14'), (40,'102','15'), (40,'102','16'), (40,'102','17'), (40,'102','18'), (40,'103','01'), (40,'103','02'), (40,'103','03'), (40,'103','04'), (40,'103','05'), (40,'103','06'), (40,'103','07'), (40,'103','08'), (40,'103','09'), (40,'103','10'), (40,'103','11'), (40,'103','12'), (40,'103','13'), (40,'103','14'), (40,'103','15'), (40,'103','16'), (40,'103','17'), (40,'103','18'), (40,'104','01'), (40,'104','02'), (40,'104','03'), (40,'104','04'), (40,'104','05'), (40,'104','06'), (40,'104','07'), (40,'104','08'), (40,'104','09'), (40,'104','10'), (40,'104','11'), (40,'104','12'), (40,'104','13'), (40,'104','14'), (40,'104','15'), (40,'104','16'), (40,'104','17'), (40,'104','18'), (40,'999','00'), (40,'999','01'), (40,'999','02'), (50,'101','00'), (50,'102','00'), (50,'999','00'), (55,'101','00'), (55,'102','00'), (55,'104','00'), (55,'105','00'), (55,'106','00'), (55,'107','00'), (55,'108','00'), (55,'109','00'), (55,'110','00'), (55,'112','00'), (55,'113','00'), (55,'114','00'), (55,'116','00'), (55,'117','00'), (55,'118','00'), (55,'120','00'), (55,'121','00'), (55,'122','00'), (55,'123','04'), (55,'123','12'), (55,'999','00'), (56,'177','02'), (56,'177','05'), (56,'217','00'), (56,'228','00'), (56,'242','02'), (56,'248','01'), (56,'248','02'), (56,'248','03'), (56,'257','00'), (56,'276','00'), (56,'279','00'), (56,'335','00'), (56,'339','03'), (56,'456','00'), (56,'463','00'), (56,'482','00'), (56,'487','00'), (56,'515','00'), (56,'527','00'), (56,'528','00'), (56,'531','00'), (56,'532','00'), (56,'538','00'), (56,'541','00'), (56,'607','00'), (56,'999','00'), (57,'101','00'), (57,'102','00'), (57,'103','01'), (57,'103','02'), (57,'104','01'), (57,'104','02'), (57,'104','03'), (57,'105','00'), (57,'106','01'), (57,'106','02'), (57,'106','03'), (57,'106','04'), (57,'106','05'), (57,'106','06'), (57,'106','07'), (57,'106','08'), (57,'107','00'), (57,'108','01'), (57,'108','02'), (57,'109','00'), (57,'110','00'), (57,'999','00'), (58,'101','00'), (58,'102','00'), (58,'103','01'), (58,'103','02'), (58,'104','01'), (58,'104','02'), (58,'104','03'), (58,'105','00'), (58,'106','01'), (58,'106','02'), (58,'106','03'), (58,'106','04'), (58,'106','05'), (58,'106','06'), (58,'106','07'), (58,'106','08'), (58,'107','00'), (58,'201','00'), (58,'202','00'), (58,'203','01'), (58,'203','02'), (58,'204','01'), (58,'204','02'), (58,'204','03'), (58,'205','00'), (58,'206','01'), (58,'206','02'), (58,'206','03'), (58,'206','04'), (58,'206','05'), (58,'206','06'), (58,'206','07'), (58,'206','08'), (58,'207','00'), (58,'301','00'), (58,'302','00'), (58,'303','01'), (58,'303','02'), (58,'304','01'), (58,'304','02'), (58,'304','03'), (58,'305','00'), (58,'306','01'), (58,'306','02'), (58,'306','03'), (58,'306','04'), (58,'306','05'), (58,'306','06'), (58,'306','07'), (58,'306','08'), (58,'307','00'), (58,'401','00'), (58,'402','00'), (58,'403','01'), (58,'403','02'), (58,'404','01'), (58,'404','02'), (58,'404','03'), (58,'405','00'), (58,'406','01'), (58,'406','02'), (58,'406','03'), (58,'406','04'), (58,'406','05'), (58,'406','06'), (58,'406','07'), (58,'406','08'), (58,'407','00'), (58,'500','00'), (58,'601','00'), (58,'602','00'), (58,'603','01'), (58,'603','02'), (58,'604','01'), (58,'604','02'), (58,'604','03'), (58,'605','00'), (58,'606','01'), (58,'606','02'), (58,'606','03'), (58,'606','04'), (58,'606','05'), (58,'606','06'), (58,'606','07'), (58,'606','08'), (58,'607','00'), (58,'999','00'), (60,'102','00'), (60,'105','00'), (60,'107','00'), (60,'110','00'), (60,'117','00'), (60,'120','00'), (60,'121','00'), (60,'122','00'), (60,'125','00'), (60,'133','00'), (60,'134','00'), (60,'135','00'), (60,'146','00'), (60,'147','00'), (60,'148','00'), (60,'149','00'), (60,'150','01'), (60,'151','00'), (60,'151','01'), (60,'999','00'), (60,'999','01'), (60,'999','02'), (61,'242','02'), (61,'248','01'), (61,'248','02'), (61,'248','03'), (61,'276','00'), (61,'456','00'), (61,'527','00'), (61,'531','00'), (61,'538','00'), (61,'607','00'), (61,'999','00'), (62,'177','02'), (62,'242','02'), (62,'248','01'), (62,'248','02'), (62,'248','03'), (62,'276','00'), (62,'279','00'), (62,'335','00'), (62,'531','00'), (62,'999','00'), (63,'177','01'), (63,'177','02'), (63,'177','05'), (63,'180','00'), (63,'187','02'), (63,'217','00'), (63,'228','00'), (63,'257','00'), (63,'276','00'), (63,'279','00'), (63,'308','00'), (63,'335','00'), (63,'339','03'), (63,'456','00'), (63,'463','00'), (63,'482','00'), (63,'487','00'), (63,'515','00'), (63,'527','00'), (63,'528','00'), (63,'531','00'), (63,'532','00'), (63,'538','00'), (63,'541','00'), (63,'544','00'), (63,'607','00'), (63,'999','00'), (70,'101','00'), (70,'102','00'), (70,'103','00'), (70,'104','00'), (70,'105','00'), (70,'107','00'), (70,'108','00'), (70,'109','00'), (70,'110','00'), (70,'111','00'), (70,'112','00'), (70,'113','00'), (70,'113','01'), (70,'113','02'), (70,'113','03'), (70,'114','00'), (70,'115','00'), (70,'115','01'), (70,'115','02'), (70,'116','00'), (70,'117','00'), (70,'118','00'), (70,'999','00'), (70,'999','01'), (80,'101','00'), (80,'102','00'), (80,'103','00'), (80,'104','00'), (80,'105','00'), (80,'106','00'), (80,'107','00'), (80,'108','00'), (80,'109','00'), (80,'110','00'), (80,'111','00'), (80,'112','00'), (80,'113','00'), (80,'113','01'), (80,'113','02'), (80,'113','03'), (80,'114','00'), (80,'115','00'), (80,'115','01'), (80,'115','02'), (80,'116','00'), (80,'117','00'), (80,'118','00'), (80,'119','00'), (80,'999','00'), (80,'999','01'), (90,'101','00'), (90,'102','00'), (90,'103','00'), (90,'104','00'), (90,'105','00'), (90,'105','01'), (90,'105','02'), (90,'106','01'), (90,'106','02'), (90,'106','03'), (90,'106','04'), (90,'106','05'), (90,'106','06'), (90,'107','00'), (90,'108','00'), (90,'109','00'), (90,'110','00'), (90,'111','00'), (90,'112','01'), (90,'112','02'), (90,'112','03'), (90,'112','04'), (90,'112','05'), (90,'112','06'), (90,'112','07'), (90,'113','00'), (90,'113','01'), (90,'113','02'), (90,'113','03'), (90,'113','04'), (90,'114','00'), (90,'114','01'), (90,'114','02'), (90,'114','03'), (90,'115','00'), (90,'116','00'), (90,'117','00'), (90,'118','00'), (90,'119','00'), (90,'120','00'), (90,'121','00'), (90,'122','00'), (90,'123','00'), (90,'124','00'), (90,'125','00'), (90,'126','00'), (90,'127','00'), (90,'128','00'), (90,'129','00'), (90,'130','00'), (90,'131','00'), (90,'132','00'), (90,'133','00'), (90,'134','00'), (90,'135','00'), (90,'136','00'), (90,'137','01'), (90,'137','02'), (90,'137','03'), (90,'138','00'), (90,'139','00'), (90,'140','00'), (90,'141','00'), (90,'999','00'), (90,'999','01'), (91,'101','00'), (91,'102','00'), (91,'103','01'), (91,'103','02'), (91,'104','01'), (91,'104','02'), (91,'104','03'), (91,'105','00'), (91,'106','01'), (91,'106','02'), (91,'106','03'), (91,'106','04'), (91,'106','05'), (91,'106','06'), (91,'106','07'), (91,'106','08'), (91,'106','09'), (91,'107','00'), (91,'999','00'), (92,'101','00'), (92,'102','00'), (92,'103','01'), (92,'103','02'), (92,'104','01'), (92,'104','02'), (92,'104','03'), (92,'105','00'), (92,'106','01'), (92,'106','02'), (92,'106','03'), (92,'106','04'), (92,'106','05'), (92,'106','06'), (92,'106','07'), (92,'106','08'), (92,'106','09'), (92,'107','00'), (92,'999','00'), (93,'101','00'), (93,'102','00'), (93,'102','01'), (93,'103','00'), (93,'103','01'), (93,'103','02'), (93,'103','03'), (93,'999','00'), (94,'102','00'), (100,'101','00'), (100,'102','00'), (100,'102','01'), (100,'102','02'), (100,'103','00'), (100,'104','00'), (100,'105','00'), (100,'106','00'), (100,'107','00'), (100,'108','00'), (100,'109','00'), (100,'110','00'), (100,'111','00'), (100,'112','00'), (100,'113','01'), (100,'113','02'), (100,'113','03'), (100,'113','04'), (100,'113','05'), (100,'114','00'), (100,'115','00'), (100,'116','00'), (100,'117','01'), (100,'117','02'), (100,'117','03'), (100,'117','04'), (100,'117','05'), (100,'118','00'), (100,'119','00'), (100,'120','00'), (100,'121','00'), (100,'122','00'), (100,'123','00'), (100,'124','00'), (100,'124','01'), (100,'125','01'), (100,'125','02'), (100,'125','03'), (100,'126','00'), (100,'127','00'), (100,'128','00'), (100,'129','00'), (100,'130','00'), (100,'131','00'), (100,'131','01'), (100,'131','02'), (100,'131','03'), (100,'131','04'), (100,'132','00'), (100,'133','01'), (100,'999','00'), (100,'999','01'), (110,'101','00'), (110,'102','00'), (110,'102','01'), (110,'102','02'), (110,'103','00'), (110,'104','00'), (110,'105','00'), (110,'106','00'), (110,'107','00'), (110,'108','00'), (110,'109','00'), (110,'110','01'), (110,'110','02'), (110,'110','03'), (110,'110','04'), (110,'110','05'), (110,'111','00'), (110,'112','00'), (110,'113','00'), (110,'114','01'), (110,'114','02'), (110,'114','03'), (110,'114','04'), (110,'114','05'), (110,'115','00'), (110,'116','00'), (110,'117','01'), (110,'117','02'), (110,'117','03'), (110,'117','04'), (110,'117','05'), (110,'118','00'), (110,'119','00'), (110,'120','00'), (110,'121','00'), (110,'122','00'), (110,'123','00'), (110,'123','01'), (110,'124','01'), (110,'124','02'), (110,'124','03'), (110,'125','00'), (110,'126','00'), (110,'127','00'), (110,'128','00'), (110,'129','01'), (110,'999','00'), (110,'999','01'), (120,'101','00'), (120,'102','00'), (120,'103','00'), (120,'104','00'), (120,'105','00'), (120,'106','00'), (120,'107','00'), (120,'108','00'), (120,'109','00'), (120,'110','00'), (120,'111','00'), (120,'112','00'), (120,'113','00'), (120,'114','00'), (120,'115','00'), (120,'999','00'), (120,'999','01'), (130,'101','00'), (130,'102','00'), (130,'103','00'), (130,'104','00'), (130,'105','00'), (130,'106','00'), (130,'107','00'), (130,'108','00'), (130,'109','00'), (130,'110','00'), (130,'111','00'), (130,'112','00'), (130,'113','00'), (130,'999','00'), (140,'101','00'), (140,'102','00'), (140,'103','00'), (140,'104','00'), (140,'105','00'), (140,'106','00'), (140,'107','00'), (140,'107','01'), (140,'108','00'), (140,'109','00'), (140,'110','00'), (140,'111','00'), (140,'112','00'), (140,'112','01'), (140,'113','00'), (140,'114','00'), (140,'115','00'), (140,'999','00'), (140,'999','01'), (141,'101','00'), (141,'102','00'), (141,'103','00'), (141,'104','00'), (141,'105','00'), (141,'106','00'), (141,'107','00'), (141,'108','00'), (141,'109','00'), (141,'111','00'), (141,'112','00'), (141,'999','00'), (145,'102','01'), (145,'102','02'), (145,'103','00'), (145,'104','00'), (145,'105','00'), (145,'109','00'), (145,'113','02'), (145,'113','05'), (145,'114','00'), (145,'116','00'), (145,'117','01'), (145,'117','03'), (145,'117','04'), (145,'117','05'), (145,'120','00'), (145,'121','00'), (145,'122','00'), (145,'124','00'), (145,'124','01'), (145,'125','01'), (145,'125','02'), (145,'125','03'), (145,'128','00'), (145,'129','00'), (145,'131','02'), (145,'132','00'), (145,'133','01'), (145,'999','00'), (146,'110','00'), (146,'110','10'), (146,'110','11'), (146,'110','12'), (150,'101','00'), (160,'101','00'), (160,'102','00'), (160,'103','00'), (160,'104','00'), (160,'105','00'), (160,'106','00'), (160,'107','00'), (160,'108','00'), (160,'109','00'), (160,'110','00'), (160,'111','00'), (160,'112','00'), (160,'113','00'), (160,'114','00'), (160,'115','00'), (160,'999','00'), (160,'999','01'), (170,'101','00'), (170,'102','00'), (170,'103','00'), (170,'104','00'), (170,'105','00'), (170,'106','00'), (170,'107','00'), (170,'108','00'), (170,'109','00'), (170,'110','00'), (170,'111','00'), (170,'112','00'), (170,'113','00'), (170,'114','00'), (170,'115','00'), (170,'116','00'), (170,'117','00'), (170,'118','00'), (170,'119','00'), (170,'120','00'), (170,'121','00'), (170,'999','00'), (170,'999','01'), (180,'101','00'), (180,'102','00'), (180,'103','00'), (180,'104','00'), (180,'105','00'), (180,'106','00'), (180,'107','00'), (180,'108','00'), (180,'109','00'), (180,'110','00'), (180,'111','00'), (180,'112','00'), (180,'113','00'), (180,'999','00'), (190,'101','00'), (190,'999','00'), (200,'101','00'), (200,'102','00'), (200,'103','00'), (200,'104','00'), (200,'105','00'), (200,'106','00'), (200,'107','00'), (200,'108','00'), (200,'109','00'), (200,'110','00'), (200,'111','00'), (200,'999','00'), (210,'101','01'), (210,'101','02'), (210,'101','03'), (210,'101','04'), (210,'102','00'), (210,'103','00'), (210,'104','01'), (210,'104','02'), (210,'105','00'), (210,'106','00'), (210,'107','00'), (210,'108','00'), (210,'109','00'), (210,'110','00'), (210,'110','01'), (210,'110','02'), (210,'110','03'), (210,'111','01'), (210,'111','02'), (210,'112','00'), (210,'113','00'), (210,'114','01'), (210,'114','02'), (210,'114','03'), (210,'114','04'), (210,'114','05'), (210,'114','06'), (210,'115','01'), (210,'115','02'), (210,'115','03'), (210,'116','00'), (210,'116','01'), (210,'116','02'), (210,'117','00'), (210,'117','01'), (210,'117','02'), (210,'117','03'), (210,'117','04'), (210,'117','05'), (210,'117','06'), (210,'118','00'), (210,'119','01'), (210,'119','02'), (210,'120','00'), (210,'121','00'), (210,'122','00'), (210,'123','00'), (210,'123','01'), (210,'123','02'), (210,'123','03'), (210,'123','04'), (210,'123','05'), (210,'124','00'), (210,'125','00'), (210,'126','00'), (210,'126','01'), (210,'126','02'), (210,'127','00'), (210,'128','00'), (210,'129','00'), (210,'130','00'), (210,'130','01'), (210,'130','02'), (210,'130','03'), (210,'131','00'), (210,'132','00'), (210,'133','00'), (210,'134','00'), (210,'135','00'), (210,'136','00'), (210,'136','01'), (210,'136','02'), (210,'136','03'), (210,'136','04'), (210,'137','00'), (210,'137','01'), (210,'137','02'), (210,'137','03'), (210,'137','04'), (210,'137','05'), (210,'138','00'), (210,'139','00'), (210,'140','00'), (210,'141','00'), (210,'142','00'), (210,'143','00'), (210,'143','01'), (210,'143','02'), (210,'144','00'), (210,'145','00'), (210,'146','00'), (210,'147','00'), (210,'148','01'), (210,'148','02'), (210,'148','03'), (210,'148','04'), (210,'148','05'), (210,'148','06'), (210,'148','07'), (210,'148','08'), (210,'148','09'), (210,'148','10'), (210,'148','11'), (210,'148','12'), (210,'148','13'), (210,'148','14'), (210,'148','15'), (210,'148','16'), (210,'148','17'), (210,'148','18'), (210,'148','19'), (210,'148','20'), (210,'148','21'), (210,'148','22'), (210,'148','23'), (210,'149','00'), (210,'150','00'), (210,'151','00'), (210,'152','00'), (210,'153','00'), (210,'154','00'), (210,'154','01'), (210,'155','00'), (210,'156','00'), (210,'157','00'), (210,'158','00'), (210,'159','00'), (210,'160','00'), (210,'161','00'), (210,'162','00'), (210,'163','00'), (210,'164','00'), (210,'165','00'), (210,'166','00'), (210,'167','00'), (210,'167','01'), (210,'167','02'), (210,'168','00'), (210,'168','01'), (210,'168','02'), (210,'168','03'), (210,'169','00'), (210,'170','00'), (210,'171','00'), (210,'172','00'), (210,'173','01'), (210,'173','02'), (210,'173','03'), (210,'173','04'), (210,'174','00'), (210,'174','01'), (210,'175','00'), (210,'176','00'), (210,'999','00'), (210,'999','01'), (210,'999','02'), (220,'101','01'), (220,'101','02'), (220,'101','03'), (220,'101','04'), (220,'101','05'), (220,'101','06'), (220,'101','07'), (220,'101','08'), (220,'101','09'), (220,'101','10'), (220,'101','11'), (220,'101','12'), (220,'101','13'), (220,'102','01'), (220,'102','02'), (220,'103','01'), (220,'103','02'), (220,'104','01'), (220,'104','02'), (220,'104','03'), (220,'105','00'), (220,'106','00'), (220,'107','00'), (220,'108','00'), (220,'109','00'), (220,'110','00'), (220,'111','00'), (220,'111','02'), (220,'112','00'), (220,'113','00'), (220,'114','00'), (220,'115','00'), (220,'116','00'), (220,'117','00'), (220,'118','00'), (220,'119','00'), (220,'120','00'), (220,'121','00'), (220,'122','00'), (220,'123','00'), (220,'124','00'), (220,'125','00'), (220,'126','00'), (220,'127','00'), (220,'128','00'), (220,'129','00'), (220,'130','00'), (220,'131','00'), (220,'132','00'), (220,'133','00'), (220,'134','00'), (220,'135','00'), (220,'136','00'), (220,'137','00'), (220,'138','00'), (220,'139','00'), (220,'140','00'), (220,'141','00'), (220,'142','00'), (220,'143','00'), (220,'144','00'), (220,'145','00'), (220,'146','00'), (220,'147','00'), (220,'148','00'), (220,'175','00'), (220,'999','00'), (220,'999','01'), (230,'101','00'), (230,'101','01'), (230,'101','02'), (230,'101','05'), (230,'102','00'), (230,'102','01'), (230,'102','02'), (230,'102','05'), (230,'103','01'), (230,'103','02'), (230,'999','00'), (230,'999','01'), (240,'101','00'), (240,'102','00'), (240,'999','00'), (250,'101','00'), (250,'102','01'), (250,'102','02'), (250,'102','03'), (250,'103','00'), (250,'104','00'), (250,'104','01'), (250,'105','00'), (250,'999','00'), (260,'101','00'), (260,'999','00'), (270,'101','00'), (270,'102','00'), (280,'086','00'), (280,'087','00'), (280,'088','00'), (280,'089','00'), (280,'090','00'), (290,'081','00'), (290,'082','00'), (290,'083','00'), (290,'084','00'), (290,'085','00'), (290,'086','00'), (290,'087','00'), (290,'088','00'), (290,'089','00'), (290,'090','00'), (300,'083','00'), (300,'084','00'), (300,'085','00'), (300,'086','00'), (300,'087','00'), (300,'088','00'), (300,'089','00'), (300,'090','00'), (310,'090','00'), (320,'090','00'), (330,'088','00'), (330,'089','00'), (330,'090','00'), (340,'089','00'), (340,'090','00'), (350,'087','00'), (350,'088','00'), (350,'089','00'), (350,'090','00'), (370,'101','00'), (940,'134','00'), (940,'177','03'), (940,'454','00'), (940,'509','00'), (940,'532','00'), (960,'106','00'), (970,'108','00'), (980,'998','00');


INSERT INTO Kompetenzgruppen(KG_ID, KG_Bezeichnung, KG_Spalte, KG_Zeile) VALUES (-2,'keine',-2,-2), (-1,'admin',-1,-1), (100,'Schüler Individualdaten',1,1), (200,'Schüler Leistungsdaten',1,2), (300,'Berichte',2,3), (400,'Import/Export',3,1), (500,'Blockoperationen',3,2), (600,'Schulbezogene Daten',3,3), (700,'Extras',3,4), (800,'Katalog-Einträge',1,3), (900,'Lehrerdaten',2,2), (1000,'Verfahren Schulpflichtverletzung',2,3), (1100,'Stundenplanung',4,1), (1300,'Notenmodul',4,2), (1400,'Datenbank-Management',4,3), (1600,'Oberstufe - Laufbahnplanung',5,1), (1700,'Oberstufe - Kursplanung',5,2), (1800,'Oberstufe - -Klausurplanung',5,3), (1900,'Abitur',5,4), (2000,'Addressbuch (CardDAV)',1,4), (3000,'Kalender (CaldDAV)',1,5), (4000,'Abschlussberechnung Sek I',2,1), (5000,'Abschlussberechnung berufsbildende Schule',2,2);


INSERT INTO Kompetenzen(KO_ID, KO_Gruppe, KO_Bezeichnung) VALUES (-2,-2,'keine'), (-1,-1,'admin'), (11,100,'Ansehen'), (12,100,'Ändern'), (13,100,'Löschen'), (14,100,'Vermerke ändern'), (15,100,'KAoA-Daten ändern'), (16,100,'Einwilligungen ändern (DSGVO, Lernplattformen)'), (21,200,'Ansehen'), (22,200,'Funktionsbezogen ändern'), (23,200,'Alle ändern'), (31,300,'Alle Formulare drucken'), (32,300,'Standard-Formulare drucken'), (33,300,'Ändern'), (34,300,'Löschen'), (41,400,'Daten importieren'), (42,400,'Schülerdaten exportieren'), (43,400,'Lehrerdaten exportieren'), (44,400,'Schnittstelle SchILD-NRW verwenden'), (45,400,'Access-DB-Export durchführen'), (46,400,'Export über XML-Schnittstellen'), (61,600,'Ansehen'), (62,600,'Ändern'), (71,700,'Backup durchführen'), (72,700,'Gelöschte Daten zurückholen'), (73,700,'Farben für Fachgruppen ändern'), (74,700,'Daten aus Kurs42 importieren'), (75,700,'Personengruppen bearbeiten'), (81,800,'Ansehen'), (82,800,'Ändern'), (83,800,'Löschen'), (91,900,'Ansehen'), (92,900,'Ändern'), (93,900,'Löschen'), (94,900,'Detaildaten ansehen'), (95,900,'Detaildaten ändern'), (101,1000,'Ansehen'), (102,1000,'Ändern'), (103,1000,'Löschen'), (111,1100,'Stundenplan ansehen (allgemein)'), (112,1100,'Stundneplan ansehen (funktionsbezogen)'), (113,1100,'Stundenpläne importieren'), (114,1100,'Stundenpläne exportieren'), (115,1100,'Stundenpläne erstellen'), (116,1100,'Stundenpläne aktivieren'), (131,1300,'Administration Notenmodul'), (132,1300,'Noten ändern (allgemein)'), (133,1300,'Noten ändern (funktionsbezogen)'), (134,1300,'Noten ansehen (allgemein)'), (135,1300,'Noten ansehen (funktionsbezogen)'), (141,1400,'Schema erstellen und migrieren'), (142,1400,'SQLite importieren (Backup einspielen)'), (143,1400,'SQLite exportieren (Backup erstellen)'), (161,1600,'Laufbahnplanung (allgemein)'), (162,1600,'Laufbahnplanung (funktionsbezogen)'), (163,1600,'Laufbahnplanung aus LuPO importieren'), (171,1700,'Kursverwaltung - Blocken (allgemein)'), (172,1700,'Kursverwaltung - Blocken (funktionsbezogen)'), (173,1700,'Kursverwaltung - Blockung aktivieren'), (181,1800,'Klausurplanung ändern'), (182,1800,'Klausurplanung ansehen (allgemein)'), (183,1800,'Klausurplanung ansehen (funktionsbezogen)'), (191,1900,'Abiturdaten ansehen (allgemein)'), (192,1900,'Abiturdaten ansehen (funktionsbezogen)'), (193,1900,'Abiturdaten ändern (allgemein)'), (194,1900,'Abiturdaten ändern (funktionsbezogen)'), (195,1900,'Prüfungsergebnisse eingeben (allgemein)'), (196,1900,'Prüfungsergebnisse eingeben (funktionsbezogen)'), (201,2000,'Ansehen'), (202,2000,'Ansehen'), (301,3000,'Ansehen'), (302,3000,'Bearbeiten'), (303,3000,'Ansehen'), (401,4000,'Abschlussdaten ansehen (allgemein)'), (402,4000,'Abschlussdaten ansehen (funktionsbezogen)'), (403,4000,'Abschlussdaten ändern (allgemein)'), (404,4000,'Abschlussdaten ändern (funktionsbezogen)'), (405,4000,'Prüfungsergebnisse eingeben (allgemein)'), (406,4000,'Prüfungsergebnisse eingeben (funktionsbezogen)'), (501,5000,'Abschlussdaten ansehen (allgemein)'), (502,5000,'Abschlussdaten ansehen (funktionsbezogen)'), (503,5000,'Abschlussdaten ändern (allgemein)'), (504,5000,'Abschlussdaten ändern (funktionsbezogen)'), (505,5000,'Prüfungsergebnisse eingeben (allgemein)'), (506,5000,'Prüfungsergebnisse eingeben (funktionsbezogen)');


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
