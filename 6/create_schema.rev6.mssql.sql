CREATE TABLE EigeneSchule (
  ID bigint NOT NULL, 
  SchulformNr nvarchar(3), 
  SchulformKrz nvarchar(3), 
  SchulformBez nvarchar(50), 
  SchultraegerArt nvarchar(2), 
  SchultraegerNr nvarchar(6), 
  Schulgliederung nvarchar(3), 
  SchulNr nvarchar(6), 
  Bezeichnung1 nvarchar(50), 
  Bezeichnung2 nvarchar(50), 
  Bezeichnung3 nvarchar(50), 
  Strasse nvarchar(50), 
  PLZ nvarchar(10), 
  Ort nvarchar(50), 
  Telefon nvarchar(20), 
  Fax nvarchar(20), 
  Email nvarchar(100), 
  Ganztags nvarchar(1) DEFAULT '+', 
  Schuljahr smallint, 
  SchuljahrAbschnitt smallint, 
  AnzahlAbschnitte smallint DEFAULT 2, 
  Fremdsprachen nvarchar(1) DEFAULT '+', 
  UpdateSprachenfolge nvarchar(1) DEFAULT '+', 
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
  SchulLogo varbinary(max), 
  SchulLogoBase64 nvarchar(max), 
  SchulNrEigner int, 
  SchulleiterName nvarchar(50), 
  SchulleiterVorname nvarchar(30), 
  SchulleiterAmtsbez nvarchar(30), 
  SchulleiterGeschlecht int, 
  StvSchulleiterName nvarchar(50), 
  StvSchulleiterVorname nvarchar(30), 
  StvSchulleiterAmtsbez nvarchar(30), 
  StvSchulleiterGeschlecht int, 
  Einstellungen nvarchar(max), 
  Fehlstundenmodell_PrS1 nvarchar(1) DEFAULT 'G', 
  Fehlstundenmodell_S2 nvarchar(1) DEFAULT 'F', 
  Tendenznoten_S1 nvarchar(1) DEFAULT '-', 
  WebKL_Modus nvarchar(1) DEFAULT 'A', 
  WebMahnungenGesperrt nvarchar(1) DEFAULT '-', 
  WebNotenGesperrt nvarchar(1) DEFAULT '-', 
  LogoFormat nvarchar(3), 
  SchILDweb_Config nvarchar(max), 
  WebTeilLeistungenAnlegen nvarchar(1) DEFAULT '-', 
  WebInfoMail nvarchar(1) DEFAULT '-', 
  WebAdresse nvarchar(100), 
  Land nvarchar(50), 
  Einstellungen2 nvarchar(max), 
  SchulleiterTitel nvarchar(10), 
  StvSchulleiterTitel nvarchar(10),
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID)
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
  SchulNrEigner int, 
  Lernfelder nvarchar(max), 
  DQR_Niveau int, 
  Ebene1Klartext nvarchar(255), 
  Ebene2Klartext nvarchar(255), 
  Ebene3Klartext nvarchar(255),
  CONSTRAINT PK_EigeneSchule_Fachklassen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Fachklassen_UC1 UNIQUE (FKS, AP, BKIndexTyp)
);


CREATE TABLE EigeneSchule_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  FachKrz nvarchar(20), 
  Bezeichnung nvarchar(255), 
  ZeugnisBez nvarchar(255), 
  UeZeugnisBez nvarchar(255), 
  StatistikKrz nvarchar(2), 
  BasisFach nvarchar(1) DEFAULT '-', 
  IstSprache nvarchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  SortierungS2 int DEFAULT 32000, 
  NachprErlaubt nvarchar(1) DEFAULT '+', 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  Gewichtung smallint DEFAULT 1, 
  Fachgruppe_ID bigint, 
  Unterichtssprache nvarchar(1) DEFAULT 'D', 
  IstSchriftlich nvarchar(1) DEFAULT '-', 
  IstSchriftlichBA nvarchar(1) DEFAULT '-', 
  AufZeugnis nvarchar(1) DEFAULT '+', 
  Lernfelder nvarchar(max), 
  SchulNrEigner int, 
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
  CONSTRAINT EigeneSchule_Faecher_UC1 UNIQUE (FachKrz)
);


CREATE TABLE EigeneSchule_FachTeilleistungen (
  SchulNrEigner int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Teilleistung_ID bigint NOT NULL, 
  Kursart nvarchar(5),
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Fach_ID, Kursart, SchulNrEigner, Teilleistung_ID),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE EigeneSchule_Jahrgaenge (
  ID bigint DEFAULT -1 NOT NULL, 
  InternKrz nvarchar(20), 
  ASDJahrgang nvarchar(2), 
  ASDBezeichnung nvarchar(100), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung int DEFAULT 32000, 
  IstChronologisch nvarchar(1) DEFAULT '+', 
  Spaltentitel nvarchar(2), 
  SekStufe nvarchar(6), 
  SGL nvarchar(3), 
  JahrgangNum smallint, 
  Restabschnitte int, 
  SchulNrEigner int, 
  Folgejahrgang_ID bigint,
  CONSTRAINT PK_EigeneSchule_Jahrgaenge PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
);


CREATE TABLE EigeneSchule_KAoADaten (
  SchulNrEigner int NOT NULL, 
  Curriculum nvarchar(1) DEFAULT '+' NOT NULL, 
  Koordinator nvarchar(1) DEFAULT '+' NOT NULL, 
  Berufsorientierungsbuero nvarchar(1) DEFAULT '+' NOT NULL, 
  KooperationsvereinbarungAA nvarchar(1) DEFAULT '+' NOT NULL, 
  NutzungReflexionsworkshop nvarchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzI nvarchar(1) DEFAULT '+' NOT NULL, 
  NutzungEntscheidungskompetenzII nvarchar(1) DEFAULT '+' NOT NULL,
  CONSTRAINT PK_EigeneSchule_KAoADaten PRIMARY KEY (SchulNrEigner)
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
  SchulNrEigner int,
  CONSTRAINT PK_EigeneSchule_Kursart PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Kursart_UC1 UNIQUE (Kursart, KursartAllg)
);


CREATE TABLE EigeneSchule_Merkmale (
  ID bigint DEFAULT -1 NOT NULL, 
  Schule nvarchar(1) DEFAULT '+', 
  Schueler nvarchar(1) DEFAULT '+', 
  Kurztext nvarchar(10), 
  Langtext nvarchar(100), 
  SchulNrEigner int,
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
  SchulNrEigner int, 
  Schulform2 nvarchar(100),
  CONSTRAINT PK_EigeneSchule_Schulformen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schulformen_UC1 UNIQUE (SGL)
);


CREATE TABLE EigeneSchule_Teilstandorte (
  SchulNrEigner int NOT NULL, 
  AdrMerkmal nvarchar(1) NOT NULL, 
  PLZ nvarchar(10), 
  Ort nvarchar(50), 
  Strasse nvarchar(50), 
  HausNr nvarchar(10), 
  Bemerkung nvarchar(50), 
  Kuerzel nvarchar(30),
  CONSTRAINT PK_EigeneSchule_Teilstandorte PRIMARY KEY (AdrMerkmal)
);


CREATE TABLE EigeneSchule_Texte (
  ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Kuerzel nvarchar(50), 
  Inhalt nvarchar(255), 
  Beschreibung nvarchar(100), 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_EigeneSchule_Texte PRIMARY KEY (ID)
);


CREATE TABLE EigeneSchule_Zertifikate (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Kuerzel nvarchar(20) NOT NULL, 
  Bezeichnung nvarchar(100), 
  Fach nvarchar(100), 
  Formatvorlage nvarchar(255),
  CONSTRAINT PK_EigeneSchule_Zertifikate PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Zertifikate_UC1 UNIQUE (SchulNrEigner, Kuerzel)
);


CREATE TABLE Fach_Gliederungen (
  Fach_ID bigint NOT NULL, 
  Gliederung nvarchar(3) NOT NULL, 
  SchulNrEigner int NOT NULL, 
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


CREATE TABLE Floskelgruppen (
  SchulNrEigner int NOT NULL, 
  Kuerzel nvarchar(4) NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Hauptgruppe nvarchar(4), 
  Farbe int,
  CONSTRAINT PK_Floskelgruppen PRIMARY KEY (Kuerzel, SchulNrEigner)
);


CREATE TABLE Floskeln (
  SchulNrEigner int NOT NULL, 
  Kuerzel nvarchar(10) NOT NULL, 
  FloskelText nvarchar(max) NOT NULL, 
  FloskelGruppe nvarchar(10), 
  FloskelFach nvarchar(20), 
  FloskelNiveau nvarchar(2), 
  FloskelJahrgang nvarchar(2),
  CONSTRAINT PK_Floskeln PRIMARY KEY (Kuerzel)
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


CREATE TABLE K42_Blockgruppen (
  IDNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Bezeichnung nvarchar(255), 
  Jahrgang nvarchar(16), 
  Semester int, 
  Schienenzahl int, 
  Erstexport nvarchar(1) DEFAULT '+', 
  MahnungsExport nvarchar(1) DEFAULT '-', 
  KoppIDMaske nvarchar(32),
  CONSTRAINT PK_K42_Blockgruppen PRIMARY KEY (IDNr)
);


CREATE TABLE K42_Blockungen (
  ID bigint NOT NULL, 
  Bezeichnung nvarchar(128), 
  Schuljahr int, 
  Abschnitt int, 
  Angelegt datetime2, 
  LetzteBearbeitung datetime2, 
  Jahrgang nvarchar(64),
  CONSTRAINT PK_K42_Blockungen PRIMARY KEY (ID)
);


CREATE TABLE K42_Faecher (
  IDNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  FachKrz nvarchar(20), 
  Bezeichnung nvarchar(64), 
  StatistikKrz nvarchar(5), 
  Sortierung int, 
  Fachgruppe_ID bigint, 
  IstSprache nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_K42_Faecher PRIMARY KEY (IDNr)
);


CREATE TABLE K42_Jahrgaenge (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  InternKrz nvarchar(20), 
  ASDJahrgang nvarchar(2), 
  ASDBezeichnung nvarchar(200), 
  SGL nvarchar(3), 
  SGLText nvarchar(100),
  CONSTRAINT PK_K42_Jahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE K42_JgBereiche (
  JG_Bereich int, 
  BlockungsID bigint NOT NULL, 
  Jahrgang nvarchar(2),
  CONSTRAINT PK_K42_JgBereiche PRIMARY KEY (BlockungsID, Jahrgang, JG_Bereich)
);


CREATE TABLE K42_KlausurTermine (
  TerminNr int, 
  BlockungsID bigint NOT NULL, 
  BlockgruppenID bigint, 
  Bezeichnung nvarchar(128), 
  IstAbiturTermin nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_K42_KlausurTermine PRIMARY KEY (BlockgruppenID, BlockungsID, TerminNr)
);


CREATE TABLE K42_Klausurschienen (
  ID bigint NOT NULL, 
  IdNr bigint, 
  BlockungsID bigint NOT NULL, 
  Bezeichnung nvarchar(64), 
  Klausurdatum datetime2, 
  VonStd int, 
  BisStd int, 
  NurSchriftlich nvarchar(1) DEFAULT '+', 
  BlockgruppenID bigint, 
  TerminNr int,
  CONSTRAINT PK_K42_Klausurschienen PRIMARY KEY (ID)
);


CREATE TABLE K42_KursSchienen (
  ID int DEFAULT -1 NOT NULL, 
  KursID int NOT NULL, 
  SchienenID int, 
  Fixiert int, 
  Tag int, 
  TerminNr int, 
  BlockungsID int,
  CONSTRAINT PK_K42_KursSchienen PRIMARY KEY (ID)
);


CREATE TABLE K42_KursTeilnehmer (
  ID int DEFAULT -1 NOT NULL, 
  KursID int NOT NULL, 
  SchuelerID int, 
  Fixiert int, 
  Tag int, 
  TerminNr int, 
  BlockungsID int,
  CONSTRAINT PK_K42_KursTeilnehmer PRIMARY KEY (ID)
);


CREATE TABLE K42_Kurse (
  ID bigint NOT NULL, 
  IDNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  BlockgruppenID bigint, 
  Typ int, 
  SchienenID bigint, 
  Bezeichnung nvarchar(128), 
  Fach nvarchar(20), 
  Stunden int, 
  Lehrer nvarchar(10), 
  Jahrgang nvarchar(64), 
  Kursart nvarchar(5), 
  Semester int, 
  Schienenzahl int, 
  Blocken nvarchar(1) DEFAULT '+', 
  Sperrung varbinary(max), 
  Parallelkurse int, 
  KursNr int, 
  MaxProSchiene int, 
  Fixiert nvarchar(1) DEFAULT '-', 
  KursPosition int, 
  Kursraum nvarchar(10), 
  Koopkurs nvarchar(1) DEFAULT '-', 
  MaxGroesse int, 
  FixGroesse nvarchar(1) DEFAULT '-', 
  Klausurdatum datetime2, 
  KlAnfangStd int, 
  KlEndStd int, 
  KlausurBetroffene int, 
  KlAufsicht varbinary(max), 
  KlRaum int, 
  KlBemerkung nvarchar(255), 
  WoStdKL int, 
  WoStdZK int, 
  Zusatzkraft nvarchar(10), 
  UnterrichtsNr nvarchar(32), 
  Klassen nvarchar(64), 
  StundenPlan varbinary(max), 
  TerminNr int, 
  KursPlanRaum int,
  CONSTRAINT PK_K42_Kurse PRIMARY KEY (ID)
);


CREATE TABLE K42_Lehrer (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Kuerzel nvarchar(10), 
  Name nvarchar(64), 
  Vorname nvarchar(64), 
  Passwort nvarchar(128), 
  Geschlecht nvarchar(1), 
  AmtsBez nvarchar(16), 
  Email nvarchar(128),
  CONSTRAINT PK_K42_Lehrer PRIMARY KEY (ID)
);


CREATE TABLE K42_Schienen (
  ID bigint NOT NULL, 
  IDNr bigint, 
  BlockungsID bigint NOT NULL, 
  BlockgruppenID bigint, 
  Bezeichnung nvarchar(128), 
  Umwaehlerzahl int, 
  KopplungsID nvarchar(32), 
  Sortierung int, 
  Stundenraster varbinary(max),
  CONSTRAINT PK_K42_Schienen PRIMARY KEY (ID)
);


CREATE TABLE K42_SchienenKurse (
  ID int DEFAULT -1 NOT NULL, 
  SchienenID int NOT NULL, 
  KursID int, 
  Fixiert int, 
  Tag int, 
  TerminNr int, 
  BlockungsID int,
  CONSTRAINT PK_K42_SchienenKurse PRIMARY KEY (ID)
);


CREATE TABLE K42_Schueler (
  IDNr bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Status int NOT NULL, 
  Geschlecht int, 
  Jahrgang nvarchar(32), 
  Klasse nvarchar(10), 
  Name nvarchar(128), 
  Vorname nvarchar(128), 
  CollCount int, 
  GebDat datetime2, 
  SchulNr int, 
  DB_IDNr bigint, 
  ExterneID nvarchar(30), 
  Tutor nvarchar(16), 
  PruefOrd nvarchar(32), 
  Email nvarchar(128), 
  KoopDBIDNr bigint, 
  VersNr int, 
  Bemerkung nvarchar(1024),
  CONSTRAINT PK_K42_Schueler PRIMARY KEY (IDNr)
);


CREATE TABLE K42_SchuelerFaecher (
  ID bigint NOT NULL, 
  Schueler_ID bigint, 
  BlockungsID int NOT NULL, 
  Fach_ID bigint, 
  KursartInd nvarchar(5), 
  Fixiert nvarchar(1) DEFAULT '-', 
  FehlStd int, 
  Unentsch int, 
  Koop nvarchar(1) DEFAULT '-', 
  Anzahl int, 
  Zensur nvarchar(2), 
  Mdl nvarchar(255), 
  Schr nvarchar(255), 
  Mahnung nvarchar(1) DEFAULT '-', 
  KoopSchule int, 
  KursBez nvarchar(32), 
  Fehl nvarchar(16), 
  UFehl nvarchar(16), 
  LeistungsID bigint, 
  KursartAllg nvarchar(5), 
  VersNr int,
  CONSTRAINT PK_K42_SchuelerFaecher PRIMARY KEY (ID)
);


CREATE TABLE K42_Versetzungstabelle (
  IDNr int NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Klasse nvarchar(6), 
  JG nvarchar(20), 
  FolgeKl nvarchar(6), 
  VorgKl nvarchar(6), 
  FolgeJg nvarchar(20), 
  VorgJg nvarchar(20), 
  OrgForm nvarchar(2), 
  KlLehrer nvarchar(6), 
  StvKlLehrer nvarchar(6), 
  SLBNR int, 
  ASDSCHGL nvarchar(6), 
  Jahrgangs_ID nvarchar(9),
  CONSTRAINT PK_K42_Versetzungstabelle PRIMARY KEY (IDNr)
);


CREATE TABLE K42_ZulKursarten (
  ID bigint NOT NULL, 
  BlockungsID bigint NOT NULL, 
  Sortierung int, 
  KursartInd nvarchar(5), 
  Bezeichnung nvarchar(255), 
  SF nvarchar(2), 
  JgBereich int, 
  IsVisible nvarchar(1) DEFAULT '+', 
  Schriftlich nvarchar(1) DEFAULT '-', 
  KursartAllg nvarchar(5),
  CONSTRAINT PK_K42_ZulKursarten PRIMARY KEY (ID)
);


CREATE TABLE K_Adressart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_Adressart PRIMARY KEY (ID),
  CONSTRAINT K_Adressart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Ankreuzdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNrEigner int NOT NULL, 
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
  SchulNrEigner int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Jahrgang nvarchar(2) NOT NULL, 
  Gliederung nvarchar(3), 
  FloskelText nvarchar(255) NOT NULL, 
  Sortierung int, 
  FachSortierung int, 
  Abschnitt int, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aktiv nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_K_Ankreuzfloskeln PRIMARY KEY (ID)
);


CREATE TABLE K_BeschaeftigungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(100), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Datenschutz (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(250), 
  Sichtbar nvarchar(1) DEFAULT '+' NOT NULL, 
  Schluessel nvarchar(20), 
  SchulNrEigner int NOT NULL, 
  Sortierung int DEFAULT 32000 NOT NULL, 
  Beschreibung nvarchar(max),
  CONSTRAINT PK_K_Datenschutz PRIMARY KEY (ID)
);


CREATE TABLE K_EinschulungsArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(40) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_EinschulungsArt PRIMARY KEY (ID),
  CONSTRAINT K_EinschulungsArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Einzelleistungen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNrEigner int NOT NULL, 
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
  SchulNrEigner int,
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
  SchulNrEigner int,
  CONSTRAINT PK_K_ErzieherArt PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherArt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_ErzieherFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_ErzieherFunktion PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherFunktion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_FahrschuelerArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
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
  SchulNrEigner int,
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
  SchulNrEigner int,
  CONSTRAINT PK_K_Haltestelle PRIMARY KEY (ID),
  CONSTRAINT K_Haltestelle_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Kindergarten (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50), 
  PLZ nvarchar(10), 
  Ort nvarchar(30), 
  Strasse nvarchar(40), 
  Tel nvarchar(20), 
  Email nvarchar(40), 
  Bemerkung nvarchar(50), 
  Sichtbar nvarchar(1) DEFAULT '-', 
  Sortierung int, 
  SchulNrEigner int,
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
  SchulNrEigner int,
  CONSTRAINT PK_K_Ort PRIMARY KEY (ID),
  CONSTRAINT K_Ort_UC1 UNIQUE (PLZ, Bezeichnung)
);

CREATE INDEX K_Ort_IDX1 ON K_Ort(PLZ);


CREATE TABLE K_AllgAdresse (
  ID bigint DEFAULT -1 NOT NULL, 
  AllgAdrAdressArt nvarchar(30) NOT NULL, 
  AllgAdrName1 nvarchar(50), 
  AllgAdrName2 nvarchar(50), 
  AllgAdrStrasse nvarchar(50), 
  AllgAdrOrt_ID bigint, 
  AllgAdrPLZ nvarchar(10), 
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
  SchulNrEigner int, 
  Massnahmentraeger nvarchar(1) DEFAULT '-', 
  BelehrungISG nvarchar(1) DEFAULT '-', 
  GU_ID nvarchar(40), 
  ErwFuehrungszeugnis nvarchar(1) DEFAULT '-', 
  ExtID nvarchar(50),
  CONSTRAINT PK_K_AllgAdresse PRIMARY KEY (ID),
  CONSTRAINT K_AllgAdresse_AdressArt_FK FOREIGN KEY (AllgAdrAdressArt) REFERENCES K_Adressart(Bezeichnung) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID)
);


CREATE TABLE AllgAdrAnsprechpartner (
  ID bigint DEFAULT -1 NOT NULL, 
  Adresse_ID bigint, 
  Name nvarchar(60), 
  Vorname nvarchar(60), 
  Anrede nvarchar(10), 
  Telefon nvarchar(20), 
  Email nvarchar(100), 
  Abteilung nvarchar(50), 
  SchulNrEigner int, 
  Titel nvarchar(15), 
  GU_ID nvarchar(40),
  CONSTRAINT PK_AllgAdrAnsprechpartner PRIMARY KEY (ID),
  CONSTRAINT Ansprechpartner_Adr_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID)
);


CREATE TABLE K_Ortsteil (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Ort_ID bigint, 
  PLZ nvarchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int, 
  OrtsteilSchluessel nvarchar(30),
  CONSTRAINT PK_K_Ortsteil PRIMARY KEY (ID),
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
  SchulNrEigner int,
  CONSTRAINT PK_K_Religion PRIMARY KEY (ID),
  CONSTRAINT K_Religion_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Schule (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNr nvarchar(6) NOT NULL, 
  Name nvarchar(100), 
  SchulformNr nvarchar(3), 
  SchulformKrz nvarchar(3), 
  SchulformBez nvarchar(50), 
  Strasse nvarchar(50), 
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
  SchulNrEigner int,
  CONSTRAINT PK_K_Schule PRIMARY KEY (ID),
  CONSTRAINT K_Schule_UC1 UNIQUE (SchulNr)
);


CREATE TABLE K_Schulfunktionen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50), 
  Sortierung int, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_Schulfunktionen PRIMARY KEY (ID)
);


CREATE TABLE K_Schwerpunkt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_Schwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Schwerpunkt_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE Fachklassen_Schwerpunkte (
  SchulNrEigner int NOT NULL, 
  Fachklasse_ID bigint NOT NULL, 
  Schwerpunkt_ID bigint NOT NULL,
  CONSTRAINT PK_Fachklassen_Schwerpunkte PRIMARY KEY (Fachklasse_ID, SchulNrEigner, Schwerpunkt_ID),
  CONSTRAINT Fachklassen_Schwerpunkte_Fachkl_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Fachklassen_Schwerpunkte_Schwerp_FK FOREIGN KEY (Schwerpunkt_ID) REFERENCES K_Schwerpunkt(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE K_Sportbefreiung (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_Sportbefreiung PRIMARY KEY (ID),
  CONSTRAINT K_Sportbefreiung_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Staat (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(80) NOT NULL, 
  StatistikKrz nvarchar(3), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  ExportBez nvarchar(20), 
  SchulNrEigner int, 
  Bezeichnung2 nvarchar(80),
  CONSTRAINT PK_K_Staat PRIMARY KEY (ID),
  CONSTRAINT K_Staat_UC1 UNIQUE (StatistikKrz)
);


CREATE TABLE K_TelefonArt (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
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
  SchulNrEigner int,
  CONSTRAINT PK_K_Textdateien PRIMARY KEY (ID)
);


CREATE TABLE K_Verkehrssprachen (
  ID bigint DEFAULT -1 NOT NULL, 
  Kurztext nvarchar(10), 
  Langtext nvarchar(100), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Sortierung int, 
  SchulNrEigner int,
  CONSTRAINT PK_K_Verkehrssprachen PRIMARY KEY (ID)
);


CREATE TABLE K_Vermerkart (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(30) NOT NULL, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_K_Vermerkart PRIMARY KEY (ID),
  CONSTRAINT K_Vermerkart_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE K_Zertifikate (
  Kuerzel nvarchar(5) NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  SchulNrEigner int NOT NULL,
  CONSTRAINT PK_K_Zertifikate PRIMARY KEY (Kuerzel, SchulNrEigner)
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


CREATE TABLE Kompetenzen (
  KO_ID bigint NOT NULL, 
  KO_Gruppe bigint NOT NULL, 
  KO_Bezeichnung nvarchar(64) NOT NULL,
  CONSTRAINT PK_Kompetenzen PRIMARY KEY (KO_Gruppe, KO_ID)
);


CREATE TABLE Kompetenzgruppen (
  KG_Spalte bigint NOT NULL, 
  KG_Zeile bigint NOT NULL, 
  KG_ID bigint NOT NULL, 
  KG_Bezeichnung nvarchar(50) NOT NULL,
  CONSTRAINT PK_Kompetenzgruppen PRIMARY KEY (KG_Bezeichnung, KG_ID, KG_Spalte, KG_Zeile)
);


CREATE TABLE Kurse (
  ID bigint DEFAULT -1 NOT NULL, 
  Jahr smallint NOT NULL, 
  Abschnitt smallint NOT NULL, 
  KurzBez nvarchar(20) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2), 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5), 
  WochenStd smallint, 
  LehrerKrz nvarchar(10), 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Schienen nvarchar(20), 
  Fortschreibungsart nvarchar(1), 
  WochenstdKL float, 
  SchulNr int, 
  EpochU nvarchar(1) DEFAULT '-', 
  SchulNrEigner int, 
  ZeugnisBez nvarchar(130), 
  Jahrgaenge nvarchar(50),
  CONSTRAINT PK_Kurse PRIMARY KEY (ID),
  CONSTRAINT Kurse_UC1 UNIQUE (Jahr, Abschnitt, KurzBez, ASDJahrgang, Fach_ID, KursartAllg, WochenStd, LehrerKrz, Jahrgaenge)
);


CREATE TABLE LehrerFotos (
  Lehrer_ID bigint NOT NULL, 
  Foto varbinary(max), 
  FotoBase64 nvarchar(max), 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerFotos PRIMARY KEY (Lehrer_ID)
);


CREATE TABLE LehrerLehramtFachr (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10), 
  FachrKrz nvarchar(10), 
  FachrAnerkennungKrz nvarchar(10), 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerLehramtFachr PRIMARY KEY (FachrKrz, LehramtKrz, Lehrer_ID)
);


CREATE TABLE LehrerLehramtLehrbef (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10), 
  LehrbefKrz nvarchar(10), 
  LehrbefAnerkennungKrz nvarchar(10), 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerLehramtLehrbef PRIMARY KEY (LehramtKrz, LehrbefKrz, Lehrer_ID)
);


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL, 
  LI_LoginTime datetime2, 
  LI_LogoffTime datetime2, 
  SchulNrEigner int,
  CONSTRAINT PK_Logins PRIMARY KEY (LI_LoginTime, LI_UserID)
);


CREATE TABLE LuPO_Beratungslehrer (
  Abi_Jahrgang int NOT NULL, 
  Lehrer_ID bigint NOT NULL,
  CONSTRAINT PK_LuPO_Beratungslehrer PRIMARY KEY (Abi_Jahrgang, Lehrer_ID)
);


CREATE TABLE LuPO_Fachgruppen (
  ID bigint NOT NULL, 
  Aufgabenfeld int DEFAULT 0, 
  FachgruppeKrz nvarchar(2), 
  Farbe int DEFAULT 16777215, 
  Bezeichnung nvarchar(100),
  CONSTRAINT PK_LuPO_Fachgruppen PRIMARY KEY (ID)
);


CREATE TABLE LuPO_FachgruppenFaecher (
  Fach nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(80), 
  Fachgruppe_ID bigint,
  CONSTRAINT PK_LuPO_FachgruppenFaecher PRIMARY KEY (Fach)
);


CREATE TABLE LuPO_Faecher (
  Abi_Jahrgang int NOT NULL, 
  Fach_ID bigint NOT NULL, 
  ID bigint DEFAULT 0 NOT NULL, 
  Bezeichnung nvarchar(80), 
  StatistikKrz nvarchar(2), 
  Sortierung int DEFAULT 32000 NOT NULL, 
  IstSprache int DEFAULT 0 NOT NULL, 
  Unterichtssprache nvarchar(1) DEFAULT 'D' NOT NULL, 
  E1 int DEFAULT 1 NOT NULL, 
  E2 int DEFAULT 1 NOT NULL, 
  Q1 int DEFAULT 1 NOT NULL, 
  Q2 int DEFAULT 1 NOT NULL, 
  Q3 int DEFAULT 1 NOT NULL, 
  Q4 int DEFAULT 1 NOT NULL, 
  Abi_Moegl int DEFAULT 1 NOT NULL, 
  LK_Moegl int DEFAULT 1 NOT NULL, 
  AlsNeueFSInSII int DEFAULT 0 NOT NULL, 
  Leitfach_1_ID bigint, 
  Leitfach_2_ID bigint, 
  E1_WStd int, 
  E2_WStd int, 
  E1_S_M nvarchar(1), 
  E2_S_M nvarchar(1), 
  Q_WStd int, 
  E_ExportKursart nvarchar(5), 
  NurMuendlich int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_LuPO_Faecher PRIMARY KEY (Abi_Jahrgang, Fach_ID)
);


CREATE TABLE LuPO_Jahrgangsdaten (
  Abi_Jahrgang int NOT NULL, 
  ZK_Beginn_GE nvarchar(2) DEFAULT 'Q3', 
  ZK_Beginn_SW nvarchar(2) DEFAULT 'Q3', 
  BeratungsText nvarchar(2000), 
  MailText nvarchar(2000),
  CONSTRAINT PK_LuPO_Jahrgangsdaten PRIMARY KEY (Abi_Jahrgang)
);


CREATE TABLE LuPO_NichtMoeglAbiFachKombi (
  Abi_Jahrgang int NOT NULL, 
  ID nvarchar(30) NOT NULL, 
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  Kursart1 nvarchar(5), 
  Kursart2 nvarchar(5), 
  Phase nvarchar(10) DEFAULT '-' NOT NULL, 
  Typ nvarchar(1) DEFAULT '-' NOT NULL,
  CONSTRAINT PK_LuPO_NichtMoeglAbiFachKombi PRIMARY KEY (Abi_Jahrgang, ID)
);


CREATE TABLE LuPO_Schueler (
  Schueler_ID bigint NOT NULL, 
  DatumBeratung datetime2, 
  DatumRuecklauf datetime2, 
  SPP int DEFAULT 0 NOT NULL, 
  Sportattest int DEFAULT 0 NOT NULL, 
  Kommentar nvarchar(max), 
  PruefOrdnung nvarchar(20), 
  Email nvarchar(100), 
  Beratungslehrer nvarchar(50), 
  AnzK_E1 int, 
  AnzK_E2 int, 
  AnzK_Q1 int, 
  AnzK_Q2 int, 
  AnzK_Q3 int, 
  AnzK_Q4 int, 
  AnzS_E1 int, 
  AnzS_E2 int, 
  AnzS_Q1 int, 
  AnzS_Q2 int, 
  AnzS_Q3 int, 
  AnzS_Q4 int, 
  AnzS_Summe nvarchar(5), 
  AnzK_Summe nvarchar(5), 
  PruefPhase nvarchar(1), 
  Zeitstempel datetime2, 
  Gliederung nvarchar(3), 
  Konfession nvarchar(2), 
  Zulassung nvarchar(1), 
  BLL_Art nvarchar(1), 
  BLL_Punkte int, 
  FS2_SekI_Manuell int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_LuPO_Schueler PRIMARY KEY (Schueler_ID)
);


CREATE TABLE LuPO_SchuelerFaecher (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart_E1 nvarchar(5), 
  Punkte_E1 nvarchar(2), 
  Konflikt_E1 int DEFAULT 0 NOT NULL, 
  Kursart_E2 nvarchar(5), 
  Punkte_E2 nvarchar(2), 
  Konflikt_E2 int DEFAULT 0 NOT NULL, 
  Kursart_Q1 nvarchar(5), 
  Punkte_Q1 nvarchar(2), 
  Konflikt_Q1 int DEFAULT 0 NOT NULL, 
  Kursart_Q2 nvarchar(5), 
  Punkte_Q2 nvarchar(2), 
  Konflikt_Q2 int DEFAULT 0 NOT NULL, 
  Kursart_Q3 nvarchar(5), 
  Punkte_Q3 nvarchar(2), 
  Konflikt_Q3 int DEFAULT 0 NOT NULL, 
  Kursart_Q4 nvarchar(5), 
  Punkte_Q4 nvarchar(2), 
  Konflikt_Q4 int DEFAULT 0 NOT NULL, 
  AbiturFach int, 
  Konflikt_AF int DEFAULT 0 NOT NULL, 
  Bemerkungen nvarchar(50), 
  Fachgruppe nvarchar(5), 
  Aufgabenfeld int DEFAULT 0 NOT NULL, 
  Aendern_E1 int, 
  Aendern_E2 int, 
  Aendern_Q1 int, 
  Aendern_Q2 int, 
  Aendern_Q3 int, 
  MdlPruefErgebnis int, 
  Aendern_Q4 int, 
  Markiert_Q1 int, 
  Markiert_Q2 int, 
  Markiert_Q3 int, 
  Markiert_Q4 int, 
  AbiPruefErgebnis int, 
  MdlPflichtPruefung nvarchar(1),
  CONSTRAINT PK_LuPO_SchuelerFaecher PRIMARY KEY (ID)
);


CREATE TABLE LuPO_SchuelerFehlermeldungen (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fehlercode nvarchar(20), 
  Fehlertext nvarchar(800), 
  Fehlergruppe nvarchar(2), 
  Sortierung int,
  CONSTRAINT PK_LuPO_SchuelerFehlermeldungen PRIMARY KEY (ID)
);


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL, 
  Fach2_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Kursart1 nvarchar(5), 
  Kursart2 nvarchar(5), 
  PK nvarchar(30) NOT NULL, 
  Sortierung int, 
  Phase nvarchar(10), 
  Typ nvarchar(1),
  CONSTRAINT PK_NichtMoeglAbiFachKombi PRIMARY KEY (PK)
);


CREATE TABLE Personengruppen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNrEigner int NOT NULL, 
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
  SchulNrEigner int NOT NULL, 
  Gruppe_ID bigint NOT NULL, 
  Person_ID bigint, 
  PersonNr int, 
  PersonArt nvarchar(1), 
  PersonName nvarchar(50) NOT NULL, 
  PersonVorname nvarchar(30), 
  PersonPLZ nvarchar(10), 
  PersonOrt nvarchar(50), 
  PersonStrasse nvarchar(50), 
  PersonTelefon nvarchar(20), 
  PersonMobil nvarchar(20), 
  PersonEmail nvarchar(100), 
  Bemerkung nvarchar(100), 
  Zusatzinfo nvarchar(100), 
  Sortierung int, 
  PersonAnrede nvarchar(10), 
  PersonAkadGrad nvarchar(15),
  CONSTRAINT PK_Personengruppen_Personen PRIMARY KEY (ID)
);


CREATE TABLE PrfSemAbschl (
  Nr nvarchar(2) NOT NULL, 
  Klartext nvarchar(30), 
  StatistikKrz nvarchar(1), 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_PrfSemAbschl PRIMARY KEY (Nr)
);


CREATE TABLE SVWS_Client_Konfiguration_Global (
  AppName nvarchar(100) NOT NULL, 
  Schluessel nvarchar(255) NOT NULL, 
  Wert nvarchar(max) NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Global PRIMARY KEY (AppName, Schluessel)
);


CREATE TABLE SVWS_DB_AutoInkremente (
  NameTabelle nvarchar(200) NOT NULL, 
  MaxID bigint DEFAULT 1 NOT NULL,
  CONSTRAINT PK_SVWS_DB_AutoInkremente PRIMARY KEY (NameTabelle)
);


CREATE TABLE SVWS_DB_Version (
  Revision int DEFAULT 0 NOT NULL,
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
  SchulNrEigner int,
  CONSTRAINT PK_SchildFilter PRIMARY KEY (ID),
  CONSTRAINT SchildFilter_UC1 UNIQUE (Name)
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
  SchulNrEigner int NOT NULL, 
  DatumLoeschfristHinweisDeaktiviert datetime2, 
  DatumLoeschfristHinweisDeaktiviertUserID int, 
  DatumDatenGeloescht datetime2,
  CONSTRAINT PK_Schild_Verwaltung PRIMARY KEY (GU_ID),
  CONSTRAINT Schild_Verwaltung_UC1 UNIQUE (SchulNrEigner)
);


CREATE TABLE Schildintern_AbiturInfos (
  PrfOrdnung nvarchar(20) NOT NULL, 
  AbiFach nvarchar(1) NOT NULL, 
  Bedingung nvarchar(3), 
  AbiInfoKrz nvarchar(20), 
  AbiInfoBeschreibung nvarchar(255), 
  AbiInfoText nvarchar(max),
  CONSTRAINT PK_Schildintern_AbiturInfos PRIMARY KEY (AbiFach, AbiInfoKrz, Bedingung, PrfOrdnung)
);


CREATE TABLE Schildintern_Berufsebene (
  Berufsebene int NOT NULL, 
  Kuerzel nvarchar(2) NOT NULL, 
  Klartext nvarchar(255),
  CONSTRAINT PK_Schildintern_Berufsebene PRIMARY KEY (Berufsebene, Kuerzel)
);


CREATE TABLE Schildintern_DQR_Niveaus (
  Gliederung nvarchar(4) NOT NULL, 
  FKS nvarchar(8) NOT NULL, 
  DQR_Niveau int NOT NULL,
  CONSTRAINT PK_Schildintern_DQR_Niveaus PRIMARY KEY (Gliederung, FKS, DQR_Niveau)
);


CREATE TABLE Schildintern_Datenart (
  DatenartKrz nvarchar(10) NOT NULL, 
  Datenart nvarchar(50), 
  Tabellenname nvarchar(30), 
  Reihenfolge int,
  CONSTRAINT PK_Schildintern_Datenart PRIMARY KEY (DatenartKrz)
);


CREATE TABLE Schildintern_Fachgruppen (
  FG_ID bigint NOT NULL, 
  FG_SF nvarchar(50), 
  FG_Bezeichnung nvarchar(50), 
  FG_Farbe int, 
  FG_Sortierung int, 
  FG_Kuerzel nvarchar(5), 
  FG_Zeugnis nvarchar(1),
  CONSTRAINT PK_Schildintern_Fachgruppen PRIMARY KEY (FG_ID)
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
  GueltigAb datetime2, 
  GueltigBis datetime2, 
  AO_Kuerzel nvarchar(10) NOT NULL, 
  AO_Beschreibung nvarchar(255), 
  AO_Stufen nvarchar(10), 
  Zusatzmerkmal_Anzeige nvarchar(50),
  CONSTRAINT PK_Schildintern_KAoA_Anschlussoption PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Anschlussoption_IDX1 ON Schildintern_KAoA_Anschlussoption(AO_Kuerzel);


CREATE TABLE Schildintern_KAoA_Berufsfeld (
  ID bigint NOT NULL, 
  GueltigAb datetime2, 
  GueltigBis datetime2, 
  BF_Kuerzel nvarchar(10) NOT NULL, 
  BF_Beschreibung nvarchar(255),
  CONSTRAINT PK_Schildintern_KAoA_Berufsfeld PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Berufsfeld_IDX1 ON Schildintern_KAoA_Berufsfeld(BF_Kuerzel);


CREATE TABLE Schildintern_KAoA_Kategorie (
  ID bigint NOT NULL, 
  GueltigAb datetime2, 
  GueltigBis datetime2, 
  K_Kuerzel nvarchar(10) NOT NULL, 
  K_Beschreibung nvarchar(255), 
  K_Jahrgaenge nvarchar(25),
  CONSTRAINT PK_Schildintern_KAoA_Kategorie PRIMARY KEY (ID)
);

CREATE INDEX Schildintern_KAoA_Kategorie_IDX1 ON Schildintern_KAoA_Kategorie(K_Kuerzel);


CREATE TABLE Schildintern_KAoA_Merkmal (
  ID bigint NOT NULL, 
  GueltigAb datetime2, 
  GueltigBis datetime2, 
  M_Kuerzel nvarchar(20) NOT NULL, 
  Kategorie_ID bigint NOT NULL, 
  M_Beschreibung nvarchar(255), 
  M_Option nvarchar(25), 
  M_Kategorie nvarchar(10),
  CONSTRAINT PK_Schildintern_KAoA_Merkmal PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_Merkmal_Kategorie_FK FOREIGN KEY (Kategorie_ID) REFERENCES Schildintern_KAoA_Kategorie(ID)
);

CREATE INDEX Schildintern_KAoA_Merkmal_IDX1 ON Schildintern_KAoA_Merkmal(M_Kuerzel);


CREATE TABLE Schildintern_KAoA_Zusatzmerkmal (
  ID bigint NOT NULL, 
  GueltigAb datetime2, 
  GueltigBis datetime2, 
  ZM_Kuerzel nvarchar(20) NOT NULL, 
  Merkmal_ID bigint NOT NULL, 
  ZM_Beschreibung nvarchar(255), 
  ZM_Option nvarchar(25), 
  ZM_Merkmal nvarchar(20),
  CONSTRAINT PK_Schildintern_KAoA_Zusatzmerkmal PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_Zusatzmerkmal_Merkmal_FK FOREIGN KEY (Merkmal_ID) REFERENCES Schildintern_KAoA_Merkmal(ID)
);

CREATE INDEX Schildintern_KAoA_Zusatzmerkmal_IDX1 ON Schildintern_KAoA_Zusatzmerkmal(ZM_Kuerzel);


CREATE TABLE Schildintern_KAoA_SBO_Ebene4 (
  ID bigint NOT NULL, 
  GueltigAb datetime2, 
  GueltigBis datetime2, 
  Kuerzel_EB4 nvarchar(20) NOT NULL, 
  Beschreibung_EB4 nvarchar(255), 
  Zusatzmerkmal nvarchar(20), 
  Zusatzmerkmal_ID bigint,
  CONSTRAINT PK_Schildintern_KAoA_SBO_Ebene4 PRIMARY KEY (ID),
  CONSTRAINT Schildintern_KAoA_SBO_Ebene4_Zusatzmerkmall_FK FOREIGN KEY (Zusatzmerkmal_ID) REFERENCES Schildintern_KAoA_Zusatzmerkmal(ID)
);

CREATE INDEX Schildintern_KAoA_SBO_Ebene4_IDX1 ON Schildintern_KAoA_SBO_Ebene4(Kuerzel_EB4);


CREATE TABLE Schildintern_K_Schulnote (
  ID bigint NOT NULL, 
  Krz nvarchar(2), 
  Art nvarchar(1), 
  Bezeichnung nvarchar(40), 
  Zeugnisnotenbez nvarchar(40), 
  Punkte nvarchar(2), 
  Sortierung int, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+',
  CONSTRAINT PK_Schildintern_K_Schulnote PRIMARY KEY (ID)
);


CREATE TABLE Schildintern_KursartenZuordnung (
  KursartIndiv nvarchar(5) NOT NULL, 
  KursartAllg nvarchar(5) NOT NULL,
  CONSTRAINT PK_Schildintern_KursartenZuordnung PRIMARY KEY (KursartIndiv)
);


CREATE TABLE Schildintern_Laender (
  Kurztext nvarchar(2) NOT NULL, 
  Langtext nvarchar(40), 
  Sortierung int,
  CONSTRAINT PK_Schildintern_Laender PRIMARY KEY (Kurztext)
);


CREATE TABLE Schildintern_PrfSemAbschl (
  Nr nvarchar(2) NOT NULL, 
  Klartext nvarchar(50), 
  StatistikKrz nvarchar(1), 
  Sortierung int, 
  Schulform nvarchar(2) NOT NULL, 
  StatistikKrzNeu nvarchar(2),
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
  CONSTRAINT PK_Schildintern_Zusatzinfos PRIMARY KEY (JG_BKAbschl, SGL_BKAbschl)
);


CREATE TABLE SchuelerEinzelleistungen (
  SchulNrEigner int NOT NULL, 
  ID bigint DEFAULT -1 NOT NULL, 
  Datum date, 
  Lehrer_ID bigint, 
  Art_ID bigint, 
  Bemerkung nvarchar(100), 
  Leistung_ID bigint, 
  NotenKrz nvarchar(2),
  CONSTRAINT PK_SchuelerEinzelleistungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerEL_Art_FK FOREIGN KEY (Art_ID) REFERENCES K_Einzelleistungen(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerGSDaten (
  Schueler_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
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
  Nachname_Klassenlehrer nvarchar(50), 
  GS_Klasse nvarchar(10), 
  Bemerkungen nvarchar(max), 
  Geschwisterkind nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerGSDaten PRIMARY KEY (Schueler_ID)
);


CREATE TABLE SchuelerListe (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Erzeuger nvarchar(20), 
  Privat nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
);


CREATE TABLE SchuelerReportvorlagen (
  User_ID bigint NOT NULL, 
  SchulNrEigner int, 
  Reportvorlage nvarchar(255), 
  Schueler_IDs nvarchar(max),
  CONSTRAINT PK_SchuelerReportvorlagen PRIMARY KEY (User_ID, Reportvorlage)
);


CREATE TABLE SchuelerWiedervorlage (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Bemerkung nvarchar(255), 
  AngelegtAm datetime2, 
  WiedervorlageAm datetime2, 
  ErledigtAm datetime2, 
  User_ID bigint, 
  Sekretariat nvarchar(1) DEFAULT '+', 
  Typ nvarchar(1), 
  NichtLoeschen nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerWiedervorlage PRIMARY KEY (ID)
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
  CONSTRAINT PK_Schulver_DBS PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_Schulformen (
  Schulform nvarchar(2) NOT NULL, 
  SF nvarchar(2), 
  Bezeichnung nvarchar(60), 
  Flag nvarchar(1) DEFAULT '1', 
  geaendert datetime2,
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
  CONSTRAINT PK_Schulver_Schultraeger PRIMARY KEY (SchulNr)
);


CREATE TABLE Schulver_WeitereSF (
  SNR nvarchar(6) NOT NULL, 
  SGL nvarchar(3) DEFAULT '   ' NOT NULL, 
  FSP nvarchar(2) DEFAULT '  ' NOT NULL,
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
  CONSTRAINT PK_Statkue_AndereGrundschulen PRIMARY KEY (SNR)
);


CREATE TABLE Statkue_Bilingual (
  SF nvarchar(2) NOT NULL, 
  Fach nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(100), 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Bilingual PRIMARY KEY (Fach, SF)
);


CREATE TABLE Statkue_Einschulungsart (
  Art nvarchar(2) NOT NULL, 
  Sortierung int DEFAULT 0, 
  Beschreibung nvarchar(100), 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Einschulungsart PRIMARY KEY (Art)
);


CREATE TABLE Statkue_Fachklasse (
  BKIndex int DEFAULT 0 NOT NULL, 
  Flag nvarchar(1), 
  FKS nvarchar(3) NOT NULL, 
  AP nvarchar(2) NOT NULL, 
  BGrp nvarchar(1), 
  BFeld nvarchar(2), 
  Sortierung int DEFAULT 0, 
  Status nvarchar(20), 
  Beschreibung nvarchar(100), 
  Beschreibung_W nvarchar(100), 
  geaendert datetime2, 
  Beschreibung_MW nvarchar(100), 
  BAKLALT nvarchar(2), 
  BAGRALT nvarchar(4), 
  BAKL nvarchar(5), 
  BAGR nvarchar(8), 
  Ebene1 nvarchar(2), 
  Ebene2 nvarchar(2), 
  Ebene3 nvarchar(2), 
  Flag_APOBK nvarchar(1),
  CONSTRAINT PK_Statkue_Fachklasse PRIMARY KEY (AP, BKIndex, FKS)
);


CREATE TABLE Statkue_Foerderschwerpunkt (
  Beschreibung nvarchar(100), 
  Flag nvarchar(1) DEFAULT '1', 
  FSP nvarchar(2) NOT NULL, 
  geaendert datetime2, 
  SF nvarchar(2) NOT NULL,
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
  CONSTRAINT PK_Statkue_Gliederung PRIMARY KEY (BKAnlage, BKTyp, Flag, SF)
);


CREATE TABLE Statkue_Herkunftsart (
  SF nvarchar(2) NOT NULL, 
  Art nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(255) NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  Sortierung int DEFAULT 0 NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Herkunftsart PRIMARY KEY (Art, SF)
);


CREATE TABLE Statkue_Herkunftsschulform (
  SF nvarchar(2) NOT NULL, 
  HSF nvarchar(3) NOT NULL, 
  Beschreibung nvarchar(150) NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime2,
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
  CONSTRAINT PK_Statkue_LehrerAbgang PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerAnrechnung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerAnrechnung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerBeschaeftigungsart (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerBeschaeftigungsart PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerEinsatzstatus (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerEinsatzstatus PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerFachrAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerFachrichtung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerFachrichtung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramt (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehramt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehramtAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehramtAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefAnerkennung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehrbefAnerkennung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLehrbefaehigung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLehrbefaehigung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerLeitung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerLeitung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMehrleistung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerMehrleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerMinderleistung (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Statkue_LehrerMinderleistung PRIMARY KEY (ID)
);


CREATE TABLE Statkue_LehrerRechtsverhaeltnis (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Beginn datetime2, 
  Ende datetime2, 
  Sort int DEFAULT 0 NOT NULL,
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
  CONSTRAINT PK_Statkue_Nationalitaeten PRIMARY KEY (Schluessel)
);


CREATE TABLE K_Lehrer (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID nvarchar(40), 
  Kuerzel nvarchar(10) NOT NULL, 
  LIDKrz nvarchar(4), 
  Nachname nvarchar(30) NOT NULL, 
  Vorname nvarchar(20), 
  PersonTyp nvarchar(20) DEFAULT 'LEHRKRAFT', 
  SchulNrEigner int, 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Aenderbar nvarchar(1) DEFAULT '+', 
  FuerExport nvarchar(1) DEFAULT '+', 
  Statistik nvarchar(1) DEFAULT '+', 
  Strasse nvarchar(50), 
  Ort_ID bigint, 
  PLZ nvarchar(10), 
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
  SchulFunktion nvarchar(10), 
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
  CONSTRAINT PK_K_Lehrer PRIMARY KEY (ID),
  CONSTRAINT K_Lehrer_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID),
  CONSTRAINT K_Lehrer_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID),
  CONSTRAINT K_Lehrer_Statkue_Nationalitaeten_FK FOREIGN KEY (StaatKrz) REFERENCES Statkue_Nationalitaeten(Schluessel),
  CONSTRAINT K_Lehrer_UC1 UNIQUE (Kuerzel)
);


CREATE TABLE EigeneSchule_Abteilungen (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  AbteilungsLeiter nvarchar(10), 
  Sichtbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int, 
  Raum nvarchar(20), 
  Email nvarchar(100), 
  Durchwahl nvarchar(20), 
  Sortierung int,
  CONSTRAINT PK_EigeneSchule_Abteilungen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abteilungen_Leiter_FK FOREIGN KEY (AbteilungsLeiter) REFERENCES K_Lehrer(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE KursLehrer (
  Kurs_ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  Anteil float, 
  SchulNrEigner int,
  CONSTRAINT PK_KursLehrer PRIMARY KEY (Kurs_ID, Lehrer_ID),
  CONSTRAINT KursLehrer_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursLehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAbschnittsdaten (
  Lehrer_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Rechtsverhaeltnis nvarchar(1), 
  Beschaeftigungsart nvarchar(2), 
  Einsatzstatus nvarchar(1), 
  PflichtstdSoll float, 
  UnterrichtsStd float, 
  MehrleistungStd float, 
  EntlastungStd float, 
  AnrechnungStd float, 
  RestStd float, 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerAbschnittsdaten PRIMARY KEY (Abschnitt, Jahr, Lehrer_ID),
  CONSTRAINT LehrerAbschnitte_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerAnrechnung (
  Lehrer_ID bigint NOT NULL, 
  AnrechnungsgrundKrz nvarchar(10), 
  AnrechnungStd float, 
  Jahr int, 
  Abschnitt int, 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerAnrechnung PRIMARY KEY (Abschnitt, AnrechnungsgrundKrz, Jahr, Lehrer_ID),
  CONSTRAINT LehrerAnrechnung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerEntlastung (
  Lehrer_ID bigint NOT NULL, 
  EntlastungsgrundKrz nvarchar(10), 
  EntlastungStd float, 
  Jahr int, 
  Abschnitt int, 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerEntlastung PRIMARY KEY (Abschnitt, EntlastungsgrundKrz, Jahr, Lehrer_ID),
  CONSTRAINT LehrerEntlastung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerFunktionen (
  Lehrer_ID bigint NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Funktion_ID bigint NOT NULL, 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerFunktionen PRIMARY KEY (Abschnitt, Funktion_ID, Jahr, Lehrer_ID),
  CONSTRAINT LehrerFunktionen_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_Schulfunktionen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerLehramt (
  Lehrer_ID bigint NOT NULL, 
  LehramtKrz nvarchar(10), 
  LehramtAnerkennungKrz nvarchar(10), 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerLehramt PRIMARY KEY (LehramtKrz, Lehrer_ID),
  CONSTRAINT LehrerLehramt_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE LehrerMehrleistung (
  Lehrer_ID bigint NOT NULL, 
  MehrleistungsgrundKrz nvarchar(10) NOT NULL, 
  MehrleistungStd float, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  SchulNrEigner int,
  CONSTRAINT PK_LehrerMehrleistung PRIMARY KEY (Abschnitt, Jahr, Lehrer_ID, MehrleistungsgrundKrz),
  CONSTRAINT LehrerMehrleistung_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Lehrer_IMEI (
  ID bigint NOT NULL, 
  Lehrer_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  IMEI nvarchar(20),
  CONSTRAINT PK_Lehrer_IMEI PRIMARY KEY (ID),
  CONSTRAINT Lehrer_IMEI_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Statkue_Organisationsform (
  SF nvarchar(2) NOT NULL, 
  OrgForm nvarchar(1) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  Beschreibung nvarchar(100) NOT NULL, 
  Flag nvarchar(1), 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Organisationsform PRIMARY KEY (FSP, OrgForm, SF)
);


CREATE TABLE Statkue_PLZOrt (
  ID bigint NOT NULL, 
  PLZ nvarchar(50), 
  RegSchl nvarchar(50), 
  Ort nvarchar(50), 
  Sortierung int DEFAULT 1,
  CONSTRAINT PK_Statkue_PLZOrt PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Reformpaedagogik (
  SF nvarchar(2) NOT NULL, 
  RPG nvarchar(1) NOT NULL, 
  Beschreibung nvarchar(100) NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Reformpaedagogik PRIMARY KEY (RPG, SF)
);


CREATE TABLE Statkue_Religionen (
  Schluessel nvarchar(2) NOT NULL, 
  Klartext nvarchar(50) NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_Religionen PRIMARY KEY (Schluessel)
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
  CONSTRAINT PK_Statkue_SchuelerUebergangsempfehlung5Jg PRIMARY KEY (ID)
);


CREATE TABLE Statkue_SchuelerVerkehrssprache (
  ID bigint NOT NULL, 
  Kurztext nvarchar(10) NOT NULL, 
  Langtext nvarchar(255) NOT NULL, 
  Gesprochen_in nvarchar(255), 
  Beginn datetime2, 
  Ende datetime2,
  CONSTRAINT PK_Statkue_SchuelerVerkehrssprache PRIMARY KEY (ID)
);


CREATE TABLE Statkue_Schulformen (
  Schulform nvarchar(2), 
  SF nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime2, 
  Sortierung int DEFAULT 0,
  CONSTRAINT PK_Statkue_Schulformen PRIMARY KEY (Bezeichnung, SF)
);


CREATE TABLE Statkue_Strassen (
  Ort nvarchar(50) NOT NULL, 
  RegSchl nvarchar(8) NOT NULL, 
  Strasse nvarchar(75) NOT NULL, 
  Stand nvarchar(20),
  CONSTRAINT PK_Statkue_Strassen PRIMARY KEY (RegSchl, Strasse)
);


CREATE TABLE Statkue_ZulFaecher (
  Schulform nvarchar(2) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  BG nvarchar(2) NOT NULL, 
  Fach nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(80) NOT NULL, 
  KZ_Bereich int DEFAULT 0, 
  Flag nvarchar(1) DEFAULT '1', 
  Sortierung int DEFAULT 0, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulFaecher PRIMARY KEY (Bezeichnung, BG, Fach, Flag, FSP, Schulform)
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
  CONSTRAINT PK_Statkue_ZulJahrgaenge PRIMARY KEY (ID)
);


CREATE TABLE Statkue_ZulKlArt (
  KlArt nvarchar(2) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  Bezeichnung nvarchar(100) NOT NULL, 
  Schulform nvarchar(2) NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulKlArt PRIMARY KEY (Bezeichnung, FSP, KlArt, Schulform)
);


CREATE TABLE Statkue_ZulKuArt (
  SF nvarchar(2) NOT NULL, 
  FSP nvarchar(2) NOT NULL, 
  BG nvarchar(2) NOT NULL, 
  Kursart nvarchar(3) NOT NULL, 
  Kursart2 nvarchar(5) NOT NULL, 
  Bezeichnung nvarchar(120) NOT NULL, 
  JgBereich int DEFAULT 0 NOT NULL, 
  Flag nvarchar(1) DEFAULT '1' NOT NULL, 
  geaendert datetime2,
  CONSTRAINT PK_Statkue_ZulKuArt PRIMARY KEY (Bezeichnung, BG, Flag, FSP, JgBereich, Kursart, Kursart2, SF)
);


CREATE TABLE Stundenplan (
  ID bigint DEFAULT -1 NOT NULL, 
  Schuljahr int NOT NULL, 
  SchuljahrAbschnitt int NOT NULL, 
  Beginn date DEFAULT '1899-01-01' NOT NULL, 
  Ende date, 
  Beschreibung nvarchar(1000) NOT NULL,
  CONSTRAINT PK_Stundenplan PRIMARY KEY (ID)
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
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsichtsbereiche_FK FOREIGN KEY (Aufsichtsbereich_ID) REFERENCES Stundenplan_Aufsichtsbereiche(ID),
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


CREATE TABLE Stundentafel (
  ID bigint DEFAULT -1 NOT NULL, 
  Bezeichnung nvarchar(50) NOT NULL, 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2), 
  Klasse nvarchar(6), 
  SGL nvarchar(3), 
  Fachklasse_ID bigint, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int, 
  Sortierung int DEFAULT 32000,
  CONSTRAINT PK_Stundentafel PRIMARY KEY (ID)
);


CREATE TABLE Stundentafel_Faecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Stundentafel_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  KursartAllg nvarchar(5), 
  WochenStd smallint, 
  LehrerKrz nvarchar(10), 
  EpochenUnterricht nvarchar(1) DEFAULT '-', 
  Sortierung int DEFAULT 32000, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  SchulNrEigner int,
  CONSTRAINT PK_Stundentafel_Faecher PRIMARY KEY (ID),
  CONSTRAINT StundentafelFaecher_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT StundentafelFaecher_Stdtafel_FK FOREIGN KEY (Stundentafel_ID) REFERENCES Stundentafel(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundentafel_Faecher_UC1 UNIQUE (Stundentafel_ID, Fach_ID)
);


CREATE TABLE TextExportVorlagen (
  SchulNrEigner int NOT NULL, 
  VorlageName nvarchar(50) NOT NULL, 
  Daten nvarchar(max),
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (SchulNrEigner, VorlageName)
);


CREATE TABLE Usergroups (
  UG_ID bigint NOT NULL, 
  UG_Bezeichnung nvarchar(64), 
  UG_Kompetenzen nvarchar(255), 
  UG_Nr int, 
  SchulNrEigner int,
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
  SchulNrEigner int, 
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


CREATE TABLE SVWS_Client_Konfiguration_Benutzer (
  Benutzer_ID bigint NOT NULL, 
  AppName nvarchar(100) NOT NULL, 
  Schluessel nvarchar(255) NOT NULL, 
  Wert nvarchar(max) NOT NULL,
  CONSTRAINT PK_SVWS_Client_Konfiguration_Benutzer PRIMARY KEY (Benutzer_ID, AppName, Schluessel),
  CONSTRAINT SVWSClientKonfigurationBenutzer_Users_FK FOREIGN KEY (Benutzer_ID) REFERENCES Users(ID) ON UPDATE CASCADE ON DELETE CASCADE
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
  SchulNrEigner int, 
  AdrMerkmal nvarchar(1) DEFAULT 'A', 
  WebNotenGesperrt nvarchar(1) DEFAULT '-', 
  KoopKlasse nvarchar(1) DEFAULT '-', 
  Ankreuzzeugnisse nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_Versetzung PRIMARY KEY (ID),
  CONSTRAINT Versetzung_Lehrer_FK FOREIGN KEY (KlassenlehrerKrz) REFERENCES K_Lehrer(Kuerzel),
  CONSTRAINT Versetzung_UC1 UNIQUE (Klasse)
);


CREATE TABLE EigeneSchule_Abt_Kl (
  ID bigint DEFAULT -1 NOT NULL, 
  Abteilung_ID bigint NOT NULL, 
  Klasse nvarchar(15) NOT NULL, 
  Sichtbar nvarchar(1) DEFAULT '+', 
  SchulNrEigner int,
  CONSTRAINT PK_EigeneSchule_Abt_Kl PRIMARY KEY (ID),
  CONSTRAINT EigeneSchuleAbtKl_Abteilung_FK FOREIGN KEY (Abteilung_ID) REFERENCES EigeneSchule_Abteilungen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT EigeneSchuleAbtKl_Klasse_FK FOREIGN KEY (Klasse) REFERENCES Versetzung(Klasse) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Schueler (
  ID bigint DEFAULT -1 NOT NULL, 
  GU_ID nvarchar(40), 
  SrcID int, 
  IDext nvarchar(30), 
  Status int, 
  Name nvarchar(60), 
  Vorname nvarchar(60), 
  Zusatz nvarchar(255), 
  Geburtsname nvarchar(60), 
  Strasse nvarchar(50), 
  Ort_ID bigint, 
  PLZ nvarchar(10), 
  OrtAbk nvarchar(50), 
  Ortsteil_ID bigint, 
  Telefon nvarchar(20), 
  Email nvarchar(100), 
  Fax nvarchar(20), 
  AktSchuljahr smallint, 
  AktAbschnitt smallint, 
  Klasse nvarchar(15), 
  Jahrgang smallint, 
  PruefOrdnung nvarchar(20), 
  Geburtsdatum date, 
  Geburtsort nvarchar(100), 
  Volljaehrig nvarchar(1) DEFAULT '-', 
  Geschlecht smallint, 
  StaatKrz nvarchar(3), 
  StaatKrz2 nvarchar(3), 
  StaatAbk nvarchar(50), 
  Aussiedler nvarchar(1) DEFAULT '-', 
  Religion_ID bigint, 
  ReligionAbk nvarchar(30), 
  Religionsabmeldung date, 
  Religionsanmeldung date, 
  Bafoeg nvarchar(1) DEFAULT '-', 
  Schwerbehinderung nvarchar(1) DEFAULT '-', 
  Foerderschwerpunkt_ID bigint, 
  Sportbefreiung_ID bigint, 
  Fahrschueler_ID bigint, 
  Haltestelle_ID bigint, 
  HaltestelleAbk nvarchar(30), 
  ASDSchulform nvarchar(3), 
  Jahrgang_ID bigint, 
  ASDJahrgang nvarchar(2), 
  Fachklasse_ID bigint, 
  SchulpflichtErf nvarchar(1) DEFAULT '-', 
  Anschreibdatum date, 
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
  RefPaed nvarchar(1) DEFAULT '-', 
  KeineAuskunft nvarchar(1) DEFAULT '-', 
  Lehrer nvarchar(10), 
  Beruf nvarchar(100), 
  AbschlussDatum nvarchar(15), 
  Bemerkungen nvarchar(max), 
  BeginnBildungsgang date, 
  Durchschnitt nvarchar(4), 
  OrgFormKrz nvarchar(1), 
  Klassenart nvarchar(2), 
  DurchschnittsNote nvarchar(4), 
  LSSGL nvarchar(5), 
  LSSchulform nvarchar(2), 
  KonfDruck nvarchar(1) DEFAULT '+', 
  DSN_Text nvarchar(15), 
  Berufsabschluss nvarchar(1), 
  Schwerpunkt_ID bigint, 
  LSSGL_SIM nvarchar(3), 
  BerufsschulpflErf nvarchar(1) DEFAULT '-', 
  StatusNSJ int, 
  FachklasseNSJ_ID bigint, 
  BuchKonto float, 
  VerkehrsspracheFamilie nvarchar(2), 
  JahrZuzug int, 
  DauerKindergartenbesuch nvarchar(1), 
  VerpflichtungSprachfoerderkurs nvarchar(1) DEFAULT '-', 
  TeilnahmeSprachfoerderkurs nvarchar(1) DEFAULT '-', 
  SchulbuchgeldBefreit nvarchar(1) DEFAULT '-', 
  Autist nvarchar(1) DEFAULT '-', 
  GeburtslandSchueler nvarchar(10), 
  GeburtslandVater nvarchar(10), 
  GeburtslandMutter nvarchar(10), 
  Uebergangsempfehlung_JG5 nvarchar(10), 
  ErsteSchulform_SI nvarchar(10), 
  JahrWechsel_SI int, 
  JahrWechsel_SII int, 
  Migrationshintergrund nvarchar(1) DEFAULT '-', 
  Foerderschwerpunkt2_ID bigint, 
  SortierungKlasse int, 
  ExterneSchulNr nvarchar(6), 
  Kindergarten_ID bigint, 
  LetzterBerufsAbschluss nvarchar(10), 
  LetzterAllgAbschluss nvarchar(10), 
  Land nvarchar(2), 
  AV_Leist int, 
  AV_Zuv int, 
  AV_Selbst int, 
  SV_Verant int, 
  SV_Konfl int, 
  SV_Koop int, 
  Duplikat nvarchar(1) DEFAULT '-', 
  EinschulungsartASD nvarchar(2), 
  HausNr nvarchar(10), 
  Strassenname nvarchar(50), 
  SchulNrEigner int, 
  BilingualerZweig nvarchar(1), 
  DurchschnittsnoteFHR nvarchar(4), 
  DSN_FHR_Text nvarchar(15), 
  Eigenanteil float, 
  StaatAbk2 nvarchar(50), 
  ZustimmungFoto nvarchar(1) DEFAULT '-', 
  BKAZVO int, 
  HatBerufsausbildung nvarchar(1) DEFAULT '-', 
  Ausweisnummer nvarchar(30), 
  AOSF nvarchar(1) DEFAULT '-', 
  EPJahre int DEFAULT 2, 
  LSBemerkung nvarchar(255), 
  WechselBestaetigt nvarchar(1) DEFAULT '-', 
  DauerBildungsgang int, 
  AnmeldeDatum date, 
  MeisterBafoeg nvarchar(1) DEFAULT '-', 
  OnlineAnmeldung nvarchar(1) DEFAULT '-', 
  Dokumentenverzeichnis nvarchar(255), 
  Berufsqualifikation nvarchar(100), 
  HausNrZusatz nvarchar(30), 
  ZieldifferentesLernen nvarchar(1) DEFAULT '-', 
  ZusatzNachname nvarchar(30), 
  EndeEingliederung date, 
  SchulEmail nvarchar(100), 
  EndeAnschlussfoerderung date, 
  MasernImpfnachweis nvarchar(1) DEFAULT '-', 
  Lernstandsbericht nvarchar(1) DEFAULT '-', 
  SprachfoerderungVon date, 
  SprachfoerderungBis date,
  CONSTRAINT PK_Schueler PRIMARY KEY (ID),
  CONSTRAINT Schueler_Einschulungsart_FK FOREIGN KEY (Einschulungsart_ID) REFERENCES K_EinschulungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Fahrschueler_FK FOREIGN KEY (Fahrschueler_ID) REFERENCES K_FahrschuelerArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Haltestelle_FK FOREIGN KEY (Haltestelle_ID) REFERENCES K_Haltestelle(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Versetzung_FK FOREIGN KEY (Klasse) REFERENCES Versetzung(Klasse) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ort_PLZ_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Religion_FK FOREIGN KEY (Religion_ID) REFERENCES K_Religion(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Sportbefreiung_FK FOREIGN KEY (Sportbefreiung_ID) REFERENCES K_Sportbefreiung(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Schueler_Statkue_Nationalitaeten_FK FOREIGN KEY (StaatKrz) REFERENCES Statkue_Nationalitaeten(Schluessel),
  CONSTRAINT Schueler_UC1 UNIQUE (GU_ID)
);


CREATE TABLE Stundenplan_Unterricht (
  ID bigint DEFAULT -1 NOT NULL, 
  Zeitraster_ID bigint NOT NULL, 
  Wochentyp int DEFAULT 0 NOT NULL, 
  Klasse_ID bigint, 
  Kurs_ID bigint, 
  Fach_ID bigint NOT NULL,
  CONSTRAINT PK_Stundenplan_Unterricht PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Unterricht_Versetzung_FK FOREIGN KEY (Klasse_ID) REFERENCES Versetzung(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_EigeneSchule_Faecher_FK FOREIGN KEY (Kurs_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Stundenplan_Unterricht_Stundenplan_Zeitraster_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Stundenplan_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_UC1 UNIQUE (Zeitraster_ID, Klasse_ID, Kurs_ID)
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
  SchulNrEigner int,
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
  Fachlehrer nvarchar(10), 
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
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerAbiFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerAbitur (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  FA_Fach nvarchar(130), 
  FA_Punkte int, 
  FehlStd int, 
  uFehlStd int, 
  Latinum nvarchar(1) DEFAULT '-', 
  KlLatinum nvarchar(1) DEFAULT '-', 
  Graecum nvarchar(1) DEFAULT '-', 
  Hebraicum nvarchar(1) DEFAULT '-', 
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
  Jahr int, 
  Abschnitt int, 
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
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerAbitur PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbitur_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbitur_UC1 UNIQUE (Schueler_ID)
);


CREATE TABLE SchuelerAnkreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Floskel_ID bigint NOT NULL, 
  Stufe1 nvarchar(1) DEFAULT '-', 
  Stufe2 nvarchar(1) DEFAULT '-', 
  Stufe3 nvarchar(1) DEFAULT '-', 
  Stufe4 nvarchar(1) DEFAULT '-', 
  Stufe5 nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerAnkreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT SchuelerAKF_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKAbschluss (
  Schueler_ID bigint NOT NULL, 
  Zulassung nchar(1), 
  Bestanden nchar(1), 
  Zeugnis nchar(1), 
  ZertifikatBK nchar(1), 
  ZulassungErwBK nchar(1), 
  BestandenErwBK nchar(1), 
  ZulassungBA nchar(1), 
  BestandenBA nchar(1), 
  PraktPrfNote nvarchar(2), 
  NoteKolloquium nvarchar(2), 
  ThemaAbschlussarbeit nvarchar(max), 
  SchulNrEigner int, 
  BAP_Vorhanden nvarchar(1), 
  NoteFachpraxis nvarchar(2), 
  FachPraktAnteilAusr nvarchar(1), 
  Jahr int, 
  Abschnitt int,
  CONSTRAINT PK_SchuelerBKAbschluss PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerBKAbschl_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerBKFaecher (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
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
  SchulNrEigner int, 
  Fachlehrer nvarchar(10), 
  NoteAbschlussBA nvarchar(2), 
  Kursart nvarchar(5), 
  Jahr int, 
  Abschnitt int,
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL, 
  Datenschutz_ID bigint NOT NULL, 
  Status nvarchar(1) DEFAULT '-' NOT NULL, 
  SchulNrEigner int NOT NULL,
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
  Name1 nvarchar(50), 
  Vorname1 nvarchar(50), 
  Anrede2 nvarchar(20), 
  Titel2 nvarchar(10), 
  Name2 nvarchar(50), 
  Vorname2 nvarchar(50), 
  ErzStrasse nvarchar(50), 
  ErzOrt_ID bigint, 
  ErzPLZ nvarchar(10), 
  ErzOrtsteil_ID bigint, 
  ErzAnschreiben nvarchar(1) DEFAULT '+', 
  ErzBemerkung nvarchar(255), 
  Sortierung int, 
  ErzEmail nvarchar(100), 
  ErzAdrZusatz nvarchar(50), 
  SchulNrEigner int, 
  Erz1StaatKrz nvarchar(3), 
  Erz2StaatKrz nvarchar(3), 
  ErzEmail2 nvarchar(100), 
  Erz1ZusatzNachname nvarchar(30), 
  Erz2ZusatzNachname nvarchar(30), 
  Bemerkungen nvarchar(max),
  CONSTRAINT PK_SchuelerErzAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzAdr_ErzieherArt_FK FOREIGN KEY (ErzieherArt_ID) REFERENCES K_ErzieherArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ort_FK FOREIGN KEY (ErzOrt_ID) REFERENCES K_Ort(ID),
  CONSTRAINT SchuelerErzAdr_Ortsteil_FK FOREIGN KEY (ErzOrtsteil_ID) REFERENCES K_Ortsteil(ID),
  CONSTRAINT SchuelerErzAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
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
  SchulNrEigner int,
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
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerFHRFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHRFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFoerderempfehlungen (
  GU_ID nvarchar(40) NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  DatumAngelegt date DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Klasse nvarchar(15), 
  Jahr int, 
  Abschnitt int, 
  Fach_ID bigint, 
  Lehrer_ID bigint, 
  DatumAenderungSchild datetime2, 
  DatumAenderungSchildWeb datetime2, 
  Kurs nvarchar(20), 
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
  Leistung_ID bigint, 
  Kurs_ID bigint, 
  EingabeFertig nvarchar(1) DEFAULT '-', 
  Faecher nvarchar(255), 
  Abgeschlossen nvarchar(1) DEFAULT '-',
  CONSTRAINT PK_SchuelerFoerderempfehlungen PRIMARY KEY (GU_ID),
  CONSTRAINT SchuelerFE_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFotos (
  Schueler_ID bigint NOT NULL, 
  Foto varbinary(max), 
  FotoBase64 nvarchar(max), 
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerFotos PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerFotos_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerKAoADaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Jahr int NOT NULL, 
  Abschnitt int NOT NULL, 
  Jahrgang nvarchar(2), 
  Kategorie nvarchar(10), 
  Merkmal nvarchar(20), 
  Zusatzmerkmal nvarchar(20), 
  Anschlussoption nvarchar(10), 
  Berufsfeld nvarchar(10), 
  SBO_Ebene4 nvarchar(20), 
  KategorieID bigint NOT NULL, 
  MerkmalID bigint, 
  ZusatzmerkmalID bigint, 
  AnschlussoptionID bigint, 
  BerufsfeldID bigint, 
  SBO_Ebene4ID bigint, 
  Bemerkung nvarchar(255),
  CONSTRAINT PK_SchuelerKAoADaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerKAoADaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Kategorie_FK FOREIGN KEY (KategorieID) REFERENCES Schildintern_KAoA_Kategorie(ID),
  CONSTRAINT SchuelerKAoADaten_Merkmal_FK FOREIGN KEY (MerkmalID) REFERENCES Schildintern_KAoA_Merkmal(ID),
  CONSTRAINT SchuelerKAoADaten_Zusatzmerkmal_FK FOREIGN KEY (ZusatzmerkmalID) REFERENCES Schildintern_KAoA_Zusatzmerkmal(ID),
  CONSTRAINT SchuelerKAoADaten_Anschlussoption_FK FOREIGN KEY (AnschlussoptionID) REFERENCES Schildintern_KAoA_Anschlussoption(ID),
  CONSTRAINT SchuelerKAoADaten_Berufsfeld_FK FOREIGN KEY (BerufsfeldID) REFERENCES Schildintern_KAoA_Berufsfeld(ID),
  CONSTRAINT SchuelerKAoADaten_SBO_Ebene4_FK FOREIGN KEY (SBO_Ebene4ID) REFERENCES Schildintern_KAoA_SBO_Ebene4(ID)
);


CREATE TABLE SchuelerLernabschnittsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Jahr smallint NOT NULL, 
  Abschnitt smallint NOT NULL, 
  Bildungsgang nvarchar(1) NOT NULL, 
  WechselNr smallint NOT NULL, 
  Jahrgang smallint, 
  Hochrechnung int, 
  SemesterWertung nvarchar(1) DEFAULT '+', 
  PruefOrdnung nvarchar(20), 
  Klasse nvarchar(15), 
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
  KlassenLehrer nvarchar(10), 
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
  Folgeklasse nvarchar(15), 
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
  KN_Lehrer nvarchar(10), 
  SchulNrEigner int, 
  StvKlassenlehrer_ID bigint, 
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
  CONSTRAINT PK_SchuelerLernabschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLernabschnittsdaten_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Foerderschwerpunkt_FK FOREIGN KEY (Foerderschwerpunkt_ID) REFERENCES K_Foerderschwerpunkt(ID),
  CONSTRAINT SchuelerLernabschnittsdaten_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLernabschnittsdaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernabschnittsdaten_UC1 UNIQUE (Schueler_ID, Jahr, Abschnitt, Bildungsgang, WechselNr)
);


CREATE TABLE SchuelerListe_Inhalt (
  Liste_ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerListe_Inhalt PRIMARY KEY (Liste_ID, Schueler_ID),
  CONSTRAINT SchuelerListeInhalt_Liste_FK FOREIGN KEY (Liste_ID) REFERENCES SchuelerListe(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerListeInhalt_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerMerkmale (
  ID bigint NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Kurztext nvarchar(10), 
  SchulNrEigner int, 
  DatumVon date, 
  DatumBis date,
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerMerkmale_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerSprachenfolge (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  JahrgangVon smallint, 
  JahrgangBis smallint, 
  Reihenfolge nvarchar(1), 
  AbschnittVon smallint, 
  AbschnittBis smallint, 
  SchulNrEigner int, 
  Referenzniveau nvarchar(5),
  CONSTRAINT PK_SchuelerSprachenfolge PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachenfolge_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_UC1 UNIQUE (Schueler_ID, Fach_ID)
);


CREATE TABLE SchuelerTelefone (
  ID bigint DEFAULT -1 NOT NULL, 
  Schueler_ID bigint NOT NULL, 
  TelefonArt_ID bigint, 
  Telefonnummer nvarchar(20), 
  Bemerkung nvarchar(50), 
  Sortierung int DEFAULT 32000, 
  SchulNrEigner int, 
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
  SchulNrEigner int, 
  AngelegtVon nvarchar(20), 
  GeaendertVon nvarchar(20),
  CONSTRAINT PK_SchuelerVermerke PRIMARY KEY (ID),
  CONSTRAINT SchuelerVermerke_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerVermerke_VermerkArt_FK FOREIGN KEY (VermerkArt_ID) REFERENCES K_Vermerkart(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX SchuelerVermerke_IDX1 ON SchuelerVermerke(Schueler_ID);


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
  SchulNrEigner int,
  CONSTRAINT PK_Schueler_AllgAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerAllgAdr_Adresse_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Ansprech_FK FOREIGN KEY (Ansprechpartner_ID) REFERENCES AllgAdrAnsprechpartner(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Beschaeftigungsart_FK FOREIGN KEY (Vertragsart_ID) REFERENCES K_BeschaeftigungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE INDEX Schueler_AllgAdr_IDX1 ON Schueler_AllgAdr(Schueler_ID);


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
  CONSTRAINT Stundenplan_UnterrichtRaum_Raeume_FK FOREIGN KEY (Raum_ID) REFERENCES Stundenplan_Raeume(ID),
  CONSTRAINT Stundenplan_UnterrichtRaum_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_UC1 UNIQUE (Unterricht_ID, Raum_ID)
);


CREATE TABLE SchuelerErzFunktion (
  ID bigint DEFAULT -1 NOT NULL, 
  Erzieher_ID bigint NOT NULL, 
  Funktion_ID bigint NOT NULL, 
  Person smallint, 
  Klasse nvarchar(10), 
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerErzFunktion PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzFunktion_Erzieher_FK FOREIGN KEY (Erzieher_ID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerErzFunktion_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_ErzieherFunktion(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerFehlstunden (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Datum date DEFAULT CURRENT_TIMESTAMP NOT NULL, 
  Fach_ID bigint, 
  FehlStd float NOT NULL, 
  VonStd int, 
  BisStd int, 
  Entschuldigt nvarchar(1) DEFAULT '-', 
  Lehrer_ID bigint,
  CONSTRAINT PK_SchuelerFehlstunden PRIMARY KEY (ID),
  CONSTRAINT SchuelerFehlstunden_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE SchuelerLD_PSFachBem (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  ASV nvarchar(max), 
  LELS nvarchar(max), 
  ESF nvarchar(max), 
  BemerkungFSP nvarchar(max), 
  BemerkungVersetzung nvarchar(max), 
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerLD_PSFachBem PRIMARY KEY (ID),
  CONSTRAINT SchuelerLD_PSFachBem_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLD_PSFachBem_UC1 UNIQUE (Abschnitt_ID)
);


CREATE TABLE SchuelerLeistungsdaten (
  ID bigint DEFAULT -1 NOT NULL, 
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Hochrechnung int, 
  Fachlehrer nvarchar(10), 
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
  Zusatzkraft nvarchar(10), 
  WochenstdZusatzkraft int, 
  Prf10Fach nvarchar(1) DEFAULT '-', 
  AufZeugnis nvarchar(1) DEFAULT '+', 
  Gewichtung int DEFAULT 1, 
  SchulNrEigner int, 
  NoteAbschlussBA nvarchar(2), 
  Umfang nvarchar(1),
  CONSTRAINT PK_SchuelerLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLeistungsdaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_FK FOREIGN KEY (Fachlehrer) REFERENCES K_Lehrer(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_UC1 UNIQUE (Abschnitt_ID, Fach_ID, Fachlehrer, Kursart, Kurs_ID)
);

CREATE INDEX SchuelerLeistungsdaten_IDX1 ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX2 ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX3 ON SchuelerLeistungsdaten(Fachlehrer);


CREATE TABLE SchuelerZuweisungen (
  Abschnitt_ID bigint NOT NULL, 
  Fach_ID bigint NOT NULL, 
  Kursart nvarchar(5), 
  SchulNrEigner int,
  CONSTRAINT PK_SchuelerZuweisungen PRIMARY KEY (Abschnitt_ID, Fach_ID),
  CONSTRAINT Zuweisungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ZuordnungReportvorlagen (
  ID bigint DEFAULT -1 NOT NULL, 
  SchulNrEigner int NOT NULL, 
  Jahrgang_ID bigint NOT NULL, 
  Abschluss nvarchar(50), 
  AbschlussBB nvarchar(50), 
  AbschlussArt int, 
  VersetzungKrz nvarchar(2), 
  Fachklasse_ID bigint, 
  Reportvorlage nvarchar(255), 
  Beschreibung nvarchar(255), 
  Gruppe nvarchar(50), 
  Zeugnisart nvarchar(5),
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


CREATE TRIGGER t_AutoIncrement_INSERT_K42_KursSchienen ON K42_KursSchienen INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K42_KursSchienen
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K42_KursSchienen');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K42_KursSchienen);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K42_KursSchienen', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K42_KursSchienen
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K42_KursSchienen';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K42_KursSchienen ON K42_KursSchienen AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K42_KursSchienen');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K42_KursSchienen);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K42_KursSchienen', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K42_KursSchienen';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K42_KursTeilnehmer ON K42_KursTeilnehmer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K42_KursTeilnehmer
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K42_KursTeilnehmer');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K42_KursTeilnehmer);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K42_KursTeilnehmer', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K42_KursTeilnehmer
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K42_KursTeilnehmer';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K42_KursTeilnehmer ON K42_KursTeilnehmer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K42_KursTeilnehmer');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K42_KursTeilnehmer);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K42_KursTeilnehmer', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K42_KursTeilnehmer';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_K42_SchienenKurse ON K42_SchienenKurse INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K42_SchienenKurse
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K42_SchienenKurse');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K42_SchienenKurse);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K42_SchienenKurse', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K42_SchienenKurse
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K42_SchienenKurse';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K42_SchienenKurse ON K42_SchienenKurse AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K42_SchienenKurse');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K42_SchienenKurse);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K42_SchienenKurse', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K42_SchienenKurse';
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


CREATE TRIGGER t_AutoIncrement_INSERT_K_Textdateien ON K_Textdateien INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO K_Textdateien
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Textdateien');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM K_Textdateien);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Textdateien', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO K_Textdateien
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Textdateien';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_K_Textdateien ON K_Textdateien AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'K_Textdateien');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM K_Textdateien);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Textdateien', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'K_Textdateien';
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


CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Aufsichtsbereich ON Katalog_Aufsichtsbereich INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Katalog_Aufsichtsbereich
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Aufsichtsbereich');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Aufsichtsbereich);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Aufsichtsbereich', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Katalog_Aufsichtsbereich
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Aufsichtsbereich';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Aufsichtsbereich ON Katalog_Aufsichtsbereich AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Aufsichtsbereich');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Aufsichtsbereich);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Aufsichtsbereich', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Aufsichtsbereich';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Pausenzeiten ON Katalog_Pausenzeiten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Katalog_Pausenzeiten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Pausenzeiten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Pausenzeiten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Pausenzeiten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Katalog_Pausenzeiten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Pausenzeiten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Pausenzeiten ON Katalog_Pausenzeiten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Pausenzeiten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Pausenzeiten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Pausenzeiten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Pausenzeiten';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Raeume ON Katalog_Raeume INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Katalog_Raeume
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Raeume');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Raeume);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Raeume', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Katalog_Raeume
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Raeume';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Raeume ON Katalog_Raeume AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Raeume');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Raeume);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Raeume', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Raeume';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Zeitraster ON Katalog_Zeitraster INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Katalog_Zeitraster
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Zeitraster');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Katalog_Zeitraster);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Zeitraster', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Katalog_Zeitraster
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Zeitraster';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Zeitraster ON Katalog_Zeitraster AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Katalog_Zeitraster');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Katalog_Zeitraster);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Zeitraster', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Katalog_Zeitraster';
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


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan ON Stundenplan INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan ON Stundenplan AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Aufsichtsbereiche ON Stundenplan_Aufsichtsbereiche INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_Aufsichtsbereiche
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Aufsichtsbereiche');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Aufsichtsbereiche);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Aufsichtsbereiche', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_Aufsichtsbereiche
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Aufsichtsbereiche';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Aufsichtsbereiche ON Stundenplan_Aufsichtsbereiche AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Aufsichtsbereiche');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Aufsichtsbereiche);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Aufsichtsbereiche', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Aufsichtsbereiche';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenzeit ON Stundenplan_Pausenzeit INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_Pausenzeit
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Pausenzeit');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenzeit);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenzeit', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_Pausenzeit
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Pausenzeit';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenzeit ON Stundenplan_Pausenzeit AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Pausenzeit');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenzeit);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenzeit', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Pausenzeit';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenaufsichten ON Stundenplan_Pausenaufsichten INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_Pausenaufsichten
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Pausenaufsichten');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenaufsichten);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenaufsichten', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_Pausenaufsichten
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Pausenaufsichten';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenaufsichten ON Stundenplan_Pausenaufsichten AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Pausenaufsichten');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Pausenaufsichten);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenaufsichten', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Pausenaufsichten';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_PausenaufsichtenBereich ON Stundenplan_PausenaufsichtenBereich INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_PausenaufsichtenBereich
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_PausenaufsichtenBereich');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_PausenaufsichtenBereich);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_PausenaufsichtenBereich', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_PausenaufsichtenBereich
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_PausenaufsichtenBereich';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_PausenaufsichtenBereich ON Stundenplan_PausenaufsichtenBereich AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_PausenaufsichtenBereich');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_PausenaufsichtenBereich);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_PausenaufsichtenBereich', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_PausenaufsichtenBereich';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Raeume ON Stundenplan_Raeume INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_Raeume
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Raeume');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Raeume);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Raeume', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_Raeume
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Raeume';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Raeume ON Stundenplan_Raeume AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Raeume');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Raeume);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Raeume', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Raeume';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Zeitraster ON Stundenplan_Zeitraster INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_Zeitraster
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Zeitraster');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Zeitraster);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Zeitraster', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_Zeitraster
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Zeitraster';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Zeitraster ON Stundenplan_Zeitraster AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Zeitraster');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Zeitraster);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Zeitraster', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Zeitraster';
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


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Unterricht ON Stundenplan_Unterricht INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_Unterricht
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Unterricht');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_Unterricht);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Unterricht', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_Unterricht
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Unterricht';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Unterricht ON Stundenplan_Unterricht AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_Unterricht');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_Unterricht);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Unterricht', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_Unterricht';
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


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtLehrer ON Stundenplan_UnterrichtLehrer INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_UnterrichtLehrer
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_UnterrichtLehrer');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtLehrer);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtLehrer', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_UnterrichtLehrer
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_UnterrichtLehrer';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtLehrer ON Stundenplan_UnterrichtLehrer AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_UnterrichtLehrer');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtLehrer);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtLehrer', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_UnterrichtLehrer';
    END;
END;

GO


CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtRaum ON Stundenplan_UnterrichtRaum INSTEAD OF INSERT AS
BEGIN
  DECLARE @tmpID bigint
  DECLARE @maxInsertedID bigint

  SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
  INSERT INTO Stundenplan_UnterrichtRaum
    SELECT * FROM inserted WHERE ID >= 0;
    
  SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_UnterrichtRaum');
  IF (@tmpID IS NULL)
    BEGIN
      SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtRaum);
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = 0;
        END;
      SET NOCOUNT ON;
      INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtRaum', @tmpID);
      SET NOCOUNT OFF;
    END;
  
  IF ((SELECT count(*) FROM inserted WHERE ID < 0) > 0)
    BEGIN  
      SELECT * INTO #tmp FROM inserted WHERE ID < 0;
      UPDATE #tmp SET ID = @tmpID, @tmpID = @tmpID + 1;
      INSERT INTO Stundenplan_UnterrichtRaum
        SELECT * FROM #tmp;
      DROP TABLE #tmp;
    END;
  
  SET NOCOUNT ON;
  IF (@maxInsertedID > @tmpID)
    BEGIN
      SET @tmpID = @maxInsertedID;
	END;
  UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_UnterrichtRaum';
  SET NOCOUNT OFF;
END;

GO


CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtRaum ON Stundenplan_UnterrichtRaum AFTER UPDATE AS
BEGIN
  if (UPDATE(ID))
    BEGIN
      DECLARE @tmpID bigint
      DECLARE @maxInsertedID bigint

      SET @maxInsertedID = (SELECT max(ID) FROM inserted WHERE ID >= 0);
      SET @tmpID = (SELECT MaxID FROM SVWS_DB_AutoInkremente WHERE NameTabelle = 'Stundenplan_UnterrichtRaum');
      IF (@tmpID IS NULL)
        BEGIN
          SET @tmpID = (SELECT max(ID) FROM Stundenplan_UnterrichtRaum);
          IF (@tmpID IS NULL)
            BEGIN
              SET @tmpID = 0;
            END;
          INSERT INTO SVWS_DB_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtRaum', @tmpID);
        END;    
      IF (@maxInsertedID > @tmpID)
        BEGIN
          SET @tmpID = @maxInsertedID;
	      END;
      UPDATE SVWS_DB_AutoInkremente SET MaxID = @tmpID WHERE NameTabelle = 'Stundenplan_UnterrichtRaum';
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


INSERT INTO SVWS_DB_Version(Revision) VALUES (6);


INSERT INTO Users (ID,US_Name,US_LoginName,US_UserGroups,US_Privileges) VALUES (1,'Administrator','Admin','1;2;3;4;5','$');

INSERT INTO Usergroups(UG_ID, UG_Bezeichnung, UG_Kompetenzen, UG_Nr, SchulNrEigner) VALUES
(1, 'Administrator', '$', 1, 1),
(2, 'Lehrer', '11;21;22;81;31;61', 3, 1),
(3, 'Sekretariat', '11;12;13;14;21;81;82;83;31;32;33;34;91;92;93;94;95;61;62;71', 4, 1);
