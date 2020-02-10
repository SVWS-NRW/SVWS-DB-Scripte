CREATE TABLE EigeneSchule (
  ID bigint NOT NULL, 
  SchulformNr nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulformKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulformBez nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchultraegerArt nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchultraegerNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulgliederung nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung1 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung2 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung3 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Telefon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fax nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Email nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ganztags nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Schuljahr smallint, 
  SchuljahrAbschnitt smallint, 
  AnzahlAbschnitte smallint DEFAULT 2, 
  Fremdsprachen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  UpdateSprachenfolge nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  JVAZeigen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  RefPaedagogikZeigen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  AnzJGS_Jahr smallint DEFAULT 1, 
  AbschnittBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'Halbjahr', 
  BezAbschnitt1 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1. Hj', 
  BezAbschnitt2 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '2. Hj', 
  IstHauptsitz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  NotenGesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  BezAbschnitt3 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  BezAbschnitt4 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZurueckgestelltAnzahl int, 
  ZurueckgestelltWeibl int, 
  ZurueckgestelltAuslaender int, 
  ZurueckgestelltAuslaenderWeibl int, 
  ZurueckgestelltAussiedler int, 
  ZurueckgestelltAussiedlerWeibl int, 
  TeamTeaching nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  AbiGruppenprozess nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  DauerUnterrichtseinheit int, 
  Gruppen8Bis1 int, 
  Gruppen13Plus int, 
  InternatsplaetzeM int, 
  InternatsplaetzeW int, 
  InternatsplaetzeNeutral int, 
  SchulLogo varbinary(max), 
  SchulnrEigner int, 
  SchulleiterName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulleiterVorname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulleiterAmtsbez nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulleiterGeschlecht int, 
  StvSchulleiterName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  StvSchulleiterVorname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  StvSchulleiterAmtsbez nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  StvSchulleiterGeschlecht int, 
  Einstellungen nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fehlstundenmodell_PrS1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'G', 
  Fehlstundenmodell_S2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'F', 
  Tendenznoten_S1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  WebKL_Modus nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'A', 
  WebMahnungenGesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  WebNotenGesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  LogoFormat nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchILDweb_Config nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  WebTeilLeistungenAnlegen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  WebInfoMail nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  WebAdresse nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Land nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Einstellungen2 nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulleiterTitel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  StvSchulleiterTitel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Fachklassen (
  ID bigint DEFAULT -1 NOT NULL, 
  BKIndex smallint, 
  FKS nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  AP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Kennung nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  FKS_AP_SIM nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  BKIndexTyp nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschreibung_W nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Status nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  Lernfelder nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  DQR_Niveau int, 
  Ebene1Klartext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ebene2Klartext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ebene3Klartext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_EigeneSchule_Fachklassen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Fachklassen_UC1 UNIQUE (AP, BKIndexTyp, FKS)
);


CREATE TABLE EigeneSchule_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  FachKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZeugnisBez nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  UeZeugnisBez nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  StatistikKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  BasisFach nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  IstSprache nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  SortierungS2 int DEFAULT 32000, 
  NachprErlaubt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Gewichtung smallint DEFAULT 1, 
  Fachgruppe_ID bigint, 
  Unterichtssprache nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  IstSchriftlich nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  IstSchriftlichBA nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  AufZeugnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Lernfelder nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  LK_Moegl nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Abi_Moegl nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  E1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  E2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Q1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Q2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Q3 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Q4 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  AlsNeueFSinSII nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Leitfach_ID bigint, 
  Leitfach2_ID bigint, 
  E1_WZE int, 
  E2_WZE int, 
  Q_WZE int, 
  E1_S nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  E2_S nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  NurMuendlich nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Aufgabenfeld nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbgeschlFaecherHolen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  GewichtungFHR int, 
  MaxBemZeichen int,
  CONSTRAINT PK_EigeneSchule_Faecher PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Faecher_UC1 UNIQUE (FachKrz)
);


CREATE TABLE EigeneSchule_FachTeilleistungen (
  SchulnrEigner int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Teilleistung_ID bigint NOT NULL, 
  Kursart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Fach_ID, Kursart, SchulnrEigner, Teilleistung_ID),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EigeneSchule_Jahrgaenge (
  ID bigint DEFAULT -1 NOT NULL, 
  InternKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDBezeichnung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  IstChronologisch nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Spaltentitel nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SekStufe nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  SGL nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  JahrgangNum smallint, 
  Restabschnitte int, 
  SchulnrEigner int, 
  Folgejahrgang_ID bigint,
  CONSTRAINT PK_EigeneSchule_Jahrgaenge PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
);


CREATE TABLE EigeneSchule_KAoADaten (
  SchulnrEigner int NOT NULL, 
  Curriculum nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  Koordinator nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  Berufsorientierungsbuero nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  KooperationsvereinbarungAA nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  NutzungReflexionsworkshop nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzI nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzII nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL,
  CONSTRAINT PK_EigeneSchule_KAoADaten PRIMARY KEY (SchulnrEigner)
);


CREATE TABLE EigeneSchule_Kursart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(120) COLLATE Latin1_General_100_BIN2_UTF8, 
  InternBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kursart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_Kursart PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Kursart_UC1 UNIQUE (Kursart, KursartAllg)
);


CREATE TABLE EigeneSchule_KursartAllg (
  ID bigint DEFAULT -1 NOT NULL, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  InternBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  KursartASD nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(120) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_KursartAllg PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_KursartAllg_UC1 UNIQUE (KursartAllg)
);


CREATE TABLE EigeneSchule_Merkmale (
  ID bigint DEFAULT -1 NOT NULL, 
  Schule nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schueler nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Langtext nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_Merkmale PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Schulformen (
  ID bigint DEFAULT -1 NOT NULL, 
  SGL nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SF_SGL nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulform nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  DoppelQualifikation nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  BKIndex int, 
  SchulnrEigner int, 
  Schulform2 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_EigeneSchule_Schulformen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schulformen_UC1 UNIQUE (SGL)
);


CREATE TABLE EigeneSchule_Teilstandorte (
  SchulnrEigner int NOT NULL, 
  AdrMerkmal nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Hausnr nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kuerzel nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_EigeneSchule_Teilstandorte PRIMARY KEY (AdrMerkmal)
);


CREATE TABLE EigeneSchule_Texte (
  ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kuerzel nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Inhalt nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Texte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Zertifikate (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kuerzel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fach nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Formatvorlage nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_EigeneSchule_Zertifikate PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Zertifikate_UC1 UNIQUE (Kuerzel, SchulnrEigner)
);


CREATE TABLE EigeneSchule_Zertifikatsfaecher (
  Zertifikat_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kuerzel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Lernfelder nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  MaxPunkte int, 
  Sortierung int,
  CONSTRAINT PK_EigeneSchule_Zertifikatsfaecher PRIMARY KEY (Kuerzel, SchulnrEigner)
);


CREATE TABLE Fach_Gliederungen (
  Fach_ID bigint NOT NULL, 
  Gliederung nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Faechergruppe int, 
  GewichtungAB int, 
  GewichtungBB int, 
  SchriftlichAB nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchriftlichBB nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  GymOSFach nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZeugnisBez nvarchar(130) COLLATE Latin1_General_100_BIN2_UTF8, 
  Lernfelder nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachklasse_ID bigint DEFAULT 0 NOT NULL, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Fach_Gliederungen PRIMARY KEY (Fach_ID, Fachklasse_ID)
);


CREATE TABLE Floskelgruppen (
  SchulnrEigner int NOT NULL, 
  Kuerzel nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Hauptgruppe nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  Farbe int,
  CONSTRAINT PK_Floskelgruppen PRIMARY KEY (Kuerzel, SchulnrEigner)
);


CREATE TABLE Floskeln (
  SchulnrEigner int NOT NULL, 
  Kuerzel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Floskeltext nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Floskelgruppe nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Floskelfach nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Floskelniveau nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Floskeljahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Floskeln PRIMARY KEY (Kuerzel)
);


CREATE TABLE K42_Blockgruppen (
  IdNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Bezeichnung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgang nvarchar(16) COLLATE Latin1_General_100_BIN2_UTF8, 
  Semester int, 
  Schienenzahl int, 
  Erstexport nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Mahnungsexport nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KoppIdMaske nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Blockgruppen PRIMARY KEY (IdNr)
);


CREATE TABLE K42_Blockungen (
  ID bigint NOT NULL, 
  Bezeichnung nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schuljahr int, 
  Abschnitt int, 
  Angelegt datetime2, 
  LetzteBearbeitung datetime2, 
  Jahrgang nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Blockungen PRIMARY KEY (ID)
);


CREATE TABLE K42_Faecher (
  IdNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  FachKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  StatistikKrz nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  Fachgruppe_ID bigint, 
  IstSprache nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Faecher PRIMARY KEY (IdNr)
);


CREATE TABLE K42_IdnrListe (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Owner int, 
  Typ int, 
  Idnr bigint, 
  Fix int, 
  Tag int, 
  TerminNr int,
  CONSTRAINT PK_K42_IdnrListe PRIMARY KEY (ID)
);


CREATE TABLE K42_Jahrgaenge (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  InternKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDBezeichnung nvarchar(200) COLLATE Latin1_General_100_BIN2_UTF8, 
  SGL nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SGLText nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Jahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE K42_JgBereiche (
  JG_Bereich int, 
  BlockungsID bigint NOT NULL, 
  Jahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_JgBereiche PRIMARY KEY (BlockungsID, JG_Bereich, Jahrgang)
);


CREATE TABLE K42_KlausurTermine (
  TerminNr int, 
  BlockungsID bigint NOT NULL, 
  BlockgruppenID bigint, 
  Bezeichnung nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  IstAbiturTermin nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_KlausurTermine PRIMARY KEY (BlockgruppenID, BlockungsID, TerminNr)
);


CREATE TABLE K42_Klausurschienen (
  ID bigint NOT NULL, 
  Idnr bigint, 
  BlockungsID bigint NOT NULL, 
  Bezeichnung nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klausurdatum datetime2, 
  VonStd int, 
  BisStd int, 
  NurSchriftlich nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  BlockgruppenID bigint, 
  TerminNr int,
  CONSTRAINT PK_K42_Klausurschienen PRIMARY KEY (ID)
);


CREATE TABLE K42_Kurse (
  ID bigint NOT NULL, 
  IdNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  BlockgruppenID bigint, 
  Typ int, 
  SchienenID bigint, 
  Bezeichnung nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fach nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Stunden int, 
  Lehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgang nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kursart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Semester int, 
  Schienenzahl int, 
  Blocken nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sperrung varbinary(max), 
  Parallelkurse int, 
  KursNr int, 
  MaxProSchiene int, 
  Fixiert nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KursPosition int, 
  Kursraum nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Koopkurs nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  MaxGroesse int, 
  FixGroesse nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klausurdatum datetime2, 
  KlAnfangStd int, 
  KlEndStd int, 
  KlausurBetroffene int, 
  KlAufsicht varbinary(max), 
  KlRaum int, 
  KlBemerkung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  WoStdKL int, 
  WoStdZK int, 
  Zusatzkraft nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  UnterrichtsNr nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klassen nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  StundenPlan varbinary(max), 
  TerminNr int, 
  KursPlanRaum int,
  CONSTRAINT PK_K42_Kurse PRIMARY KEY (ID)
);


CREATE TABLE K42_Lehrer (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Kuerzel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Name nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vorname nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  Passwort nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  Geschlecht nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  AmtsBez nvarchar(16) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMail nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Lehrer PRIMARY KEY (ID)
);


CREATE TABLE K42_Schienen (
  ID bigint NOT NULL, 
  IdNr bigint, 
  BlockungsID bigint NOT NULL, 
  BlockgruppenID bigint, 
  Bezeichnung nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  Umwaehlerzahl int, 
  KopplungsId nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  Stundenraster varbinary(max),
  CONSTRAINT PK_K42_Schienen PRIMARY KEY (ID)
);


CREATE TABLE K42_Schueler (
  IdNr bigint NOT NULL, 
  BlockungsId bigint NOT NULL, 
  Status int NOT NULL, 
  Geschlecht int, 
  Jahrgang nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klasse nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Name nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vorname nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  CollCount int, 
  GebDat datetime2, 
  SchulNr int, 
  DB_IdNr bigint, 
  Tutor nvarchar(16) COLLATE Latin1_General_100_BIN2_UTF8, 
  PruefOrd nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMail nvarchar(128) COLLATE Latin1_General_100_BIN2_UTF8, 
  KoopDBIdNr bigint, 
  VersNr int, 
  Bemerkung nvarchar(1024) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Schueler PRIMARY KEY (IdNr)
);


CREATE TABLE K42_SchuelerFaecher (
  ID bigint NOT NULL, 
  Schueler_ID bigint, 
  BlockungsId int NOT NULL, 
  Fach_ID bigint, 
  KursartInd nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fixiert nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  FehlStd int, 
  Unentsch int, 
  Koop nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Anzahl int, 
  Zensur nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Mdl nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schr nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Mahnung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KoopSchule int, 
  KursBez nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fehl nvarchar(16) COLLATE Latin1_General_100_BIN2_UTF8, 
  UFehl nvarchar(16) COLLATE Latin1_General_100_BIN2_UTF8, 
  LeistungsID bigint, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  VersNr int,
  CONSTRAINT PK_K42_SchuelerFaecher PRIMARY KEY (ID)
);


CREATE TABLE K42_Versetzungstabelle (
  IdNr int NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Klasse nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  JG nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  FolgeKl nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  VorgKl nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  FolgeJg nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  VorgJg nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Orgform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  KlLehrer nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  StvKlLehrer nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  SLBNR int, 
  ASDSCHGL nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgangs_ID nvarchar(9) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_Versetzungstabelle PRIMARY KEY (IdNr)
);


CREATE TABLE K42_ZulKursarten (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Sortierung int, 
  KursartInd nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  JgBereich int, 
  IsVisible nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schriftlich nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K42_ZulKursarten PRIMARY KEY (ID)
);


CREATE TABLE K_Adressart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Adressart PRIMARY KEY (ID),
  CONSTRAINT K_Adressart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ankreuzdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  TextStufe1 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  TextStufe2 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  TextStufe3 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  TextStufe4 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  TextStufe5 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  BezeichnungSONST nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K_Ankreuzdaten PRIMARY KEY (ID)
);


CREATE TABLE K_Ankreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Jahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Floskeltext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int, 
  FachSortierung int, 
  Abschnitt int, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aktiv nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+',
  CONSTRAINT PK_K_Ankreuzfloskeln PRIMARY KEY (ID)
);


CREATE TABLE K_BeschaeftigungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(250) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+' NOT NULL, 
  Schluessel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int NOT NULL, 
  Sortierung int DEFAULT 32000 NOT NULL, 
  Beschreibung nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K_Datenschutz PRIMARY KEY (ID)
);


CREATE TABLE K_EinschulungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_EinschulungsArt PRIMARY KEY (ID),
  CONSTRAINT K_EinschulungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Einzelleistungen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Gewichtung float,
  CONSTRAINT PK_K_Einzelleistungen PRIMARY KEY (ID)
);


CREATE TABLE K_EntlassGrund (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_EntlassGrund PRIMARY KEY (ID),
  CONSTRAINT K_EntlassGrund_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  ExportBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_K_ErzieherArt PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_ErzieherFunktion PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherFunktion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_FahrschuelerArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_FahrschuelerArt PRIMARY KEY (ID),
  CONSTRAINT K_FahrschuelerArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Foerderschwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Foerderschwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Foerderschwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Haltestelle (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  EntfernungSchule float, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Haltestelle PRIMARY KEY (ID),
  CONSTRAINT K_Haltestelle_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Kindergarten (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Tel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMail nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Kindergarten PRIMARY KEY (ID)
);


CREATE TABLE K_KlassenOrgForm (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+',
  CONSTRAINT PK_K_KlassenOrgForm PRIMARY KEY (ID),
  CONSTRAINT K_KlassenOrgForm_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ort (
  ID bigint DEFAULT -1 NOT NULL, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kreis nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Land nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Ort PRIMARY KEY (ID),
  CONSTRAINT K_Ort_UC1 UNIQUE (Bezeichnung, PLZ)
);

CREATE INDEX K_Ort_IDX1 ON K_Ort(PLZ);


CREATE TABLE K_AllgAdresse (
  ID bigint DEFAULT -1 NOT NULL, 
  AllgAdrAdressArt nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  AllgAdrName1 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrName2 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrStrasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrOrt_ID bigint, 
  AllgAdrPLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrTelefon1 nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrTelefon2 nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrFax nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrEmail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrBemerkungen nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  AllgAdrAusbildungsBetrieb nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  AllgAdrBietetPraktika nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  AllgAdrBranche nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrZusatz1 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrZusatz2 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int, 
  Massnahmentraeger nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  BelehrungISG nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  GU_ID nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErwFuehrungszeugnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  ExtID nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K_AllgAdresse PRIMARY KEY (ID),
  CONSTRAINT K_AllgAdresse_AdressArt_FK FOREIGN KEY (AllgAdrAdressArt) REFERENCES K_Adressart(Bezeichnung) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID) ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE AllgAdrAnsprechpartner (
  ID bigint DEFAULT -1 NOT NULL, 
  Adresse_ID bigint, 
  Name nvarchar(60) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vorname nvarchar(60) COLLATE Latin1_General_100_BIN2_UTF8, 
  Anrede nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Telefon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Abteilung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  Titel nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  GU_ID nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_AllgAdrAnsprechpartner PRIMARY KEY (ID),
  CONSTRAINT Ansprechpartner_Adr_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE K_Ortsteil (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Ort_ID bigint, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int, 
  OrtsteilSchluessel nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K_Ortsteil PRIMARY KEY (ID),
  CONSTRAINT K_Ortsteil_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Lehrer (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kuerzel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  LIDKrz nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  Nachname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Vorname nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonTyp nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'LEHRKRAFT', 
  SchulnrEigner int, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  FuerExport nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Statistik nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort_ID bigint, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ortsteil_ID bigint, 
  Tel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Handy nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMailDienstlich nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  StaatKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Geburtsdatum datetime2, 
  Geschlecht nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Anrede nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Amtsbezeichnung nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  Titel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Faecher nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  IdentNr1 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SerNr nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  PANr nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  LBVNr nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  VSchluessel nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DatumZugang datetime2, 
  GrundZugang nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  DatumAbgang datetime2, 
  GrundAbgang nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulFunktion nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  PflichtstdSoll float, 
  Rechtsverhaeltnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschaeftigungsart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Einsatzstatus nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  StammschulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  LPassword nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  PWAktuell nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-;5', 
  SchILDweb_FL nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchILDweb_KL nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchILDweb_Config nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  KennwortTools nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Antwort1 nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Antwort2 nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  KennwortToolsAktuell nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-;5',
  CONSTRAINT PK_K_Lehrer PRIMARY KEY (ID),
  CONSTRAINT K_Lehrer_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT K_Lehrer_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT K_Lehrer_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE EigeneSchule_Abteilungen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  AbteilungsLeiter nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int, 
  Raum nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Durchwahl nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int,
  CONSTRAINT PK_EigeneSchule_Abteilungen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abteilungen_Leiter_FK FOREIGN KEY (AbteilungsLeiter) REFERENCES K_Lehrer(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE K_Religion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  ExportBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZeugnisBezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Religion PRIMARY KEY (ID),
  CONSTRAINT K_Religion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Schule (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Name nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulformNr nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulformKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulformBez nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Telefon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fax nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Email nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulleiter nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulNr_SIM nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kuerzel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  KurzBez nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Schule PRIMARY KEY (ID),
  CONSTRAINT K_Schule_UC1 UNIQUE (SchulNr)
);


CREATE TABLE K_Schulfunktionen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Schulfunktionen PRIMARY KEY (ID)
);


CREATE TABLE K_Schwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Schwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Schwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE Fachklassen_Schwerpunkte (
  SchulnrEigner int NOT NULL, 
  Fachklasse_ID bigint NOT NULL, 
  Schwerpunkt_ID bigint NOT NULL,
  CONSTRAINT PK_Fachklassen_Schwerpunkte PRIMARY KEY (Fachklasse_ID, SchulnrEigner, Schwerpunkt_ID),
  CONSTRAINT Fachklassen_Schwerpunkte_Fachkl_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Fachklassen_Schwerpunkte_Schwerp_FK FOREIGN KEY (Schwerpunkt_ID) REFERENCES K_Schwerpunkt(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE K_Sportbefreiung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Sportbefreiung PRIMARY KEY (ID),
  CONSTRAINT K_Sportbefreiung_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Staat (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(80) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  ExportBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  Bezeichnung2 nvarchar(80) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_K_Staat PRIMARY KEY (ID),
  CONSTRAINT K_Staat_UC1 UNIQUE (StatistikKrz)
);


CREATE TABLE K_TXTDATEIEN (
  ID bigint DEFAULT -1 NOT NULL, 
  BEZEICHNUNG nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  TEXT_ID bigint NOT NULL, 
  TEXT_BODY nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Sortierung smallint, 
  SchulnrEigner int,
  CONSTRAINT PK_K_TXTDATEIEN PRIMARY KEY (ID)
);


CREATE TABLE K_TelefonArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_TelefonArt PRIMARY KEY (ID),
  CONSTRAINT K_TelefonArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Verkehrssprachen (
  ID bigint DEFAULT -1 NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Langtext nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  SchulnrEigner int,
  CONSTRAINT PK_K_Verkehrssprachen PRIMARY KEY (ID)
);


CREATE TABLE K_Vermerkart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_K_Vermerkart PRIMARY KEY (ID),
  CONSTRAINT K_Vermerkart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Zertifikate (
  Kuerzel nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  SchulnrEigner int NOT NULL,
  CONSTRAINT PK_K_Zertifikate PRIMARY KEY (Kuerzel, SchulnrEigner)
);


CREATE TABLE Kompetenzen (
  KO_ID bigint NOT NULL, 
  KO_Gruppe bigint NOT NULL, 
  KO_Bezeichnung nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
  CONSTRAINT PK_Kompetenzen PRIMARY KEY (KO_Gruppe, KO_ID)
);


CREATE TABLE Kompetenzgruppen (
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL, 
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
  CONSTRAINT PK_Kompetenzgruppen PRIMARY KEY (KG_Bezeichnung, KG_ID, KG_Spalte, KG_Zeile)
);


CREATE TABLE KursKombinationen (
  Kurs1_ID bigint NOT NULL, 
  Kurs2_ID bigint NOT NULL,
  CONSTRAINT PK_KursKombinationen PRIMARY KEY (Kurs1_ID, Kurs2_ID)
);


CREATE TABLE Kurse (
  ID bigint DEFAULT -1 NOT NULL, 
  Jahr smallint NOT NULL, 
  Abschnitt smallint NOT NULL, 
  KurzBez nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Wochenstd smallint, 
  LehrerKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Schienen nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fortschreibungsart nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WochenstdKL float, 
  SchulNr int, 
  EpochU nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  SchulnrEigner int, 
  Zeugnisbez nvarchar(130) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgaenge nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Kurse PRIMARY KEY (ID),
  CONSTRAINT Kurse_UC1 UNIQUE (ASDJahrgang, Abschnitt, Fach_ID, Jahr, Jahrgaenge, KursartAllg, KurzBez, LehrerKrz, Wochenstd)
);


CREATE TABLE KursLehrer (
  Kurs_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Anteil float, 
  SchulnrEigner int,
  CONSTRAINT PK_KursLehrer PRIMARY KEY (Kurs_ID, Lehrer_ID),
  CONSTRAINT KursLehrer_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursLehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAbschnittsdaten (
  Lehrer_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Rechtsverhaeltnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschaeftigungsart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Einsatzstatus nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  PflichtstdSoll float, 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerAbschnittsdaten PRIMARY KEY (Abschnitt, Jahr, Lehrer_ID),
  CONSTRAINT LehrerAbschnitte_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAnrechnung (
  Lehrer_ID bigint NOT NULL, 
  AnrechnungsgrundKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  AnrechnungStd float, 
  Jahr int, 
  Abschnitt int, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerAnrechnung PRIMARY KEY (Abschnitt, AnrechnungsgrundKrz, Jahr, Lehrer_ID),
  CONSTRAINT LehrerAnrechnung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerEntlastung (
  Lehrer_ID bigint NOT NULL, 
  EntlastungsgrundKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  EntlastungStd float, 
  Jahr int, 
  Abschnitt int, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerEntlastung PRIMARY KEY (Abschnitt, EntlastungsgrundKrz, Jahr, Lehrer_ID),
  CONSTRAINT LehrerEntlastung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerFotos (
  Lehrer_ID bigint NOT NULL, 
  Foto varbinary(max), 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerFotos PRIMARY KEY (Lehrer_ID)
);


CREATE TABLE LehrerFunktionen (
  Lehrer_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Funktion_ID bigint NOT NULL, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerFunktionen PRIMARY KEY (Abschnitt, Funktion_ID, Jahr, Lehrer_ID),
  CONSTRAINT LehrerFunktionen_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_Schulfunktionen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramt (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LehramtAnerkennungKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerLehramt PRIMARY KEY (LehramtKrz, Lehrer_ID),
  CONSTRAINT LehrerLehramt_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramtFachr (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  FachrKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  FachrAnerkennungKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerLehramtFachr PRIMARY KEY (FachrKrz, LehramtKrz, Lehrer_ID)
);


CREATE TABLE LehrerLehramtLehrbef (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LehrbefKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LehrbefAnerkennungKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerLehramtLehrbef PRIMARY KEY (LehramtKrz, LehrbefKrz, Lehrer_ID)
);


CREATE TABLE LehrerMehrleistung (
  Lehrer_ID bigint NOT NULL, 
  MehrleistungsgrundKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  MehrleistungStd float, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  SchulnrEigner int,
  CONSTRAINT PK_LehrerMehrleistung PRIMARY KEY (Abschnitt, Jahr, Lehrer_ID, MehrleistungsgrundKrz),
  CONSTRAINT LehrerMehrleistung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Lehrer_IMEI (
  ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  IMEI nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Lehrer_IMEI PRIMARY KEY (ID),
  CONSTRAINT Lehrer_IMEI_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL, 
  LI_LoginTime datetime2, 
  LI_LogoffTime datetime2, 
  SchulnrEigner int,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_LoginTime, LI_UserID)
);


CREATE TABLE NUES_Kategorien (
  KategorieKuerzel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  KategorieText nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  KategorieArt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_NUES_Kategorien PRIMARY KEY (KategorieKuerzel)
);


CREATE TABLE NUES_Merkmale (
  MerkmalKuerzel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  MerkmalText nvarchar(200) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Jahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HauptKategorie nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  NebenKategorie nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_NUES_Merkmale PRIMARY KEY (MerkmalKuerzel),
  CONSTRAINT NUES_Merkmale_Kategorie_FK FOREIGN KEY (HauptKategorie) REFERENCES NUES_Kategorien(KategorieKuerzel) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Kursart1 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kursart2 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  PK nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int, 
  Phase nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Typ nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_NichtMoeglAbiFachKombi PRIMARY KEY (PK)
);


CREATE TABLE Personengruppen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Gruppenname nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Zusatzinfo nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  SammelEMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  GruppenArt nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  XMLExport nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+',
  CONSTRAINT PK_Personengruppen PRIMARY KEY (ID)
);


CREATE TABLE Personengruppen_Personen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Gruppe_ID bigint NOT NULL, 
  Person_ID bigint, 
  PersonNr int, 
  PersonArt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  PersonVorname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonPLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonOrt nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonStrasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonTelefon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonMobil nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonEMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZusatzInfo nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  PersonAnrede nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  PersonAkadGrad nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Personengruppen_Personen PRIMARY KEY (ID)
);


CREATE TABLE PrfSemAbschl (
  Nr nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  StatistikKrz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_PrfSemAbschl PRIMARY KEY (Nr)
);


CREATE TABLE SETTINGS (
  ID bigint NOT NULL, 
  NAME nvarchar(32) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulNrEigner int NOT NULL, 
  VALUE_FLOAT float, 
  VALUE_INT int, 
  VALUE_STR nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SETTINGS PRIMARY KEY (ID)
);

CREATE INDEX SETTINGS_IDX1 ON SETTINGS(NAME, SchulNrEigner);
CREATE INDEX SETTINGS_IDX2 ON SETTINGS(NAME);
CREATE INDEX SETTINGS_IDX3 ON SETTINGS(SchulNrEigner);


CREATE TABLE SVWS_DB_AutoInkremente (
  NameTabelle nvarchar(200) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_DB_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_Version (
  Revision int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_SVWS_DB_Version PRIMARY KEY (Revision)
);


CREATE TABLE SchildFilter (
  ID bigint DEFAULT -1 NOT NULL, 
  Art nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Name nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Tabellen nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZusatzTabellen nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bedingung nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  BedingungKlartext nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_SchildFilter PRIMARY KEY (ID),
  CONSTRAINT SchildFilter_UC1 UNIQUE (Name)
);


CREATE TABLE Schild_Verwaltung (
  BackupDatum datetime2, 
  AutoBerechnung datetime2, 
  DatumStatkue datetime2, 
  DatumSchildIntern datetime2, 
  Bescheinigung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Stammblatt nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  DatenGeprueft nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  FaecherUebernehmen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Version nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  GU_ID nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikJahr int, 
  SchulnrEigner int NOT NULL, 
  LD_Datentyp nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Version3 nvarchar(16) COLLATE Latin1_General_100_BIN2_UTF8, 
  DatumLoeschfristHinweisDeaktiviert datetime2, 
  DatumLoeschfristHinweisDeaktiviertUserID int, 
  DatumDatenGeloescht datetime2,
  CONSTRAINT PK_Schild_Verwaltung PRIMARY KEY (GU_ID),
  CONSTRAINT Schild_Verwaltung_UC1 UNIQUE (SchulnrEigner)
);


CREATE TABLE Schildintern_AbiturInfos (
  PrfOrdnung nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  AbiFach nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bedingung nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbiInfoKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbiInfoBeschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbiInfoText nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_AbiturInfos PRIMARY KEY (AbiFach, AbiInfoKrz, Bedingung, PrfOrdnung)
);


CREATE TABLE Schildintern_Berufsebene (
  Berufsebene int NOT NULL, 
  Kuerzel nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_Berufsebene PRIMARY KEY (Berufsebene, Kuerzel)
);


CREATE TABLE Schildintern_DQR_Niveaus (
  Gliederung nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  FKS nvarchar(8) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  DQR_Niveau int NOT NULL
);


CREATE TABLE Schildintern_Datenart (
  DatenartKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Datenart nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Tabellenname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_Datenart PRIMARY KEY (DatenartKrz)
);


CREATE TABLE Schildintern_Fachgruppen (
  FG_ID bigint NOT NULL, 
  FG_SF nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  FG_Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  FG_Farbe int, 
  FG_Sortierung int, 
  FG_Kuerzel nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  FG_Zeugnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_Fachgruppen PRIMARY KEY (FG_ID)
);


CREATE TABLE Schildintern_FaecherSortierung (
  Fach nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(80) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung1 int, 
  Sortierung2 int, 
  Fachgruppe_ID bigint, 
  FachgruppeKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  AufgabenbereichAbitur nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_FaecherSortierung PRIMARY KEY (Fach)
);


CREATE TABLE Schildintern_FilterFehlendeEintraege (
  ID bigint NOT NULL, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Feldname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Tabellen nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SQLText nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulform nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Feldtyp nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_FilterFehlendeEintraege PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_FilterFeldListe (
  ID bigint NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DBFeld nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Typ nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Werte nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  StdWert nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Operator nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zusatzbedingung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_FilterFeldListe PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_HSchStatus (
  StatusNr int NOT NULL, 
  Bezeichnung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  InSimExp nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SIMAbschnitt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_HSchStatus PRIMARY KEY (StatusNr)
);


CREATE TABLE Schildintern_KAoA_Anschlussoption (
  AO_Kuerzel nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  AO_Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  AO_Stufen nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_KAoA_Anschlussoption PRIMARY KEY (AO_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Berufsfeld (
  BF_Kuerzel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BF_Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_KAoA_Berufsfeld PRIMARY KEY (BF_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Kategorie (
  K_Kuerzel nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  K_Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  K_Jahrgaenge nvarchar(25) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_KAoA_Kategorie PRIMARY KEY (K_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Merkmal (
  M_Kuerzel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  M_Kategorie nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  M_Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  M_Option nvarchar(25) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_KAoA_Merkmal PRIMARY KEY (M_Kuerzel)
);


CREATE TABLE Schildintern_KAoA_Zusatzmerkmal (
  ZM_Kuerzel nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  ZM_Merkmal nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZM_Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZM_Option nvarchar(25) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_KAoA_Zusatzmerkmal PRIMARY KEY (ZM_Kuerzel)
);


CREATE TABLE Schildintern_K_Schulnote (
  ID bigint NOT NULL, 
  Krz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Art nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zeugnisnotenbez nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Punkte nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Aenderbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_K_Schulnote PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_KursartenZuordnung (
  KursartIndiv nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
  CONSTRAINT PK_Schildintern_KursartenZuordnung PRIMARY KEY (KursartIndiv)
);


CREATE TABLE Schildintern_Laender (
  Kurztext nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int,
  CONSTRAINT PK_Schildintern_Laender PRIMARY KEY (Kurztext)
);


CREATE TABLE Schildintern_PrfSemAbschl (
  Nr nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  StatistikKrz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  Schulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikKrzNeu nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_PrfSemAbschl PRIMARY KEY (Nr, Schulform)
);


CREATE TABLE Schildintern_PruefOrd_Optionen (
  OP_Schulformen nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_POKrz nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_Krz nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_Abgangsart_B nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  OP_Abgangsart_NB nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  OP_Art nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_Typ nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  OP_Bildungsgang nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_Name nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_Kommentar nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  OP_Jahrgaenge nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OP_BKIndex nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  OP_BKAnl_Typ nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  OP_Reihenfolge int NOT NULL,
  CONSTRAINT PK_Schildintern_PruefOrd_Optionen PRIMARY KEY (OP_Art, OP_Bildungsgang, OP_Jahrgaenge, OP_Krz, OP_Name, OP_POKrz, OP_Reihenfolge, OP_Schulformen)
);


CREATE TABLE Schildintern_PruefungsOrdnung (
  PO_Schulform nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  PO_Krz nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  PO_Name nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  PO_SGL nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  PO_MinJahrgang int DEFAULT 0 NOT NULL, 
  PO_MaxJahrgang int DEFAULT 20 NOT NULL, 
  PO_Jahrgaenge nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
  CONSTRAINT PK_Schildintern_PruefungsOrdnung PRIMARY KEY (PO_Krz, PO_SGL, PO_Schulform)
);


CREATE TABLE Schildintern_SchuelerImpExp (
  Tabelle nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  TabellenAnzeige nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  MasterTable nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  ExpCmd nvarchar(250) COLLATE Latin1_General_100_BIN2_UTF8, 
  SrcGetFieldsSQL nvarchar(250) COLLATE Latin1_General_100_BIN2_UTF8, 
  DeleteSQL nvarchar(250) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstGetIDSQL nvarchar(250) COLLATE Latin1_General_100_BIN2_UTF8, 
  HauptFeld nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DetailFeld nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_SchuelerImpExp PRIMARY KEY (Tabelle)
);


CREATE TABLE Schildintern_SpezialFilterFelder (
  ID bigint NOT NULL, 
  Gruppe nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  KurzBez nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Grundschule nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Tabelle nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  DBFeld nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Typ nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Control nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  WerteAnzeige nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  WerteSQL nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupInfo nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  OperatorenAnzeige nvarchar(150) COLLATE Latin1_General_100_BIN2_UTF8, 
  OperatorenSQL nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zusatzbedingung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZusatzTabellen nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_SpezialFilterFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_TextExport (
  DatenartKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Feldname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  AnzeigeText nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  FeldTyp nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Feldwerte nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErgebnisWerte nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupFeldname nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupSQLText nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  DBFormat nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'ALLE' NOT NULL,
  CONSTRAINT PK_Schildintern_TextExport PRIMARY KEY (AnzeigeText, DBFormat, DatenartKrz, Feldname)
);


CREATE TABLE Schildintern_VerfImportFelder (
  ID bigint NOT NULL, 
  TableDescription nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  FieldDescription nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstTable nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstFieldName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstFieldType nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstRequiredState nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstLookupTable nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstLookupTableIDFieldName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstLookupFieldName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstResultFieldName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstKeyLookupInsert nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstKeyLookupNameCreateID nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstForceNumeric nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_VerfImportFelder PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_VerfImportTabellen (
  TableName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  DstRequiredFields nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstIDFieldName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sequence int, 
  LookupTable nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupFields nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupFieldTypes nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupResultField nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupResultFieldType nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LookupKeyField nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstDefaultFieldName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstDefaultFieldValue nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  DstCreateID nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  GU_ID_Field nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Schildintern_VerfImportTabellen PRIMARY KEY (TableName)
);


CREATE TABLE Schildintern_Zusatzinfos (
  SGL_BKAbschl nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  JG_BKAbschl nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
  CONSTRAINT PK_Schildintern_Zusatzinfos PRIMARY KEY (JG_BKAbschl, SGL_BKAbschl)
);


CREATE TABLE SchuelerEinzelleistungen (
  SchulnrEigner int NOT NULL, 
  ID bigint DEFAULT -1 NOT NULL, 
  Datum datetime2, 
  Lehrer_ID bigint, 
  Art_ID bigint, 
  Bemerkung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Leistung_ID bigint, 
  NotenKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerEinzelleistungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerEL_Art_FK FOREIGN KEY (Art_ID) REFERENCES K_Einzelleistungen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerGSDaten (
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
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
  Anrede_Klassenlehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Nachname_Klassenlehrer nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  GS_Klasse nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkungen nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Geschwisterkind nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-',
  CONSTRAINT PK_SchuelerGSDaten PRIMARY KEY (Schueler_ID)
);


CREATE TABLE SchuelerListe (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Erzeuger nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Privat nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerReportvorlagen (
  User_ID bigint NOT NULL, 
  SchulnrEigner int, 
  ReportVorlage nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schueler_IDs nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8
);


CREATE TABLE SchuelerWiedervorlage (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Bemerkung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  AngelegtAm datetime2, 
  WiedervorlageAm datetime2, 
  ErledigtAm datetime2, 
  User_ID bigint, 
  Sekretariat nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Typ nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  NichtLoeschen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerWiedervorlage PRIMARY KEY (ID)
);


CREATE TABLE Schulver_DBS (
  SchulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Regschl nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  KoRe float, 
  KoHo float, 
  ABez1 nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  ABez2 nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  ABez3 nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  PLZ nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(34) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  TelVorw nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Telefon nvarchar(12) COLLATE Latin1_General_100_BIN2_UTF8, 
  FaxVorw nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fax nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  ModemVorw nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Modem nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  OeffPri nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KurzBez nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchBetrSchl int, 
  SchBetrSchlDatum nvarchar(8) COLLATE Latin1_General_100_BIN2_UTF8, 
  ArtderTraegerschaft nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchultraegerNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulgliederung nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulart nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ganztagsbetrieb nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Verbund nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bus nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachberater int, 
  FachberHauptamtl int, 
  TelNrDBSalt nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  RP nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Email nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  URL nvarchar(1000) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkung nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  CD int, 
  Stift int, 
  OGTS nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SELB nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Internat nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  InternatPlaetze int DEFAULT 0, 
  SMail nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SportImAbi nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '0',
  CONSTRAINT PK_Schulver_DBS PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_Schulformen (
  Schulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bezeichnung nvarchar(60) COLLATE Latin1_General_100_BIN2_UTF8, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1', 
  geaendert datetime2,
  CONSTRAINT PK_Schulver_Schulformen PRIMARY KEY (Schulform)
);


CREATE TABLE Schulver_Schultraeger (
  SchulNr nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Regschl nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  KoRe nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  KoHo nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  ABez1 nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  ABez2 nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  ABez3 nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  PLZ nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  TelVorw nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Telefon nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  SF nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  OeffPri nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  KurzBez nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchBetrSchl int, 
  SchBetrSchlDatum nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchuelerZahlASD int DEFAULT 0, 
  SchuelerZahlVS int DEFAULT 0, 
  ArtderTraegerschaft nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchultraegerNr nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulgliederung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ganztagsbetrieb nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  aktiv int DEFAULT 1 NOT NULL,
  CONSTRAINT PK_Schulver_Schultraeger PRIMARY KEY (SchulNr)
);


CREATE TABLE Statkue_Abgangsart (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Art nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(200) COLLATE Latin1_General_100_BIN2_UTF8, 
  KZ_Bereich int DEFAULT 0, 
  KZ_Bereich_JG int DEFAULT 0, 
  AbgangsJG nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1', 
  geaendert datetime2, 
  Sortierung int DEFAULT 0,
  CONSTRAINT PK_Statkue_Abgangsart PRIMARY KEY (AbgangsJG, Art, KZ_Bereich, SF)
);


CREATE TABLE Statkue_AllgMerkmale (
  ID bigint NOT NULL, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  StatistikKrz nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Schule int, 
  Schueler int, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int,
  CONSTRAINT PK_Statkue_AllgMerkmale PRIMARY KEY (ID, Kurztext)
);


CREATE TABLE Statkue_AndereGrundschulen (
  SNR nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  ABez1 nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  Auswahl int, 
  RegSchl nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_AndereGrundschulen PRIMARY KEY (SNR)
);


CREATE TABLE Statkue_Bilingual (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Fach nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Bilingual PRIMARY KEY (Fach, SF)
);


CREATE TABLE Statkue_Einschulungsart (
  Art nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sortierung int DEFAULT 0, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Einschulungsart PRIMARY KEY (Art)
);


CREATE TABLE Statkue_Fachklasse (
  BKIndex int DEFAULT 0 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  FKS nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  AP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BGrp nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  BFeld nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 0, 
  Status nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschreibung_W nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2, 
  Beschreibung_MW nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  BAKLALT nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  BAGRALT nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  BAKL nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  BAGR nvarchar(8) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ebene1 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ebene2 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ebene3 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Flag_APOBK nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Statkue_Fachklasse PRIMARY KEY (AP, BKIndex, FKS)
);


CREATE TABLE Statkue_Foerderschwerpunkt (
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1', 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Foerderschwerpunkt PRIMARY KEY (FSP, SF)
);


CREATE TABLE Statkue_Gliederung (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BKAnlage nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BKTyp nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BKIndex int DEFAULT 0, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Gliederung PRIMARY KEY (BKAnlage, BKTyp, Flag, SF)
);


CREATE TABLE Statkue_Herkunftsart (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Art nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1' NOT NULL, 
  Sortierung int DEFAULT 0 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Herkunftsart PRIMARY KEY (Art, SF)
);


CREATE TABLE Statkue_Herkunftsschulform (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  HSF nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(150) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1' NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Herkunftsschulform PRIMARY KEY (HSF, SF)
);


CREATE TABLE Statkue_LehrerAbgang (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Statkue_LehrerAbgang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerAnrechnung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerAnrechnung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerBeschaeftigungsart (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerBeschaeftigungsart PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerEinsatzstatus (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerEinsatzstatus PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerFachrAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrichtung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerFachrichtung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramt (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehramt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramtAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehramtAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehrbefAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefaehigung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehrbefaehigung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLeitung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLeitung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMehrleistung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerMehrleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMinderleistung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerMinderleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerRechtsverhaeltnis (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerRechtsverhaeltnis PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerZugang (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  ASDSchluessel nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Statkue_LehrerZugang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Nationalitaeten (
  Schluessel nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext2 nvarchar(80) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2, 
  Beginn datetime2, 
  Ende datetime2,
  CONSTRAINT PK_Statkue_Nationalitaeten PRIMARY KEY (Schluessel)
);


CREATE TABLE Statkue_Organisationsform (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  OrgForm nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Organisationsform PRIMARY KEY (FSP, OrgForm, SF)
);


CREATE TABLE Statkue_PLZOrt (
  ID bigint NOT NULL, 
  PLZ nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  REGSCHL nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  ORT nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 1,
  CONSTRAINT PK_Statkue_PLZOrt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Reformpaedagogik (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  RPG nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beschreibung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Reformpaedagogik PRIMARY KEY (RPG, SF)
);


CREATE TABLE Statkue_Religionen (
  Schluessel nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Klartext nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Religionen PRIMARY KEY (Schluessel)
);


CREATE TABLE Statkue_SchuelerErsteSchulformSekI (
  ID bigint NOT NULL, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_SchuelerErsteSchulformSekI PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerKindergartenbesuch (
  ID bigint NOT NULL, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_SchuelerKindergartenbesuch PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerUebergangsempfehlung5Jg (
  ID bigint NOT NULL, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int, 
  HGSEM nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
  CONSTRAINT PK_Statkue_SchuelerUebergangsempfehlung5Jg PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerVerkehrssprache (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Langtext nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Gesprochen_in nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beginn datetime2, 
  Ende datetime2,
  CONSTRAINT PK_Statkue_SchuelerVerkehrssprache PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Schulformen (
  Schulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1' NOT NULL, 
  geaendert datetime2, 
  Sortierung int DEFAULT 0,
  CONSTRAINT PK_Statkue_Schulformen PRIMARY KEY (Bezeichnung, SF)
);


CREATE TABLE Statkue_ZulFaecher (
  Schulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BG nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Fach nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(80) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  KZ_Bereich int DEFAULT 0, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1', 
  Sortierung int DEFAULT 0, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulFaecher PRIMARY KEY (BG, Bezeichnung, FSP, Fach, Flag, Schulform)
);


CREATE TABLE Statkue_ZulJahrgaenge (
  ID bigint NOT NULL, 
  Schulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  SNR nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  KZ_Bereich int DEFAULT 0, 
  Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_ZulKlArt (
  KlArt nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Schulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulKlArt PRIMARY KEY (Bezeichnung, FSP, KlArt, Schulform)
);


CREATE TABLE Statkue_ZulKuArt (
  SF nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  FSP nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  BG nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Kursart nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Kursart2 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Bezeichnung nvarchar(120) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  JgBereich int DEFAULT 0 NOT NULL, 
  Flag nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '1' NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulKuArt PRIMARY KEY (BG, Bezeichnung, FSP, Flag, JgBereich, Kursart, Kursart2, SF)
);


CREATE TABLE Stundentafel (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klasse nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  SGL nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachklasse_ID bigint, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Stundentafel PRIMARY KEY (ID)
);


CREATE TABLE Stundentafel_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundentafel_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  WochenStd smallint, 
  LehrerKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  EpochenUnterricht nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  SchulnrEigner int,
  CONSTRAINT PK_Stundentafel_Faecher PRIMARY KEY (ID),
  CONSTRAINT StundentafelFaecher_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT StundentafelFaecher_Stdtafel_FK FOREIGN KEY (Stundentafel_ID) REFERENCES Stundentafel(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundentafel_Faecher_UC1 UNIQUE (Fach_ID, Stundentafel_ID)
);


CREATE TABLE TextExportVorlagen (
  SchulnrEigner int NOT NULL, 
  VorlageName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Daten nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (SchulnrEigner, VorlageName)
);


CREATE TABLE Usergroups (
  UG_ID bigint NOT NULL, 
  UG_Bezeichnung nvarchar(64) COLLATE Latin1_General_100_BIN2_UTF8, 
  UG_Kompetenzen nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  UG_Nr int, 
  SchulnrEigner int,
  CONSTRAINT PK_Usergroups PRIMARY KEY (UG_ID),
  CONSTRAINT Usergroups_UC1 UNIQUE (UG_Bezeichnung)
);


CREATE TABLE Users (
  ID bigint DEFAULT -1 NOT NULL, 
  US_Name nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  US_LoginName nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  US_Password nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  US_UserGroups nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  US_Privileges nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  EMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMailName nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  SMTPUsername nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  SMTPPassword nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  EMailSignature nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  HeartbeatDate int, 
  ComputerName nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  US_PasswordHash nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Users PRIMARY KEY (ID),
  CONSTRAINT Users_UC1 UNIQUE (US_LoginName)
);


CREATE TABLE Versetzung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(150) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDKlasse nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klasse nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Jahrgang_ID bigint, 
  FKlasse nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  VKlasse nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  OrgFormKrz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KlassenlehrerKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  StvKlassenlehrerKrz nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Restabschnitte smallint, 
  ASDSchulformNr nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachklasse_ID bigint, 
  PruefOrdnung nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  Klassenart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SommerSem nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  NotenGesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  AdrMerkmal nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'A', 
  WebNotenGesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  KoopKlasse nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Ankreuzzeugnisse nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_Versetzung PRIMARY KEY (ID),
  CONSTRAINT Versetzung_Lehrer_FK FOREIGN KEY (KlassenlehrerKrz) REFERENCES K_Lehrer(Kuerzel) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT Versetzung_UC1 UNIQUE (Klasse)
);


CREATE TABLE EigeneSchule_Abt_Kl (
  ID bigint DEFAULT -1 NOT NULL, 
  Abteilung_ID bigint NOT NULL, 
  Klasse nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Sichtbar nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  SchulnrEigner int,
  CONSTRAINT PK_EigeneSchule_Abt_Kl PRIMARY KEY (ID),
  CONSTRAINT EigeneSchuleAbtKl_Abteilung_FK FOREIGN KEY (Abteilung_ID) REFERENCES EigeneSchule_Abteilungen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT EigeneSchuleAbtKl_Klasse_FK FOREIGN KEY (Klasse) REFERENCES Versetzung(Klasse) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schueler (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8, 
  SrcID int, 
  IDext nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Status int, 
  Name nvarchar(60) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vorname nvarchar(60) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zusatz nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Geburtsname nvarchar(60) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ort_ID bigint, 
  PLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  OrtAbk nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Ortsteil_ID bigint, 
  Telefon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Email nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fax nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  AktSchuljahr smallint, 
  AktAbschnitt smallint, 
  Klasse nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgang smallint, 
  PruefOrdnung nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Geburtsdatum datetime2, 
  Geburtsort nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Volljaehrig nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Geschlecht smallint, 
  StaatKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  StaatKrz2 nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  StaatAbk nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Aussiedler nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Religion_ID bigint, 
  ReligionAbk nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Religionsabmeldung datetime2, 
  Religionsanmeldung datetime2, 
  Bafoeg nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Schwerbehinderung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  Sportbefreiung_ID bigint, 
  Fahrschueler_ID bigint, 
  Haltestelle_ID bigint, 
  HaltestelleAbk nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDSchulform nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachklasse_ID bigint, 
  SchulpflichtErf nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Anschreibdatum datetime2, 
  Aufnahmedatum datetime2, 
  Einschulungsjahr smallint, 
  Einschulungsart_ID bigint, 
  LSSchulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSchulformSIM nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSchulentlassDatum datetime2, 
  LSVersetzung nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSFachklKennung nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSFachklSIM nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSEntlassgrund nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSEntlassArt nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSKlassenart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSRefPaed nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Entlassjahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Entlassjahrgang_ID bigint, 
  Entlassdatum datetime2, 
  Entlassgrund nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Entlassart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulwechselNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulwechseldatum datetime2, 
  Geloescht nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Gesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  ModifiziertAm datetime2, 
  ModifiziertVon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Markiert nvarchar(21) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  FotoVorhanden nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  JVA nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  RefPaed nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  KeineAuskunft nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Lehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beruf nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbschlussDatum nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkungen nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  BeginnBildungsgang datetime2, 
  Durchschnitt nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  OrgFormKrz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klassenart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  DurchschnittsNote nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSGL nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSchulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  KonfDruck nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DSN_Text nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  Berufsabschluss nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schwerpunkt_ID bigint, 
  LSSGL_SIM nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  BerufsschulpflErf nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  StatusNSJ int, 
  FachklasseNSJ_ID bigint, 
  Buchkonto float, 
  VerkehrsspracheFamilie nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  JahrZuzug int, 
  DauerKindergartenbesuch nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  VerpflichtungSprachfoerderkurs nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  TeilnahmeSprachfoerderkurs nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schulbuchgeldbefreit nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Autist nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  GeburtslandSchueler nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  GeburtslandVater nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  GeburtslandMutter nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Uebergangsempfehlung_JG5 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErsteSchulform_SI nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  JahrWechsel_SI int, 
  JahrWechsel_SII int, 
  Migrationshintergrund nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Foerderschwerpunkt2_ID bigint, 
  SortierungKlasse int, 
  ExterneSchulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kindergarten_ID bigint, 
  LetzterBerufsAbschluss nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LetzterAllgAbschluss nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Land nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  Duplikat nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  EinschulungsartASD nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Hausnr nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Strassenname nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  BilingualerZweig nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  DurchschnittsnoteFHR nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  DSN_FHR_Text nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  Eigenanteil float, 
  StaatAbk2 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZustimmungFoto nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  BKAZVO int, 
  HatBerufsausbildung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Ausweisnummer nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  AOSF nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  EPJahre int DEFAULT 2, 
  LSBemerkung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  WechselBestaetigt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  DauerBildungsgang int, 
  AnmeldeDatum datetime2, 
  MeisterBafoeg nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  OnlineAnmeldung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Dokumentenverzeichnis nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Berufsqualifikation nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  HausnrZusatz nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZieldifferentesLernen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  ZusatzNachname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  EndeEingliederung datetime2, 
  SchulEmail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  EndeAnschlussfoerderung datetime2,
  CONSTRAINT PK_Schueler PRIMARY KEY (ID),
  CONSTRAINT Schueler_Einschulungsart_FK FOREIGN KEY (Einschulungsart_ID) REFERENCES K_EinschulungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Fahrschueler_FK FOREIGN KEY (Fahrschueler_ID) REFERENCES K_FahrschuelerArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Haltestelle_FK FOREIGN KEY (Haltestelle_ID) REFERENCES K_Haltestelle(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ort_PLZ_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Religion_FK FOREIGN KEY (Religion_ID) REFERENCES K_Religion(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Sportbefreiung_FK FOREIGN KEY (Sportbefreiung_ID) REFERENCES K_Sportbefreiung(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Staat_FK FOREIGN KEY (StaatKrz) REFERENCES K_Staat(StatistikKrz) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Versetzung_FK FOREIGN KEY (Klasse) REFERENCES Versetzung(Klasse) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_UC1 UNIQUE (GU_ID)
);


CREATE TABLE SchuelerMerkmale (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Kurztext nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  DatumVon datetime2, 
  DatumBis datetime2,
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerMerkmale_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKAbschluss (
  Schueler_ID bigint NOT NULL, 
  Zulassung nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bestanden nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zeugnis nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZertifikatBK nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZulassungErwBK nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  BestandenErwBK nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  ZulassungBA nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  BestandenBA nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  PraktPrfNote nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NoteKolloquium nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  ThemaAbschlussarbeit nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  BAP_Vorhanden nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  NoteFachpraxis nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  FachPraktAnteilAusr nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahr int, 
  Abschnitt int,
  CONSTRAINT PK_SchuelerBKAbschluss PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerBKAbschl_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerTelefone (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  TelefonArt_ID bigint, 
  Telefonnummer nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkung nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int DEFAULT 32000, 
  SchulnrEigner int, 
  Gesperrt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-',
  CONSTRAINT PK_SchuelerTelefone PRIMARY KEY (ID),
  CONSTRAINT SchuelerTelefone_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerTelefone_Telefonart_FK FOREIGN KEY (TelefonArt_ID) REFERENCES K_TelefonArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX SchuelerTelefone_IDX1 ON SchuelerTelefone(Schueler_ID);


CREATE TABLE SchuelerVermerke (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  VermerkArt_ID bigint, 
  Datum datetime2, 
  Bemerkung nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  AngelegtVon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  GeaendertVon nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerVermerke PRIMARY KEY (ID),
  CONSTRAINT SchuelerVermerke_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerVermerke_VermerkArt_FK FOREIGN KEY (VermerkArt_ID) REFERENCES K_Vermerkart(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerVermerke_IDX1 ON SchuelerVermerke(Schueler_ID);


CREATE TABLE SchuelerSprachenfolge (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  JahrgangVon smallint, 
  JahrgangBis smallint, 
  Reihenfolge nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbschnittVon smallint, 
  AbschnittBis smallint, 
  SchulnrEigner int, 
  Referenzniveau nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerSprachenfolge PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachenfolge_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_UC1 UNIQUE (Fach_ID, Schueler_ID)
);


CREATE TABLE SchuelerListe_Inhalt (
  Liste_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerListe_Inhalt PRIMARY KEY (Liste_ID, Schueler_ID),
  CONSTRAINT SchuelerListeInhalt_Liste_FK FOREIGN KEY (Liste_ID) REFERENCES SchuelerListe(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerListeInhalt_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerNUESDaten (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  JahrgangIst nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HauptMerkmal nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  NebenMerkmal nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerNUESDaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerNUESDaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAbiFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  FachKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  FSortierung int, 
  Gekoppelt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kurs_ID bigint, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachlehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbiFach nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  P11_1 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  S11_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  P11_2 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  S11_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  P_FA nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  R_FA nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  W12_1 int, 
  P12_1 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  H12_1 int, 
  R12_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  S12_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  W12_2 int, 
  P12_2 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  H12_2 int, 
  R12_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  S12_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  W13_1 int, 
  P13_1 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  H13_1 int, 
  R13_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  S13_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  W13_2 int, 
  P13_2 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  H13_2 int, 
  R13_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  S13_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Zulassung smallint, 
  Durchschnitt float, 
  AbiPruefErgebnis smallint, 
  Zwischenstand smallint, 
  MdlPflichtPruefung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  MdlBestPruefung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  MdlFreiwPruefung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  MdlPruefErgebnis smallint, 
  MdlPruefFolge smallint, 
  AbiErgebnis smallint, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerAbiFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFotos (
  Schueler_ID bigint NOT NULL, 
  Foto varbinary(max), 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerFotos PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerFotos_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Kurs_Schueler (
  Kurs_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL,
  CONSTRAINT PK_Kurs_Schueler PRIMARY KEY (Kurs_ID, Schueler_ID),
  CONSTRAINT KursSchueler_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursSchueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  FachKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  FachSchriftlich nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  FachSchriftlichBA nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vornote nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NoteSchriftlich nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  MdlPruefung nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  MdlPruefungFW nchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  NoteMuendlich nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NoteAbschluss nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NotePrfGesamt nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  FSortierung int, 
  SchulnrEigner int, 
  Fachlehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  NoteAbschlussBA nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kursart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahr int, 
  Abschnitt int,
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAbgaenge (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  BemerkungIntern nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbgangsSchulform nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbgangsBeschreibung nvarchar(200) COLLATE Latin1_General_100_BIN2_UTF8, 
  OrganisationsformKrz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbgangsSchule nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbgangsSchuleAnschr nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbgangsSchulNr nvarchar(6) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSEntlassArt nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSchulformSIM nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSchulEntlassDatum datetime2, 
  LSVersetzung nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSSGL nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSFachklKennung nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  LSFachklSIM nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  FuerSIMExport nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  LSBeginnDatum datetime2, 
  LSBeginnJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerAbgaenge PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbgaenge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerAbgaenge_IDX1 ON SchuelerAbgaenge(LSSchulEntlassDatum, Schueler_ID);


CREATE TABLE SchuelerLernabschnittsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Jahr smallint NOT NULL, 
  Abschnitt smallint NOT NULL, 
  Bildungsgang nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  WechselNr smallint NOT NULL, 
  Jahrgang smallint, 
  Hochrechnung int, 
  SemesterWertung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  PruefOrdnung nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Klasse nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Verspaetet smallint, 
  NPV_Fach_ID bigint, 
  NPV_NoteKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NPV_Datum datetime2, 
  NPAA_Fach_ID bigint, 
  NPAA_NoteKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NPAA_Datum datetime2, 
  NPBQ_Fach_ID bigint, 
  NPBQ_NoteKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  NPBQ_Datum datetime2, 
  VersetzungKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbschlussArt smallint, 
  AbschlIstPrognose nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Konferenzdatum datetime2, 
  ZeugnisDatum datetime2, 
  KlassenLehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDSchulgliederung nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  ASDJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahrgang_ID bigint, 
  Fachklasse_ID bigint, 
  Schwerpunkt_ID bigint, 
  ZeugnisBem nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Schwerbehinderung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  OrgFormKrz nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  RefPaed nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Klassenart nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  SumFehlStd int, 
  SumFehlStdU int, 
  Wiederholung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Gesamtnote_GS int, 
  Gesamtnote_NW int, 
  Folgeklasse nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Foerderschwerpunkt2_ID bigint, 
  Abschluss nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Abschluss_B nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  DSNote nvarchar(4) COLLATE Latin1_General_100_BIN2_UTF8, 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  KN_Lehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  StvKlassenlehrer_ID bigint, 
  MoeglNPFaecher nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zertifikate nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  DatumFHR datetime2, 
  PruefAlgoErgebnis nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zeugnisart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  DatumVon datetime2, 
  DatumBis datetime2, 
  FehlstundenGrenzwert int,
  CONSTRAINT PK_SchuelerLernabschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLernabschnittsdaten_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT SchuelerLernabschnittsdaten_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernabschnittsdaten_UC1 UNIQUE (Abschnitt, Bildungsgang, Jahr, Schueler_ID, WechselNr)
);


CREATE TABLE SchuelerErzAdr (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  ErzieherArt_ID bigint, 
  Anrede1 nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Titel1 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Name1 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vorname1 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Anrede2 nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Titel2 nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Name2 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Vorname2 nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErzStrasse nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErzOrt_ID bigint, 
  ErzPLZ nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErzOrtsteil_ID bigint, 
  ErzAnschreiben nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  ErzBemerkung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Sortierung int, 
  ErzEMail nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErzAdrZusatz nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int, 
  Erz1StaatKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  Erz2StaatKrz nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  ErzEMail2 nvarchar(100) COLLATE Latin1_General_100_BIN2_UTF8, 
  Erz1ZusatzNachname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Erz2ZusatzNachname nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkungen nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerErzAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzAdr_ErzieherArt_FK FOREIGN KEY (ErzieherArt_ID) REFERENCES K_ErzieherArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ort_FK FOREIGN KEY (ErzOrt_ID) REFERENCES K_Ort(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT SchuelerErzAdr_Ortsteil_FK FOREIGN KEY (ErzOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT SchuelerErzAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerErzAdr_IDX1 ON SchuelerErzAdr(Schueler_ID);


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL, 
  Datenschutz_ID bigint NOT NULL, 
  Status nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-' NOT NULL, 
  SchulnrEigner int NOT NULL,
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Datenschutz_ID, Schueler_ID),
  CONSTRAINT SchuelerDatenschutz_K_Datenschutz_FK FOREIGN KEY (Datenschutz_ID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerDatenschutz_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAnkreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Floskel_ID bigint NOT NULL, 
  Stufe1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Stufe2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Stufe3 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Stufe4 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Stufe5 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerAnkreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT SchuelerAKF_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFHRFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  FachKrz nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  PSII_2_1 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_2_1 int, 
  RSII_2_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_2_2 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_2_2 int, 
  RSII_2_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_2_1_W nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_2_1_W int, 
  RSII_2_1_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_2_2_W nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_2_2_W int, 
  RSII_2_2_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_3_1 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_3_1 int, 
  RSII_3_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_3_2 nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_3_2 int, 
  RSII_3_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_3_1_W nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_3_1_W int, 
  RSII_3_1_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  PSII_3_2_W nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HSII_3_2_W int, 
  RSII_3_2_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  KSII_2_1 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_2_2 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_2_1_W nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_2_2_W nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_3_1 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_3_2 nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_3_1_W nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KSII_3_2_W nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  FSortierung int, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerFHRFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHRFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schueler_AllgAdr (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Adresse_ID bigint NOT NULL, 
  Vertragsart_ID bigint, 
  Vertragsbeginn datetime2, 
  Vertragsende datetime2, 
  Ausbilder nvarchar(30) COLLATE Latin1_General_100_BIN2_UTF8, 
  AllgAdrAnschreiben nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Praktikum nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Sortierung int, 
  Ansprechpartner_ID bigint, 
  Betreuungslehrer_ID bigint, 
  SchulnrEigner int,
  CONSTRAINT PK_Schueler_AllgAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerAllgAdr_Adresse_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Ansprech_FK FOREIGN KEY (Ansprechpartner_ID) REFERENCES AllgAdrAnsprechpartner(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Beschaeftigungsart_FK FOREIGN KEY (Vertragsart_ID) REFERENCES K_BeschaeftigungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX Schueler_AllgAdr_IDX1 ON Schueler_AllgAdr(Schueler_ID);


CREATE TABLE SchuelerAbitur (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FA_Fach nvarchar(130) COLLATE Latin1_General_100_BIN2_UTF8, 
  FA_Punkte int, 
  FehlStd int, 
  uFehlStd int, 
  Latinum nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  KlLatinum nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Graecum nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Hebraicum nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  FranzBilingual nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  BesondereLernleistung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  AnzRelLK smallint, 
  AnzRelGK smallint, 
  AnzRelOK smallint, 
  AnzDefLK smallint, 
  AnzDefGK smallint, 
  Thema_PJK nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  FS2_SekI_manuell nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Kurse_I int, 
  Defizite_I int, 
  LK_Defizite_I int, 
  AnzahlKurse_0 int, 
  Punktsumme_I int, 
  Durchschnitt_I float, 
  SummeGK smallint, 
  SummeLK smallint, 
  SummenOK smallint, 
  Zugelassen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Jahr int, 
  Abschnitt int, 
  BLL_Art nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT 'K', 
  BLL_Punkte int, 
  Thema_BLL nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Punktsumme_II int, 
  Defizite_II int, 
  LK_Defizite_II int, 
  PruefungBestanden nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Note nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
  GesamtPunktzahl smallint, 
  Notensprung smallint, 
  FehlendePunktzahl smallint, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerAbitur PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbitur_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbitur_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerFHR (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FHRErreicht nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Note nvarchar(3) COLLATE Latin1_General_100_BIN2_UTF8, 
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
  WSII_2_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_2_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_2_1_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_2_2_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_3_1 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_3_2 nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_3_1_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  WSII_3_2_W nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerFHR PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHR_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHR_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerKAoADaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Jahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kategorie nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Merkmal nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zusatzmerkmal nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Anschlussoption nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Berufsfeld nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Bemerkung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerKAoADaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerKAoADaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFoerderempfehlungen (
  GU_ID nvarchar(40) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulnrEigner int NOT NULL, 
  DatumAngelegt datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Klasse nvarchar(15) COLLATE Latin1_General_100_BIN2_UTF8, 
  Jahr int, 
  Abschnitt int, 
  Fach_ID bigint, 
  Lehrer_ID bigint, 
  DatumAenderungSchild datetime2, 
  DatumAenderungSchildWeb datetime2, 
  Kurs nvarchar(20) COLLATE Latin1_General_100_BIN2_UTF8, 
  Inhaltl_Prozessbez_Komp nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Methodische_Komp nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Lern_Arbeitsverhalten nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Massn_Inhaltl_Prozessbez_Komp nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Massn_Methodische_Komp nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Massn_Lern_Arbeitsverhalten nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Verantwortlichkeit_Eltern nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Verantwortlichkeit_Schueler nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zeitrahmen_von_Datum datetime2, 
  Zeitrahmen_bis_Datum datetime2, 
  Ueberpruefung_Datum datetime2, 
  Naechstes_Beratungsgespraech datetime2, 
  Leistung_ID bigint, 
  Kurs_ID bigint, 
  EingabeFertig nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Faecher nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Abgeschlossen nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-',
  CONSTRAINT PK_SchuelerFoerderempfehlungen PRIMARY KEY (GU_ID),
  CONSTRAINT SchuelerFE_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerZuweisungen (
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerZuweisungen PRIMARY KEY (Abschnitt_ID, Fach_ID),
  CONSTRAINT Zuweisungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerErzFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Erzieher_ID bigint NOT NULL, 
  Funktion_ID bigint NOT NULL, 
  Person smallint, 
  Klasse nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerErzFunktion PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzFunktion_Erzieher_FK FOREIGN KEY (Erzieher_ID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerErzFunktion_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_ErzieherFunktion(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerLeistungsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Hochrechnung int, 
  FachLehrer nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kursart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  KursartAllg nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8, 
  Kurs_ID bigint, 
  NotenKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Warnung nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Warndatum datetime2, 
  AbiFach nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Wochenstunden smallint, 
  AbiZeugnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  Prognose nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fehlstd smallint, 
  uFehlstd smallint, 
  Sortierung int DEFAULT 32000, 
  Lernentw nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  Gekoppelt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  VorherAbgeschl nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '-', 
  AbschlussJahrgang nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  HochrechnungStatus nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulNr int, 
  Zusatzkraft nvarchar(10) COLLATE Latin1_General_100_BIN2_UTF8, 
  WochenstdZusatzkraft int, 
  Prf10Fach nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  AufZeugnis nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8 DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  SchulnrEigner int, 
  NoteAbschlussBA nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_SchuelerLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLeistungsdaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_FK FOREIGN KEY (FachLehrer) REFERENCES K_Lehrer(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_UC2 UNIQUE (Abschnitt_ID, FachLehrer, Fach_ID, Kurs_ID, Kursart)
);

CREATE INDEX SchuelerLeistungsdaten_IDX1 ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX2 ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX3 ON SchuelerLeistungsdaten(FachLehrer);


CREATE TABLE SchuelerLD_PSFachBem (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  ASV nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  LELS nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  ESF nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  BemerkungFSP nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  BemerkungVersetzung nvarchar(max) COLLATE Latin1_General_100_BIN2_UTF8, 
  SchulnrEigner int,
  CONSTRAINT PK_SchuelerLD_PSFachBem PRIMARY KEY (ID),
  CONSTRAINT SchuelerLD_PSFachBem_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLD_PSFachBem_UC1 UNIQUE (Abschnitt_ID)
);


CREATE TABLE SchuelerFehlstunden (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Datum datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Fach_ID bigint, 
  Fehlstd float NOT NULL, 
  VonStd int, 
  BisStd int, 
  Entschuldigt nvarchar(1) COLLATE Latin1_General_100_BIN2_UTF8, 
  Lehrer_ID bigint,
  CONSTRAINT PK_SchuelerFehlstunden PRIMARY KEY (ID),
  CONSTRAINT SchuelerFehlstunden_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ZuordnungReportvorlagen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulnrEigner int NOT NULL, 
  Jahrgang_ID bigint NOT NULL, 
  Abschluss nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbschlussBB nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  AbschlussArt int, 
  VersetzungKrz nvarchar(2) COLLATE Latin1_General_100_BIN2_UTF8, 
  Fachklasse_ID bigint, 
  Reportvorlage nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Beschreibung nvarchar(255) COLLATE Latin1_General_100_BIN2_UTF8, 
  Gruppe nvarchar(50) COLLATE Latin1_General_100_BIN2_UTF8, 
  Zeugnisart nvarchar(5) COLLATE Latin1_General_100_BIN2_UTF8,
  CONSTRAINT PK_ZuordnungReportvorlagen PRIMARY KEY (ID)
);

GO

CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Fachklassen ON EigeneSchule_Fachklassen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Fachklassen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Fachklassen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Fachklassen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Fachklassen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Fachklassen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Fachklassen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Fachklassen ON EigeneSchule_Fachklassen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Fachklassen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Fachklassen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Fachklassen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Fachklassen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Faecher ON EigeneSchule_Faecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Faecher
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Faecher');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Faecher);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Faecher', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Faecher
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Faecher';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Faecher ON EigeneSchule_Faecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Faecher');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Faecher);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Faecher', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Faecher';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Jahrgaenge ON EigeneSchule_Jahrgaenge INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Jahrgaenge
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Jahrgaenge');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Jahrgaenge);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Jahrgaenge', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Jahrgaenge
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Jahrgaenge';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Jahrgaenge ON EigeneSchule_Jahrgaenge AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Jahrgaenge');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Jahrgaenge);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Jahrgaenge', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Jahrgaenge';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Kursart ON EigeneSchule_Kursart INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Kursart
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Kursart');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Kursart);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Kursart', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Kursart
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Kursart';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Kursart ON EigeneSchule_Kursart AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Kursart');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Kursart);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Kursart', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Kursart';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_KursartAllg ON EigeneSchule_KursartAllg INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_KursartAllg
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_KursartAllg');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_KursartAllg);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_KursartAllg', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_KursartAllg
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_KursartAllg';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_KursartAllg ON EigeneSchule_KursartAllg AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_KursartAllg');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_KursartAllg);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_KursartAllg', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_KursartAllg';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Merkmale ON EigeneSchule_Merkmale INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Merkmale
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Merkmale');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Merkmale);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Merkmale', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Merkmale
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Merkmale';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Merkmale ON EigeneSchule_Merkmale AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Merkmale');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Merkmale);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Merkmale', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Merkmale';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Schulformen ON EigeneSchule_Schulformen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Schulformen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Schulformen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Schulformen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Schulformen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Schulformen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Schulformen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Schulformen ON EigeneSchule_Schulformen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Schulformen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Schulformen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Schulformen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Schulformen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Zertifikate ON EigeneSchule_Zertifikate INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Zertifikate
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Zertifikate');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Zertifikate);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Zertifikate', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Zertifikate
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Zertifikate';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Zertifikate ON EigeneSchule_Zertifikate AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Zertifikate');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Zertifikate);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Zertifikate', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Zertifikate';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Adressart ON K_Adressart INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Adressart
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Adressart');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Adressart);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Adressart', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Adressart
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Adressart';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Adressart ON K_Adressart AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Adressart');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Adressart);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Adressart', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Adressart';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzdaten ON K_Ankreuzdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Ankreuzdaten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ankreuzdaten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ankreuzdaten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzdaten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Ankreuzdaten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ankreuzdaten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzdaten ON K_Ankreuzdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ankreuzdaten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ankreuzdaten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzdaten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ankreuzdaten';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzfloskeln ON K_Ankreuzfloskeln INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Ankreuzfloskeln
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ankreuzfloskeln');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ankreuzfloskeln);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzfloskeln', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Ankreuzfloskeln
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ankreuzfloskeln';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzfloskeln ON K_Ankreuzfloskeln AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ankreuzfloskeln');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ankreuzfloskeln);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzfloskeln', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ankreuzfloskeln';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_BeschaeftigungsArt ON K_BeschaeftigungsArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_BeschaeftigungsArt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_BeschaeftigungsArt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_BeschaeftigungsArt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_BeschaeftigungsArt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_BeschaeftigungsArt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_BeschaeftigungsArt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_BeschaeftigungsArt ON K_BeschaeftigungsArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_BeschaeftigungsArt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_BeschaeftigungsArt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_BeschaeftigungsArt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_BeschaeftigungsArt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Datenschutz ON K_Datenschutz INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Datenschutz
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Datenschutz');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Datenschutz);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Datenschutz', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Datenschutz
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Datenschutz';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Datenschutz ON K_Datenschutz AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Datenschutz');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Datenschutz);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Datenschutz', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Datenschutz';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_EinschulungsArt ON K_EinschulungsArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_EinschulungsArt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_EinschulungsArt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_EinschulungsArt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EinschulungsArt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_EinschulungsArt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_EinschulungsArt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_EinschulungsArt ON K_EinschulungsArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_EinschulungsArt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_EinschulungsArt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EinschulungsArt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_EinschulungsArt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Einzelleistungen ON K_Einzelleistungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Einzelleistungen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Einzelleistungen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Einzelleistungen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Einzelleistungen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Einzelleistungen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Einzelleistungen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Einzelleistungen ON K_Einzelleistungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Einzelleistungen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Einzelleistungen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Einzelleistungen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Einzelleistungen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_EntlassGrund ON K_EntlassGrund INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_EntlassGrund
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_EntlassGrund');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_EntlassGrund);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EntlassGrund', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_EntlassGrund
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_EntlassGrund';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_EntlassGrund ON K_EntlassGrund AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_EntlassGrund');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_EntlassGrund);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EntlassGrund', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_EntlassGrund';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherArt ON K_ErzieherArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_ErzieherArt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_ErzieherArt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_ErzieherArt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherArt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_ErzieherArt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_ErzieherArt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherArt ON K_ErzieherArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_ErzieherArt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_ErzieherArt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherArt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_ErzieherArt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherFunktion ON K_ErzieherFunktion INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_ErzieherFunktion
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_ErzieherFunktion');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_ErzieherFunktion);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherFunktion', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_ErzieherFunktion
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_ErzieherFunktion';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherFunktion ON K_ErzieherFunktion AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_ErzieherFunktion');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_ErzieherFunktion);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherFunktion', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_ErzieherFunktion';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_FahrschuelerArt ON K_FahrschuelerArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_FahrschuelerArt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_FahrschuelerArt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_FahrschuelerArt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_FahrschuelerArt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_FahrschuelerArt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_FahrschuelerArt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_FahrschuelerArt ON K_FahrschuelerArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_FahrschuelerArt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_FahrschuelerArt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_FahrschuelerArt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_FahrschuelerArt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Foerderschwerpunkt ON K_Foerderschwerpunkt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Foerderschwerpunkt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Foerderschwerpunkt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Foerderschwerpunkt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Foerderschwerpunkt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Foerderschwerpunkt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Foerderschwerpunkt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Foerderschwerpunkt ON K_Foerderschwerpunkt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Foerderschwerpunkt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Foerderschwerpunkt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Foerderschwerpunkt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Foerderschwerpunkt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Haltestelle ON K_Haltestelle INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Haltestelle
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Haltestelle');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Haltestelle);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Haltestelle', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Haltestelle
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Haltestelle';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Haltestelle ON K_Haltestelle AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Haltestelle');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Haltestelle);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Haltestelle', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Haltestelle';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Kindergarten ON K_Kindergarten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Kindergarten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Kindergarten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Kindergarten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Kindergarten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Kindergarten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Kindergarten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Kindergarten ON K_Kindergarten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Kindergarten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Kindergarten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Kindergarten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Kindergarten';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_KlassenOrgForm ON K_KlassenOrgForm INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_KlassenOrgForm
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_KlassenOrgForm');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_KlassenOrgForm);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_KlassenOrgForm', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_KlassenOrgForm
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_KlassenOrgForm';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_KlassenOrgForm ON K_KlassenOrgForm AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_KlassenOrgForm');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_KlassenOrgForm);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_KlassenOrgForm', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_KlassenOrgForm';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Ort ON K_Ort INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Ort
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ort');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ort);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ort', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Ort
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ort';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ort ON K_Ort AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ort');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ort);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ort', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ort';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_AllgAdresse ON K_AllgAdresse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_AllgAdresse
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_AllgAdresse');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_AllgAdresse);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_AllgAdresse', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_AllgAdresse
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_AllgAdresse';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_AllgAdresse ON K_AllgAdresse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_AllgAdresse');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_AllgAdresse);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_AllgAdresse', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_AllgAdresse';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_AllgAdrAnsprechpartner ON AllgAdrAnsprechpartner INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO AllgAdrAnsprechpartner
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'AllgAdrAnsprechpartner');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM AllgAdrAnsprechpartner);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('AllgAdrAnsprechpartner', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO AllgAdrAnsprechpartner
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'AllgAdrAnsprechpartner';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_AllgAdrAnsprechpartner ON AllgAdrAnsprechpartner AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'AllgAdrAnsprechpartner');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM AllgAdrAnsprechpartner);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('AllgAdrAnsprechpartner', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'AllgAdrAnsprechpartner';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Ortsteil ON K_Ortsteil INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Ortsteil
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ortsteil');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Ortsteil);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ortsteil', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Ortsteil
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ortsteil';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ortsteil ON K_Ortsteil AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Ortsteil');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Ortsteil);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ortsteil', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Ortsteil';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Lehrer ON K_Lehrer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Lehrer
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Lehrer');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Lehrer);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Lehrer', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Lehrer
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Lehrer';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Lehrer ON K_Lehrer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Lehrer');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Lehrer);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Lehrer', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Lehrer';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abteilungen ON EigeneSchule_Abteilungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Abteilungen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Abteilungen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abteilungen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abteilungen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Abteilungen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Abteilungen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abteilungen ON EigeneSchule_Abteilungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Abteilungen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abteilungen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abteilungen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Abteilungen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Religion ON K_Religion INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Religion
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Religion');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Religion);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Religion', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Religion
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Religion';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Religion ON K_Religion AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Religion');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Religion);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Religion', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Religion';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Schule ON K_Schule INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Schule
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Schule');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Schule);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schule', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Schule
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Schule';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schule ON K_Schule AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Schule');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Schule);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schule', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Schule';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Schulfunktionen ON K_Schulfunktionen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Schulfunktionen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Schulfunktionen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Schulfunktionen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schulfunktionen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Schulfunktionen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Schulfunktionen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schulfunktionen ON K_Schulfunktionen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Schulfunktionen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Schulfunktionen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schulfunktionen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Schulfunktionen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Schwerpunkt ON K_Schwerpunkt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Schwerpunkt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Schwerpunkt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Schwerpunkt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schwerpunkt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Schwerpunkt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Schwerpunkt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schwerpunkt ON K_Schwerpunkt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Schwerpunkt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Schwerpunkt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schwerpunkt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Schwerpunkt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Sportbefreiung ON K_Sportbefreiung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Sportbefreiung
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Sportbefreiung');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Sportbefreiung);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Sportbefreiung', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Sportbefreiung
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Sportbefreiung';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Sportbefreiung ON K_Sportbefreiung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Sportbefreiung');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Sportbefreiung);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Sportbefreiung', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Sportbefreiung';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Staat ON K_Staat INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Staat
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Staat');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Staat);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Staat', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Staat
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Staat';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Staat ON K_Staat AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Staat');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Staat);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Staat', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Staat';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_TXTDATEIEN ON K_TXTDATEIEN INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_TXTDATEIEN
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_TXTDATEIEN');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_TXTDATEIEN);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TXTDATEIEN', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_TXTDATEIEN
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_TXTDATEIEN';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_TXTDATEIEN ON K_TXTDATEIEN AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_TXTDATEIEN');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_TXTDATEIEN);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TXTDATEIEN', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_TXTDATEIEN';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_TelefonArt ON K_TelefonArt INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_TelefonArt
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_TelefonArt');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_TelefonArt);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TelefonArt', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_TelefonArt
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_TelefonArt';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_TelefonArt ON K_TelefonArt AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_TelefonArt');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_TelefonArt);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TelefonArt', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_TelefonArt';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Verkehrssprachen ON K_Verkehrssprachen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Verkehrssprachen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Verkehrssprachen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Verkehrssprachen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Verkehrssprachen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Verkehrssprachen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Verkehrssprachen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Verkehrssprachen ON K_Verkehrssprachen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Verkehrssprachen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Verkehrssprachen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Verkehrssprachen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Verkehrssprachen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K_Vermerkart ON K_Vermerkart INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Vermerkart
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Vermerkart');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Vermerkart);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Vermerkart', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Vermerkart
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Vermerkart';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Vermerkart ON K_Vermerkart AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Vermerkart');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Vermerkart);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Vermerkart', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Vermerkart';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Kurse ON Kurse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Kurse
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Kurse');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Kurse);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Kurse', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Kurse
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Kurse';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Kurse ON Kurse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Kurse');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Kurse);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Kurse', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Kurse';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen ON Personengruppen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Personengruppen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Personengruppen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Personengruppen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Personengruppen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Personengruppen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen ON Personengruppen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Personengruppen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Personengruppen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Personengruppen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen_Personen ON Personengruppen_Personen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Personengruppen_Personen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Personengruppen_Personen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Personengruppen_Personen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen_Personen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Personengruppen_Personen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Personengruppen_Personen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen_Personen ON Personengruppen_Personen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Personengruppen_Personen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Personengruppen_Personen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen_Personen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Personengruppen_Personen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchildFilter ON SchildFilter INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchildFilter
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchildFilter');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchildFilter);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchildFilter', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchildFilter
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchildFilter';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchildFilter ON SchildFilter AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchildFilter');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchildFilter);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchildFilter', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchildFilter';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerEinzelleistungen ON SchuelerEinzelleistungen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerEinzelleistungen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerEinzelleistungen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerEinzelleistungen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerEinzelleistungen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerEinzelleistungen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerEinzelleistungen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerEinzelleistungen ON SchuelerEinzelleistungen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerEinzelleistungen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerEinzelleistungen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerEinzelleistungen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerEinzelleistungen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerListe ON SchuelerListe INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerListe
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerListe');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerListe);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerListe', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerListe
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerListe';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerListe ON SchuelerListe AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerListe');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerListe);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerListe', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerListe';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerWiedervorlage ON SchuelerWiedervorlage INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerWiedervorlage
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerWiedervorlage');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerWiedervorlage);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerWiedervorlage', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerWiedervorlage
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerWiedervorlage';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerWiedervorlage ON SchuelerWiedervorlage AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerWiedervorlage');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerWiedervorlage);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerWiedervorlage', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerWiedervorlage';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel ON Stundentafel INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundentafel
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundentafel');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundentafel);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundentafel
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundentafel';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel ON Stundentafel AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundentafel');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundentafel);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundentafel';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel_Faecher ON Stundentafel_Faecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundentafel_Faecher
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundentafel_Faecher');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundentafel_Faecher);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel_Faecher', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundentafel_Faecher
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundentafel_Faecher';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel_Faecher ON Stundentafel_Faecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundentafel_Faecher');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundentafel_Faecher);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel_Faecher', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundentafel_Faecher';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Users ON Users INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Users
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Users');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Users);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Users', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Users
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Users';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Users ON Users AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Users');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Users);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Users', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Users';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Versetzung ON Versetzung INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Versetzung
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Versetzung');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Versetzung);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Versetzung', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Versetzung
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Versetzung';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Versetzung ON Versetzung AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Versetzung');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Versetzung);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Versetzung', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Versetzung';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abt_Kl ON EigeneSchule_Abt_Kl INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO EigeneSchule_Abt_Kl
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Abt_Kl');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abt_Kl);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abt_Kl', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO EigeneSchule_Abt_Kl
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Abt_Kl';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abt_Kl ON EigeneSchule_Abt_Kl AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'EigeneSchule_Abt_Kl');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM EigeneSchule_Abt_Kl);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abt_Kl', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'EigeneSchule_Abt_Kl';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Schueler ON Schueler INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Schueler
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Schueler');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Schueler);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Schueler
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Schueler';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler ON Schueler AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Schueler');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Schueler);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Schueler';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerTelefone ON SchuelerTelefone INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerTelefone
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerTelefone');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerTelefone);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerTelefone', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerTelefone
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerTelefone';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerTelefone ON SchuelerTelefone AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerTelefone');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerTelefone);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerTelefone', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerTelefone';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerVermerke ON SchuelerVermerke INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerVermerke
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerVermerke');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerVermerke);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerVermerke', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerVermerke
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerVermerke';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerVermerke ON SchuelerVermerke AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerVermerke');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerVermerke);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerVermerke', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerVermerke';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerSprachenfolge ON SchuelerSprachenfolge INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerSprachenfolge
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerSprachenfolge');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerSprachenfolge);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachenfolge', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerSprachenfolge
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerSprachenfolge';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerSprachenfolge ON SchuelerSprachenfolge AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerSprachenfolge');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerSprachenfolge);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachenfolge', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerSprachenfolge';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbiFaecher ON SchuelerAbiFaecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerAbiFaecher
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAbiFaecher');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAbiFaecher);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbiFaecher', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerAbiFaecher
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAbiFaecher';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbiFaecher ON SchuelerAbiFaecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAbiFaecher');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAbiFaecher);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbiFaecher', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAbiFaecher';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerBKFaecher ON SchuelerBKFaecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerBKFaecher
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerBKFaecher');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerBKFaecher);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerBKFaecher', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerBKFaecher
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerBKFaecher';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerBKFaecher ON SchuelerBKFaecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerBKFaecher');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerBKFaecher);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerBKFaecher', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerBKFaecher';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbgaenge ON SchuelerAbgaenge INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerAbgaenge
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAbgaenge');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAbgaenge);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbgaenge', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerAbgaenge
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAbgaenge';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbgaenge ON SchuelerAbgaenge AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAbgaenge');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAbgaenge);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbgaenge', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAbgaenge';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLernabschnittsdaten ON SchuelerLernabschnittsdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerLernabschnittsdaten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerLernabschnittsdaten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerLernabschnittsdaten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLernabschnittsdaten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerLernabschnittsdaten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerLernabschnittsdaten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLernabschnittsdaten ON SchuelerLernabschnittsdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerLernabschnittsdaten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerLernabschnittsdaten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLernabschnittsdaten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerLernabschnittsdaten';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerErzAdr ON SchuelerErzAdr INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerErzAdr
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerErzAdr');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerErzAdr);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzAdr', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerErzAdr
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerErzAdr';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerErzAdr ON SchuelerErzAdr AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerErzAdr');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerErzAdr);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzAdr', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerErzAdr';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAnkreuzfloskeln ON SchuelerAnkreuzfloskeln INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerAnkreuzfloskeln
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAnkreuzfloskeln');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAnkreuzfloskeln);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAnkreuzfloskeln', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerAnkreuzfloskeln
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAnkreuzfloskeln';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAnkreuzfloskeln ON SchuelerAnkreuzfloskeln AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAnkreuzfloskeln');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAnkreuzfloskeln);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAnkreuzfloskeln', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAnkreuzfloskeln';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHRFaecher ON SchuelerFHRFaecher INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerFHRFaecher
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerFHRFaecher');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerFHRFaecher);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHRFaecher', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerFHRFaecher
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerFHRFaecher';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHRFaecher ON SchuelerFHRFaecher AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerFHRFaecher');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerFHRFaecher);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHRFaecher', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerFHRFaecher';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Schueler_AllgAdr ON Schueler_AllgAdr INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Schueler_AllgAdr
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Schueler_AllgAdr');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Schueler_AllgAdr);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler_AllgAdr', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Schueler_AllgAdr
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Schueler_AllgAdr';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler_AllgAdr ON Schueler_AllgAdr AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Schueler_AllgAdr');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Schueler_AllgAdr);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler_AllgAdr', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Schueler_AllgAdr';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbitur ON SchuelerAbitur INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerAbitur
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAbitur');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerAbitur);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbitur', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerAbitur
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAbitur';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbitur ON SchuelerAbitur AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerAbitur');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerAbitur);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbitur', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerAbitur';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHR ON SchuelerFHR INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerFHR
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerFHR');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerFHR);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHR', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerFHR
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerFHR';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHR ON SchuelerFHR AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerFHR');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerFHR);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHR', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerFHR';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerKAoADaten ON SchuelerKAoADaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerKAoADaten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerKAoADaten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerKAoADaten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerKAoADaten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerKAoADaten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerKAoADaten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerKAoADaten ON SchuelerKAoADaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerKAoADaten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerKAoADaten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerKAoADaten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerKAoADaten';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerErzFunktion ON SchuelerErzFunktion INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerErzFunktion
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerErzFunktion');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerErzFunktion);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzFunktion', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerErzFunktion
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerErzFunktion';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerErzFunktion ON SchuelerErzFunktion AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerErzFunktion');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerErzFunktion);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzFunktion', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerErzFunktion';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLeistungsdaten ON SchuelerLeistungsdaten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerLeistungsdaten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerLeistungsdaten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerLeistungsdaten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLeistungsdaten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerLeistungsdaten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerLeistungsdaten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLeistungsdaten ON SchuelerLeistungsdaten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerLeistungsdaten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerLeistungsdaten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLeistungsdaten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerLeistungsdaten';
    END;
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


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLD_PSFachBem ON SchuelerLD_PSFachBem INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerLD_PSFachBem
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerLD_PSFachBem');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerLD_PSFachBem);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLD_PSFachBem', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerLD_PSFachBem
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerLD_PSFachBem';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLD_PSFachBem ON SchuelerLD_PSFachBem AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerLD_PSFachBem');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerLD_PSFachBem);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLD_PSFachBem', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerLD_PSFachBem';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFehlstunden ON SchuelerFehlstunden INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO SchuelerFehlstunden
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerFehlstunden');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM SchuelerFehlstunden);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFehlstunden', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO SchuelerFehlstunden
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerFehlstunden';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFehlstunden ON SchuelerFehlstunden AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'SchuelerFehlstunden');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM SchuelerFehlstunden);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFehlstunden', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'SchuelerFehlstunden';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_ZuordnungReportvorlagen ON ZuordnungReportvorlagen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint
  
  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO ZuordnungReportvorlagen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'ZuordnungReportvorlagen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM ZuordnungReportvorlagen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('ZuordnungReportvorlagen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO ZuordnungReportvorlagen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'ZuordnungReportvorlagen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_ZuordnungReportvorlagen ON ZuordnungReportvorlagen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint
  
      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'ZuordnungReportvorlagen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM ZuordnungReportvorlagen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('ZuordnungReportvorlagen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'ZuordnungReportvorlagen';
    END;
END;

GO



DELETE FROM Kurs_Schueler;

UPDATE SchuelerLeistungsdaten SET Kurs_ID = NULL WHERE ID IN (
SELECT DISTINCT
  SchuelerLeistungsdaten.ID
FROM
  Kurse JOIN SchuelerLeistungsdaten ON Kurse.ID = SchuelerLeistungsdaten.Kurs_ID
        JOIN SchuelerLernabschnittsdaten ON SchuelerLeistungsdaten.Abschnitt_ID = SchuelerLernabschnittsdaten.ID
        JOIN Schueler ON SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID
WHERE
  Kurse.Jahr <> SchuelerLernabschnittsdaten.Jahr OR
  Kurse.Abschnitt <> SchuelerLernabschnittsdaten.Abschnitt
);

INSERT INTO Kurs_Schueler
SELECT DISTINCT
  Kurse.ID AS Kurs_ID,
  Schueler.ID AS Schueler_ID
FROM 
  Kurse JOIN SchuelerLeistungsdaten ON Kurse.ID = SchuelerLeistungsdaten.Kurs_ID
        JOIN SchuelerLernabschnittsdaten ON SchuelerLeistungsdaten.Abschnitt_ID = SchuelerLernabschnittsdaten.ID
        JOIN Schueler ON SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;

INSERT INTO SVWS_DB_Version(Revision) VALUES (4);


INSERT INTO Users (ID,US_Name,US_LoginName,US_UserGroups,US_Privileges) VALUES (1,'Administrator','Admin','1;2;3;4;5','$');
