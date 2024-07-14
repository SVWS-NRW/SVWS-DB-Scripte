CREATE TABLE AllgemeineMerkmaleKatalog_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das ASD-Kürzel des allgemeinen Merkmals bei Schulen und/oder Schülern',
  CONSTRAINT PK_AllgemeineMerkmaleKatalog_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte (ASD-Kürzel) für Fremdschlüssel zu den allgemeinen Merkmalen bei Schulen und Schülern';


CREATE TABLE Benutzergruppen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID der Benutzergruppe', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Die Bezeichnung der Benutzergruppe', 
  IstAdmin int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob die Benutzergruppe Administrator-Rechte hat (1) oder nicht (0)',
  CONSTRAINT PK_Benutzergruppen PRIMARY KEY (ID)
) COMMENT 'Die Definition von Benutzergruppen (Rollen). Diese dienen als Vorlage für die Rechtezuweisung an Benutzer.';


CREATE TABLE Berufskolleg_Anlagen (
  ID bigint NOT NULL COMMENT 'ID der Anlage', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Einstelliges Kürzel der Anlage (A,B,C,D,E,X,Z)', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Bezeichnung der Anlage', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_Berufskolleg_Anlagen PRIMARY KEY (ID),
  CONSTRAINT Berufskolleg_Anlagen_UC1 UNIQUE (Kuerzel)
) COMMENT 'Informationen Anlagen des Berufskollegs';


CREATE TABLE Berufskolleg_Berufsebenen1 (
  ID bigint NOT NULL COMMENT 'ID der Berufsebene ', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Kürzel der Berufsebene', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Bezeichnung der Berufsebene', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_Berufskolleg_Berufsebenen1 PRIMARY KEY (ID)
) COMMENT 'Informationen Berufsebenen der Ebene 1 des Berufskollegs';


CREATE TABLE Berufskolleg_Berufsebenen2 (
  ID bigint NOT NULL COMMENT 'ID der Berufsebene ', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Kürzel der Berufsebene', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Bezeichnung der Berufsebene', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_Berufskolleg_Berufsebenen2 PRIMARY KEY (ID)
) COMMENT 'Informationen Berufsebenen der Ebene 2 des Berufskollegs';


CREATE TABLE Berufskolleg_Berufsebenen3 (
  ID bigint NOT NULL COMMENT 'ID der Berufsebene ', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Kürzel der Berufsebene', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Bezeichnung der Berufsebene', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_Berufskolleg_Berufsebenen3 PRIMARY KEY (ID)
) COMMENT 'Informationen Berufsebenen der Ebene 3 des Berufskollegs';


CREATE TABLE Berufskolleg_Fachklassen_Keys (
  FachklassenIndex int NOT NULL COMMENT 'Der Index, welcher der Fachklasse für die Zuordnung zum Bildungsgang zugeordnet ist', 
  Schluessel varchar(3) NOT NULL COMMENT 'Der erste Teil des Fachklassenschlüssels (FKS, dreistellig) ', 
  Schluessel2 varchar(2) NOT NULL COMMENT 'Der zweite Teil des Fachklassenschlüssels (AP, zweistellig)',
  CONSTRAINT PK_Berufskolleg_Fachklassen_Keys PRIMARY KEY (FachklassenIndex, Schluessel, Schluessel2)
) COMMENT 'Die Schlüssel von Fachklassen des Berufskollegs - auch von mittlerweile ausgelaufenen Fachklassen';


CREATE TABLE Credentials (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datensatzes für die SVWS internen Account-Credentials', 
  Benutzername varchar(255) NOT NULL COMMENT 'Benutzername für den Credential-Datensatz', 
  BenutzernamePseudonym varchar(255) COMMENT 'Der pseudonymisierte Benutzername für den Credential-Datensatz', 
  Initialkennwort varchar(255) COMMENT 'Initialkennwort für den Credential-Datensatz', 
  PasswordHash varchar(255) COMMENT 'Passwordhash für den Credential-Datensatz', 
  RSAPublicKey longtext COMMENT 'RSAPublicKey für den Credential-Datensatz', 
  RSAPrivateKey longtext COMMENT 'RSAPrivateKey für den Credential-Datensatz', 
  AES longtext COMMENT 'AES-Schlüssel für den Credential-Datensatz',
  CONSTRAINT PK_Credentials PRIMARY KEY (ID),
  CONSTRAINT Credentials_UC1 UNIQUE (Benutzername)
) COMMENT 'Daten für die Zugänge zu SVWS internen Systemen für SingleSignOn-Lösungen';


CREATE TABLE BenutzerAllgemein (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID des allgemeinen Benutzers', 
  AnzeigeName varchar(255) COMMENT 'Der Anzeigename für den allgemeinen Benutzer', 
  CredentialID bigint COMMENT 'Die ID des Credential-Eintrags',
  CONSTRAINT PK_BenutzerAllgemein PRIMARY KEY (ID),
  CONSTRAINT BenutzerAllgemein_Credential_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Die Definition von Benutzern, welchen sich am Server anmelden können, aber nicht als Lehrer bzw. Personal, Schüler oder Erzieher erfasst sind';


CREATE TABLE EigeneSchule_Fachklassen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Fachklasse im schulinternen Katalog der Fachklassen nur BK und SBK', 
  BKIndex smallint COMMENT 'BKIndex aus der Statkue bildet mit FKS und AP eine eindeutige Kombination IT.NRW', 
  FKS varchar(3) COMMENT 'Fachklassenschlüssel bildet mit BKIndex und AP eine eindeutige Kombination IT.NRW', 
  AP varchar(2) COMMENT 'Laufende Nummer zum FKS bildet mit FKS und BKIndex eine eindeutige Kombination IT.NRW', 
  Bezeichnung varchar(100) COMMENT 'Bezeichnung der Fachklasse Text', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortiernummer der Fachklasse', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'steuert die Sichtbarkeit der Fachklasse', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Gibt an ob die Fachklasse änderbar ist', 
  Kennung varchar(10) COMMENT 'Kennung der Fachklasse', 
  FKS_AP_SIM varchar(5) COMMENT 'Kombination aus FKS und AP mit Minuszeichen', 
  BKIndexTyp varchar(3) COMMENT 'Typ des BKIndex IT.NW', 
  Beschreibung_W varchar(100) COMMENT 'Weiblicher Beschreibungstext für die Fachklassenbezeichnung', 
  Status varchar(20) COMMENT 'Status der Fachklasse kann auslaufend sein', 
  Lernfelder longtext COMMENT 'Text für die Lernfelder die zur Fachklasse auf dem Zeugnis ausgewiesen werden', 
  DQR_Niveau int COMMENT 'DQR-Niveau der Fachklasse Deutscher Qualitätsrahmen', 
  Ebene1Klartext varchar(255) COMMENT 'Berufsebene 1', 
  Ebene2Klartext varchar(255) COMMENT 'Berufsebene 2', 
  Ebene3Klartext varchar(255) COMMENT 'Berufsebene 3',
  CONSTRAINT PK_EigeneSchule_Fachklassen PRIMARY KEY (ID)
) COMMENT 'Berufskolleg: Tabelle der vorhandenen Fachklassen';


CREATE TABLE EigeneSchule_KAoADaten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des KAoA-Dateneintrags für die Schule', 
  Curriculum varchar(1) DEFAULT '+' NOT NULL COMMENT 'KAOA Curriculumsangaben', 
  Koordinator varchar(1) DEFAULT '+' NOT NULL COMMENT 'KAOA Koordinator', 
  Berufsorientierungsbuero varchar(1) DEFAULT '+' NOT NULL COMMENT 'Schule hat Beruforientierungsbüro', 
  KooperationsvereinbarungAA varchar(1) DEFAULT '+' NOT NULL COMMENT 'Kooperationsvereinbarung KAOA geschlossen', 
  NutzungReflexionsworkshop varchar(1) DEFAULT '+' NOT NULL COMMENT 'Reflexionsworkshops werden genutzt', 
  NutzungEntscheidungskompetenzI varchar(1) DEFAULT '+' NOT NULL COMMENT 'Nutzung der Entscheidungskompetenzen 1', 
  NutzungEntscheidungskompetenzII varchar(1) DEFAULT '+' NOT NULL COMMENT 'Nutzung der Entscheidungskompetenzen 2',
  CONSTRAINT PK_EigeneSchule_KAoADaten PRIMARY KEY (ID)
) COMMENT 'TODO: Tabelle zur Eintragung, welche KAOA-Merkmale an der Schule genutzt wreden';


CREATE TABLE EigeneSchule_Kursart (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Kursarteneintrag', 
  Bezeichnung varchar(120) COMMENT 'Bezeichnung des Kursarteneintrags IT.NRW', 
  InternBez varchar(20) COMMENT 'Interne Bezeichnung Kursarteneintrag', 
  Kursart varchar(10) COMMENT 'Kürzel Kursart', 
  KursartAllg varchar(10) COMMENT 'Allgemeine Bezeichnung Kursart (zB GK bei GKM)', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Kursart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der Kursart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Kursart änderbar Ja Nein',
  CONSTRAINT PK_EigeneSchule_Kursart PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Kursart_UC1 UNIQUE (Kursart, KursartAllg)
) COMMENT 'vorhandene Kursarten die dem Schüler zugewiesen werden können in den Leistungsdaten / Kursen';


CREATE TABLE EigeneSchule_Merkmale (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Merkmals das an der Schule vorhanden ist', 
  Schule varchar(1) DEFAULT '+' COMMENT 'Merkmal kann der Schule zugewiesen werden', 
  Schueler varchar(1) DEFAULT '+' COMMENT 'Merkmal kann auch einem einzelnen Schüler auf Individualdaten II zugewiesen werden', 
  Kurztext varchar(10) COMMENT 'Kurztext des Merkmals zB OGS', 
  Langtext varchar(100) COMMENT 'Langtext des Merkmal zB offener Ganztag',
  CONSTRAINT PK_EigeneSchule_Merkmale PRIMARY KEY (ID)
) COMMENT 'Katalog der Merkmale (Schule bearbeiten > Merkmale), die dem Schüler dann auf Individualdaten zugewiesen werden können (IT.NRW-Statistik)';


CREATE TABLE EigeneSchule_Schulformen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Schulgliederung', 
  SGL varchar(3) COMMENT 'Schulgliedererung die an der Schule vorkommt', 
  SF_SGL varchar(5) COMMENT 'Statistikkürzel SchulformSchulgliederung', 
  Schulform varchar(100) COMMENT 'Schulform der SGL', 
  DoppelQualifikation varchar(1) DEFAULT '-' COMMENT 'Gibt an, ob am Berufskolleg die SGL mit Doppelqualifikation abgeschlossen werden kann', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der SGL', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der SGL', 
  BKIndex int COMMENT 'BKIndex zur SGL (IT.NRW)', 
  Schulform2 varchar(100) COMMENT 'Schulform2 zur SGL',
  CONSTRAINT PK_EigeneSchule_Schulformen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schulformen_UC1 UNIQUE (SGL)
) COMMENT 'Liste der Schulgliederungen (SGL) Schule bearbeiten > Kann dann den Schülern unter Indv-Daten I zugeordnet werden (IT.NRW)';


CREATE TABLE EigeneSchule_Teilstandorte (
  AdrMerkmal varchar(1) NOT NULL COMMENT 'Adressmerkmal des Teilstandortes (A...Z)', 
  PLZ varchar(10) COMMENT 'Postleitzahl des Teilstandortes', 
  Ort varchar(50) COMMENT 'Ort des Teilstandortes', 
  Strassenname varchar(55) COMMENT 'Straßenname des Teilstandortes', 
  HausNr varchar(10) COMMENT 'Hausnummer des Teilstandortes', 
  HausNrZusatz varchar(30) COMMENT 'Hausnummerzusatz des Teilstandortes', 
  Bemerkung varchar(50) COMMENT 'Bemerkung zum Teilstandort (Text)', 
  Kuerzel varchar(30) COMMENT 'Kürzel des Teilstandortes',
  CONSTRAINT PK_EigeneSchule_Teilstandorte PRIMARY KEY (AdrMerkmal)
) COMMENT 'Liste der Teilstandorte Schule bearbeiten > Teilstandorte > (It.NRW benutzt dieses Merkmal zu Bildung von Teilklassen in der sim.txt)';


CREATE TABLE EigeneSchule_Texte (
  ID bigint NOT NULL COMMENT 'ID des Textes unter Schulverwaltung Eigene Schule bearbeiten', 
  Kuerzel varchar(50) COMMENT 'Kürzel des Schultextes', 
  Inhalt varchar(255) COMMENT 'Inhalt des Schultextes', 
  Beschreibung varchar(100) COMMENT 'Beschreibung des Schultextes', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Gibt an ob der Text änderbar ist',
  CONSTRAINT PK_EigeneSchule_Texte PRIMARY KEY (ID)
) COMMENT 'Texte, die unter Schule bearbeiten erstellt werden und in Reports abgerufen werden können.';


CREATE TABLE EigeneSchule_Zertifikate (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Zertifikats', 
  Kuerzel varchar(20) NOT NULL COMMENT 'Kürzel des Zertifikats', 
  Bezeichnung varchar(100) COMMENT 'Bezeichnung des Zertifikats', 
  Fach varchar(100) COMMENT 'Fachbezeichnung für das Zertifikat', 
  Formatvorlage varchar(255) COMMENT 'Formatforlage für das Zertifikat',
  CONSTRAINT PK_EigeneSchule_Zertifikate PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Zertifikate_UC1 UNIQUE (Kuerzel)
) COMMENT 'Liste von Zertifikaten, die angelegt werden können (nur BK)';


CREATE TABLE EinschulungsartKatalog_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Einschulungsart',
  CONSTRAINT PK_EinschulungsartKatalog_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den Einschulungsarten';


CREATE TABLE FachKatalog (
  ID bigint NOT NULL COMMENT 'ID des Faches', 
  KuerzelASD varchar(10) NOT NULL COMMENT 'Das eindeutige Kürzel des Faches entsprechend der Vorgaben der amtlichen Schulstatistik', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Die texttuelle Beschreibung des Faches', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Das atomare Kürzel des Faches (z.B. bei Fremdsprachen - für das Sprachenkürzel) - Teil des Kürzels für die amtliche Schulstatistik', 
  Aufgabenfeld int COMMENT 'Das Aufgabenfeld, welchem das Fach ggf. zugeordnet ist (1, 2 oder 3)', 
  Fachgruppe varchar(10) COMMENT 'Das Kürzel der zugeordneten Fachgruppe', 
  JahrgangAb varchar(10) COMMENT 'Der ASD-Jahrgang, ab dem das Fach zulässig ist (z.B. bei Fremdsprachen)', 
  IstFremdsprache int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich um ein Fach der Herkuntftsprache handelt (Unterrichts in der Herkunftssprache oder Herkunftssprache anstelle einer Pflichtfremdsprache)', 
  IstHKFS int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich um ein Fach der Herkuntftsprache handelt (Unterrichts in der Herkunftssprache oder Herkunftssprache anstelle einer Pflichtfremdsprache)', 
  IstAusRegUFach int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob das Fach außerhalb des regulären Fachunterichts unterrichtet wird', 
  IstErsatzPflichtFS int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich bei dem Fach um einen Ersatz für eine Pflichtfremdsprache handelt (siehe auch istHKFS)', 
  IstKonfKoop int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob das Religionsfach konfessionell kooperativ unterrichtet wird oder nicht - Teil des Kürzels für die amtliche Schulstatistik', 
  NurSII int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob das Fach nur in der Sekundarstufe II unterrichtet wird', 
  ExportASD int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob das Fach bei Export der amtlichen Schulstatistik berücksichtigt werden soll oder nicht', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_FachKatalog PRIMARY KEY (ID)
) COMMENT 'Eine Tabelle mit den zulässigen Fächern';


CREATE TABLE FachKatalog_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das ASD-Kürzel des Faches',
  CONSTRAINT PK_FachKatalog_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte (ASD-Kürzel) für Fremdschlüssel zu den zulässigen Fächern';


CREATE TABLE FachKatalog_Schulformen (
  Fach_ID bigint NOT NULL COMMENT 'die ID des Faches', 
  Schulform_Kuerzel varchar(10) NOT NULL COMMENT 'das Kürzel der Schulform', 
  Schulgliederung_Kuerzel varchar(10) NOT NULL COMMENT 'das Kürzel der Schulgliederung bzw. des Bildungsganges. Leerer String, falls alle Gliederungen der Schulform gemeint sind',
  CONSTRAINT PK_FachKatalog_Schulformen PRIMARY KEY (Fach_ID, Schulform_Kuerzel, Schulgliederung_Kuerzel)
) COMMENT 'Tabelle mit der Zuordnungen der erlaubten Schulformen bei den zulässigen Fächern';


CREATE TABLE Fach_Gliederungen (
  Fach_ID bigint NOT NULL COMMENT 'ID für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  Gliederung varchar(3) NOT NULL COMMENT 'SGL für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  Faechergruppe int COMMENT 'Fächergruppe für gliederungsbezogenen Einstellungen zum Fach (BK)', 
  GewichtungAB int COMMENT 'Gewichtung Allgemeinbildend für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  GewichtungBB int COMMENT 'Gewichtung Berufsbezogen für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  SchriftlichAB varchar(1) DEFAULT '-' COMMENT 'Ist schriftliches Fach Allgemeinbildend für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  SchriftlichBB varchar(1) DEFAULT '-' COMMENT 'Ist schriftliches Fach Berufsbildend für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  GymOSFach varchar(1) DEFAULT '-' COMMENT 'Ist Fach der GymOB für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  ZeugnisBez varchar(130) COMMENT 'Zeugnisbezeihnung für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  Lernfelder longtext COMMENT 'Lernfelder für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  Fachklasse_ID bigint DEFAULT 0 NOT NULL COMMENT 'Fachklassen ID für die gliederungsbezogenen Einstellungen zum Fach (BK)', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung dfür die gliederungsbezogenen Einstellungen zum Fach (BK)',
  CONSTRAINT PK_Fach_Gliederungen PRIMARY KEY (Fach_ID, Fachklasse_ID)
) COMMENT 'Gliederungsspezifische Einstellungen zu den Unterrichtsfächern (nur BK)';


CREATE TABLE Fachgruppen (
  ID bigint NOT NULL COMMENT 'ID des Fachgruppen-Core-Type, welcher auch ein Mapping zu den Fachgruppen von SchildNRW und Lupo bereitstellt', 
  Fachbereich int COMMENT 'Fachbereich (Nr) der Fachgruppe aus Lupo', 
  SchildFgID bigint COMMENT 'Fachgruppen ID aus SchildNRW', 
  FG_Bezeichnung varchar(80) NOT NULL COMMENT 'Bezeichnung der Fachgruppe', 
  FG_Kuerzel varchar(10) COMMENT 'Kürzel der Fachgruppe', 
  Schulformen varchar(255) COMMENT 'Gibt an in welchen Schulformen die Fachgruppe zulässig ist', 
  FarbeR int COMMENT 'Default-Fachgruppenfarbe (Rot-Wert)', 
  FarbeG int COMMENT 'Default-Fachgruppenfarbe (Grün-Wert)', 
  FarbeB int COMMENT 'Default-Fachgruppenfarbe (Blau-Wert)', 
  Sortierung int COMMENT 'Eine Standard-Sortierreihenfolge für die Fachgruppen', 
  FuerZeugnis int NOT NULL COMMENT 'Gibt an, ob die Fachgruppe für Unterteilungen auf Zeugnissen verwendet wird', 
  gueltigVon int COMMENT 'Das Schuljahr, ab dem die Fachgruppe eingeführt wurde', 
  gueltigBis int COMMENT 'Das Schuljahr, bis wann die Fachgruppe gültig ist',
  CONSTRAINT PK_Fachgruppen PRIMARY KEY (ID),
  CONSTRAINT Fachgruppen_UC1 UNIQUE (SchildFgID)
) COMMENT 'Tabelle für den Core-Type der Fachgruppen';


CREATE TABLE EigeneSchule_Faecher (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eindeutige ID zur Kennzeichnung des Fächer-Datensatzes', 
  FachKrz varchar(20) COMMENT 'Ein eindeutiges Kürzel zur Identifikation des Fach', 
  Bezeichnung varchar(255) COMMENT 'Die Bezeichnung des Faches', 
  ZeugnisBez varchar(255) COMMENT 'Die Bezeichnung des Faches auf einem Zeugnis', 
  UeZeugnisBez varchar(255) COMMENT 'Die Bezeichnung des Faches auf einem Überweisungszeugnis', 
  Zeugnisdatenquelle_ID bigint COMMENT 'Feld zum Festlegen der ID für die Zeugnisdatenquelle in Schild', 
  StatistikKrz varchar(2) COMMENT 'Das Statistik-Kürzel des Faches', 
  BasisFach varchar(1) DEFAULT '-' COMMENT 'Gibt an, ob das Fach in der Oberstufe unterrichtet wird', 
  IstSprache varchar(1) DEFAULT '-' COMMENT 'Gibt an, ob das Fach eine Fremdsprache ist', 
  Sortierung int DEFAULT 32000 COMMENT 'Gibt eine Sortierung für die Fächer vor', 
  SortierungS2 int DEFAULT 32000 COMMENT 'Gibt die spezielle Sortierung der Fächer für die Sekundarstufe II vor', 
  NachprErlaubt varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob in dem Fach eine Nachprüfung erlaubt ist.', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob der Datensatz in der Oberfläche sichtbar sein soll und bei einer Auswahl zur Verfügung steht. ', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob Änderungen am Datensatz erlaubt sind.', 
  Gewichtung smallint DEFAULT 1 COMMENT 'Gibt die Gewichtung des Faches im allgemeinbildenden Bereich am BK an, wenn keine gliederungsbezogenen Gewichtungen vergeben sind', 
  Unterichtssprache varchar(1) DEFAULT 'D' COMMENT 'Einstelliges Kürzel der Unterrichtssprache (E, F, …)', 
  IstSchriftlich varchar(1) DEFAULT '-' COMMENT 'gibt an, ob das Fach ein schritliches Fach für ZK ist oder nicht', 
  IstSchriftlichBA varchar(1) DEFAULT '-' COMMENT 'gibt an, ob ein Fach am BK für den beruflichen Abschluss schriftlich gewertet wird', 
  AufZeugnis varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob das Fach auf dem Zeugnis erscheinen soll', 
  Lernfelder longtext COMMENT 'speichert die Lernfeld-Texte zu den Fachklassen beim Unterrichtsfach am BK, ist von den Textfelder im Menü Fachklassen abgelöst worden, sollte nicht mehr genutzt werden', 
  LK_Moegl varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach als Leistungskurs belegt werden kann.', 
  Abi_Moegl varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach als drittes oder viertes Abiturfach belegt werden kann.', 
  E1 varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach im 1. Halbjahr der Einführungsphase belegt werden kann,', 
  E2 varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach im 2. Halbjahr der Einführungsphase belegt werden kann,', 
  Q1 varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach im 1. Halbjahr des 1. Jahres der Qualifikationsphase belegt werden kann,', 
  Q2 varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach im 2. Halbjahr des 1. Jahres der Qualifikationsphase belegt werden kann,', 
  Q3 varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach im 1. Halbjahr des 2. Jahres der Qualifikationsphase belegt werden kann,', 
  Q4 varchar(1) DEFAULT '+' COMMENT 'gibt an, ob das Fach im 2. Halbjahr des 2. Jahres der Qualifikationsphase belegt werden kann,', 
  AlsNeueFSInSII varchar(1) DEFAULT '-' COMMENT 'gibt an, ob das Fach als neue Fremdsprache in der Sekundarstufe zählt.', 
  Leitfach_ID bigint COMMENT 'bei Projektkursfächern: Die ID des Leitfaches', 
  Leitfach2_ID bigint COMMENT 'bei Projektkursfächern: Ggf. die ID des zweiten Leitfaches', 
  E1_WZE int COMMENT 'Beim WBK: Gibt die Anzahl der Wochenstunden für das 1. Halbjahr in der Einführungsphase an.', 
  E2_WZE int COMMENT 'Beim WBK: Gibt die Anzahl der Wochenstunden für das 2. Halbjahr in der Einführungsphase an.', 
  Q_WZE int COMMENT 'Beim WBK: Gibt die Anzahl der Wochenstunden für die Qualifikationsphase an.', 
  E1_S varchar(1) DEFAULT '-' COMMENT 'Beim WBK: Gibt an, ob das Fach in dem 1. Halbjahr der Einführungsphase schriftlich belegt werden muss', 
  E2_S varchar(1) DEFAULT '-' COMMENT 'Beim WBK: Gibt an, ob das Fach in dem 2. Halbjahr der Einführungsphase schriftlich belegt werden muss', 
  NurMuendlich varchar(1) DEFAULT '-' COMMENT 'Beim WBK: Gibt an, ob das Fach nur muendlich belegt werden darf', 
  Aufgabenfeld varchar(2) COMMENT 'Das Aufgabenfeld, zu welchem das Fach gehört', 
  AbgeschlFaecherHolen varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob das Fach bei der Operation „Abgeschlossene Fächer holen“ berücksichtigt werden soll.', 
  GewichtungFHR int COMMENT 'Gibt eine Gewichtung des Faches bei der Berechnung der FHR an.', 
  MaxBemZeichen int COMMENT 'steuert die max. Anzahl von Zeichen in der Memo-Feldern der Fachbezogenen Bemerkungen (insbes. Grundschulzeugnisse)',
  CONSTRAINT PK_EigeneSchule_Faecher PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Faecher_Zeugnisdatenquellen_FK FOREIGN KEY (Zeugnisdatenquelle_ID) REFERENCES Fachgruppen(SchildFgID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Faecher_UC1 UNIQUE (FachKrz)
) COMMENT 'Tabelle der vorhandenen Unterrichtsfächer und deren Bezeichnungen/ Einstellungen';


CREATE TABLE EigeneSchule_FachTeilleistungen (
  Teilleistung_ID bigint NOT NULL COMMENT 'Die eindeutige ID der Teilleistungsart – verweist auf die Teilleistungsart', 
  Fach_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Faches – verweist auf das Fach', 
  Kursart varchar(10) COMMENT 'Gibt an, bei welcher Kursart die Teilleistungsart zugeordnet werden soll',
  CONSTRAINT PK_EigeneSchule_FachTeilleistungen PRIMARY KEY (Teilleistung_ID, Fach_ID, Kursart),
  CONSTRAINT EigeneSchule_FachTeilleistungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Teilleistungsarten, die einem Fach über die Vorlagen zugewiesen sind damit diese automatisch über den Gruppenprozess eingetragen werden können';


CREATE TABLE Gost_Jahrgangsdaten (
  Abi_Jahrgang int NOT NULL COMMENT 'Schuljahr, in welchem der Jahrgang das Abitur macht, oder -1 für die Vorlage für das Anlegen neuer Abiturjahrgänge.', 
  ZusatzkursGEVorhanden int DEFAULT 1 COMMENT 'Legt fest, ob ein Zusatzkurs in Geschichte angeboten wird', 
  ZusatzkursGEErstesHalbjahr varchar(4) DEFAULT 'Q2.1' COMMENT 'Halbjahr, in welchem ein Zusatzkurs in Geschichte beginnt (z.B. Q2.1)', 
  ZusatzkursSWVorhanden int DEFAULT 1 COMMENT 'Legt fest, ob ein Zusatzkurs in Sozialwissenschaften angeboten wird', 
  ZusatzkursSWErstesHalbjahr varchar(4) DEFAULT 'Q2.1' COMMENT 'Halbjahr, in welchem ein Zusatzkurs in Sozialwissenschaften beginnt (z.B. Q2.1)', 
  TextBeratungsbogen varchar(2000) COMMENT 'Text, welcher auf dem Ausdruck eines Beratungsbogens gedruckt wird', 
  TextMailversand varchar(2000) COMMENT 'Text, welcher in einer Mail beim Versenden von Beratungsdateien verwendet wird',
  CONSTRAINT PK_Gost_Jahrgangsdaten PRIMARY KEY (Abi_Jahrgang),
  CONSTRAINT Gost_Jahrgangsdaten_UC_Abi_Jahrgang UNIQUE (Abi_Jahrgang)
) COMMENT 'Gymnasiale Oberstufe - Allgemeine Informationen zu den Jahrgängen';


CREATE TABLE Gost_Jahrgang_Fachwahlen (
  Abi_Jahrgang int NOT NULL COMMENT 'Schuljahr, in welchem der Jahrgang das Abitur macht', 
  Fach_ID bigint NOT NULL COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: ID des Faches in der Fächertabelle', 
  EF1_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Kursart des belegten Faches in EF.1', 
  EF2_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Kursart des belegten Faches in EF.2', 
  Q11_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Kursart des belegten Faches in Q1.1', 
  Q12_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Kursart des belegten Faches in Q1.2', 
  Q21_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Kursart des belegten Faches in Q2.1', 
  Q22_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Kursart des belegten Faches in Q2.2', 
  AbiturFach int COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Abiturfach 1 bis 4 oder null', 
  Bemerkungen varchar(50) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten - Fachwahlen: Bemerkungen zum belegten Fach',
  CONSTRAINT PK_Gost_Jahrgang_Fachwahlen PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Fachwahlen_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachwahlen_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten: Informationen zu der jahrgangsspezifischen Vorlage zu von Schülern normalerweise gewählten Fächern';

CREATE INDEX Gost_Jahrgang_Fachwahlen_IDX_Abi_Jahrgang ON Gost_Jahrgang_Fachwahlen(Abi_Jahrgang);
CREATE INDEX Gost_Jahrgang_Fachwahlen_IDX_Abi_Jahrgang_Fach_ID ON Gost_Jahrgang_Fachwahlen(Abi_Jahrgang, Fach_ID);


CREATE TABLE Gost_Blockung (
  ,
  CONSTRAINT PK_Gost_Blockung PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition einer Kursblockung der gymnasialen Oberstufe';


CREATE TABLE Gost_Jahrgang_Fachkombinationen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datensatzes', 
  Abi_Jahrgang int DEFAULT -1 NOT NULL COMMENT 'Schuljahr, in welchem der Jahrgang das Abitur macht', 
  Fach1_ID bigint NOT NULL COMMENT 'Die ID des ersten Faches der nicht möglichen Fächerkombination / eines Fächerprofils', 
  Fach2_ID bigint NOT NULL COMMENT 'Die ID des zweiten Faches der nicht möglichen Fächerkombination / eines Fächerprofils', 
  Kursart1 varchar(10) COMMENT 'Die Kursart des ersten Faches der nicht möglichen Fächerkombination / eines Fächerprofils', 
  Kursart2 varchar(10) COMMENT 'Die Kursart des zweiten Faches der nicht möglichen Fächerkombination / eines Fächerprofils', 
  EF1 int DEFAULT 1 NOT NULL COMMENT 'Gibt an, ob die Regel in EF.1 angewendet werden soll.', 
  EF2 int DEFAULT 1 NOT NULL COMMENT 'Gibt an, ob die Regel in EF.2 angewendet werden soll.', 
  Q11 int DEFAULT 1 NOT NULL COMMENT 'Gibt an, ob die Regel in Q1.1 angewendet werden soll.', 
  Q12 int DEFAULT 1 NOT NULL COMMENT 'Gibt an, ob die Regel in Q1.2 angewendet werden soll.', 
  Q21 int DEFAULT 1 NOT NULL COMMENT 'Gibt an, ob die Regel in Q2.1 angewendet werden soll.', 
  Q22 int DEFAULT 1 NOT NULL COMMENT 'Gibt an, ob die Regel in Q2.2 angewendet werden soll.', 
  Typ int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich um eine nicht mögliche Fächerkombination (0) oder ein Fächerprofil handelt (1)', 
  Hinweistext varchar(255) DEFAULT '' NOT NULL COMMENT 'Hinweistext, der ausgegeben wird, wenn das Fachprofil / die nicht mögliche Fächerkombination nicht erfüllt wird.',
  CONSTRAINT PK_Gost_Jahrgang_Fachkombinationen PRIMARY KEY (ID),
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Fach1_ID_FK FOREIGN KEY (Fach1_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Fachkombinationen_Fach2_ID_FK FOREIGN KEY (Fach2_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten: Zu erzwingende Fachkombinationen oder nicht mögliche Fachkombinationen in einem Jahrgang';

CREATE INDEX Gost_Jahrgang_Fachkombinationen_IDX_Abi_Jahrgang ON Gost_Jahrgang_Fachkombinationen(Abi_Jahrgang);


CREATE TABLE Gost_Jahrgang_Faecher (
  Abi_Jahrgang int NOT NULL COMMENT 'Schuljahr, in welchem der Jahrgang das Abitur macht', 
  Fach_ID bigint NOT NULL COMMENT 'ID des Faches in der Fächertabelle', 
  WaehlbarEF1 int DEFAULT 1 NOT NULL COMMENT 'Belegung des Faches in der EF.1 möglich: 1 - true, 0 - false ', 
  WaehlbarEF2 int DEFAULT 1 NOT NULL COMMENT 'Belegung des Faches in der EF.2 möglich: 1 - true, 0 - false', 
  WaehlbarQ11 int DEFAULT 1 NOT NULL COMMENT 'Belegung des Faches in der Q1.1 möglich: 1 - true, 0 - false', 
  WaehlbarQ12 int DEFAULT 1 NOT NULL COMMENT 'Belegung des Faches in der Q1.2 möglich: 1 - true, 0 - false', 
  WaehlbarQ21 int DEFAULT 1 NOT NULL COMMENT 'Belegung des Faches in der Q2.1 möglich: 1 - true, 0 - false', 
  WaehlbarQ22 int DEFAULT 1 NOT NULL COMMENT 'Belegung des Faches in der Q2.2 möglich: 1 - true, 0 - false', 
  WaehlbarAbiGK int DEFAULT 1 NOT NULL COMMENT 'Eintrag, ob das Fach als 3. oder 4. Abiturfach gewählt werden kann: 1 - true, 0 - false', 
  WaehlbarAbiLK int DEFAULT 1 NOT NULL COMMENT 'Eintrag, ob das Fach als 1. oder 2. Abiturfach (LK) gewählt werden kann: 1 - true, 0 - false', 
  WochenstundenQPhase int COMMENT 'Anzahl der Unterrichtsstunden in 45-minuten-Einheiten des Faches in der Qualifikationsphase',
  CONSTRAINT PK_Gost_Jahrgang_Faecher PRIMARY KEY (Abi_Jahrgang, Fach_ID),
  CONSTRAINT Gost_Jahrgang_Faecher_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Faecher_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten: Informationen zu den wählbaren Fächern der einzelnen Jahrgänge';

CREATE INDEX Gost_Jahrgang_Faecher_IDX_Abi_Jahrgang ON Gost_Jahrgang_Faecher(Abi_Jahrgang);
CREATE INDEX Gost_Jahrgang_Faecher_IDX_Abi_Jahrgang_Fach_ID ON Gost_Jahrgang_Faecher(Abi_Jahrgang, Fach_ID);


CREATE TABLE Gost_Blockung_Kurse (
  ,
  CONSTRAINT PK_Gost_Blockung_Kurse PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Kurse, welche einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Blockung_Regeln (
  ,
  CONSTRAINT PK_Gost_Blockung_Regeln PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Regeln, welche als Bedingungen zu einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Blockung_Schienen (
  ,
  CONSTRAINT PK_Gost_Blockung_Schienen PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Schienen, welche einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Blockung_Zwischenergebnisse (
  ,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse PRIMARY KEY (ID)
) COMMENT 'Tabelle für Zwischenergebnisse, welche einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Blockung_Regelparameter (
  ,
  CONSTRAINT PK_Gost_Blockung_Regelparameter PRIMARY KEY (Regel_ID, Nummer)
) COMMENT 'Tabelle für die Parameter von Regeln, welche als Bedingungen zu einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Blockung_Zwischenergebnisse_Kurs_Schienen (
  ,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schienen PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schienen_ID)
) COMMENT 'Tabelle für die Zuordnung von Kursen zu Schienen bei Zwischenergebnissen, welche einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Herkunft (
  ID bigint NOT NULL COMMENT 'Die ID der Herkunft', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Statistikkürzel der Herkunft', 
  Beschreibung varchar(255) NOT NULL COMMENT 'Die textuelle Beschreibung der Herkunft', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_Herkunft PRIMARY KEY (ID)
) COMMENT 'Eine Tabelle mit den unterschiedlichen Herkunftsmöglichkeiten von Schülern';


CREATE TABLE Herkunft_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Herkunft',
  CONSTRAINT PK_Herkunft_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den Herkünften';


CREATE TABLE Herkunft_Schulformen (
  Herkunft_ID bigint NOT NULL COMMENT 'die ID der Herkunft', 
  Schulform_Kuerzel varchar(10) NOT NULL COMMENT 'das Kürzel der Schulform',
  CONSTRAINT PK_Herkunft_Schulformen PRIMARY KEY (Herkunft_ID, Schulform_Kuerzel)
) COMMENT 'Tabelle mit der Zuordnungen der erlaubten Schulformen bei Herkünften ';


CREATE TABLE Herkunftsart (
  ID bigint NOT NULL COMMENT 'Die ID der Herkunftsart', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Herkunftsart', 
  gueltigVon int COMMENT 'Gibt die Gültigkeit ab welchem Schuljahr an', 
  gueltigBis int COMMENT 'Gibt die Gültigkeit bis zu welchem Schuljahr an',
  CONSTRAINT PK_Herkunftsart PRIMARY KEY (ID)
) COMMENT 'Tabelle für die unterschiedlichen Arten bei der Herkunft';


CREATE TABLE Herkunftsart_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Herkunftsart',
  CONSTRAINT PK_Herkunftsart_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den Herkunftsarten';


CREATE TABLE Herkunftsart_Schulformen (
  Herkunftsart_ID bigint NOT NULL COMMENT 'die ID der Herkunftsart', 
  Schulform_Kuerzel varchar(10) NOT NULL COMMENT 'das Kürzel der Schulform', 
  KurzBezeichnung varchar(255) NOT NULL COMMENT 'Eine kurze Bezeichnung der Herkunftsart', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Die Bezeichnung der Herkunftsart',
  CONSTRAINT PK_Herkunftsart_Schulformen PRIMARY KEY (Herkunftsart_ID, Schulform_Kuerzel)
) COMMENT 'Tabelle mit der Zuordnungen der erlaubten Schulformen bei den Herkunftsarten und den jeweiligen Beschreibungen der Arten ';


CREATE TABLE ImpExp_EigeneImporte (
  ID int DEFAULT 0 NOT NULL COMMENT 'ID des Importschemas für den externen Textimport', 
  Title varchar(50) COMMENT 'Bezeichnung des Schemas', 
  DelimiterChar varchar(1) COMMENT 'Enthält das Trennzeichen für den Import', 
  TextQuote varchar(1) COMMENT 'Texttrennzeichen', 
  SkipLines smallint DEFAULT 0 COMMENT 'externen Textimport', 
  DateFormat varchar(10) COMMENT 'Format der Datumswerte', 
  BooleanTrue varchar(10) COMMENT 'externen Textimport', 
  AbkWeiblich varchar(10) COMMENT 'Abkürzung für weiblich', 
  AbkMaennlich varchar(10) COMMENT 'Abkürzung für männlich', 
  MainTable varchar(50) COMMENT 'externen Textimport', 
  InsertMode int COMMENT 'externen Textimport', 
  LookupTableDir varchar(250) COMMENT 'externen Textimport', 
  SchuelerIDMode varchar(4) COMMENT 'externen Textimport',
  CONSTRAINT PK_ImpExp_EigeneImporte PRIMARY KEY (ID)
) COMMENT 'Importschemata, die im Programm "Externimport.exe" definiert werden';


CREATE TABLE ImpExp_EigeneImporte_Felder (
  Import_ID int DEFAULT 0 NOT NULL COMMENT 'externen Textimport Felder', 
  Field_ID int DEFAULT 0 COMMENT 'externen Textimport Felder', 
  TableDescription varchar(50) COMMENT 'externen Textimport Felder', 
  FieldDescription varchar(50) COMMENT 'externen Textimport Felder', 
  SrcPosition smallint DEFAULT 0 COMMENT 'externen Textimport Felder', 
  DstTable varchar(50) COMMENT 'externen Textimport Felder', 
  DstFieldName varchar(50) COMMENT 'externen Textimport Felder', 
  DstFieldType varchar(1) COMMENT 'externen Textimport Felder', 
  DstFieldIsIdentifier int COMMENT 'externen Textimport Felder', 
  DstLookupDir varchar(250) COMMENT 'externen Textimport Felder', 
  DstLookupTable varchar(50) COMMENT 'externen Textimport Felder', 
  DstLookupFieldName varchar(50) COMMENT 'externen Textimport Felder', 
  DstLookupTableIDFieldName varchar(50) COMMENT 'externen Textimport Felder', 
  DstResultFieldName varchar(50) COMMENT 'externen Textimport Felder', 
  DstKeyLookupInsert int COMMENT 'externen Textimport Felder', 
  DstKeyLookupNameCreateID int COMMENT 'externen Textimport Felder', 
  DstForceNumeric int COMMENT 'externen Textimport Felder',
  CONSTRAINT PK_ImpExp_EigeneImporte_Felder PRIMARY KEY (Import_ID, Field_ID)
) COMMENT 'Importschemata, die im Programm "Externimport.exe" definiert werden - Hier die Spaltendefinitionen';


CREATE TABLE ImpExp_EigeneImporte_Tabellen (
  Import_ID int DEFAULT 0 NOT NULL COMMENT 'externen Textimport Tabellen', 
  TableName varchar(50) COMMENT 'externen Textimport Tabellen', 
  DstCreateID int COMMENT 'externen Textimport Tabellen', 
  DstIDFieldName varchar(50) COMMENT 'externen Textimport Tabellen', 
  Sequence int DEFAULT 0 COMMENT 'externen Textimport Tabellen', 
  LookupTable varchar(50) COMMENT 'externen Textimport Tabellen', 
  LookupFields varchar(50) COMMENT 'externen Textimport Tabellen', 
  LookupFieldTypes varchar(50) COMMENT 'externen Textimport Tabellen', 
  LookupFieldPos varchar(50) COMMENT 'externen Textimport Tabellen', 
  LookupKeyField varchar(50) COMMENT 'externen Textimport Tabellen', 
  LookupResultField varchar(50) COMMENT 'externen Textimport Tabellen', 
  LookupResultFieldType varchar(10) COMMENT 'externen Textimport Tabellen', 
  DstDefaultFieldName varchar(50) COMMENT 'externen Textimport Tabellen', 
  DstDefaultFieldValue varchar(10) COMMENT 'externen Textimport Tabellen', 
  GU_ID_Field varchar(50) COMMENT 'externen Textimport Tabellen',
  CONSTRAINT PK_ImpExp_EigeneImporte_Tabellen PRIMARY KEY (Import_ID, TableName)
) COMMENT 'Importschemata, die im Programm "Externimport.exe" definiert werden - Hier die Tabellendefinitionen';


CREATE TABLE Jahrgaenge_Keys (
  Kuerzel varchar(2) NOT NULL COMMENT 'Das zweistellige Kürzel des Jahrgangs',
  CONSTRAINT PK_Jahrgaenge_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Tabelle der Schlüsselwerte für Jahrgänge, die bei anderen Tabellen als Foreign-Keys verwendet werden können';


CREATE TABLE K_Adressart (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Adressart', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Adressart (Betrieb Kammer usw)', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Adressart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der Adressart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Adressart ist änderbar Ja Nein',
  CONSTRAINT PK_K_Adressart PRIMARY KEY (ID),
  CONSTRAINT K_Adressart_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Katalog der Arten, die den weiteren Adressen/Betrieben zugeordnet werden können';


CREATE TABLE K_Ankreuzdaten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datensatzes für die Angaben zu den Ankreuzkompetenzen', 
  TextStufe1 varchar(100) COMMENT 'Bezeichnung Stufe 1', 
  TextStufe2 varchar(100) COMMENT 'Bezeichnung Stufe 2', 
  TextStufe3 varchar(100) COMMENT 'Bezeichnung Stufe 3', 
  TextStufe4 varchar(100) COMMENT 'Bezeichnung Stufe 4', 
  TextStufe5 varchar(100) COMMENT 'Bezeichnung Stufe 5', 
  BezeichnungSONST varchar(100) COMMENT 'Bezeichnung Zusatzstufe',
  CONSTRAINT PK_K_Ankreuzdaten PRIMARY KEY (ID)
) COMMENT 'Angaben zu den Ankreuzkompetenzen (Ankreutzzeugnisse GS / Kompetenz-Ausdrucke für Schüler zum Zeugnis)';


CREATE TABLE K_Ankreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Ankreuzfloskel', 
  Fach_ID bigint COMMENT 'FachID zu der die Ankreuzfloskel gehört, null für individuelle Ankreuzfloskeln bzw. siehe Spalte IstASV', 
  IstASV int DEFAULT 0 NOT NULL COMMENT 'Gibt an, falls die Fach_ID null ist, ob es sich bei der Ankreuzfloskel um eine Floskel zum Arbeits- und Sozialverhalten handelt (1) oder nicht (0).', 
  Jahrgang varchar(2) NOT NULL COMMENT 'Jahrgang zu der die Ankreuzfloskel gehört', 
  Gliederung varchar(3) COMMENT 'Schulgliederung zu der die Ankreuzkompetenz gehört (nur wichtig bei BK)', 
  FloskelText varchar(255) NOT NULL COMMENT 'Text der Ankreuzfloskel', 
  Sortierung int COMMENT 'Sortierung der Ankreuzfloskel', 
  FachSortierung int COMMENT 'Sortierung des Faches der Ankreuzfloskel', 
  Abschnitt int COMMENT 'Wird in welchen Abschnitten verwendet 1Hj 2HJ beide', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der Ankreuzfloskel', 
  Aktiv varchar(1) DEFAULT '+' COMMENT 'Gibt an ob die Ankreuzfloskel aktiv ist',
  CONSTRAINT PK_K_Ankreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT K_Ankreuzfloskeln_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Einzelne Textbausteine, die den Fächer dann als Ankreuzkompetenzen zugewiesen werden können';


CREATE TABLE K_BeschaeftigungsArt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Beschäftigungsart unter weitere Adressen', 
  Bezeichnung varchar(100) NOT NULL COMMENT 'Bezeichnung der Beschäftigungsart', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Beschäftigungsart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der Beschäftigungsart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Beschäftigungsart ist änderbar Ja Nein',
  CONSTRAINT PK_K_BeschaeftigungsArt PRIMARY KEY (ID),
  CONSTRAINT K_BeschaeftigungsArt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Beschäftigungsarten, die bei weiteren Adressen und Betrieben dem Schüler zugeordnet werden können';


CREATE TABLE K_Datenschutz (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eindeutige ID für den Datensatz', 
  Bezeichnung varchar(250) NOT NULL COMMENT 'Eine kurze Bezeichnung der Einwilligungsart', 
  Sichtbar varchar(1) DEFAULT '+' NOT NULL COMMENT 'Regelt die Sichtbarkeit der Einwilligungsart bei der Ansicht der Schülertabelle ', 
  Schluessel varchar(20) COMMENT 'Fest vorgegebene Werte, die es in Schild-NRW später ermöglichen, die Einwilligungsart zu erkennen', 
  Sortierung int DEFAULT 32000 NOT NULL COMMENT 'Gibt die Reihenfolge der Einwilligungsarten bei der Darstellung an.', 
  Beschreibung longtext COMMENT 'Eine ausführliche Beschreibung der Einwilligungsart', 
  PersonArt varchar(1) COMMENT 'Personentyp der Einwilligungsart (S=Schueler L=Lehrer E=Erzieher)',
  CONSTRAINT PK_K_Datenschutz PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Einwilligungsarten';


CREATE TABLE K_EinschulungsArt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Einschulungsart', 
  Bezeichnung varchar(40) NOT NULL COMMENT 'Bezeichnung der Einschulungsart', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Einschulungsart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Einschulungsart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Einschulungsart',
  CONSTRAINT PK_K_EinschulungsArt PRIMARY KEY (ID),
  CONSTRAINT K_EinschulungsArt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'War urspünglich mal für alle Schulformen verfügbar, ist aber bei den allg.-bildenen Schulen durch die Statkue-Tabelle ersetzt worden. Bei WBKs und BKs wird sie aber noch verwendet (der Umstieg auf die Statkue-Tabelle führte da zu Protesten, weil die Schulen keine eigenen Einträge mehr machen konnten).';


CREATE TABLE K_Einzelleistungen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Teilleistung zu den Leistungsdaten', 
  Bezeichnung varchar(50) COMMENT 'Bezeichnung der Teilleistung zu den Leistungsdaten', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Teilleistung zu den Leistungsdaten', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Teilleistung zu den Leistungsdaten', 
  Gewichtung float COMMENT 'Gewichtung der Teilleistung zu den Leistungsdaten',
  CONSTRAINT PK_K_Einzelleistungen PRIMARY KEY (ID)
) COMMENT 'Liste der Teilleistungsarten, die den Fächern in dne Leistungsdaten zugewiesen werden können';


CREATE TABLE K_EntlassGrund (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Entlassgrundes', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung des Entlassgrundes', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Entlassgrundes', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Entlassgrundes', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit des Entlassgrundes',
  CONSTRAINT PK_K_EntlassGrund PRIMARY KEY (ID),
  CONSTRAINT K_EntlassGrund_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der Entlassgründe > Schulbesuch > Entlassung von eigener Schule (kann selbst definiert werden)';


CREATE TABLE K_ErzieherArt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Erzieherart', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Erzieherart', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Erzieherart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Erzieherart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Erzieherart', 
  ExportBez varchar(20) COMMENT 'Exportbezeichnung der Erzieherart',
  CONSTRAINT PK_K_ErzieherArt PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherArt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der Erzieherarten > Karteireiter Erzieher';


CREATE TABLE K_ErzieherFunktion (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'DEPRECATED: ID der Ezieherfunktion', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'DEPRECATED: Bezeichnung der Ezieherfunktion', 
  Sortierung int DEFAULT 32000 COMMENT 'DEPRECATED: Sortierung der Ezieherfunktion', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'SDEPRECATED: Sichbarkeit der Ezieherfunktion', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'DEPRECATED: Änderbarkeit der Ezieherfunktion',
  CONSTRAINT PK_K_ErzieherFunktion PRIMARY KEY (ID),
  CONSTRAINT K_ErzieherFunktion_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste von möglichen Funktionen für Erzieher **** alt wird mittlerweile über Personengruppen geregelt ****';


CREATE TABLE K_FahrschuelerArt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Fahrschülerart', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Fahrschülerart', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Fahrschülerart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Fahrschülerart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Fahrschülerart',
  CONSTRAINT PK_K_FahrschuelerArt PRIMARY KEY (ID),
  CONSTRAINT K_FahrschuelerArt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der Fahrschülerarten Individualdaten I - kann selbst definiert werden';


CREATE TABLE K_Foerderschwerpunkt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Förderschwerpunktes', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung des Förderschwerpunktes', 
  StatistikKrz varchar(2) COMMENT 'Statistikkürzel des Förderschwerpunktes', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Förderschwerpunktes', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Förderschwerpunktes', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit des Förderschwerpunktes',
  CONSTRAINT PK_K_Foerderschwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Foerderschwerpunkt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der Förderschwerpunkte mit interner Bezeichnung und ASD-Kürzel (IT.NRW)';


CREATE TABLE K_Haltestelle (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Haltestelle', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Haltestelle', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Haltestelle', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Haltestelle', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Haltestelle', 
  EntfernungSchule float COMMENT 'Enterfung zur Schule von der Haltestelle',
  CONSTRAINT PK_K_Haltestelle PRIMARY KEY (ID),
  CONSTRAINT K_Haltestelle_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der Haltestellen Individualdaten I - kann selbst definiert werden';


CREATE TABLE K_Kindergarten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Kindergartens', 
  Bezeichnung varchar(100) COMMENT 'Bezeichnung des Kindergartens', 
  PLZ varchar(10) COMMENT 'PLZ  des Kindergartens', 
  Ort varchar(30) COMMENT 'Ort des Kindergartens', 
  Strassenname varchar(55) COMMENT 'Strassenname des Kindergartens', 
  HausNr varchar(10) COMMENT 'Hausnummer des Kindergarten', 
  HausNrZusatz varchar(30) COMMENT 'Hausnumemrzusatz des Kindergartens', 
  Tel varchar(20) COMMENT 'Telefonnummer des Kindergartens', 
  Email varchar(40) COMMENT 'E-Mail-Adresse des Kindergartens', 
  Bemerkung varchar(50) COMMENT 'Bemerkung zum Kindergarten', 
  Sichtbar varchar(1) DEFAULT '-' COMMENT 'Sichbarkeit des Kindergartens', 
  Sortierung int COMMENT 'Sortierung des Kindergartens',
  CONSTRAINT PK_K_Kindergarten PRIMARY KEY (ID)
) COMMENT 'Liste aller Kindergärten für den Reiter Individualdaten II';


CREATE TABLE K_Ort (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Ortes', 
  PLZ varchar(10) NOT NULL COMMENT 'PLZ des Ortes', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung des Ortes', 
  Kreis varchar(3) COMMENT 'Kreis des Ortes', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Ortes', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Ortes', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit des Ortes', 
  Land varchar(2) COMMENT 'Land des Ortes',
  CONSTRAINT PK_K_Ort PRIMARY KEY (ID),
  CONSTRAINT K_Ort_UC1 UNIQUE (PLZ, Bezeichnung)
) COMMENT 'Interner Ortskatalog';

CREATE INDEX K_Ort_IDX1 ON K_Ort(PLZ);


CREATE TABLE K_Ortsteil (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Ortsteils', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung des Ortsteils', 
  Ort_ID bigint COMMENT 'Fremdschlüssel auf den Ort, dem der Ortsteil zugeordnet ist', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Ortsteils', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Ortsteils', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit des Ortsteils', 
  OrtsteilSchluessel varchar(30) COMMENT 'Schlüssel des Ortsteils (Regional?)',
  CONSTRAINT PK_K_Ortsteil PRIMARY KEY (ID),
  CONSTRAINT K_Ortsteil_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT K_Ortsteil_UC1 UNIQUE (Bezeichnung, Ort_ID)
) COMMENT 'Interner Ortsteilkatalog';


CREATE TABLE K_AllgAdresse (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der weiteren Adresse (Betriebe)', 
  AdressArt_ID bigint COMMENT 'Adressart des Betriebs, Fremdschlüssel auf die ID in K_Adressart', 
  AllgAdrName1 varchar(50) COMMENT 'Name1 des Betriebs', 
  AllgAdrName2 varchar(50) COMMENT 'Name2 des Betriebs', 
  AllgAdrStrassenname varchar(55) COMMENT 'Straßenname des Betriebsdatensatz', 
  AllgAdrHausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  AllgAdrHausNrZusatz varchar(30) COMMENT 'Zusatz zur Hausnummer wenn Hausnummern getrennt gespeichert werden', 
  AllgAdrOrt_ID bigint COMMENT 'OrtID des Betriebs', 
  AllgOrtsteil_ID bigint COMMENT 'OrtsteilID des Betriebs', 
  AllgAdrTelefon1 varchar(20) COMMENT 'Telefonnummer1 des Betriebs', 
  AllgAdrTelefon2 varchar(20) COMMENT 'Telefonnummer2 des Betriebs', 
  AllgAdrFax varchar(20) COMMENT 'Faxnummer des Betriebs', 
  AllgAdrEmail varchar(100) COMMENT 'E-MailAdresse des Betriebes', 
  AllgAdrBemerkungen varchar(255) COMMENT 'Bemerkung zum Betrieb', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Betriebsdatensatz', 
  AllgAdrAusbildungsBetrieb varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Betrieb ausbildet Ja Nein', 
  AllgAdrBietetPraktika varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Betrieb Praktikumsplätze bietet Ja Nein', 
  AllgAdrBranche varchar(50) COMMENT 'Brache des Betriebs', 
  AllgAdrZusatz1 varchar(10) COMMENT 'Adresszusatz zum Betrieb', 
  AllgAdrZusatz2 varchar(10) COMMENT 'Adresszusatz2 zum Betrieb', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit des Datensatzes', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Datensatz ist änderbar Ja Nein', 
  Massnahmentraeger varchar(1) DEFAULT '-' COMMENT 'Bezeichnung des Maßnahmenträgers', 
  BelehrungISG varchar(1) DEFAULT '-' COMMENT 'Belehrung nach Infektionsschutzgesetz notwendig Ja Nein', 
  GU_ID varchar(40) COMMENT 'GU_ID des Betriebsdatensatzes (für Import zur Erkennung)', 
  ErwFuehrungszeugnis varchar(1) DEFAULT '-' COMMENT 'Wird für diesen Betrieb ein Erweitertes Führungszeugnis benötigt?', 
  ExtID varchar(50) COMMENT 'Externe ID des Betriebsdatensatzes',
  CONSTRAINT PK_K_AllgAdresse PRIMARY KEY (ID),
  CONSTRAINT K_AllgAdresse_K_Adressart_FK FOREIGN KEY (AdressArt_ID) REFERENCES K_Adressart(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_AllgAdresse_Ort_FK FOREIGN KEY (AllgAdrOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_AllgAdresse_Ortsteil_FK FOREIGN KEY (AllgOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Katalog der weiteren Adressen und Betriebe';


CREATE TABLE AllgAdrAnsprechpartner (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Ansprechpartners der Tabelle AllgAdresse (Betriebe)', 
  Adresse_ID bigint NOT NULL COMMENT 'ID des Betriebs (der Adresse) aus der Tabelle AllgAdresse', 
  Name varchar(120) COMMENT 'Name des Ansprechpartners im Betrieb PAuswG vom 21.6.2019 §5 Abs. 2', 
  Vorname varchar(80) COMMENT 'Vorname des Ansprechpartners im Betrieb PAuswG vom 21.6.2019 §5 Abs. 2. Wird im Client mit Rufname angezeigt.', 
  Anrede varchar(10) COMMENT 'Anrede des Ansprechpartners im Betrieb', 
  Telefon varchar(20) COMMENT 'Telefonnummer des Ansprechpartners im Betrieb', 
  Email varchar(100) COMMENT 'Email-Adresse des Ansprechpartners im Betrieb', 
  Abteilung varchar(50) COMMENT 'ggf Abteilung des Ansprechpartners im Betrieb', 
  Titel varchar(15) COMMENT 'Titel des Ansprechpartners im Betrieb', 
  GU_ID varchar(40) COMMENT 'GU_ID des Ansprechpartners im Betrieb',
  CONSTRAINT PK_AllgAdrAnsprechpartner PRIMARY KEY (ID),
  CONSTRAINT AllgAdrAnsprechpartner_Adr_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Ansprechpartner-Daten die einem Betrieb/Adresse in K_AllgAdresse zugeordnet werden können';


CREATE TABLE K_Religion (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Religion', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Religion', 
  StatistikKrz varchar(10) COMMENT 'Statistikkürzel der Religion', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Religion', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Religion', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Religion', 
  ExportBez varchar(20) COMMENT 'Exportbezeichnung der Religion', 
  ZeugnisBezeichnung varchar(50) COMMENT 'Zeugnisbezeichnung der Religion',
  CONSTRAINT PK_K_Religion PRIMARY KEY (ID),
  CONSTRAINT K_Religion_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der verwendeten Konfessionen mit interner Bezeichnung und ASD-Kürzel (IT.NRW)';


CREATE TABLE K_Schule (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Eintrags der Schulen', 
  SchulNr varchar(6) NOT NULL COMMENT 'Schulnummer des Eintrags der Schulen', 
  Name varchar(120) COMMENT 'Nachname der Lehrkraft PAuswG vom 21.6.2019 §5 Abs. 2', 
  SchulformNr varchar(3) COMMENT 'Schulformnummer des Eintrags der Schulen', 
  SchulformKrz varchar(3) COMMENT 'Schulformkürzel des Eintrags der Schulen', 
  SchulformBez varchar(50) COMMENT 'Schulformbezeichnung des Eintrags der Schulen', 
  Strassenname varchar(55) COMMENT 'Straßenname der Schule', 
  HausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  HausNrZusatz varchar(30) COMMENT 'Hausnummerzusatz wenn getrennt gespeichert', 
  PLZ varchar(10) COMMENT 'PLZ des Eintrags der Schulen', 
  Ort varchar(50) COMMENT 'Ort des Eintrags der Schulen', 
  Telefon varchar(20) COMMENT 'Telefonnummer des Eintrags der Schulen', 
  Fax varchar(20) COMMENT 'Faxnummer des Eintrags der Schulen', 
  Email varchar(40) COMMENT 'E-MailAdresse des Eintrags der Schulen', 
  Schulleiter varchar(40) COMMENT 'Schulleitername des Eintrags der Schulen', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Eintrags der Schulen', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Eintrags der Schulen', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit des Eintrags der Schulen', 
  SchulNr_SIM varchar(6) COMMENT 'Statistiklürzel Schulnummer des Eintrags der Schulen', 
  Kuerzel varchar(10) COMMENT 'Kürzel des Eintrags der Schulen', 
  KurzBez varchar(40) COMMENT 'Kutbezeichnung des Eintrags der Schulen',
  CONSTRAINT PK_K_Schule PRIMARY KEY (ID),
  CONSTRAINT K_Schule_UC1 UNIQUE (SchulNr)
) COMMENT 'Interner Katalog der verwendeten Schulen für die Herkunft der Schüler (Reiter Schulbesuch)';


CREATE TABLE K_Schulfunktionen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der schulinternen Funktion', 
  Bezeichnung varchar(50) COMMENT 'Bezeichnung der schulinternen Funktion', 
  Sortierung int COMMENT 'Sortierung der schulinternen Funktion', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der schulinternen Funktion',
  CONSTRAINT PK_K_Schulfunktionen PRIMARY KEY (ID)
) COMMENT 'frei definierbarer Katalog für Schulfunktionen, die dann im Lehrerkatalog den Lehrern zugewiesen werden können';


CREATE TABLE K_Schwerpunkt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Schwerpunktes', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung des Schwerpunktes', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Schwerpunktes', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Schwerpunktes', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit des Schwerpunktes',
  CONSTRAINT PK_K_Schwerpunkt PRIMARY KEY (ID),
  CONSTRAINT K_Schwerpunkt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Schwerpunkte, die einem Schüler auf Individualdaten I zugeordnet werden können (z.B. RS und GY)';


CREATE TABLE K_Sportbefreiung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Sportbefreiung', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung der Sportbefreiung', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Sportbefreiung', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Sportbefreiung', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Sportbefreiung',
  CONSTRAINT PK_K_Sportbefreiung PRIMARY KEY (ID),
  CONSTRAINT K_Sportbefreiung_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der Sportbefreiungen kann frei definiert werden ';


CREATE TABLE K_TelefonArt (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Telefonart', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Telefonart', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Telefonart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Telefonart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Telefonart',
  CONSTRAINT PK_K_TelefonArt PRIMARY KEY (ID),
  CONSTRAINT K_TelefonArt_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der intern verwendeten Telefonnummern-Bezeichnungen kann frei definiert werden';


CREATE TABLE K_Textdateien (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Textes der zum Ersatz für txt-Dateien genutzt wird', 
  Bezeichnung varchar(32) COMMENT 'Bezeichnungdes Textes der zum Ersatz für txt-Dateien genutzt wird', 
  Text_ID bigint NOT NULL COMMENT 'TextID des Textes der zum Ersatz für txt-Dateien genutzt wird', 
  Text_Body longtext COMMENT 'Text-Body des Textes der zum Ersatz für txt-Dateien genutzt wird', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit des Textes der zum Ersatz für txt-Dateien genutzt wird', 
  Sortierung smallint COMMENT 'Sortierung des Textes der zum Ersatz für txt-Dateien genutzt wird',
  CONSTRAINT PK_K_Textdateien PRIMARY KEY (ID)
) COMMENT 'Katalog für TXT-Dateien, diese werden ab Schild3.0 intern verwaltet (z.B für Email-Texte)';


CREATE TABLE K_Vermerkart (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Vermerkart', 
  Bezeichnung varchar(30) NOT NULL COMMENT 'Bezeichnung der Vermerkart', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Vermerkart', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichbarkeit der Vermerkart', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Änderbarkeit der Vermerkart',
  CONSTRAINT PK_K_Vermerkart PRIMARY KEY (ID),
  CONSTRAINT K_Vermerkart_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste der verwendeten Vermerkarten – kann unter Schulverwaltung frei ergänzt werden';


CREATE TABLE K_Zertifikate (
  Kuerzel varchar(5) NOT NULL COMMENT 'Kürzel des Zertifikats', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung des Zertifikats',
  CONSTRAINT PK_K_Zertifikate PRIMARY KEY (Kuerzel)
) COMMENT 'Liste der Zertifikate nur BK';


CREATE TABLE Katalog_Aufsichtsbereich (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID identifiziert einen Aufsichtsbereich eindeutig', 
  Kuerzel varchar(20) NOT NULL COMMENT 'Die Kurzbezeichnung des Aufsichtsbereichs', 
  Beschreibung varchar(1000) NOT NULL COMMENT 'Gegebenenfalls eine ausführlichere Beschreibung des Aufsichtsbereichs',
  CONSTRAINT PK_Katalog_Aufsichtsbereich PRIMARY KEY (ID),
  CONSTRAINT Katalog_Aufsichtsbereich_UC1 UNIQUE (Kuerzel)
) COMMENT 'Enthält eine aktuelle Liste von Aufsichtsbereichen, die an der Schule für Pausenzeiten vereinbart sind.';


CREATE TABLE Katalog_Pausenzeiten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine ID, die einen Pausenzeit-Eintrag eindeutig identifiziert', 
  Tag int NOT NULL COMMENT 'Der Wochentag laut ISO-8601 Standard: (1 - Montag, 2 - Dienstag, ...)', 
  Beginn time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Pausenzeit beginnt', 
  Ende time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Pausenzeit endet', 
  Bezeichnung varchar(40) DEFAULT 'Pause' NOT NULL COMMENT 'Eine kurze Bezeichnung, welche die Art der Pausenzeit genauer beschreibt (z.B. Mittagspause)',
  CONSTRAINT PK_Katalog_Pausenzeiten PRIMARY KEY (ID),
  CONSTRAINT Katalog_Pausenzeiten_UC1 UNIQUE (Tag, Beginn, Ende)
) COMMENT 'Enthält die aktuellen Zeiten für die Pausenaufsichten.';


CREATE TABLE Katalog_Raeume (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID identifiziert einen Raumeintrag eindeutig', 
  Kuerzel varchar(20) NOT NULL COMMENT 'Das Kürzel des Raums - auch eindeutig', 
  Beschreibung varchar(1000) NOT NULL COMMENT 'Gegebenenfalls eine ausführlichere Beschreibung des Raumes', 
  Groesse int DEFAULT 40 NOT NULL COMMENT 'Die Größe des Raumes, d.h. wie viele Schüler hier max. Platz haben',
  CONSTRAINT PK_Katalog_Raeume PRIMARY KEY (ID),
  CONSTRAINT Katalog_Raeume_UC1 UNIQUE (Kuerzel)
) COMMENT 'Enthält eine aktuelle Liste von Räumen, die an der Schule verfügbar sind.';


CREATE TABLE Katalog_Zeitraster (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine ID, die einen Zeitraster-Eintrag eindeutig identifiziert', 
  Tag int NOT NULL COMMENT 'Der Wochentag laut ISO-8601 Standard: (1 - Montag, 2 - Dienstag, ...)', 
  Stunde int NOT NULL COMMENT 'Die Stunde laut Stundenplan (1, 2, ...)', 
  Beginn time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Stunde beginnt', 
  Ende time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Stunde endet',
  CONSTRAINT PK_Katalog_Zeitraster PRIMARY KEY (ID),
  CONSTRAINT Katalog_Zeitraster_UC1 UNIQUE (Tag, Stunde)
) COMMENT 'Enthält das aktuelle Zeitraster für Stundenpläne.';


CREATE TABLE KlassenartenKatalog_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Klassenart',
  CONSTRAINT PK_KlassenartenKatalog_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den zulässigen Klassenarten';


CREATE TABLE Kompetenzgruppen (
  KG_ID bigint NOT NULL COMMENT 'ID der Kompetenzgruppe', 
  KG_Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung der Kompetenzgruppe', 
  KG_Spalte bigint NOT NULL COMMENT 'Spalte in der Benutzerverwaltung für die Kompetenzgruppe', 
  KG_Zeile bigint NOT NULL COMMENT 'Zeile in der Benutzerverwaltung für die Kompetenzgruppe',
  CONSTRAINT PK_Kompetenzgruppen PRIMARY KEY (KG_ID)
) COMMENT 'definierte Usergruppen, die wiederum die Kompetenzen enthält';


CREATE TABLE Kompetenzen (
  KO_ID bigint NOT NULL COMMENT 'ID für die Berechtigungskompetenz', 
  KO_Gruppe bigint NOT NULL COMMENT 'Gruppe der Berechtigungskompetenz', 
  KO_Bezeichnung varchar(64) NOT NULL COMMENT 'Bezeichnung der Berechtigungskompetenz',
  CONSTRAINT PK_Kompetenzen PRIMARY KEY (KO_ID),
  CONSTRAINT Kompetenzen_Kompetenzgruppen_FK FOREIGN KEY (KO_Gruppe) REFERENCES Kompetenzgruppen(KG_ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Rechte für die Benutzerverwaltung von Schild-NRW';


CREATE TABLE BenutzergruppenKompetenzen (
  Gruppe_ID bigint NOT NULL COMMENT 'Die ID der Benutzergruppe', 
  Kompetenz_ID bigint NOT NULL COMMENT 'Die ID der zugeordneten Kompetenz',
  CONSTRAINT PK_BenutzergruppenKompetenzen PRIMARY KEY (Gruppe_ID, Kompetenz_ID),
  CONSTRAINT BenutzergruppenKompetenzen_Benutzergruppen_FK FOREIGN KEY (Gruppe_ID) REFERENCES Benutzergruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BenutzergruppenKompetenzen_Kompetenzen_FK FOREIGN KEY (Kompetenz_ID) REFERENCES Kompetenzen(KO_ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Die Kompetenzen, welche der Benutzergruppe - also der Vorlage - zugeordnet wurden.';


CREATE TABLE KursFortschreibungsarten (
  ID bigint NOT NULL COMMENT 'ID der Kurs-Fortschreibungsart', 
  Kuerzel varchar(20) DEFAULT 'N' NOT NULL COMMENT 'Das Kürzel der Kurs-Fortschreibungsart', 
  Bezeichnung varchar(255) COMMENT 'Die Bezeichnung der Kurs-Fortschreibungsart', 
  gueltigVon int COMMENT 'Der Datensatz ist gültig ab dem Schuljahr', 
  gueltigBis int COMMENT 'Der Datensatz ist gültig bis zu dem Schuljahr',
  CONSTRAINT PK_KursFortschreibungsarten PRIMARY KEY (ID),
  CONSTRAINT KursFortschreibungsarten_UC1 UNIQUE (Kuerzel)
) COMMENT 'Tabelle für den Core-Type der Kurs-Fortschreibungsarten';


CREATE TABLE KursartenKatalog_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Kursart',
  CONSTRAINT PK_KursartenKatalog_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den zulässigen Kursarten';


CREATE TABLE Lernplattformen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datensatzes für die verwendete Lernplattform', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Bezeichnung der Lernplattform', 
  BenutzernameSuffixLehrer varchar(255) COMMENT 'Suffix für den Benutzernamen bei den Lehrern', 
  BenutzernameSuffixErzieher varchar(255) COMMENT 'Suffix für den Benutzernamen bei den Erziehern', 
  BenutzernameSuffixSchueler varchar(255) COMMENT 'Suffix für den Benutzernamen bei den Schülern', 
  Konfiguration longtext COMMENT 'Json-Objekt mit den Konfigurationseinstellungen der Accounterstellung für die Lernplattform',
  CONSTRAINT PK_Lernplattformen PRIMARY KEY (ID)
) COMMENT 'Tabelle mit Lernplattformen die die Schule nutzt und zu denen Credentials existieren';


CREATE TABLE CredentialsLernplattformen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datensatzes für die externen Account-Credentials (Lernplattformen)', 
  LernplattformID bigint NOT NULL COMMENT 'ID der Lernplattform', 
  Benutzername varchar(255) NOT NULL COMMENT 'Benutzername für den Credential-Datensatz', 
  BenutzernamePseudonym varchar(255) COMMENT 'Der pseudonymisierte Benutzername für den Credential-Datensatz', 
  Initialkennwort varchar(255) COMMENT 'Initialkennwort für den Credential-Datensatz', 
  PashwordHash varchar(255) COMMENT 'Passwordhash für den Credential-Datensatz', 
  RSAPublicKey longtext COMMENT 'RSAPublicKey für den Credential-Datensatz', 
  RSAPrivateKey longtext COMMENT 'RSAPrivateKey für den Credential-Datensatz', 
  AES longtext COMMENT 'AES-Schlüssel für den Credential-Datensatz',
  CONSTRAINT PK_CredentialsLernplattformen PRIMARY KEY (ID),
  CONSTRAINT CredentialsLernplattformen_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT CredentialsLernplattformen_UC1 UNIQUE (LernplattformID, Benutzername)
) COMMENT 'Daten für die Zugänge zu anderen Systemen (Lernplattformen)';


CREATE TABLE Nationalitaeten_Keys (
  DEStatisCode varchar(3) NOT NULL COMMENT 'Der dreistellige Länder-Code des statistischen Bundesamtes (DESTATIS)',
  CONSTRAINT PK_Nationalitaeten_Keys PRIMARY KEY (DEStatisCode)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den Nationalitäten';


CREATE TABLE NichtMoeglAbiFachKombi (
  Fach1_ID bigint NOT NULL COMMENT 'FACH1ID für eine nicht mögliche Kombination', 
  Fach2_ID bigint NOT NULL COMMENT 'FACH2ID für eine nicht mögliche Kombination', 
  Kursart1 varchar(10) COMMENT 'Kursart Fach1', 
  Kursart2 varchar(10) COMMENT 'Kursart Fach2', 
  PK varchar(30) NOT NULL COMMENT 'Primärschlüssel aus FachIDs und Minuszeichen', 
  Sortierung int COMMENT 'Sortierung der nicht möglichen Kombination', 
  Phase varchar(10) COMMENT 'Über welche Jahrgangsstufen geht die Kombination nicht', 
  Typ varchar(1) COMMENT 'Nicht mögliche Fächerkombination (-) oder Fächerprofil (+)',
  CONSTRAINT PK_NichtMoeglAbiFachKombi PRIMARY KEY (PK),
  CONSTRAINT NichtMoeglAbiFachKombi_Fach1_FK FOREIGN KEY (Fach1_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT NichtMoeglAbiFachKombi_Fach2_FK FOREIGN KEY (Fach2_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Nicht mögliche Abiturfach-Kombinationen unter Fächer der Oberstufe bearbeiten';


CREATE TABLE Noten (
  ID bigint NOT NULL COMMENT 'ID der Noten', 
  Kuerzel varchar(2) NOT NULL COMMENT 'Das Kürzel der Note', 
  IstTendenznote int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich um eine Tendenznote (plus) oder (minus) handelt', 
  Text varchar(255) COMMENT 'Die Bezeichnung der Note', 
  AufZeugnis int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob die Note auf einem Zeugnis als erteilte Note gedruckt wird oder nicht.', 
  Notenpunkte int COMMENT 'Die Notenpunkte der Note in der Sekundarstufe II', 
  TextLaufbahnSII varchar(2) COMMENT 'Die Bezeichnung der Note in der Sekundarstufe II, die für die Laufbahn zum Abitur verwendet wird', 
  AufLaufbahnSII int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob die Note bei der Laufbahn in der Sekundarstufe II gedruckt wird oder nicht.', 
  Sortierung int NOT NULL COMMENT 'Eine Default-Sortierung der Noten', 
  gueltigVon int COMMENT 'Der Datensatz ist gültig ab dem Schuljahr', 
  gueltigBis int COMMENT 'Der Datensatz ist gültig bis zu dem Schuljahr',
  CONSTRAINT PK_Noten PRIMARY KEY (ID),
  CONSTRAINT Noten_UC1 UNIQUE (Kuerzel)
) COMMENT 'Tabelle für den Core-Type der Noten';


CREATE TABLE OrganisationsformenKatalog_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Organisationsform',
  CONSTRAINT PK_OrganisationsformenKatalog_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte (ASD-Kürzel) für Fremdschlüssel zu den zulässigen Organisationsformen';


CREATE TABLE PersonalTypen (
  ID bigint NOT NULL COMMENT 'ID des Personal-Typs', 
  Kuerzel varchar(20) COMMENT 'Das Kürzel des Personal-Typs', 
  Bezeichnung varchar(255) COMMENT 'Die (Lang-)Bezeichnung des Personal-Typs', 
  gueltigVon int COMMENT 'Der Datensatz ist gültig ab dem Schuljahr', 
  gueltigBis int COMMENT 'Der Datensatz ist gültig bis zu dem Schuljahr',
  CONSTRAINT PK_PersonalTypen PRIMARY KEY (ID),
  CONSTRAINT PersonalTypen_UC1 UNIQUE (Kuerzel)
) COMMENT 'Katalog-Tabelle mit den möglichen Personal-Typen in der Lehrer-Tabelle, damit auch Nicht-Lehrer in der Lehrer-Liste aufgenommen und unterschieden werden können';


CREATE TABLE K_Lehrer (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eindeutige ID zur Kennzeichnung des Lehrer-Datensatzes', 
  GU_ID varchar(40) COMMENT 'Eindeutige ID Datenbank übergreifend. Wurde früher mal für Logineo genutzt, kann später mal zur Identifizierung genutzt werden.', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Lehrer-Kürzel für eine lesbare eindeutige Identifikation des Lehrers', 
  LIDKrz varchar(4) COMMENT 'Lehrer-Kürzel für eine eindeutige Identifikation des Lehrers – Verwendung für die Statistik - TODO lassen sich kuerzel und LIDKrz nicht sinnvoll zusammenfassen?', 
  Nachname varchar(120) NOT NULL COMMENT 'Der Nachname des Lehrers PAuswG vom 21.6.2019 §5 Abs. 2', 
  Vorname varchar(80) COMMENT 'Der Vorname des Lehrers PAuswG vom 21.6.2019 §5 Abs. 2. Wird im Client mit Rufname angezeigt.', 
  PersonTyp varchar(20) DEFAULT 'LEHRKRAFT' COMMENT 'Die Art der Person – wurde nachträglich hinzugefügt, damit auch Nicht-Lehrer in die Liste aufgenommen und unterschieden werden können', 
  Sortierung int DEFAULT 32000 COMMENT 'Eine Nummer, die zur Sortierung der Lehrer-Datensätze verwendet werden kann.', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob der Lehrer-Datensatz in der Oberfläche sichtbar sein soll und bei einer Auswahl zur Verfügung steht. ', 
  Aenderbar varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob Änderungen am Lehrer-Datensatz erlaubt sind.', 
  FuerExport varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob der Lehrer-Datensatz für den Export in andere Software verwendet werden soll - TODO fuer welche(n) Zweck(e) wird dies gespeichert - gehört dies an diese Stelle? ', 
  Statistik varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob der Lehrer-Datensatz bei der Statistik berücksichtigt werden soll.', 
  Strassenname varchar(55) COMMENT 'Straßenname der Lehrkraft', 
  HausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  HausNrZusatz varchar(30) COMMENT 'Zusatz zur Hausnummer wenn Hausnummern getrennt gespeichert werden', 
  Ort_ID bigint COMMENT 'Adressdaten des Lehrers: Fremdschlüssel auf die Katalog-Tabelle mit den Orten', 
  Ortsteil_ID bigint COMMENT 'Adressdaten des Lehrers: Fremdschlüssel auf die Katalog-Tabelle mit den Ortsteilen', 
  Tel varchar(20) COMMENT 'Adressdaten des Lehrers: Telefonnummer', 
  Handy varchar(20) COMMENT 'Adressdaten des Lehrers: Mobilnummer oder Faxnummer', 
  Email varchar(100) COMMENT 'Adressdaten des Lehrers: Private Email-Adresse', 
  EmailDienstlich varchar(100) COMMENT 'Adressdaten des Lehrers: Dienstliche Email-Adresse', 
  StaatKrz varchar(3) COMMENT 'Die erste Staatsangehörigkeit des Lehrers', 
  Geburtsdatum date COMMENT 'Das Geburtsdatum des Lehrers', 
  Geschlecht varchar(1) COMMENT 'Das Geschlecht des Lehrers - TODO ist in der Datenbank als String und nicht als Integer (3/4) hinterlegt, dies sollte in allen Tabellen einheitlich sein', 
  Anrede varchar(10) COMMENT 'Die Anrede für den Lehrer', 
  Amtsbezeichnung varchar(15) COMMENT 'Die Amtsbezeichnung des Lehrers', 
  Titel varchar(20) COMMENT 'Ggf. der Titel des Lehrers', 
  Faecher varchar(100) COMMENT 'Die Fächer, die der Lehrer unterrichtet - TODO hat dieses Feld noch einen Zweck? Fächer sind dem Lehrer eigentlich anders zugeordnet...  ', 
  IdentNr1 varchar(10) COMMENT 'Der vordere Teil der NRW-weit eindeutigen Ident-Nummer - setzt sich normalerweise aus Geburtsdatum und Geschlecht (3/4) zusammen, kann in Einzelfällen aber von diesem Schema abweichen', 
  SerNr varchar(5) COMMENT 'Der hintere Teil der Ident-Nummer – wird üblicherweise NRW-weit fortlaufend vergeben', 
  PANr varchar(20) COMMENT 'Personalakten-Nummer (wird von den Bezirksregierungen ggf genutzt)', 
  LBVNr varchar(15) COMMENT 'Die Personalnummer beim Landesamt für Besoldung und Versorgung (LBV)', 
  VSchluessel varchar(1) COMMENT 'Der Vergütungsschlüssel', 
  DatumZugang date COMMENT 'Das Datum, wann der Lehrer an die Schule gekommen ist.', 
  GrundZugang varchar(10) COMMENT 'Der Grund für den Zugang des Lehrers', 
  DatumAbgang date COMMENT 'Das Datum, wann der Lehrer die Schule verlassen hat.', 
  GrundAbgang varchar(10) COMMENT 'Der Grund für das Verlassen der Schule durch den Lehrer', 
  KennwortTools varchar(255) COMMENT 'Wird für das GS-Modul genutzt (gehashed).', 
  KennwortToolsAktuell varchar(3) DEFAULT '-;5' COMMENT 'Gibt an ob das LPassword geändert wurde oder ob es noch das Initialkennwort ist', 
  CredentialID bigint COMMENT 'Die ID des Credential-Eintrags',
  CONSTRAINT PK_K_Lehrer PRIMARY KEY (ID),
  CONSTRAINT K_Lehrer_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Ort_FK FOREIGN KEY (Ort_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Ortsteil_FK FOREIGN KEY (Ortsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_PersonTyp_FK FOREIGN KEY (PersonTyp) REFERENCES PersonalTypen(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_Statkue_Nationalitaeten_FK FOREIGN KEY (StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT K_Lehrer_UC1 UNIQUE (Kuerzel)
) COMMENT 'Tabelle für die Datensätze der Lehrkräfte';


CREATE TABLE Gost_Blockung_Kurslehrer (
  ,
  CONSTRAINT PK_Gost_Blockung_Kurslehrer PRIMARY KEY (Blockung_Kurs_ID, Lehrer_ID)
) COMMENT 'Tabelle für die Lehrer, welche einem Kurs einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Jahrgang_Beratungslehrer (
  Abi_Jahrgang int NOT NULL COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten: Schuljahr, in welchem der Jahrgang das Abitur macht ', 
  Lehrer_ID bigint NOT NULL COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten: ID des Beratungslehrers in der Lehrertabelle',
  CONSTRAINT PK_Gost_Jahrgang_Beratungslehrer PRIMARY KEY (Abi_Jahrgang, Lehrer_ID),
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Abi_Jahrgang_FK FOREIGN KEY (Abi_Jahrgang) REFERENCES Gost_Jahrgangsdaten(Abi_Jahrgang) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Jahrgang_Beratungslehrer_Lehrer_ID_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Gymnasiale Oberstufe - Jahrgangsdaten: Die Beratungslehrer in den einzelnen Jahrgängen';

CREATE INDEX Gost_Jahrgang_Beratungslehrer_IDX_Abi_Jahrgang ON Gost_Jahrgang_Beratungslehrer(Abi_Jahrgang);


CREATE TABLE LehrerDatenschutz (
  LehrerID bigint NOT NULL COMMENT 'LehrerID des Datenschutzeintrags', 
  DatenschutzID bigint NOT NULL COMMENT 'DatenschutzID des Eintrags', 
  Status int DEFAULT 0 NOT NULL COMMENT 'Status des Datenschutz-Eintrags (true/false)', 
  Abgefragt int DEFAULT 0 NOT NULL COMMENT 'Status der Abfrage Datenschutz-Eintrags (true/false)',
  CONSTRAINT PK_LehrerDatenschutz PRIMARY KEY (LehrerID, DatenschutzID),
  CONSTRAINT LehrerDatenschutz_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerDatenschutz_Datenschutz_FK FOREIGN KEY (DatenschutzID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Einwilligungen Datenschutz für die Lehrer';


CREATE TABLE LehrerFotos (
  Lehrer_ID bigint NOT NULL COMMENT 'LehrerID zu der das Foto gehört', 
  FotoBase64 longtext COMMENT 'Lehrerfoto im Base64-Format',
  CONSTRAINT PK_LehrerFotos PRIMARY KEY (Lehrer_ID),
  CONSTRAINT LehrerFotos_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Blobfelder für Lehrkräfte-Fotos';


CREATE TABLE LehrerLehramt (
  Lehrer_ID bigint NOT NULL COMMENT 'LehrerID zu der das Lehramt gehört', 
  LehramtKrz varchar(10) COMMENT 'Lehramtskürzel', 
  LehramtAnerkennungKrz varchar(10) COMMENT 'Lehramts-Anerkennung-Kürzel',
  CONSTRAINT PK_LehrerLehramt PRIMARY KEY (Lehrer_ID, LehramtKrz),
  CONSTRAINT LehrerLehramt_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Lehrämter gültige Schlüssel zur Lehrkraft';


CREATE TABLE LehrerLehramtFachr (
  Lehrer_ID bigint NOT NULL COMMENT 'LehrerID zu der die Fachrichtung gehört', 
  FachrKrz varchar(10) COMMENT 'Fachrichtungskürzel', 
  FachrAnerkennungKrz varchar(10) COMMENT 'FachrichtungAnerkennungskürzel',
  CONSTRAINT PK_LehrerLehramtFachr PRIMARY KEY (Lehrer_ID, FachrKrz),
  CONSTRAINT LehrerLehramtFachr_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Fachrichtung gültige Schlüssel zur Lehrkraft';


CREATE TABLE LehrerLehramtLehrbef (
  Lehrer_ID bigint NOT NULL COMMENT 'LehrerID zu der die Lehrbefähigung gehört', 
  LehrbefKrz varchar(10) COMMENT 'Kürzel der Lehrbefähigung', 
  LehrbefAnerkennungKrz varchar(10) COMMENT 'Kürzel der LehrbefähigungsAnerkennung',
  CONSTRAINT PK_LehrerLehramtLehrbef PRIMARY KEY (Lehrer_ID, LehrbefKrz),
  CONSTRAINT LehrerLehramtLehrbef_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Lehramt Lehrbefähigung gültige Schlüssel zur Lehrkraft';


CREATE TABLE LehrerLernplattform (
  LehrerID bigint NOT NULL COMMENT 'LehrerID für den Lernplattform-Datensatz', 
  LernplattformID bigint NOT NULL COMMENT 'ID der Lernplattform', 
  CredentialID bigint COMMENT 'CredentialD für den Lernplattform-Datensatz', 
  EinwilligungAbgefragt int DEFAULT 0 NOT NULL COMMENT 'Einwilligung wurde abgefragt', 
  EinwilligungNutzung int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Nutzung liegt vor', 
  EinwilligungAudiokonferenz int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Audiokonferenz liegt vor', 
  EinwilligungVideokonferenz int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Videokonferenz liegt vor',
  CONSTRAINT PK_LehrerLernplattform PRIMARY KEY (LehrerID, LernplattformID),
  CONSTRAINT LehrerLernplattform_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerLernplattform_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerLernplattform_Credential_FK FOREIGN KEY (CredentialID) REFERENCES CredentialsLernplattformen(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Tabelle zur Speicherung der CredentialID und den Einwilligungen zu den Lernplattformen';


CREATE TABLE Personengruppen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Personengruppe', 
  Gruppenname varchar(100) NOT NULL COMMENT 'Gruppenname der Personengruppe', 
  Zusatzinfo varchar(100) COMMENT 'Zusatzinfo der Personengruppe', 
  SammelEmail varchar(100) COMMENT 'Sammel-E-Mail-Adresse der Personengruppe', 
  GruppenArt varchar(20) COMMENT 'Gruppenart  der Personengruppe', 
  XMLExport varchar(1) DEFAULT '+' COMMENT 'Steuert den LogineoXML-Export', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung der Personengruppe', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der Personengruppe',
  CONSTRAINT PK_Personengruppen PRIMARY KEY (ID)
) COMMENT 'Katalog der definierten Personengruppen';


CREATE TABLE Personengruppen_Personen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Personeneintrags zur Personengruppe', 
  Gruppe_ID bigint NOT NULL COMMENT 'GruppenID des Personeneintrags zur Personengruppe', 
  Person_ID bigint COMMENT 'PersonenID des Personeneintrags zur Personengruppe wenn in DB vorhandne', 
  PersonNr int COMMENT 'Personennummer des Personeneintrags zur Personengruppe', 
  PersonArt varchar(1) COMMENT 'PersonenArt des Personeneintrags zur Personengruppe', 
  PersonName varchar(120) NOT NULL COMMENT 'Name des Personeneintrags zur Personengruppe', 
  PersonVorname varchar(80) COMMENT 'Vorname des Personeneintrags zur Personengruppe', 
  PersonPLZ varchar(10) COMMENT 'PLZ des Personeneintrags zur Personengruppe', 
  PersonOrt varchar(50) COMMENT 'Ort des Personeneintrags zur Personengruppe', 
  PersonStrassenname varchar(55) COMMENT 'Straßenname zur Person der Personengruppe', 
  PersonHausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  PersonHausNrZusatz varchar(30) COMMENT 'Zusatz zur Hausnummer wenn Hausnummern getrennt gespeichert werden', 
  PersonTelefon varchar(20) COMMENT 'Telfonnummer des Personeneintrags zur Personengruppe', 
  PersonMobil varchar(20) COMMENT 'Mobilnummer des Personeneintrags zur Personengruppe', 
  PersonEmail varchar(100) COMMENT 'Email  des Personeneintrags zur Personengruppe', 
  Bemerkung varchar(100) COMMENT 'Bemerkung des Personeneintrags zur Personengruppe', 
  Zusatzinfo varchar(100) COMMENT 'Zusatzinfo des Personeneintrags zur Personengruppe', 
  Sortierung int COMMENT 'Sortierung des Personeneintrags zur Personengruppe', 
  PersonAnrede varchar(10) COMMENT 'Anrede des Personeneintrags zur Personengruppe', 
  PersonAkadGrad varchar(15) COMMENT 'DEPRECATED: Titel des Personeneintrags zur Personengruppe',
  CONSTRAINT PK_Personengruppen_Personen PRIMARY KEY (ID),
  CONSTRAINT Personengruppen_Personen_Gruppe FOREIGN KEY (Gruppe_ID) REFERENCES Personengruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Zuordnung von Personen zur den Einträgen in der Tabelle Personengruppen';


CREATE TABLE Religionen_Keys (
  Kuerzel varchar(10) NOT NULL COMMENT 'Das Kürzel der Religion / Konfession',
  CONSTRAINT PK_Religionen_Keys PRIMARY KEY (Kuerzel)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den in der amtlichen Schulstatisik berücksichtigen Religionen / Konfessionen';


CREATE TABLE Client_Konfiguration_Global (
  AppName varchar(100) NOT NULL COMMENT 'Der Name der Client-Anwendung, für die der Konfigurationsdatensatz gespeichert ist', 
  Schluessel varchar(255) NOT NULL COMMENT 'Der Schlüsselname des Konfigurationsdatensatzes', 
  Wert longtext NOT NULL COMMENT 'Der Wert des Konfigurationsdatensatzes',
  CONSTRAINT PK_Client_Konfiguration_Global PRIMARY KEY (AppName, Schluessel)
) COMMENT 'Tabelle für das Speichern von Client-Konfigurationen als Key-Value-Paare. Dabei werden über das Feld App unterschiedliche Client-Anwendungen unterstützt. Die Konfigurationen in dieser Tabelle gelten global für den Client.';


CREATE TABLE Schema_Core_Type_Versionen (
  NameTabelle varchar(255) NOT NULL COMMENT 'Gibt den Namen der Tabelle an, wo die Daten des Core-Types hinterlegt werden.', 
  Name varchar(1023) NOT NULL COMMENT 'Gibt den Namen des Core-Types an.', 
  Version bigint DEFAULT 1 NOT NULL COMMENT 'Die Version, in welcher der Core-Type in der DB vorliegt',
  CONSTRAINT PK_Schema_Core_Type_Versionen PRIMARY KEY (NameTabelle)
) COMMENT 'Tabelle für das Speichern, in welcher Version die Core-Type-Daten in den Datenbank-Tabellen vorliegen';


CREATE TABLE Schema_AutoInkremente (
  NameTabelle varchar(200) NOT NULL COMMENT 'Gibt den Tabellennamen an, für dessen Auto-Inkrement der ID-Wert verwendet werden soll.', 
  MaxID bigint DEFAULT 1 NOT NULL COMMENT 'Die ID des höchsten jemals in die DB geschriebenen ID-Wertes bei der zugehörigen Tabelle',
  CONSTRAINT PK_Schema_AutoInkremente PRIMARY KEY (NameTabelle)
) COMMENT 'Tabelle für das Zwischenspeichern der bisherigen Maximalwerte beim Einfügen, damit eine DBMS-unabhängige Auto-Inkrement-Funktion realisiert werden kann.';


CREATE TABLE Schema_Status (
  Revision bigint DEFAULT 0 NOT NULL COMMENT 'Die Revision des Datenbankschemas der SVWS-DB', 
  IsTainted int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob die Datenbank noch für einen Produktivbetrieb zugelassen ist oder durch ein Update auf eine Entwicklerversion eventuell in einem ungültigen Zustand ist',
  CONSTRAINT PK_Schema_Status PRIMARY KEY (Revision)
) COMMENT 'Diese Tabelle enthält Informationen zum Status der SVWS-DB';


CREATE TABLE SchildFilter (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des gespeicherten Filters', 
  Art varchar(1) COMMENT 'Art des Filters', 
  Name varchar(50) NOT NULL COMMENT 'Bezeichnender Kurztext des Filters', 
  Beschreibung varchar(255) COMMENT 'Beschreibung zum Filter', 
  Tabellen varchar(255) COMMENT 'Tabellen die im Filter vorkommen', 
  ZusatzTabellen varchar(255) COMMENT 'Zusätzliche Tabellen die im Filtervorkommen', 
  Bedingung longtext COMMENT 'SQL-Text des Filters', 
  BedingungKlartext longtext COMMENT 'Klartext der bedingung',
  CONSTRAINT PK_SchildFilter PRIMARY KEY (ID),
  CONSTRAINT SchildFilter_UC1 UNIQUE (Name)
) COMMENT 'Gespeicherte Filter aus Filter I';


CREATE TABLE KAoA_Anschlussoption_Keys (
  ID bigint NOT NULL COMMENT 'Die eindeutige ID der Anschlussoption',
  CONSTRAINT PK_KAoA_Anschlussoption_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den KAOA-Anschlussoptionen';


CREATE TABLE KAoA_Berufsfeld_Keys (
  ID bigint NOT NULL COMMENT 'Die eindeutige ID für das Berufsfeld',
  CONSTRAINT PK_KAoA_Berufsfeld_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den KAOA-Berufsfeldern';


CREATE TABLE KAoA_Kategorie_Keys (
  ID bigint NOT NULL COMMENT 'Die eindeutige ID der Kategorie',
  CONSTRAINT PK_KAoA_Kategorie_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den KAOA-Kategorien';


CREATE TABLE KAoA_Merkmal_Keys (
  ID bigint NOT NULL COMMENT 'Die eindeutige ID des Merkmals',
  CONSTRAINT PK_KAoA_Merkmal_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den KAOA-Merkmalen';


CREATE TABLE KAoA_Zusatzmerkmal_Keys (
  ID bigint NOT NULL COMMENT 'Die eindeutige ID des Zusatzmerkmals',
  CONSTRAINT PK_KAoA_Zusatzmerkmal_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den KAOA-Zusatzmerkmalen';


CREATE TABLE KAoA_SBO_Ebene4_Keys (
  ID bigint NOT NULL COMMENT 'Die eindeutige ID des Merkmals der SBO-Ebene 4',
  CONSTRAINT PK_KAoA_SBO_Ebene4_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den KAOA-Merkmalen der SBO-Ebene 4';


CREATE TABLE SchuelerListe (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der individuellen Schülerliste', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung der individuellen Schülerliste', 
  Erzeuger varchar(20) COMMENT 'UserID Erzeuger der individuellen Schülerliste', 
  Privat varchar(1) DEFAULT '+' COMMENT 'Schülerliste Privat oder Öffentlich',
  CONSTRAINT PK_SchuelerListe PRIMARY KEY (ID),
  CONSTRAINT SchuelerListe_UC1 UNIQUE (Bezeichnung)
) COMMENT 'Liste mit allen angelegten individuellen Schülerlisten';


CREATE TABLE SchuelerStatus_Keys (
  ID int NOT NULL COMMENT 'ID des Schüler-Status',
  CONSTRAINT PK_SchuelerStatus_Keys PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Schlüsselwerte des Core-Types SchuelerStatus';


CREATE TABLE SchuleCredentials (
  Schulnummer int NOT NULL COMMENT 'ID für den Credential-Datensatz einer Schule (also auch für den PublicKey der anderen Schulen)', 
  RSAPublicKey longtext COMMENT 'RSAPublicKey für den Credential-Datensatz einer Schule', 
  RSAPrivateKey longtext COMMENT 'RSAPrivateKey für den Credential-Datensatz der Schule falls es die eigene ist sonst NULL', 
  AES longtext COMMENT 'AES-Schlüssel für den Credential-Datensatz der Schule falls es die eigene ist sonst NULL',
  CONSTRAINT PK_SchuleCredentials PRIMARY KEY (Schulnummer)
) COMMENT 'Tabelle für die Zugangsdaten von Schulen (PublicKey) und den Keys der eingenene Schule';


CREATE TABLE SchuleOAuthSecrets (
  ID bigint NOT NULL COMMENT 'ID des OAuth-Datensatzes', 
  AuthServer varchar(255) NOT NULL COMMENT 'Der Authorization Server', 
  ClientID longtext NOT NULL COMMENT 'Die ID des Clients', 
  ClientSecret longtext NOT NULL COMMENT 'Das Secret des Clients',
  CONSTRAINT PK_SchuleOAuthSecrets PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Credentials bei der OAuth-Authentifizierung durch die Schule';


CREATE TABLE Schulformen (
  ID bigint NOT NULL COMMENT 'ID der Schulform', 
  Kuerzel varchar(10) NOT NULL COMMENT 'Kürzel der Schulform', 
  Nummer varchar(2) COMMENT 'Nummer der Schulform für die amtliche Schulstatistik', 
  Bezeichnung varchar(255) NOT NULL COMMENT 'Bezeichnung der Schulform', 
  HatGymOb int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob eine Schule der Schulform eine gymnasiale Oberstufe haben kann (1) oder nicht (0)', 
  gueltigVon int COMMENT 'Gibt an, ab welchem Schuljahr die Schulform gültig ist', 
  gueltigBis int COMMENT 'Gibt an, bis zu welchem Schuljahr die Schulform gültig ist',
  CONSTRAINT PK_Schulformen PRIMARY KEY (ID)
) COMMENT 'Tabelle mit Schulformen';


CREATE TABLE Schuljahresabschnitte (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Schuljahresabschnittes', 
  Jahr int NOT NULL COMMENT 'Schuljahr des Schuljahresabschnitts (z.B. 2012 für 2012/13)', 
  Abschnitt int NOT NULL COMMENT 'Abschnitt des Schuljahresabschnitts', 
  VorigerAbschnitt_ID bigint COMMENT 'ID des vorigen Schuljahresabschnitts', 
  FolgeAbschnitt_ID bigint COMMENT 'ID des nachfolgenden Schuljahresabschnitts',
  CONSTRAINT PK_Schuljahresabschnitte PRIMARY KEY (ID)
) COMMENT 'Tabelle mit den in der DB angelegten Schuljahresabschnitten ';


CREATE TABLE EigeneSchule (
  ID bigint NOT NULL COMMENT 'ID des Datensatzes der eigenen Schule', 
  SchulformNr varchar(3) COMMENT 'Schulformnummer der eigenen Schule (Statkue IT.NRW)', 
  SchulformKrz varchar(3) COMMENT 'Schulformkürzel der eigenen Schule (Statkue IT.NRW)', 
  SchulformBez varchar(50) COMMENT 'Bezeichnender Text der Schulform', 
  SchultraegerArt varchar(2) COMMENT 'Art des Schulträgers', 
  SchultraegerNr varchar(6) COMMENT 'Schulträgernummer aus dem Katalog der Schulver IT.NRW', 
  SchulNr varchar(6) COMMENT 'Eindeutige Schulnummer der eigenen Schule aus der Schulver IT.NRW', 
  Bezeichnung1 varchar(50) COMMENT '1. Text für die Bezeichnung der Schule', 
  Bezeichnung2 varchar(50) COMMENT '2. Text für die Bezeichnung der Schule', 
  Bezeichnung3 varchar(50) COMMENT '3. Text für die Bezeichnung der Schule', 
  Strassenname varchar(55) COMMENT 'Straßenname der Schule', 
  HausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  HausNrZusatz varchar(30) COMMENT 'Hausnummerzusatz wenn getrennt gespeichert', 
  PLZ varchar(10) COMMENT 'PLZ der eigenen Schule', 
  Ort varchar(50) COMMENT 'Ortsangabe der eigenen Schule', 
  Telefon varchar(20) COMMENT 'Telefonnummer der eigenen Schule', 
  Fax varchar(20) COMMENT 'Faxnummer der eigenen Schule', 
  Email varchar(100) COMMENT 'Email-Adresse der eigenen Schule', 
  Ganztags varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob die Schule Ganztagsbetrieb hat', 
  Schuljahresabschnitts_ID bigint COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  AnzahlAbschnitte int DEFAULT 2 COMMENT 'Anzahl der verfügbaren Abschnitte (meist Halbjahre oder Quartale)', 
  AbschnittBez varchar(20) DEFAULT 'Halbjahr' COMMENT 'Bezeichnung der Abschnitte', 
  BezAbschnitt1 varchar(12) DEFAULT '1. Hj' COMMENT 'Bezeichnung des ersten Abschnitts', 
  BezAbschnitt2 varchar(12) DEFAULT '2. Hj' COMMENT 'Bezeichnung des zweiten Abschnitts', 
  BezAbschnitt3 varchar(12) COMMENT 'Bezeichnung des dritten Abschnitts', 
  BezAbschnitt4 varchar(12) COMMENT 'Bezeichnung des vierten Abschnitts', 
  Fremdsprachen varchar(1) DEFAULT '+' COMMENT 'Welche Fremdsprachen werden unterrichtet', 
  JVAZeigen varchar(1) DEFAULT '-' COMMENT 'Schule unterrichtet in der Justizvollzugsanstalt', 
  RefPaedagogikZeigen varchar(1) DEFAULT '-' COMMENT 'Schule hat Reformpädagogischen-Zweig', 
  AnzJGS_Jahr smallint DEFAULT 1 COMMENT 'Anzahl der Jahrgangstufen pro Schuljahr (Semesterbetrieb WBK)', 
  IstHauptsitz varchar(1) DEFAULT '+' COMMENT 'Gibt an, ob die Datenbank am Hauptsitzder Schule ist (Dependancebetrieb)', 
  NotenGesperrt varchar(1) DEFAULT '-' COMMENT 'Sperrt die Noteneingabe', 
  ZurueckgestelltAnzahl int COMMENT 'Anzahl de Zurückgestellten Kinder in der Grundschule', 
  ZurueckgestelltWeibl int COMMENT 'Anzahl de Zurückgestellten weiblichen Kinder in der Grundschule', 
  ZurueckgestelltAuslaender int COMMENT 'Anzahl de Zurückgestellten ausländischen Kinder in der Grundschule', 
  ZurueckgestelltAuslaenderWeibl int COMMENT 'Anzahl de Zurückgestellten ausländischen weiblichen Kinder in der Grundschule', 
  ZurueckgestelltAussiedler int COMMENT 'DEPRECATED: Anzahl de Zurückgestellten ausgesiedelten Kinder in der Grundschule', 
  ZurueckgestelltAussiedlerWeibl int COMMENT 'DEPRECATED: Anzahl de Zurückgestellten ausgesiedelten weiblichen Kinder in der Grundschule', 
  TeamTeaching varchar(1) DEFAULT '+' COMMENT 'Aktiviert das Teamteaching', 
  AbiGruppenprozess varchar(1) DEFAULT '+' COMMENT 'Sperrt oder erlaubt die Gruppenprozesse für das Abitur', 
  DauerUnterrichtseinheit int COMMENT 'Dauer der Unterrichtseinheit (bei NULL = 45 Minuten)', 
  Gruppen8Bis1 int COMMENT 'Schule hat Betreuung 8 bis 13', 
  Gruppen13Plus int COMMENT 'Gruppen in der 13Plus-Betreuung', 
  InternatsplaetzeM int COMMENT 'Internatsplätze männlilch', 
  InternatsplaetzeW int COMMENT 'Internatsplätze weiblich', 
  InternatsplaetzeNeutral int COMMENT 'Internatsplätze divers ohne Angabe', 
  WebAdresse varchar(100) COMMENT 'Enthält die Homepage-Adresse URL der Schule', 
  Land varchar(50) COMMENT 'Land der Schule ??? Wird wahrscheinlich für Bundeswehr verwendet?',
  CONSTRAINT PK_EigeneSchule PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Tabelle in der die Daten der Schule verwaltet werden, diese Tabelle darf in einer Einzelinstallation nur eine Zeile haben';


CREATE TABLE EigeneSchule_Logo (
  EigeneSchule_ID bigint NOT NULL COMMENT 'ID des Datensatzes der eigenen Schule', 
  LogoBase64 longtext COMMENT 'Das Logo der Schule als Bild im Base64-Format',
  CONSTRAINT PK_EigeneSchule_Logo PRIMARY KEY (EigeneSchule_ID),
  CONSTRAINT EigeneSchule_Logo_FK FOREIGN KEY (EigeneSchule_ID) REFERENCES EigeneSchule(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle in der das Logo der Schule verwaltet wird. Diese Tabelle darf in einer Einzelinstallation nur eine Zeile haben';


CREATE TABLE EigeneSchule_Abteilungen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Abteilung', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Text für die Bezeichnung der Abteilung', 
  Schuljahresabschnitts_ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  AbteilungsLeiter_ID bigint COMMENT 'Lehrer-ID für den Abteilungsleiter', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'steuert die Sichtbarkeit der Abteilung', 
  Raum varchar(20) COMMENT 'Bezeichnung für den Raum des Abteilungsleiter z.B. für Briefköpfe', 
  Email varchar(100) COMMENT 'Email des Abteilungsleiters', 
  Durchwahl varchar(20) COMMENT 'Telefonische Durchwahl des Abteilungsleiters', 
  Sortierung int COMMENT 'Sortierung des Datensatzes',
  CONSTRAINT PK_EigeneSchule_Abteilungen PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abteilungen_Leiter_FK FOREIGN KEY (AbteilungsLeiter_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Abteilungen_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Katalog der Abteilungen, denen dann ein Abteilungsleiter zugewiesen werden kann. Die Tabelle wird schuljahresspezifisch verwaltet.  ';


CREATE TABLE EigeneSchule_Jahrgaenge (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eindeutige ID zur Kennzeichnung des Jahrgangs-Datensatzes', 
  InternKrz varchar(20) COMMENT 'Ein Kürzel für den Jahrgang, welches bei der Darstellung genutzt wird', 
  GueltigVon bigint COMMENT 'Gibt an, von welchem Schuljahresabschnitt an der Jahrgang gültig ist (einschließlich), NULL bedeutet von dem ersten Abschnitt an', 
  GueltigBis bigint COMMENT 'Gibt an, bis zu welchem Schuljahresabschnitt an der Jahrgang gültig ist (einschließlich), NULL bedeutet bis zum letzten Abschnitt, Ende offen', 
  ASDJahrgang varchar(2) COMMENT 'Ein Kürzel für den Jahrgang, welches bei der Statistik verwendet wird', 
  ASDBezeichnung varchar(100) COMMENT 'Die Bezeichnung für den Jahrgang, welche bei der Statistik verwendet wird', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'true, falls der Jahrgang bei Auswahlen angezeigt werden soll oder nicht.', 
  Sortierung int DEFAULT 32000 COMMENT 'Ein Zahlwert, welcher bei für eine Sortierung der Jahrgänge bei der Darstellung verwendet wird.', 
  IstChronologisch varchar(1) DEFAULT '+' COMMENT 'Gibt an ob ein Jahrgang zu einer chronologischen Reihenfolge gehört', 
  Spaltentitel varchar(2) COMMENT 'Wird in der Übersicht benutzt um den Spaltentitel anzuzeigen. (Kurzbezeichnung in Jahrgangstabelle)', 
  SekStufe varchar(6) COMMENT 'Gibt die Primar- bzw. Sekundarstufe des Jahrgang an (Pr, SI, SII-1, SII-2, SII-3)', 
  SGL varchar(3) COMMENT 'Schulgliederung des Jahrgangs', 
  Restabschnitte int COMMENT 'Gibt die Anzahl der Restabschnitte an, die für den Verbleib an dieser Schulform üblich ist.', 
  Folgejahrgang_ID bigint COMMENT 'Die eindeutige ID des Jahrgangs, welcher auf diesen folgt – verweist auf diese Tabelle oder NULL, falls es sich um den letzten Jahrgang handelt',
  CONSTRAINT PK_EigeneSchule_Jahrgaenge PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Jahrgaenge_GueltigVon_FK FOREIGN KEY (GueltigVon) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_GueltigBis_FK FOREIGN KEY (GueltigBis) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT EigeneSchule_Jahrgaenge_UC1 UNIQUE (InternKrz)
) COMMENT 'vorhandene Jahrgänge mit deren ASD-Zuordnungen';


CREATE TABLE LehrerAbschnittsdaten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Eintrags für die LehrerAbschnittsdaten', 
  Lehrer_ID bigint NOT NULL COMMENT 'LehrerID für die LehrerAbschnittsdaten', 
  Schuljahresabschnitts_ID bigint NOT NULL COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  Rechtsverhaeltnis varchar(1) COMMENT 'Rechtsverhältnis für die LehrerAbschnittsdaten', 
  Beschaeftigungsart varchar(2) COMMENT 'Beschäftigungsart für die LehrerAbschnittsdaten', 
  Einsatzstatus varchar(1) COMMENT 'Einsatzstatus für die LehrerAbschnittsdaten', 
  StammschulNr varchar(6) COMMENT 'Die Schulnummer der Stammschule, sofern diese abweicht', 
  PflichtstdSoll float COMMENT 'Pflichtstundensoll für die LehrerAbschnittsdaten', 
  UnterrichtsStd float COMMENT 'Unterichsstunden für die LehrerAbschnittsdaten', 
  MehrleistungStd float COMMENT 'Mehrleistungsstunden für die LehrerAbschnittsdaten', 
  EntlastungStd float COMMENT 'Entlastungsstunden für die LehrerAbschnittsdaten', 
  AnrechnungStd float COMMENT 'Anrechnungstunden für die LehrerAbschnittsdaten', 
  RestStd float COMMENT 'Reststunden die nicht vergeben wurden  für die LehrerAbschnittsdaten',
  CONSTRAINT PK_LehrerAbschnittsdaten PRIMARY KEY (ID),
  CONSTRAINT LehrerAbschnittsdaten_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAbschnittsdaten_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAbschnittsdaten_UC1 UNIQUE (Lehrer_ID, Schuljahresabschnitts_ID)
) COMMENT 'Lehrerdaten, die Abschnittsweise gespeichert werden';


CREATE TABLE Klassen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Klasse in der Klassen- Versetzuungstabelle', 
  Schuljahresabschnitts_ID bigint NOT NULL COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  Bezeichnung varchar(150) COMMENT 'Bezeichnender Text für die Klasse', 
  ASDKlasse varchar(6) COMMENT 'ASD-Jahrgang der Klasse', 
  Klasse varchar(15) NOT NULL COMMENT 'Kürzel der Klasse', 
  Jahrgang_ID bigint COMMENT 'ID des ASD-Jahrgangs', 
  FKlasse varchar(15) COMMENT 'Folgeklasse', 
  VKlasse varchar(15) COMMENT 'Vorgängerklasse', 
  OrgFormKrz varchar(1) COMMENT 'Organisationsform der Klasse Kürzel IT.NRW', 
  ASDSchulformNr varchar(3) COMMENT 'Schulgliederung in der Klasse', 
  Fachklasse_ID bigint COMMENT 'FID des Fachklasse nur BK SBK', 
  PruefOrdnung varchar(20) COMMENT 'Prüfungsordnung für die Klasse', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Gibt an ob eine Klasse sichtbar ist', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierungnummer der Klasse', 
  Klassenart varchar(2) COMMENT 'Klassenart', 
  SommerSem varchar(1) DEFAULT '-' COMMENT 'Beginn im Sommersemester nur WBK', 
  NotenGesperrt varchar(1) DEFAULT '-' COMMENT 'Noteneingabe für die Klasse gesperrt', 
  AdrMerkmal varchar(1) DEFAULT 'A' COMMENT 'Adressmerkmal des Teilstandorts für die Klasse', 
  Ankreuzzeugnisse varchar(1) DEFAULT '-' COMMENT 'Gibt an ob in der Klasse Ankreuzeugnisse (GS) oder Kompentenzschreiben (andere) verwendet werden',
  CONSTRAINT PK_Klassen PRIMARY KEY (ID),
  CONSTRAINT Klassen_Schuljahresabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Klassen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Klassen_UC1 UNIQUE (Schuljahresabschnitts_ID, Klasse)
) COMMENT 'Tabelle für die Schuljahresabschnitts-spezifische Klassen-/Versetzungstabelle';


CREATE TABLE Kurse (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Kurses', 
  Schuljahresabschnitts_ID bigint NOT NULL COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  KurzBez varchar(20) NOT NULL COMMENT 'Kursbezeichnung des Kurses', 
  Jahrgang_ID bigint COMMENT 'Jahrgangs_ID des Kurses', 
  ASDJahrgang varchar(2) COMMENT 'ASD-Kürzel des Jahrgangs des Kurses', 
  Fach_ID bigint NOT NULL COMMENT 'Fach_ID des Kurses', 
  KursartAllg varchar(10) COMMENT 'Allgemeine Kursart des Kurses', 
  WochenStd smallint COMMENT 'Wochenstunden des Kurses', 
  Lehrer_ID bigint COMMENT 'Lehrer-ID des unterrichtenden Lehrers des Kurses', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Kurses', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit des Kurses', 
  Schienen varchar(20) COMMENT 'Auflistung der Schienen in denen der Kurs ist', 
  Fortschreibungsart varchar(1) COMMENT 'Fortschreibungsart des Kurses für die Hochschreibung in den nächsten Abschnitt', 
  WochenstdKL float COMMENT 'Wochenstunden des Kurslehrers', 
  SchulNr int COMMENT 'Schulnummer des Kurses bei externen Kursen nötig', 
  EpochU varchar(1) DEFAULT '-' COMMENT 'Gibt an ob ein Kurs Epochal unterrichtet wird', 
  ZeugnisBez varchar(130) COMMENT 'Zeugnisbezeichnung des Kurses', 
  Jahrgaenge varchar(50) COMMENT 'Auflistung der Jahrgänge wenn Kurs übergreifen',
  CONSTRAINT PK_Kurse PRIMARY KEY (ID),
  CONSTRAINT Kurse_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Kurse_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT Kurse_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_Fortschreibungsart_FK FOREIGN KEY (Fortschreibungsart) REFERENCES KursFortschreibungsarten(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Kurse_UC1 UNIQUE (Schuljahresabschnitts_ID, KurzBez, ASDJahrgang, Fach_ID, KursartAllg, WochenStd, Lehrer_ID, Jahrgaenge)
) COMMENT 'Tabelle der Kurse';

CREATE INDEX Kurse_IDX_Schuljahresabschnitts_ID ON Kurse(Schuljahresabschnitts_ID);
CREATE INDEX Kurse_IDX_Fach_ID ON Kurse(Fach_ID);
CREATE INDEX Kurse_IDX_Jahrgang_ID ON Kurse(Jahrgang_ID);
CREATE INDEX Kurse_IDX_Lehrer_ID ON Kurse(Lehrer_ID);


CREATE TABLE LehrerAnrechnung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID für den Eintrag für die Anrechnungsstunden', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID der Lehrerabschnittsdaten', 
  AnrechnungsgrundKrz varchar(10) COMMENT 'Anrechnungsstundentext  für die Anrechnungsstunden', 
  AnrechnungStd float COMMENT 'Zahl der Anrechnungsstunden für die Anrechnungsstunden',
  CONSTRAINT PK_LehrerAnrechnung PRIMARY KEY (ID),
  CONSTRAINT LehrerAnrechnung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerAnrechnung_UC1 UNIQUE (Abschnitt_ID, AnrechnungsgrundKrz)
) COMMENT 'Anrechnungsstunden für Lehrkräfte gültige ASD-Schlüssel';


CREATE TABLE LehrerEntlastung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID für den Eintrag für die Entlastungsstunden (Mehr-Minderleistung)', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID der Lehrerabschnittsdaten', 
  EntlastungsgrundKrz varchar(10) COMMENT 'Kürzel für die Entlastungsstunden (Minderleistung)', 
  EntlastungStd float COMMENT 'Anzahl für die Entlastungsstunden (Minderleistung)',
  CONSTRAINT PK_LehrerEntlastung PRIMARY KEY (ID),
  CONSTRAINT LehrerEntlastung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerEntlastung_UC1 UNIQUE (Abschnitt_ID, EntlastungsgrundKrz)
) COMMENT 'Entlastungsstundenstunden für Lehrkräfte gültige ASD-Schlüssel';


CREATE TABLE LehrerFunktionen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID für den Eintrag für die schulinterne Funktion eines Lehrers', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID der Lehrerabschnittsdaten', 
  Funktion_ID bigint NOT NULL COMMENT 'ID der schulinternen Funktion',
  CONSTRAINT PK_LehrerFunktionen PRIMARY KEY (ID),
  CONSTRAINT LehrerFunktionen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_Funktion_FK FOREIGN KEY (Funktion_ID) REFERENCES K_Schulfunktionen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerFunktionen_UC1 UNIQUE (Abschnitt_ID, Funktion_ID)
) COMMENT 'Lehrkräfte eingetragene Funktionen aus K_Schulfunktionen';


CREATE TABLE LehrerMehrleistung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID für den Eintrag für die Mehrarbeitsstunden eines Lehrers', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID der Lehrerabschnittsdaten', 
  MehrleistungsgrundKrz varchar(10) NOT NULL COMMENT 'Mehrarbeitsstunden Kürzel', 
  MehrleistungStd float COMMENT 'Anzahl Mehrarbeitsstunden',
  CONSTRAINT PK_LehrerMehrleistung PRIMARY KEY (ID),
  CONSTRAINT LehrerMehrleistung_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES LehrerAbschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT LehrerMehrleistung_UC1 UNIQUE (Abschnitt_ID, MehrleistungsgrundKrz)
) COMMENT 'gültige Schlüssel zur Lehrkraft für die Mehrleistungsstunden';


CREATE TABLE LehrerNotenmodulCredentials (
  ,
  CONSTRAINT PK_LehrerNotenmodulCredentials PRIMARY KEY (Lehrer_ID)
) COMMENT 'Die Credentials einer Lehrkraft für die Nutzung des Notenmoduls';


CREATE TABLE Schueler (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Schülerdatensatzes', 
  Schuljahresabschnitts_ID bigint COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  GU_ID varchar(40) NOT NULL COMMENT 'GU_ID des Schülerdatensatzes', 
  SrcID int COMMENT 'DEPRECATED: Muss aber noch aus Schild2 und Schild3 entfernt werden', 
  IDext varchar(30) COMMENT 'externe ID', 
  Status int COMMENT 'Status des Schüler steuert die Einordnung in die Kästen Aktiv Neuaufnahme Abschluss usw.', 
  Name varchar(120) COMMENT 'Name des Schülers PAuswG vom 21.6.2019 §5 Abs. 2', 
  Vorname varchar(80) COMMENT 'Vorname des Schülers PAuswG vom 21.6.2019 §5 Abs. 2. Wird im Client mit Rufname angezeigt.', 
  Zusatz varchar(255) COMMENT 'Alle gültigen Vornamen, wenn mehrere vorhanden sind. Ist nur ein Vorname vorhanden bleibt das Feld leer und Vorname wird genutzt.', 
  Geburtsname varchar(120) COMMENT 'Geburtsname des Schülers', 
  Strassenname varchar(55) COMMENT 'Straßenname des Schülers', 
  HausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  HausNrZusatz varchar(30) COMMENT 'Zusatz zur Hausnummer wenn Hausnummern getrennt gespeichert werden', 
  Ort_ID bigint COMMENT 'ID des Orts des Schülers', 
  Ortsteil_ID bigint COMMENT 'ID des Ortsteils des Schülers', 
  Telefon varchar(20) COMMENT 'Telefonnummer des Schülers', 
  Email varchar(100) COMMENT 'E-Mail-Adresse des Schülers', 
  Fax varchar(20) COMMENT 'Fax oder Mobilnummer des Schülers', 
  Geburtsdatum date COMMENT 'Geburtsdatum des Schülers', 
  Geburtsort varchar(100) COMMENT 'Geburtsort des Schülers', 
  Volljaehrig varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Schüler volljährig ist', 
  Geschlecht smallint COMMENT 'Geschlecht des Schülers', 
  StaatKrz varchar(3) COMMENT 'Kürzel der 1. Staatsangehörigkeit', 
  StaatKrz2 varchar(3) COMMENT 'Kürzel der 2. Staatsangehörigkeit', 
  Aussiedler varchar(1) DEFAULT '-' COMMENT 'DEPRECATED: Gibt an ob der Schüler ausgesiedelt ist (wird nicht mehr erfasst)', 
  Religion_ID bigint COMMENT 'ID des Religionskatalogeintrags', 
  Religionsabmeldung date COMMENT 'Abmeldetdateum vom Religionsunterricht', 
  Religionsanmeldung date COMMENT 'Anmeldedatum zum Religionsunterricht wenn vorher abgemeldet', 
  Bafoeg varchar(1) DEFAULT '-' COMMENT 'Gibt an ob ein Schüler BAFög bezieht', 
  Sportbefreiung_ID bigint COMMENT 'ID der Sportbefreiung', 
  Fahrschueler_ID bigint COMMENT 'ID des Fahrschülereintras', 
  Haltestelle_ID bigint COMMENT 'ID der Haltestelle', 
  SchulpflichtErf varchar(1) DEFAULT '-' COMMENT 'Gibt an ob die Vollzeitschulpflicht erfüllt ist Ja Nein', 
  Aufnahmedatum date COMMENT 'Aufnahmedatum', 
  Einschulungsjahr smallint COMMENT 'Einschulungsjahr', 
  Einschulungsart_ID bigint COMMENT 'ID der Einschlungsart IT.NRW', 
  LSSchulNr varchar(6) COMMENT 'letzte Schule Schulnummer', 
  LSSchulformSIM varchar(3) COMMENT 'letzte Schule Schulgliederung', 
  LSJahrgang varchar(2) COMMENT 'letzte Schule Jahrgang', 
  LSSchulEntlassDatum date COMMENT 'letzte Schule Entlassdatum', 
  LSVersetzung varchar(10) COMMENT 'letzte Schule Versetzungsvermerk', 
  LSFachklKennung varchar(10) COMMENT 'letzte Schule Fachklassenkennung', 
  LSFachklSIM varchar(5) COMMENT 'letzte Schule Fachklassenschlüssel', 
  LSEntlassgrund varchar(50) COMMENT 'letzte Schule Entlassgrund', 
  LSEntlassArt varchar(2) COMMENT 'letzte Schule Entlassart', 
  LSKlassenart varchar(2) COMMENT 'letzte Schule Klassenart', 
  LSRefPaed varchar(1) DEFAULT '-' COMMENT 'letzte Schule Reformpädagogik', 
  Entlassjahrgang varchar(2) COMMENT 'Entlasung von eigener Schule Jahrgang', 
  Entlassjahrgang_ID bigint COMMENT 'Entlasung von eigener Schule JahrgangsID', 
  Entlassdatum date COMMENT 'Entlassdatum', 
  Entlassgrund varchar(50) COMMENT 'Entlassgrund ', 
  Entlassart varchar(2) COMMENT 'Entlassart', 
  SchulwechselNr varchar(6) COMMENT 'Schulnummer aufnehmende Schule', 
  Schulwechseldatum date COMMENT 'Datum des Schulwechsels', 
  Geloescht varchar(1) DEFAULT '-' COMMENT 'Löschmarkierung Schülerdatensatz', 
  Gesperrt varchar(1) DEFAULT '-' COMMENT 'Datensatz gesperrt Ja Nein', 
  ModifiziertAm datetime COMMENT 'zuletzt geändert Datum', 
  ModifiziertVon varchar(20) COMMENT 'zuletzt geändert Benutzer', 
  Markiert varchar(21) DEFAULT '-' COMMENT 'Datensatz ist markiert', 
  FotoVorhanden varchar(1) DEFAULT '-' COMMENT 'DEPRECATED: nicht mehr genutzt Zustimmung Foto', 
  JVA varchar(1) DEFAULT '-' COMMENT 'Ist Schüler einer Justizvollzugsanstalt', 
  KeineAuskunft varchar(1) DEFAULT '-' COMMENT 'Keine Auskunft an Dritte Ja Nein', 
  Beruf varchar(100) COMMENT 'Berufsbezeichnung wenn der Schüler einen hat', 
  AbschlussDatum varchar(15) COMMENT 'Abschlussdatum', 
  Bemerkungen longtext COMMENT 'DEPRECATED: Text für Bemerkungen zum Schüler Memofeld', 
  BeginnBildungsgang date COMMENT 'Beginn des Bildungsgangs BK', 
  DurchschnittsNote varchar(4) COMMENT 'Speichert die Durchschnittsnote mit einer Nachkommastelle (aber als Textfeld) Wird primär am BK benutzt', 
  LSSGL varchar(5) COMMENT 'letzte Schule Gliederung', 
  LSSchulform varchar(2) COMMENT 'letzte Schule Schulform', 
  KonfDruck varchar(1) DEFAULT '+' COMMENT 'Konfession aufs Zeugnis für den Druck', 
  DSN_Text varchar(15) COMMENT 'Speichert die Durchschnittsnote im Klartext (also befriedigend bei einer Durchschnittsnote von z.B. 3.1)', 
  Berufsabschluss varchar(1) COMMENT 'Bezeichnung Berufsabschluss', 
  LSSGL_SIM varchar(3) COMMENT 'Letzte Schule Schulgiederung (wichtig wenn BK)', 
  BerufsschulpflErf varchar(1) DEFAULT '-' COMMENT 'Gibt an ob die Berufsschulpflicht erfüllt ist (Ja/Nein)', 
  StatusNSJ int COMMENT 'Gibt an, welcher Status für das kommende Schuljahr geplant ist (nur BK)', 
  FachklasseNSJ_ID bigint COMMENT 'Gibt an, welche Fachklasse für das kommende Schuljahr geplant ist (nur BK)', 
  BuchKonto float COMMENT 'DEPRECATED: SchildMedia', 
  VerkehrsspracheFamilie varchar(3) DEFAULT 'deu' COMMENT 'Migrationshintergrund Verkehrssprache in der Familie', 
  JahrZuzug int COMMENT 'Migrationshintergrund Zuzugsjahr', 
  DauerKindergartenbesuch varchar(1) COMMENT 'Dauer des Kindergartenbesuchs', 
  VerpflichtungSprachfoerderkurs varchar(1) DEFAULT '-' COMMENT 'Wurde zu einem Sprachförderkurs verpflichtet (Ja/Nein)', 
  TeilnahmeSprachfoerderkurs varchar(1) DEFAULT '-' COMMENT 'Teilnahme an einen Sprachförderkurs (Ja/Nein)', 
  SchulbuchgeldBefreit varchar(1) DEFAULT '-' COMMENT 'Vom Schulbuchgeld befreit (Ja/Nein)', 
  GeburtslandSchueler varchar(10) COMMENT 'Migrationshintergrund Geburtsland des Schülers', 
  GeburtslandVater varchar(10) COMMENT 'Migrationshintergrund Geburtsland des Vaters', 
  GeburtslandMutter varchar(10) COMMENT 'Migrationshintergrund Geburtsland der Mutter', 
  Uebergangsempfehlung_JG5 varchar(10) COMMENT 'Übergangsempfehlung für den Jahrgang 5', 
  ErsteSchulform_SI varchar(10) COMMENT 'Erste Schulform in der Sek1', 
  JahrWechsel_SI int COMMENT 'Jahr des Wechsels in die Sekundarstufe I', 
  JahrWechsel_SII int COMMENT 'Jahr des Wechsels in die Sekundarstufe II', 
  Migrationshintergrund varchar(1) DEFAULT '-' COMMENT 'Migrationshintergrund vorhanden (Ja/Nein)', 
  ExterneSchulNr varchar(6) COMMENT 'Schulnummer von externen Koopschüern', 
  Kindergarten_ID bigint COMMENT 'ID des Kinderkarteneintrags (GS)', 
  LetzterBerufsAbschluss varchar(10) COMMENT 'erreichter berufsbezogener Abschluss LSSchule', 
  LetzterAllgAbschluss varchar(10) COMMENT 'erreichter allgemeinbildender Abschluss LSSchule', 
  Land varchar(2) COMMENT 'Land des Wohnsitzes des Schüler (in Grenzgebieten möglich)', 
  Duplikat varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Datensatz ein Duplikat ist', 
  EinschulungsartASD varchar(2) COMMENT 'ASD-Kürzel Einschulungsart IT.NRW', 
  DurchschnittsnoteFHR varchar(4) COMMENT 'Speichert die Durchschnittsnote der FHR-Prüfung mit einer Nachkommastelle (aber als Textfeld) Wird nur am BK benutzt', 
  DSN_FHR_Text varchar(15) COMMENT 'Speichert die Durchschnittsnote der FHR-Prüfung im Klartext (also befriedigend bei einer Durchschnittsnote von z.B. 3.1) wird nur am BK verwendet', 
  Eigenanteil float COMMENT 'TODO DEPRECATED: Eigenanteil Ja/Nein ', 
  BKAZVO int COMMENT 'Gibt an ob der Schüler in einem Bildungsgang nach BKAZVO ist (BK)', 
  HatBerufsausbildung varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Schüler eine Berufsausbildung hat (BK)', 
  Ausweisnummer varchar(30) COMMENT 'Nummer des Schülerausweises', 
  EPJahre int DEFAULT 2 COMMENT 'Anzahl der Jahre in der Schuleingangssphase', 
  LSBemerkung varchar(255) COMMENT 'Bemerkung der zuletzt besuchten Schule', 
  WechselBestaetigt varchar(1) DEFAULT '-' COMMENT 'Wechsel zur aufnehmenden Schule bestätigt', 
  DauerBildungsgang int COMMENT 'Dauer des Bildungsgangs am BK', 
  AnmeldeDatum date COMMENT 'Anmeldedatum des Schülers', 
  MeisterBafoeg varchar(1) DEFAULT '-' COMMENT 'Gibt an ob ein Schüler MeisterBafög bezieht BK', 
  OnlineAnmeldung varchar(1) DEFAULT '-' COMMENT 'Schüler hat sich Online angemeldet (Ja/Nein)', 
  Dokumentenverzeichnis varchar(255) COMMENT 'Pfad zum Dokumentenverzeichnis', 
  Berufsqualifikation varchar(100) COMMENT 'Karteireiter Schulbesuch Berufsausbildung vorhanden (Ja/Nein)', 
  EndeEingliederung date COMMENT 'Ende der Eingliederung bei zugezogenen Schülern (Flüchtlingen)', 
  SchulEmail varchar(100) COMMENT 'schulische E-Mail-Adresse des Schülers', 
  EndeAnschlussfoerderung date COMMENT 'Ende der Anschlussförderung bei zugezogenen Schülern (Flüchtlingen)', 
  MasernImpfnachweis varchar(1) DEFAULT '-' COMMENT 'Gibt an, ob ein Nachweis über die Masern-Impfung erbracht wurde', 
  Lernstandsbericht varchar(1) DEFAULT '-' COMMENT 'Gibt an ob ein Schüler Sprachförderung in Deutsch (DAZ) erhält und somit Lernstandsberichte statt Zeugnisse', 
  SprachfoerderungVon date COMMENT 'Datum des Beginns der Sprachförderung', 
  SprachfoerderungBis date COMMENT 'Datum des Endes der Sprachförderung', 
  EntlassungBemerkung varchar(255) COMMENT 'Bemerkung bei Entlassung von der eigenen Schule', 
  CredentialID bigint COMMENT 'Die ID des Credential-Eintrags', 
  NeuZugewandert int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob der Schueler neu zugewandert ist (1) oder nicht (0). Wurde in der Ukraine Krise im Migrationshintergrund geschaffen.',
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
) COMMENT 'Tabelle mit den Grundlegenden Schülerdaten';


CREATE TABLE EigeneSchule_Abt_Kl (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Klassenzugehörigkeit zu einer Abteilung', 
  Abteilung_ID bigint NOT NULL COMMENT 'ID der Abteilung in der übergeordneten Tabelle', 
  Klassen_ID bigint NOT NULL COMMENT 'ID der Klasse die zur Abteilung gehört', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'steuert die Sichtbarkeit der Klasse zur Abteilung',
  CONSTRAINT PK_EigeneSchule_Abt_Kl PRIMARY KEY (ID),
  CONSTRAINT EigeneSchule_Abt_Kl_Abteilung_FK FOREIGN KEY (Abteilung_ID) REFERENCES EigeneSchule_Abteilungen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT EigeneSchule_Abt_Kl_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle ordnet den Abteilungen (EigeneSchule_Abteilungen) die zugehörigen Klassen zu';


CREATE TABLE Gost_Blockung_Zwischenergebnisse_Kurs_Schueler (
  ,
  CONSTRAINT PK_Gost_Blockung_Zwischenergebnisse_Kurs_Schueler PRIMARY KEY (Zwischenergebnis_ID, Blockung_Kurs_ID, Schueler_ID)
) COMMENT 'Tabelle für die Zuordnung von Schüler zu Kursen bei Zwischenergebnissen, welche einer Kursblockung der gymnasialen Oberstufe zugeordnet sind';


CREATE TABLE Gost_Schueler (
  Schueler_ID bigint NOT NULL COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Die ID des Schülers in der Schülertabelle', 
  DatumBeratung datetime COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Das Datum der letzten Beratung des Schülers', 
  DatumRuecklauf datetime COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Das Datum an dem der letzte Beratungsbogen des Schülersmit seiner Fächerwahl in der Schule eingereicht wurde', 
  HatSportattest int DEFAULT 0 NOT NULL COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Gibt an, ob ein Sportattest bei dem Schüler vorliegt oder nicht und die Wahl eines Ersatzfaches zulässig ist: 1 - true, 0 - false', 
  Kommentar longtext COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Kommentar des Beratungslehrers zur der Wahl des Schülers', 
  Beratungslehrer_ID bigint COMMENT 'Gymnasiale Oberstufe - Schülerdaten: ID des Beratungslehrers, der die letzte Beratung vorgenommen hat', 
  PruefPhase varchar(1) COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Gibt an welche Halbjahre bei der Belegprüfung geprüft werden sollen (E - nur EF.1, G - Gesamtprüfung bis einschließlich Q2.2)', 
  BesondereLernleistung_Art varchar(1) COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Die Art einer besonderen Lernleistung', 
  BesondereLernleistung_Punkte int COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Die Notenpunkte der besonderen Lernleistung ',
  CONSTRAINT PK_Gost_Schueler PRIMARY KEY (Schueler_ID),
  CONSTRAINT Gost_Schueler_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Gymnasiale Oberstufe: Zusatzinformationen für Schüler der gymnasialen Oberstufe ';


CREATE TABLE Gost_Schueler_Fachwahlen (
  Schueler_ID bigint NOT NULL COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: ID des Schülers in der Schuelertabelle', 
  Fach_ID bigint NOT NULL COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: ID des Faches in der Fächertabelle', 
  EF1_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Kursart des belegten Faches in EF.1', 
  EF1_Punkte varchar(2) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Notenpunkte des belegten faches in EF.1', 
  EF2_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Kursart des belegten Faches in EF.2', 
  EF2_Punkte varchar(2) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Notenpunkte des belegten faches in EF.2', 
  Q11_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Kursart des belegten Faches in Q1.1', 
  Q11_Punkte varchar(2) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Notenpunkte des belegten faches in Q1.1', 
  Q12_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Kursart des belegten Faches in Q1.2', 
  Q12_Punkte varchar(2) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Notenpunkte des belegten faches in Q1.2', 
  Q21_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Kursart des belegten Faches in Q2.1', 
  Q21_Punkte varchar(2) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Notenpunkte des belegten faches in Q2.1', 
  Q22_Kursart varchar(10) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Kursart des belegten Faches in Q2.2', 
  Q22_Punkte varchar(2) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Notenpunkte des belegten faches in Q2.2', 
  AbiturFach int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Abiturfach 1 bis 4 oder null', 
  Bemerkungen varchar(50) COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen: Bemerkungen zum belegten Fach', 
  Markiert_Q1 int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Gibt an, ob das belegte Fach in der Q1.1 für die Einbringung in das Abitur markiert wurde', 
  Markiert_Q2 int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Gibt an, ob das belegte Fach in der Q1.2 für die Einbringung in das Abitur markiert wurde', 
  Markiert_Q3 int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Gibt an, ob das belegte Fach in der Q2.1 für die Einbringung in das Abitur markiert wurde', 
  Markiert_Q4 int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Gibt an, ob das belegte Fach in der Q2.2 für die Einbringung in das Abitur markiert wurde', 
  ergebnisAbiturpruefung int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Das Ergebnis der Abiturprüfung in einem Abiturfach (1. - 4. Fach)', 
  hatMuendlichePflichtpruefung int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Gibt an, ob eine mündliche Pflichtprüfung im 1. - 3. Fach angesetzt werden muss (null - unbekannt, 0 - Nein, 1 - Ja)  ', 
  ergebnisMuendlichePruefung int COMMENT 'Gymnasiale Oberstufe - Schülerdaten - Fachwahlen - Abiturberechnung: Ergebnis der mündlichen Prüfung im 1. - 3. Fach',
  CONSTRAINT PK_Gost_Schueler_Fachwahlen PRIMARY KEY (Schueler_ID, Fach_ID),
  CONSTRAINT Gost_Schueler_Fachwahlen_Schueler_ID_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Gost_Schueler_Fachwahlen_Fach_ID_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT 'Gymnasiale Oberstufe - Schülerdaten: Informationen zu den vom Schüler gewählten Fächern';

CREATE INDEX Gost_Schueler_Fachwahlen_IDX_Schueler_ID ON Gost_Schueler_Fachwahlen(Schueler_ID);


CREATE TABLE KlassenLehrer (
  Klassen_ID bigint NOT NULL COMMENT 'ID der Klasse', 
  Lehrer_ID bigint NOT NULL COMMENT 'ID des Lehrers', 
  Reihenfolge int DEFAULT 1 NOT NULL COMMENT 'Die Reihenfolge, in welcher die Klassenlehrer in der Klassen angegeben werden. Kann zur Unterscheidung zwischen Klassenlehrern (1) und deren Stellvertretern (2, ...) genutzt werden, wenn keine alphabetische Reihenfolge gewünscht ist. ',
  CONSTRAINT PK_KlassenLehrer PRIMARY KEY (Klassen_ID, Lehrer_ID),
  CONSTRAINT Klassenlehrer_Klasse_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Klassenlehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle für die Schuljahresabschnitts-spezifische Zuordnung von Klassenleitungen zu den Klassen ';


CREATE TABLE KursLehrer (
  Kurs_ID bigint NOT NULL COMMENT 'ID des Kurses zu denen der Lehrer gehört', 
  Lehrer_ID bigint NOT NULL COMMENT 'ID des Lehrers', 
  Anteil float COMMENT 'Wochenstunden für die Zusatzkraft',
  CONSTRAINT PK_KursLehrer PRIMARY KEY (Kurs_ID, Lehrer_ID),
  CONSTRAINT KursLehrer_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursLehrer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Zusätzliche Lehrkräfte in den Kursen';


CREATE TABLE Kurs_Schueler (
  Kurs_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Kurses – verweist auf den Kurs', 
  Schueler_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Schülers – verweist auf den Schüler', 
  LernabschnittWechselNr smallint DEFAULT 0 COMMENT 'Wird für Wiederholungen im Laufenden Schuljahresabschnitt genutzt 0=aktueller/neuester Lernabschnitt 1=vor dem ersten Wechsel 2=vor dem zweiten Wechsel usw',
  CONSTRAINT PK_Kurs_Schueler PRIMARY KEY (Kurs_ID, Schueler_ID, LernabschnittWechselNr),
  CONSTRAINT KursSchueler_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT KursSchueler_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle mit KursSchueler-Zuordnungen für performanteren Zugriff, welcher über Trigger befüllt wird.';


CREATE TABLE SchuelerAbgaenge (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der abgebenden Schule in der Liste', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID zur abgebenden Schule', 
  BemerkungIntern varchar(30) COMMENT 'interne Bemerkung zur abgebenden Schule', 
  AbgangsSchulform varchar(2) COMMENT 'FSchulform zur abgebenden Schule', 
  AbgangsBeschreibung varchar(200) COMMENT 'Abgangsbeschreibung zur abgebenden Schule', 
  OrganisationsformKrz varchar(1) COMMENT 'Organisationform zur abgebenden Schule', 
  AbgangsSchule varchar(100) COMMENT 'Bezeichnung  zur abgebenden Schule', 
  AbgangsSchuleAnschr varchar(100) COMMENT 'Anschrift zur abgebenden Schule', 
  AbgangsSchulNr varchar(6) COMMENT 'Schulnummer zur abgebenden Schule', 
  LSJahrgang varchar(2) COMMENT 'Abgangsjahrgang zur abgebenden Schule', 
  LSEntlassArt varchar(2) COMMENT 'Entlassart zur abgebenden Schule', 
  LSSchulformSIM varchar(3) COMMENT 'Statiatikkürzel Schulform zur abgebenden Schule', 
  LSSchulEntlassDatum date COMMENT 'Entalssdtaum zur abgebenden Schule', 
  LSVersetzung varchar(2) COMMENT 'Versetzungsvermerk zur abgebenden Schule', 
  LSSGL varchar(5) COMMENT 'SGL zur abgebenden Schule', 
  LSFachklKennung varchar(10) COMMENT 'Fachklassenkennung zur abgebenden Schule BK', 
  LSFachklSIM varchar(5) COMMENT 'Statiatikkürzel Fachklasse zur abgebenden Schule', 
  FuerSIMExport varchar(1) DEFAULT '-' COMMENT 'SIM-Export zur abgebenden Schule', 
  LSBeginnDatum date COMMENT 'Aufnahmedatum zur abgebenden Schule', 
  LSBeginnJahrgang varchar(2) COMMENT 'Aufnahmejahrgang zur abgebenden Schule',
  CONSTRAINT PK_SchuelerAbgaenge PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbgaenge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Liste der besuchten Schulen zum Schüler > Schulbesuch';

CREATE INDEX SchuelerAbgaenge_IDX1 ON SchuelerAbgaenge(Schueler_ID, LSSchulEntlassDatum);


CREATE TABLE SchuelerAbiFaecher (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine eindeutige ID für die Abitur-Fach-Informationen des Schülers', 
  Schueler_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Schülers – verweist auf den Schüler', 
  Fach_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Faches – verweist auf das Fach', 
  FachKrz varchar(20) COMMENT 'Das Kürzel des Faches', 
  FSortierung int COMMENT 'Deprecated: Eine Zahl, welche die Sortierung der Fächer angibt', 
  Kurs_ID bigint COMMENT 'Letzer Kurs Q2, 2.Hj: Die Kurs ID - verweist auf Kurse', 
  KursartAllg varchar(10) COMMENT 'Die allgemeine Kursart des Faches (z.B. GK, LK)', 
  Fachlehrer_ID bigint COMMENT 'Letzer Kurs Q2, 2.Hj: Die ID des Fachlehrers, der als letztes in diesem Fach unterrichtet hat', 
  AbiFach varchar(1) COMMENT 'Gibt an, ob das Fach bei der Abiturprüfung gewählt wurde und dann die Nummer des Abiturfaches (1-4)', 
  P11_1 varchar(2) COMMENT 'EF, 1. HJ: Die Notenpunkte für das Fach, NULL falls das Fach in dieserm Halbjahr nicht belegt wurde', 
  S11_1 varchar(1) DEFAULT '-' COMMENT 'EF, 1. HJ: Gibt die Art und Schriftlichkeit des Kurses an (-: nicht belegt, M: GK mündlich, S: GK schriftlich)', 
  P11_2 varchar(2) COMMENT 'EF, 2. HJ: Die Notenpunkte für das Fach, NULL falls das Fach in dieserm Halbjahr nicht belegt wurde', 
  S11_2 varchar(1) DEFAULT '-' COMMENT 'EF, 2. HJ: Gibt die Art und Schriftlichkeit des Kurses an (-: nicht belegt, M: GK mündlich, S: GK schriftlich)', 
  P_FA varchar(2) COMMENT 'BK: eingebrachte Facharbeit – Notenpunkte', 
  R_FA varchar(1) DEFAULT '-' COMMENT 'BK: eingebrachte Facharbeit – Gibt an, ob die Notenpunkte bei der Abiturberechnung genutzt werden, d.h. zur Nutzung markiert wurden. (+: Nutze für Berechnung, -: Nutze nicht für die Berechnung; /: Für die Nutzung zur Berechnung gesperrt)', 
  W12_1 int COMMENT 'Q1, 1. Hj: Die Anzahl der Wochenstunden in diesem Halbjahr', 
  P12_1 varchar(2) COMMENT 'Q1, 1. Hj: Die Notenpunkte für das Fach, NULL falls das Fach in dieserm Halbjahr nicht belegt wurde', 
  H12_1 int COMMENT 'BK: Q1, 1. Hj: Speichert die User_ID von einem Benutzer, welche eine Proberechnung mit fiktiven Daten durchführt', 
  R12_1 varchar(1) DEFAULT '-' COMMENT 'Q1, 1. Hj: Gibt an, ob die Notenpunkte bei der Abiturberechnung genutzt werden, d.h. zur Nutzung markiert wurden. (+: Nutze für Berechnung, -: Nutze nicht für die Berechnung; /: Für die Nutzung zur Berechnung gesperrt)', 
  S12_1 varchar(1) DEFAULT '-' COMMENT 'Q1, 1. Hj: Gibt die Art und Schriftlichkeit des Kurses an (-: nicht belegt, M: GK mündlich, S: GK schriftlich, Z: Zusatzkurs, L: LK)', 
  W12_2 int COMMENT 'Q1, 2. Hj: Die Anzahl der Wochenstunden in diesem Halbjahr', 
  P12_2 varchar(2) COMMENT 'Q1, 2. Hj: Die Notenpunkte für das Fach, NULL falls das Fach in dieserm Halbjahr nicht belegt wurde', 
  H12_2 int COMMENT 'BK: Q1, 2. Hj: Speichert die User_ID von einem Benutzer, welche eine Proberechnung mit fiktiven Daten durchführt', 
  R12_2 varchar(1) DEFAULT '-' COMMENT 'Q1, 2. Hj: Gibt an, ob die Notenpunkte bei der Abiturberechnung genutzt werden, d.h. zur Nutzung markiert wurden. (+: Nutze für Berechnung, -: Nutze nicht für die Berechnung; /: Für die Nutzung zur Berechnung gesperrt)', 
  S12_2 varchar(1) DEFAULT '-' COMMENT 'Q1, 2. Hj: Gibt die Art und Schriftlichkeit des Kurses an (-: nicht belegt, M: GK mündlich, S: GK schriftlich, Z: Zusatzkurs, L: LK)', 
  W13_1 int COMMENT 'Q2, 1. Hj: Die Anzahl der Wochenstunden in diesem Halbjahr', 
  P13_1 varchar(2) COMMENT 'Q2, 1. Hj: Die Notenpunkte für das Fach, NULL falls das Fach in dieserm Halbjahr nicht belegt wurde', 
  H13_1 int COMMENT 'BK: Q2, 1. Hj: Speichert die User_ID von einem Benutzer, welche eine Proberechnung mit fiktiven Daten durchführt', 
  R13_1 varchar(1) DEFAULT '-' COMMENT 'Q2, 1. Hj: Gibt an, ob die Notenpunkte bei der Abiturberechnung genutzt werden, d.h. zur Nutzung markiert wurden. (+: Nutze für Berechnung, -: Nutze nicht für die Berechnung; /: Für die Nutzung zur Berechnung gesperrt)', 
  S13_1 varchar(1) DEFAULT '-' COMMENT 'Q2, 1. Hj: Gibt die Art und Schriftlichkeit des Kurses an (-: nicht belegt, M: GK mündlich, S: GK schriftlich, Z: Zusatzkurs, L: LK)', 
  W13_2 int COMMENT 'Q2,21. Hj: Die Anzahl der Wochenstunden in diesem Halbjahr', 
  P13_2 varchar(2) COMMENT 'Q2, 2. Hj: Die Notenpunkte für das Fach, NULL falls das Fach in dieserm Halbjahr nicht belegt wurde', 
  H13_2 int COMMENT 'BK: Q2, 2. Hj: Speichert die User_ID von einem Benutzer, welche eine Proberechnung mit fiktiven Daten durchführt', 
  R13_2 varchar(1) DEFAULT '-' COMMENT 'Q2, 2. Hj: Gibt an, ob die Notenpunkte bei der Abiturberechnung genutzt werden, d.h. zur Nutzung markiert wurden. (+: Nutze für Berechnung, -: Nutze nicht für die Berechnung; /: Für die Nutzung zur Berechnung gesperrt)', 
  S13_2 varchar(1) DEFAULT '-' COMMENT 'Q2, 2. Hj: Gibt die Art und Schriftlichkeit des Kurses an (-: nicht belegt, M: GK mündlich, S: GK schriftlich, Z: Zusatzkurs, L: LK)', 
  Zulassung smallint COMMENT 'Die Punkte für das Fach für die Abiturzulassung, NULL falls kein Kurs des Faches eingeht', 
  Durchschnitt float COMMENT 'Der Notendurchschnitt, falls das Fach eines der ersten drei Abiturfächer ist', 
  AbiPruefErgebnis smallint COMMENT 'Die Notenpunkte aus der Abiturprüfung, falls das Fach eines der vier Abiturfächer ist', 
  Zwischenstand smallint COMMENT 'Die Notenpunkte aus der Abiturprüfung multipliziert mit dem entsprechenden Faktor, falls das Fach eines der vier Abiturfächer ist (hier wird z.B. die besondere Lernleistung berücksichtigt', 
  MdlPflichtPruefung varchar(1) DEFAULT '-' COMMENT 'true, falls eine mündliche Abweichungsprüfung in einem der ersten drei Abiturfächer nötig ist.', 
  MdlBestPruefung varchar(1) DEFAULT '-' COMMENT 'true, falls eine mündliche Bestehensprüfung in den ersten drei Abiturfächern notwendig ist, damit das Abitur noch bestanden werden kann.', 
  MdlFreiwPruefung varchar(1) DEFAULT '-' COMMENT 'true, falls eine freiwillige Prüfung in einem der ersten drei Abiturfächer stattfindet.', 
  MdlPruefErgebnis smallint COMMENT 'enthält die Notenpunkte aus der mündlichen Abiturprüfung in einem der ersten drei Abiturfächer, falls diese durchgeführt wird, ansonsten NULL', 
  MdlPruefFolge smallint COMMENT 'enthält die Reihenfolge für mündliche Prüfungen in den ersten drei Abiturfächern, falls mehrere angesetzt werden (1, 2, 3)', 
  AbiErgebnis smallint COMMENT 'Die Notenpunkte aus der Abiturprüfung multipliziert mit dem entsprechenden Faktor (hier wird z.B. die besondere Lernleistung) und unter Einbeziehung einer möglichen mündlicher Prüfung',
  CONSTRAINT PK_SchuelerAbiFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbiFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerAbiFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbiFaecher_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Abiturfächer zum Schüler';


CREATE TABLE SchuelerAbitur (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine eindeutige ID für den Abiturdatensatz', 
  Schueler_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Schülers – verweist auf den Schüler', 
  Schuljahresabschnitts_ID bigint COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  FA_Fach varchar(130) COMMENT 'BK: Facharbeit – Fach', 
  FA_Punkte int COMMENT 'BK: Facharbeit – Notenpunkte der Facharbeit', 
  FehlStd int COMMENT 'Die Summe der Fehlstunden – sofern berechnet', 
  uFehlStd int COMMENT 'Die Summe der unentschuldigten Fehlstunden – sofern berechnet', 
  FranzBilingual varchar(1) DEFAULT '-' COMMENT 'DEPRECATED, nicht mehr genutzt', 
  BesondereLernleistung varchar(1) DEFAULT '-' COMMENT 'DEPRECATED, nur für alte APO, markiert, ob eine besondere Lernleistung vorliegt', 
  AnzRelLK smallint COMMENT 'DEPRECATED, nur alte APO für altes G9', 
  AnzRelGK smallint COMMENT 'DEPRECATED, nur alte APO für altes G9', 
  AnzRelOK smallint COMMENT 'DEPRECATED, nur alte APO für altes G9', 
  AnzDefLK smallint COMMENT 'DEPRECATED, nur alte APO für altes G9', 
  AnzDefGK smallint COMMENT 'DEPRECATED, nur alte APO für altes G9', 
  Thema_PJK varchar(255) COMMENT 'Projektkurs: Das Thema des Projektkurses', 
  FS2_SekI_Manuell varchar(1) DEFAULT '-' COMMENT 'true, falls die zweite Fremsprache in der Sekundarstufe 1 manuell geprüft wurde und vom Algorithmus als gegeben angesehen werden kann.', 
  Kurse_I int COMMENT 'Block I: Die Anzahl der eingebrachten Kurse aus der Qualifikationsphase', 
  Defizite_I int COMMENT 'Block I: Die Gesamtanzahl der eingebrachten Defizite aus der Qualifikationsphase', 
  LK_Defizite_I int COMMENT 'Block I: Die Anzahl der Defizite im LK-Bereich aus der Qualifikationsphase', 
  AnzahlKurse_0 int COMMENT 'Block I: Die Anzahl der Defizite mit 0 Punkten', 
  Punktsumme_I int COMMENT 'Block I: Die normierte Punktesumme aus der Qualifikationsphase', 
  Durchschnitt_I float COMMENT 'Block I: Der Notenpunktdurchschnitt aus den eingebrachten Kurse der Qualifikationsphase', 
  SummeGK smallint COMMENT 'Block I: Die Summe der erreichten Notepunkte aus dem Grundkurs-Bereich', 
  SummeLK smallint COMMENT 'Block I: Die Summe der erreichten Notepunkte aus dem Leistungskurs-Bereich', 
  SummenOK smallint COMMENT 'DEPRECATED: Punktsummen OK für alte APO für altes G9 (1: , NULL: )', 
  Zugelassen varchar(1) DEFAULT '-' COMMENT 'Block I: Gibt an, ob der Schüler zu den Abiturprüfungen zugelassen ist, d.h. die Bedingungen für Block I erfüllt hat (+: Ja, -: Nein, R: Freiwilliger Rücktritt)', 
  BLL_Art varchar(1) DEFAULT 'K' COMMENT 'Besondere Lernleistung: Die Art der besonderen Lernleistung(K: Keine, E: Externe, P: in einem Projektkurs)', 
  BLL_Punkte int COMMENT 'Besondere Lernleistung: Die Notenpunkte, welche bei der besonderen Lernleistung erreicht wurden – einfach gewichtet', 
  Thema_BLL varchar(255) COMMENT 'Besondere Lernleistung: Das Thema der besonderen Lernleistung', 
  Punktsumme_II int COMMENT 'Block II: Die Punktsumme aus den Abiturprüfungen, NULL falls noch nicht berechnet', 
  Defizite_II int COMMENT 'Block II: Die Anzahl der Defizite bei den Abiturprüfungen, NULL falls noch nicht berechnet', 
  LK_Defizite_II int COMMENT 'Block II: Die Anzahl der LK-Defizite bei den Abiturprüfungen, NULL falls noch nicht berechnet', 
  PruefungBestanden varchar(1) DEFAULT '-' COMMENT 'Gesamt: Gibt an, ob die Abiturprüfung bestanden wurde', 
  Note varchar(3) COMMENT 'Gesamt: Die Abschlussnote des Abiturs', 
  GesamtPunktzahl smallint COMMENT 'Gesamt: Die Gesamtpunktzahl aus beiden Blöcken (Qualifikationsphase und Abiturprüfung)', 
  Notensprung smallint COMMENT 'Gesamt: Die Gesamtpunktzahl, ab der eine höhere Notenstufe erreicht würde', 
  FehlendePunktzahl smallint COMMENT 'Gesamt: Die Anzahl an Punkten, die zur nächsthöheren Note fehlt',
  CONSTRAINT PK_SchuelerAbitur PRIMARY KEY (ID),
  CONSTRAINT SchuelerAbitur_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAbitur_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAbitur_UC1 UNIQUE (Schueler_ID)
) COMMENT 'Abiturdaten zum Schüler';


CREATE TABLE SchuelerBKAbschluss (
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID für den BKAbschlussReiter', 
  Schuljahresabschnitts_ID bigint COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  Zulassung char(1) COMMENT 'Zulassung Ja Nein für den BKAbschlussReiter', 
  Bestanden char(1) COMMENT 'Bestanden Ja Nein  für den BKAbschlussReiter', 
  ZertifikatBK char(1) COMMENT 'DEPRECATED: Zertifikat für den BKAbschlussReiter', 
  ZulassungErwBK char(1) COMMENT 'Zulassung erweiterte Beruflliche Kenntnisse', 
  BestandenErwBK char(1) COMMENT 'Bestanden erweiterte Beruflliche Kenntnisse', 
  ZulassungBA char(1) COMMENT 'Zulassung Berufsabschluss  für den BKAbschlussReiter', 
  BestandenBA char(1) COMMENT 'Bestanden Berufsabschluss für den BKAbschlussReiter', 
  PraktPrfNote varchar(2) COMMENT 'Note Praktische Prüfung für den BKAbschlussReiter', 
  NoteKolloquium varchar(2) COMMENT 'Note Kolloqium für den BKAbschlussReiter', 
  ThemaAbschlussarbeit longtext COMMENT 'Thema Abschlussarbeit für den BKAbschlussReiter', 
  BAP_Vorhanden varchar(1) COMMENT 'Berufsabschlussprüfung vorhanden für den BKAbschlussReiter', 
  NoteFachpraxis varchar(2) COMMENT 'Note der Fachpraxis für den BKAbschlussReiter', 
  FachPraktAnteilAusr varchar(1) COMMENT 'Fachpraktische Anteile mindestens ausreichend für den BKAbschlussReiter',
  CONSTRAINT PK_SchuelerBKAbschluss PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerBKAbschluss_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKAbschluss_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'BKAbschluss-Daten (BK) und ZP10 andere Schulformen mit ZP10 oder ZK';


CREATE TABLE SchuelerBKFaecher (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Facheintrags für den BKAbschlussReiter', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerIDdes Facheintrags für den BKAbschlussReiter', 
  Schuljahresabschnitts_ID bigint COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte für den Facheintrag', 
  Fach_ID bigint NOT NULL COMMENT 'FachID des Facheintrags für den BKAbschlussReiter', 
  FachKrz varchar(20) COMMENT 'Kachkürzel des Facheintrags für den BKAbschlussReiter', 
  FachSchriftlich char(1) COMMENT 'Schriftlichkeit Allgemeinbildend  des Facheintrags für den BKAbschlussReiter', 
  FachSchriftlichBA char(1) COMMENT 'Schriftlichkeit Berufsbezogen des Facheintrags für den BKAbschlussReiter', 
  Vornote varchar(2) COMMENT 'Vornote zum Fach des Facheintrags für den BKAbschlussReiter', 
  NoteSchriftlich varchar(2) COMMENT 'Schriftliche Note  des Facheintrags für den BKAbschlussReiter', 
  MdlPruefung char(1) COMMENT 'Mündliche Prüfung angesetzt Ja Nein  des Facheintrags für den BKAbschlussReiter', 
  MdlPruefungFW char(1) COMMENT 'Freiwilliege mündliche Prüfung angesetzt Ja Nein  des Facheintrags für den BKAbschlussReiter', 
  NoteMuendlich varchar(2) COMMENT 'Note mündliche Prüfung  des Facheintrags für den BKAbschlussReiter', 
  NoteAbschluss varchar(2) COMMENT 'Abschlussnote  des Facheintrags für den BKAbschlussReiter', 
  NotePrfGesamt varchar(2) COMMENT 'DEPRECATED: Wird seit Änderung der APO-BK nicht mehr genutzt. Gesamtprüfungsnote des Facheintrags für den BKAbschlussReiter', 
  FSortierung int COMMENT 'Sortierung des Facheintrags für den BKAbschlussReiter', 
  Fachlehrer_ID bigint COMMENT 'Lehrer-ID des Facheintrags für den BK-Abschluss-Reiter', 
  NoteAbschlussBA varchar(2) COMMENT 'Abschlussnote berufsbezogen  des Facheintrags für den BKAbschlussReiter', 
  Kursart varchar(10) COMMENT 'Kursart des Facheintrags für den BKAbschlussReiter',
  CONSTRAINT PK_SchuelerBKFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerBKFaecher_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerBKFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerBKFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Fächer zum Schüler in der Tabelle BKAbschluss';


CREATE TABLE SchuelerDatenschutz (
  Schueler_ID bigint NOT NULL COMMENT 'Fremdschlüssel auf Tabelle Schueler', 
  Datenschutz_ID bigint NOT NULL COMMENT 'Fremdschlüssel auf den Katalog der DSGVO-Merkmale', 
  Status varchar(1) DEFAULT '-' NOT NULL COMMENT 'Gibt an ob eine Zustimmung zum Merkmal vorliegt.', 
  Abgefragt int DEFAULT 0 NOT NULL COMMENT 'Status der Abfrage Datenschutz-Eintrags (true/false)',
  CONSTRAINT PK_SchuelerDatenschutz PRIMARY KEY (Schueler_ID, Datenschutz_ID),
  CONSTRAINT SchuelerDatenschutz_K_Datenschutz_FK FOREIGN KEY (Datenschutz_ID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerDatenschutz_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle für die zum Schüler zugeordneten DSGVO Merkmale';


CREATE TABLE SchuelerErzAdr (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Erzieherdatensatzes', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID zum Erzieherdatensatz', 
  ErzieherArt_ID bigint COMMENT 'ErziherARTID zum Erzieherdatensatz', 
  Anrede1 varchar(20) COMMENT 'Anrede1 zum Erzieherdatensatz', 
  Titel1 varchar(10) COMMENT 'Titel1 zum Erzieherdatensatz', 
  Name1 varchar(120) COMMENT 'Nachname1 zum Erzieherdatensatz PAuswG vom 21.6.2019 §5 Abs. 2', 
  Vorname1 varchar(80) COMMENT 'Vorname1 zum Erzieherdatensatz PAuswG vom 21.6.2019 §5 Abs. 2. Wird im Client mit Rufname angezeigt.', 
  Anrede2 varchar(20) COMMENT 'Anrede2 zum Erzieherdatensatz', 
  Titel2 varchar(10) COMMENT 'Titel2 zum Erzieherdatensatz', 
  Name2 varchar(120) COMMENT 'Nachname2 zum Erzieherdatensatz PAuswG vom 21.6.2019 §5 Abs. 2', 
  Vorname2 varchar(80) COMMENT 'Vorname2 zum Erzieherdatensatz PAuswG vom 21.6.2019 §5 Abs. 2. Wird im Client mit Rufname angezeigt.', 
  ErzOrt_ID bigint COMMENT 'OrtID zum Erzieherdatensatz', 
  ErzStrassenname varchar(55) COMMENT 'Straßenname des Erzieherdatensatzes', 
  ErzHausNr varchar(10) COMMENT 'Hausnummer wenn getrennt gespeichert', 
  ErzOrtsteil_ID bigint COMMENT 'OrtsteilID zum Erzieherdatensatz', 
  ErzHausNrZusatz varchar(30) COMMENT 'Zusatz zur Hausnummer wenn Hausnummern getrennt gespeichert werden', 
  ErzAnschreiben varchar(1) DEFAULT '+' COMMENT 'Erhältanschreiben Ja Nein zum Erzieherdatensatz', 
  Sortierung int COMMENT 'Sortierung zum Erzieherdatensatz', 
  ErzEmail varchar(100) COMMENT 'Email1 zum Erzieherdatensatz', 
  ErzAdrZusatz varchar(50) COMMENT 'Aresszusatz zum Erzieherdatensatz', 
  Erz1StaatKrz varchar(3) COMMENT 'Staatangehörigkeit1 zum Erzieherdatensatz', 
  Erz2StaatKrz varchar(3) COMMENT 'Staatangehörigkeit2 zum Erzieherdatensatz', 
  ErzEmail2 varchar(100) COMMENT 'Email2 zum Erzieherdatensatz', 
  Bemerkungen longtext COMMENT 'Memofeld Bemerkungen zum Erzieherdatensatz', 
  CredentialID bigint COMMENT 'Die ID des Credential-Eintrags',
  CONSTRAINT PK_SchuelerErzAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerErzAdr_Credentials_FK FOREIGN KEY (CredentialID) REFERENCES Credentials(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_ErzieherArt_FK FOREIGN KEY (ErzieherArt_ID) REFERENCES K_ErzieherArt(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ort_FK FOREIGN KEY (ErzOrt_ID) REFERENCES K_Ort(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Ortsteil_FK FOREIGN KEY (ErzOrtsteil_ID) REFERENCES K_Ortsteil(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerErzAdr_Staat1_FK FOREIGN KEY (Erz1StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerErzAdr_Staat2_FK FOREIGN KEY (Erz2StaatKrz) REFERENCES Nationalitaeten_Keys(DEStatisCode) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Erziehereinträge zum Schüler';

CREATE INDEX SchuelerErzAdr_IDX1 ON SchuelerErzAdr(Schueler_ID);


CREATE TABLE SchuelerFHR (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des FHR Datensatzes', 
  Schueler_ID bigint NOT NULL COMMENT 'ID des Schülers zum FHR Datensatz', 
  FHRErreicht varchar(1) DEFAULT '-' COMMENT 'Gibt an ob das FHR erreicht wurde', 
  Note varchar(3) COMMENT 'Gesamtnote FHR', 
  GesamtPunktzahl smallint COMMENT 'Gesamtpunktzahl FHR', 
  SummeGK smallint COMMENT 'Summer der Grundkurse FHR', 
  SummeLK smallint COMMENT 'Summer der Leistungskurse FHR', 
  SummenOK smallint COMMENT 'Gibt an ob die Anzahl der eingebrachten Kurse ok ist', 
  AnzRelLK smallint COMMENT 'Anzahl der eingebrachten LKs', 
  AnzRelGK smallint COMMENT 'Anzahl der eingebrachten Gks', 
  AnzRelOK smallint COMMENT 'Gibt an ob die Anzahl GK ok ist', 
  AnzDefLK smallint COMMENT 'Gibt an ob die Anzahl Defizite LK ok ist', 
  AnzDefGK smallint COMMENT 'Anzahl der Defizite in den Gks', 
  AnzDefOK smallint COMMENT 'Gibt an ob die Anzahl Defizite GK ok ist', 
  JSII_2_1 smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  JSII_2_1_W smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  JSII_2_2 smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  JSII_2_2_W smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  JSII_3_1 smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  JSII_3_1_W smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  JSII_3_2 smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  JSII_3_2_W smallint COMMENT 'J: Jahr des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  ASII_2_1 smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  ASII_2_2 smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  ASII_2_1_W smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  ASII_2_2_W smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  ASII_3_1 smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  ASII_3_2 smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR) ', 
  ASII_3_1_W smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  ASII_3_2_W smallint COMMENT 'A: Abschnitt des betreffenden Abschnittes (z.B. für Anzeige im Grid auf der Seite FHR)  W=wiederholt', 
  WSII_2_1 varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt.', 
  WSII_2_2 varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt.', 
  WSII_2_1_W varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt.  W=wiederholt', 
  WSII_2_2_W varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt. W=wiederholt', 
  WSII_3_1 varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt.', 
  WSII_3_2 varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt.', 
  WSII_3_1_W varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt. W=wiederholt', 
  WSII_3_2_W varchar(1) COMMENT 'W: Wertung des betreffenden Abschnittes für FHR. Damit ist gemeint: Wird der betreffende Abschnitt für die FHR-Berechnung herangezogen? Im Grid auf Karteireiter FHR wird die betreffende Spalte dann mit fetter Überschrift angezeigt. W=wiederholt',
  CONSTRAINT PK_SchuelerFHR PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHR_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFHR_UC1 UNIQUE (Schueler_ID)
) COMMENT 'Tabelle der FHR-Daten zum Schüler';


CREATE TABLE SchuelerFHRFaecher (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Facheintrags für den FHR-Reiter', 
  Schueler_ID bigint NOT NULL COMMENT 'ID des Schuelers', 
  Fach_ID bigint NOT NULL COMMENT 'ID des Faches', 
  KursartAllg varchar(10) COMMENT 'Kursart des Faches im Klartext', 
  FachKrz varchar(20) COMMENT 'Kürzel des Faches', 
  PSII_2_1 varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt', 
  HSII_2_1 int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users, der die Hochrechnung angestoßen hat (diese Daten werden dann bei Beendigung von SchILD wieder gelöscht). Nur noch BK. ', 
  RSII_2_1 varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) ', 
  PSII_2_2 varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt ', 
  HSII_2_2 int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users, der die Hochrechnung angestoßen hat (diese Daten werden dann bei Beendigung von SchILD wieder gelöscht). Nur noch BK. ', 
  RSII_2_2 varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) ', 
  PSII_2_1_W varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt W=wiederholt', 
  HSII_2_1_W int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users nur noch BK. Daten sind temporär. W=wiederholt ', 
  RSII_2_1_W varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) W=wiederholt', 
  PSII_2_2_W varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt W=wiederholt', 
  HSII_2_2_W int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users nur noch BK. Daten sind temporär. W=wiederholt ', 
  RSII_2_2_W varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) W=wiederholt', 
  PSII_3_1 varchar(2) COMMENT 'Punkte im betreffenden Abschnitt', 
  HSII_3_1 int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users, der die Hochrechnung angestoßen hat (diese Daten werden dann bei Beendigung von SchILD wieder gelöscht). Nur noch BK. ', 
  RSII_3_1 varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt)', 
  PSII_3_2 varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt', 
  HSII_3_2 int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users, der die Hochrechnung angestoßen hat (diese Daten werden dann bei Beendigung von SchILD wieder gelöscht). Nur noch BK. ', 
  RSII_3_2 varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) ', 
  PSII_3_1_W varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt W=wiederholt', 
  HSII_3_1_W int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users nur noch BK. Daten sind temporär. W=wiederholt ', 
  RSII_3_1_W varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) W=wiederholt', 
  PSII_3_2_W varchar(2) COMMENT 'P: Punkte im betreffenden Abschnitt W=wiederholt', 
  HSII_3_2_W int COMMENT 'H: Wenn ungleich 0: Es handelt sich um eine Hochrechnung, dann steht darin die ID des Users nur noch BK. Daten sind temporär. W=wiederholt ', 
  RSII_3_2_W varchar(1) DEFAULT '-' COMMENT 'R: Relevanz für Berechnung (+ wenn das Fach im betreffenden Abschnitt in die Berechnung eingeht, in SchILD wird das dann hellblau im Grid dargestellt) W=wiederholt', 
  KSII_2_1 varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt ', 
  KSII_2_2 varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt ', 
  KSII_2_1_W varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt W: Wiederholter Abschnitt', 
  KSII_2_2_W varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt ', 
  KSII_3_1 varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt ', 
  KSII_3_2 varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt ', 
  KSII_3_1_W varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt W: Wiederholter Abschnitt', 
  KSII_3_2_W varchar(5) COMMENT 'K: Kursart im betreffenden Abschnitt W: Wiederholter Abschnitt', 
  FSortierung int COMMENT 'K: Kursart im betreffenden Abschnitt ',
  CONSTRAINT PK_SchuelerFHRFaecher PRIMARY KEY (ID),
  CONSTRAINT SchuelerFHRFaecher_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerFHRFaecher_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Liste der Fächer zu SchuelerFHR';


CREATE TABLE SchuelerFotos (
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID zum Foto', 
  FotoBase64 longtext COMMENT 'Schülerfoto im Base64-Format',
  CONSTRAINT PK_SchuelerFotos PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerFotos_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Blobfelder für Fotos zum Schüler';


CREATE TABLE SchuelerGSDaten (
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID zum GS-Daten-Eintrag', 
  Note_Sprachgebrauch int COMMENT 'Note Sprachgebrauch zum GS-Daten-Eintrag', 
  Note_Lesen int COMMENT 'Note Lesen zum GS-Daten-Eintrag', 
  Note_Rechtschreiben int COMMENT 'Note Rechtschreibe zum GS-Daten-Eintrag', 
  Note_Sachunterricht int COMMENT 'Note Sachunterricht zum GS-Daten-Eintrag', 
  Note_Mathematik int COMMENT 'Note Mathematik zum GS-Daten-Eintrag', 
  Note_Englisch int COMMENT 'Note Englisch zum GS-Daten-Eintrag', 
  Note_KunstTextil int COMMENT 'Note Kunst und Textil zum GS-Daten-Eintrag', 
  Note_Musik int COMMENT 'Note Musik zum GS-Daten-Eintrag', 
  Note_Sport int COMMENT 'Note Sport zum GS-Daten-Eintrag', 
  Note_Religion int COMMENT 'Note Religion zum GS-Daten-Eintrag', 
  Durchschnittsnote_Sprache float COMMENT 'Durchschnitt Sprache zum GS-Daten-Eintrag', 
  Durchschnittsnote_Einfach float COMMENT 'Durschnit einfach zum GS-Daten-Eintrag', 
  Durchschnittsnote_Gewichtet float COMMENT 'Durchschnitt gewichtet zum GS-Daten-Eintrag (ohne Religion)', 
  Anrede_Klassenlehrer varchar(10) COMMENT 'Anrede klassenlehrer zum GS-Daten-Eintrag', 
  Nachname_Klassenlehrer varchar(120) COMMENT 'Nachname Klassenlehrer zum GS-Daten-Eintrag PAuswG vom 21.6.2019 §5 Abs. 2', 
  GS_Klasse varchar(15) COMMENT 'Klassenbezeichnung zum GS-Daten-Eintrag (Die Klasse selbst ist nicht in dieser DB definiert!)', 
  Bemerkungen longtext COMMENT 'Bemerkungen zum GS-Daten-Eintrag', 
  Geschwisterkind varchar(1) DEFAULT '-' COMMENT 'Angabe Geschwisterkind Ja Nein  zum GS-Daten-Eintrag',
  CONSTRAINT PK_SchuelerGSDaten PRIMARY KEY (Schueler_ID),
  CONSTRAINT SchuelerGSDaten_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Daten und Zeugnisnoten der abgebenden Grundschule zum Schüler';


CREATE TABLE SchuelerLernabschnittsdaten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine eindeutige ID für den Lernabschnitt des Schülers', 
  Schueler_ID bigint NOT NULL COMMENT 'Die eindeutige ID des Schülers – verweist auf den Schülers', 
  Schuljahresabschnitts_ID bigint NOT NULL COMMENT 'ID des Schuljahresabschnittes aus der Tabelle Schuljahresabschnitte', 
  WechselNr smallint DEFAULT 0 COMMENT 'Wird für Wiederholungen im Laufenden Abschnitt genutzt 0=aktueller/neuester Abschnitt 1=vor dem ersten Wechsel 2=vor dem zweiten Wechsel usw', 
  Schulbesuchsjahre smallint COMMENT 'Schulbesuchsjahre für den Lernabschnitt', 
  Hochrechnung int COMMENT 'Lernabschnitt ist Hochrechnung (nur noch BK)', 
  SemesterWertung varchar(1) DEFAULT '+' COMMENT 'Gewerteter Abschnitt (Ja/Nein)', 
  PruefOrdnung varchar(20) COMMENT 'Prüfungsordnung des Lernabschnitts', 
  Klassen_ID bigint COMMENT 'Klassen_ID des Schülers für den Lernabschnitt', 
  Tutor_ID bigint COMMENT 'Die Lehrer-ID des Tutors, der dem Schüler zugeordnet ist, oder null falls keine Zuordnung vorgenommen wurde', 
  Verspaetet smallint COMMENT 'ID des Nachprüfungsfaches', 
  NPV_Fach_ID bigint COMMENT 'TODO: Note der Nachprüfung', 
  NPV_NoteKrz varchar(2) COMMENT 'TODO: Datum der Nachprüfung', 
  NPV_Datum date COMMENT 'TODO: BK: ID des Nachprüfungsfaches für den allgemein-bildenen Abschluss', 
  NPAA_Fach_ID bigint COMMENT 'TODO: BK: Note des Nachprüfungsfaches für den allgemein-bildenen Abschluss', 
  NPAA_NoteKrz varchar(2) COMMENT 'TODO: BK: Datum der Nachprüfung für den allgemein-bildenen Abschluss', 
  NPAA_Datum date COMMENT 'TODO: BK: dito für berufs-qualifizierende Nachprüfung', 
  NPBQ_Fach_ID bigint COMMENT 'TODO: BK: dito für berufs-qualifizierende Nachprüfung', 
  NPBQ_NoteKrz varchar(2) COMMENT 'TODO: BK: dito für berufs-qualifizierende Nachprüfung', 
  NPBQ_Datum date COMMENT 'TODO: ID des Nachprüfungsfaches', 
  VersetzungKrz varchar(2) COMMENT 'Kürzel des Versetungsvermerk', 
  AbschlussArt smallint COMMENT 'Art des Abschlusses', 
  AbschlIstPrognose varchar(1) DEFAULT '-' COMMENT 'Gibt an ob Abschluss Prognose ist (GE, PS und SK)', 
  Konferenzdatum date COMMENT 'Konferenzdatum', 
  ZeugnisDatum date COMMENT 'Zeugnisdatum', 
  ASDSchulgliederung varchar(3) COMMENT 'ASD-Kürzel SGL', 
  ASDJahrgang varchar(2) COMMENT 'ASD-Jahrgang kann alles über ID geregelt werden', 
  Jahrgang_ID bigint COMMENT 'ID des Jahrgangs der zum Report zugeordnet wird', 
  Fachklasse_ID bigint COMMENT 'ID der Fachklasse (BK)', 
  Schwerpunkt_ID bigint COMMENT 'ID des Schwerpunkts aus dem Katalog', 
  ZeugnisBem longtext COMMENT 'Text für Zeugnisbemerkung', 
  Schwerbehinderung varchar(1) DEFAULT '-' COMMENT 'Schwerbehinderung (Ja/Nein)', 
  Foerderschwerpunkt_ID bigint COMMENT 'ID Hauptförderschwerpunkt', 
  OrgFormKrz varchar(1) COMMENT 'Kürzel der Organisationsform', 
  RefPaed varchar(1) DEFAULT '-' COMMENT 'TODO DEPRECATED: Reformpädagogik', 
  Klassenart varchar(2) COMMENT 'Klassenart', 
  SumFehlStd int COMMENT 'Summer der Fehlstunden', 
  SumFehlStdU int COMMENT 'Summer der Fehlstunden unentschuldigt', 
  Wiederholung varchar(1) DEFAULT '-' COMMENT 'Lernabschnitt wurde wiederholt (Ja/Nein)', 
  Gesamtnote_GS int COMMENT 'Lernbereichnote Gesellschaftswissenschaft oder Arbeitlehre HA10', 
  Gesamtnote_NW int COMMENT 'Lernbereichnote Naturwissenschaft HA10', 
  Folgeklasse_ID bigint COMMENT 'ID der Folgeklasse für den Lernabschnitt, sofern dieser vom Standard der Klassentabelle abweicht', 
  Foerderschwerpunkt2_ID bigint COMMENT 'Weiterer Förderschwerpunkt ID', 
  Abschluss varchar(50) COMMENT 'allgemeinbildender Abschluss', 
  Abschluss_B varchar(50) COMMENT 'berufsbezogener Abschnluss (BK)', 
  DSNote varchar(4) COMMENT 'Durchschnittsnote im betreffenden Abschnitt Ist allerdings in der Programmoberfläche nicht verfügbar Der Inhalt wird durch die Prüfungsalgorithmen gefüllt es ist eine Ausgabe in Reports möglich', 
  AV_Leist int COMMENT 'DEPRECATED: Kopfnote', 
  AV_Zuv int COMMENT 'DEPRECATED: Kopfnote', 
  AV_Selbst int COMMENT 'DEPRECATED: Kopfnote', 
  SV_Verant int COMMENT 'DEPRECATED: Kopfnote', 
  SV_Konfl int COMMENT 'DEPRECATED: Kopfnote', 
  SV_Koop int COMMENT 'DEPRECATED: Kopfnote', 
  MoeglNPFaecher longtext COMMENT 'Auflistung der mögllichen Nachprüfungsfächer kommagetrennt', 
  Zertifikate varchar(30) COMMENT 'DEPRECATED: Hier war mal geplant, Texte für Zertifikate einzugeben', 
  DatumFHR date COMMENT 'Datum FHR', 
  PruefAlgoErgebnis longtext COMMENT 'Text für die Ergebnisse der Abschlussberechnungen', 
  Zeugnisart varchar(5) COMMENT 'Angabe der Zeugnisart', 
  DatumVon date COMMENT 'Beginn Lernabschnitt', 
  DatumBis date COMMENT 'Ende Lernabschnitt', 
  FehlstundenGrenzwert int COMMENT 'Grenzwert für Fehlstunden (BK Warnbriefe zur Entlassung)', 
  Sonderpaedagoge_ID bigint COMMENT 'Hier kann die ID einer Lehrkraft eingetragen werden die dann die Schüler als Förderpädagoge betreut und im Notenmodul hat', 
  FachPraktAnteilAusr varchar(1) DEFAULT '+' NOT NULL COMMENT 'Enthält die Angabe, ob die Fachpraktischen Anteile in Anlage B08 B09 B10 ausreichend sind für Versetzung (BK)', 
  BilingualerZweig varchar(1) COMMENT 'Sprache des Bilingualen Zweigs', 
  AOSF varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Schüler ein AOSF hat', 
  Autist varchar(1) DEFAULT '-' COMMENT 'Gibt an ob Autismuss vorliegt (Ja/Nein)', 
  ZieldifferentesLernen varchar(1) DEFAULT '-' COMMENT 'Gibt an ob der Schüler zieldifferent unterrichtet wird', 
  meldungBAN int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob der Schüler im aktuellen Abschnitt an das BAN-Portal gemeldet werden soll (1) oder nicht (0)',
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
) COMMENT 'Lernabschnitte zum Schüler';

CREATE INDEX SchuelerLernabschnittsdaten_IDX_Schueler_ID ON SchuelerLernabschnittsdaten(Schueler_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX1_Schuljahresabschnitts_ID ON SchuelerLernabschnittsdaten(Schuljahresabschnitts_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX_Klassen_ID ON SchuelerLernabschnittsdaten(Klassen_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX_Jahrgang_ID ON SchuelerLernabschnittsdaten(Jahrgang_ID);
CREATE INDEX SchuelerLernabschnittsdaten_IDX2_Schuljahresabschnitts_ID ON SchuelerLernabschnittsdaten(Schuljahresabschnitts_ID, WechselNr);


CREATE TABLE SchuelerLernplattform (
  SchuelerID bigint NOT NULL COMMENT 'SchülerID für den Lernplattform-Datensatz', 
  LernplattformID bigint NOT NULL COMMENT 'ID der Lernplattform', 
  CredentialID bigint COMMENT 'CredentialD für den Lernplattform-Datensatz', 
  EinwilligungAbgefragt int DEFAULT 0 NOT NULL COMMENT 'Einwilligung wurde abgefragt', 
  EinwilligungNutzung int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Nutzung liegt vor', 
  EinwilligungAudiokonferenz int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Audiokonferenz liegt vor', 
  EinwilligungVideokonferenz int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Videokonferenz liegt vor',
  CONSTRAINT PK_SchuelerLernplattform PRIMARY KEY (SchuelerID, LernplattformID),
  CONSTRAINT SchuelerLernplattform_Schueler_FK FOREIGN KEY (SchuelerID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernplattform_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLernplattform_Credential_FK FOREIGN KEY (CredentialID) REFERENCES CredentialsLernplattformen(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Beziehung zu Schueler und CredentialID sowie die Speicherung von Einwilligungen bei den Lernplattformen';


CREATE TABLE SchuelerListe_Inhalt (
  Liste_ID bigint NOT NULL COMMENT 'ID der individuellen Schülerliste', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID des Schülers der zur individuellen Schülerliste gehört',
  CONSTRAINT PK_SchuelerListe_Inhalt PRIMARY KEY (Liste_ID, Schueler_ID),
  CONSTRAINT SchuelerListeInhalt_Liste_FK FOREIGN KEY (Liste_ID) REFERENCES SchuelerListe(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerListeInhalt_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Schüler zu den Einträgen in SchuelerListe';


CREATE TABLE SchuelerMerkmale (
  ID bigint NOT NULL COMMENT 'ID des Eintrag bei besondere Merkmale zum Schüler', 
  Schueler_ID bigint NOT NULL COMMENT 'Schüler-ID des Eintrag bei besondere Merkmale zum Schüler', 
  Kurztext varchar(10) COMMENT 'Kurztext des Merkmals des Eintrag bei besondere Merkmale zum Schüler', 
  DatumVon date COMMENT 'Datum Beginn des Eintrag bei besondere Merkmale zum Schüler', 
  DatumBis date COMMENT 'Datum Ende des Eintrag bei besondere Merkmale zum Schüler',
  CONSTRAINT PK_SchuelerMerkmale PRIMARY KEY (ID),
  CONSTRAINT SchuelerMerkmale_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Einträge der Merkmale (Individualdaten II) zum Schüler';


CREATE TABLE SchuelerSprachenfolge (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Sprachenfolgeeintrags', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID des Sprachenfolgeeintrags', 
  Sprache varchar(2) NOT NULL COMMENT 'Atomares Sprachkürzel aus StatKue_SVWS_ZulaessigeFaecher', 
  ReihenfolgeNr int COMMENT 'Reihenfolge Nummer des Sprachenfolgeeintrags', 
  ASDJahrgangVon varchar(2) COMMENT 'ASDJahrgang Beginn des Sprachenfolgeeintrags', 
  ASDJahrgangBis varchar(2) COMMENT 'ASDJahrgang Ende des Sprachenfolgeeintrags', 
  AbschnittVon smallint COMMENT 'Abschnitt Beginn des Sprachenfolgeeintrags', 
  AbschnittBis smallint COMMENT 'Abschnitt Ende des Sprachenfolgeeintrags', 
  Referenzniveau varchar(5) COMMENT 'Referenzniveau GeR des Sprachenfolgeeintrags', 
  KleinesLatinumErreicht int COMMENT 'Gibt an, ob der Schüler das kleine Latinum erreicht hat', 
  LatinumErreicht int COMMENT 'Gibt an, ob der Schüler das Latinum erreicht hat', 
  GraecumErreicht int COMMENT 'Gibt an, ob der Schüler das Graecum erreicht hat', 
  HebraicumErreicht int COMMENT 'Gibt an, ob der Schüler das Hebraicum erreicht hat',
  CONSTRAINT PK_SchuelerSprachenfolge PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachenfolge_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerSprachenfolge_UC1 UNIQUE (Schueler_ID, Sprache)
) COMMENT 'Einträge zur Sprachenfolge zum Schüler';

CREATE INDEX SchuelerSprachenfolge_IDX1 ON SchuelerSprachenfolge(Schueler_ID);


CREATE TABLE SchuelerSprachpruefungen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Sprachprüfungseintrags', 
  Schueler_ID bigint NOT NULL COMMENT 'ID des Schülers des Sprachprüfungseintrags', 
  Sprache varchar(2) NOT NULL COMMENT 'Atomares Sprachkürzel aus StatKue_SVWS_ZulaessigeFaecher', 
  ASDJahrgang varchar(2) COMMENT 'ASDJahrgangsbezeichnung, in der die Sprachprüfung abgelegt wurde', 
  Anspruchsniveau_ID bigint COMMENT 'Das Anspruchsniveau der Sprachprüfung (angelehnt an einen entsprechenden Schulabschluss)', 
  Pruefungsdatum date COMMENT 'Datum der Sprachprüfung', 
  ErsetzteSprache varchar(2) COMMENT 'Atomares Sprachkürzel aus StatKue_SVWS_ZulaessigeFaecher für die ersetzte Sprache', 
  IstHSUPruefung int COMMENT 'Gibt an, dass die Prüfung eine Prüfung in der Herkunftssprache ist (BASS 13-61 Nr. 2). Entspricht dem Eintrag P in Schild 2', 
  IstFeststellungspruefung int COMMENT 'Gibt an, ob die Prüfung eine Sprachfeststellungsprüfung ist (BASS 13-61 Nr. 1). Entspricht N in Schild 2', 
  KannErstePflichtfremdspracheErsetzen int COMMENT 'Gibt an, ob die Sprachprüfung an die Stelle der ersten Pflichtfremdsprache treten kann', 
  KannZweitePflichtfremdspracheErsetzen int COMMENT 'Gibt an, ob die Sprachprüfung an die Stelle der zweiten Pflichtfremdsprache treten kann', 
  KannWahlpflichtfremdspracheErsetzen int COMMENT 'Gibt an, ob die Sprachprüfung an die Stelle einer Wahlpflichtfremdsprache der Klassen 05-07 treten kann', 
  KannBelegungAlsFortgefuehrteSpracheErlauben int COMMENT 'Gibt an, ob die Sprachprüfung nachweist, dass die Sprache als fortgeführte Fremdsprache in der Oberstufe belegt werden kann (BASS 13-61 Nr. 1 Abs. 11)', 
  Referenzniveau varchar(5) COMMENT 'Das Sprachreferenzniveau der Sprachprüfung gemäß GeR', 
  NotePruefung int COMMENT 'Note der Sprachprüfung, die herangezogen werden kann, falls die Note der Sprachprüfung an die Stelle einer Fremdsprachennote tritt',
  CONSTRAINT PK_SchuelerSprachpruefungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerSprachpruefungen_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Einträge zu Sprachprüfungen des Schülers';


CREATE TABLE SchuelerTelefone (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Telefonnummerneintrags', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID des Telefonnummerneintrags', 
  TelefonArt_ID bigint COMMENT 'Art des Telefonnummerneintrags', 
  Telefonnummer varchar(20) COMMENT 'Telefonnummer des Telefonnummerneintrags', 
  Bemerkung varchar(50) COMMENT 'Bemerkung des Telefonnummerneintrags', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Telefonnummerneintrags', 
  Gesperrt varchar(1) DEFAULT '-' COMMENT 'Sperrung des Telefonnummerneintrags',
  CONSTRAINT PK_SchuelerTelefone PRIMARY KEY (ID),
  CONSTRAINT SchuelerTelefone_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerTelefone_Telefonart_FK FOREIGN KEY (TelefonArt_ID) REFERENCES K_TelefonArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Telefonnummern zum Schüler';

CREATE INDEX SchuelerTelefone_IDX1 ON SchuelerTelefone(Schueler_ID);


CREATE TABLE SchuelerVermerke (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Vermerkeintrages beim Schüler', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID des Vermerkeintrages beim Schüler', 
  VermerkArt_ID bigint COMMENT 'Art des Vermerkeintrages beim Schüler', 
  Datum date COMMENT 'Datum des Vermerkeintrages beim Schüler', 
  Bemerkung longtext COMMENT 'Bemerkung des Vermerkeintrages beim Schüler', 
  AngelegtVon varchar(20) COMMENT 'Angelegt von User des Vermerkeintrages beim Schüler', 
  GeaendertVon varchar(20) COMMENT 'Geändert von User des Vermerkeintrages beim Schüler',
  CONSTRAINT PK_SchuelerVermerke PRIMARY KEY (ID),
  CONSTRAINT SchuelerVermerke_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerVermerke_VermerkArt_FK FOREIGN KEY (VermerkArt_ID) REFERENCES K_Vermerkart(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Vermerke zum Schüler';

CREATE INDEX SchuelerVermerke_IDX1 ON SchuelerVermerke(Schueler_ID);


CREATE TABLE SchuelerZP10 (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Facheintrags für den ZP10 Abschluss', 
  Schueler_ID bigint NOT NULL COMMENT 'Schüler-ID des Facheintrags für den ZP10 Abschluss', 
  Schuljahresabschnitts_ID bigint COMMENT 'Schuljahresabschnitt-ID für den Facheintrag des ZP10 Abschlusses', 
  Fach_ID bigint NOT NULL COMMENT 'Fach-ID des Facheintrags für den ZP10 Abschluss', 
  Vornote varchar(2) COMMENT 'Vornote zum ZP10-Facheintrag', 
  NoteSchriftlich varchar(2) COMMENT 'Schriftliche Note zum ZP10-Facheintrag', 
  MdlPruefung char(1) COMMENT 'Gibt an, ob zum ZP10-Facheintrag eine mündliche Prüfung angesetzt ist', 
  MdlPruefungFW char(1) COMMENT 'Gibt an, ob zum ZP10-Facheintrag eine freiwilliege mündliche Prüfung angesetzt ist', 
  NoteMuendlich varchar(2) COMMENT 'Die Note der mündlichen Prüfung zum ZP10-Facheintrag', 
  NoteAbschluss varchar(2) COMMENT 'Die Abschlussnote zum ZP10-Facheintrag', 
  Fachlehrer_ID bigint COMMENT 'Die Lehrer-ID zum ZP10-Facheintrag',
  CONSTRAINT PK_SchuelerZP10 PRIMARY KEY (ID),
  CONSTRAINT SchuelerZP10_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZP10_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerZP10_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZP10_UC1 UNIQUE (Schueler_ID, Schuljahresabschnitts_ID, Fach_ID)
) COMMENT 'Die fachspezifischen Abschluss-Daten für die ZP10-Prüfungen';

CREATE INDEX SchuelerZP10_IDX1 ON SchuelerZP10(Schueler_ID);
CREATE INDEX SchuelerZP10_IDX2 ON SchuelerZP10(Schuljahresabschnitts_ID);
CREATE INDEX SchuelerZP10_IDX3 ON SchuelerZP10(Fach_ID);
CREATE INDEX SchuelerZP10_IDX4 ON SchuelerZP10(Fachlehrer_ID);


CREATE TABLE Schueler_AllgAdr (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Betriebeeintrags beim Schüler', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID des Betriebeeintrags beim Schüler', 
  Adresse_ID bigint NOT NULL COMMENT 'AdressID des Betriebeeintrags beim Schüler', 
  Vertragsart_ID bigint COMMENT 'VertragsArtID des Betriebeeintrags beim Schüler', 
  Vertragsbeginn date COMMENT 'Datum Vertragsbeginn des Betriebeeintrags beim Schüler', 
  Vertragsende date COMMENT 'Datum des Vertragsende des Betriebeeintrags beim Schüler', 
  Ausbilder varchar(30) COMMENT 'Ausbildername des Betriebeeintrags beim Schüler', 
  AllgAdrAnschreiben varchar(1) DEFAULT '-' COMMENT 'Betrieb erhält Anschreiben Ja/Nein', 
  Praktikum varchar(1) DEFAULT '-' COMMENT 'Gibt an ob es ein Praktikum ist beim Betriebeeintrags beim Schüler', 
  Sortierung int COMMENT 'Sortierung des Betriebeeintrags beim Schüler', 
  Ansprechpartner_ID bigint COMMENT 'AnsprechpartnerID des Betriebeeintrags beim Schüler', 
  Betreuungslehrer_ID bigint COMMENT 'BetreuungslehrerID des Betriebeeintrags beim Schüler',
  CONSTRAINT PK_Schueler_AllgAdr PRIMARY KEY (ID),
  CONSTRAINT SchuelerAllgAdr_Adresse_FK FOREIGN KEY (Adresse_ID) REFERENCES K_AllgAdresse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Ansprech_FK FOREIGN KEY (Ansprechpartner_ID) REFERENCES AllgAdrAnsprechpartner(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerAllgAdr_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAllgAdr_Vertragsart_Beschaeftigungsart_FK FOREIGN KEY (Vertragsart_ID) REFERENCES K_BeschaeftigungsArt(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'weitere Adressen und Betriebe zum Schüler';

CREATE INDEX Schueler_AllgAdr_IDX1 ON Schueler_AllgAdr(Schueler_ID);


CREATE TABLE Benutzer (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID des Benutzers', 
  Typ smallint DEFAULT 0 NOT NULL COMMENT 'Der Typ des Benutzers (0 = Allgemeiner Benutzer, 1 = Lehrer bzw. Personal aus K_Lehrer, 2 = Schueler, 3 = Erzieher)', 
  Allgemein_ID bigint COMMENT 'Die ID des allgemeinen Benutzers, falls der Benutzer es sich um einen allgemeinen Benutzer handelt', 
  Lehrer_ID bigint COMMENT 'Die Lehrer-ID des Benutzers, falls der Benutzer es sich um einen Lehrer handelt', 
  Schueler_ID bigint COMMENT 'Die Schüler-ID des Benutzers, falls der Benutzer es sich um einen Schüler handelt', 
  Erzieher_ID bigint COMMENT 'Die erzieher-ID des Benutzers, falls der Benutzer es sich um einen Erzieher handelt', 
  IstAdmin int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob der Benutzer Administrator-Rechte hat (1) oder nicht (0)',
  CONSTRAINT PK_Benutzer PRIMARY KEY (ID),
  CONSTRAINT Benutzer_Allgemein_FK FOREIGN KEY (Allgemein_ID) REFERENCES BenutzerAllgemein(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Benutzer_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Benutzer_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Benutzer_Erzieher_FK FOREIGN KEY (Erzieher_ID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Die Benutzer, welchen sich am Server anmelden können (verweist auf allgemeine Benutzer, Lehrer bzw. Personal, Schüler und Erzieher). ';


CREATE TABLE ErzieherDatenschutz (
  ErzieherID bigint NOT NULL COMMENT 'ErzieherID des Datenschutzeintrags', 
  DatenschutzID bigint NOT NULL COMMENT 'DatenschutzID des Eintrags', 
  Status int DEFAULT 0 NOT NULL COMMENT 'Status des Datenschutz-Eintrags (true/false)',
  CONSTRAINT PK_ErzieherDatenschutz PRIMARY KEY (ErzieherID, DatenschutzID),
  CONSTRAINT ErzieherDatenschutz_Erzieher_FK FOREIGN KEY (ErzieherID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ErzieherDatenschutz_Datenschutz_FK FOREIGN KEY (DatenschutzID) REFERENCES K_Datenschutz(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle zur Speicherung der Einwilligungen zu Datenschutz bei den Erziehern';


CREATE TABLE ErzieherLernplattform (
  ErzieherID bigint NOT NULL COMMENT 'ErzieherID für den Lernplattform-Datensatz', 
  LernplattformID bigint NOT NULL COMMENT 'ID der Lernplattform', 
  CredentialID bigint COMMENT 'CredentialD für den Lernplattform-Datensatz', 
  EinwilligungAbgefragt int DEFAULT 0 NOT NULL COMMENT 'Einwilligung wurde abgefragt', 
  EinwilligungNutzung int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Nutzung liegt vor', 
  EinwilligungAudiokonferenz int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Audiokonferenz liegt vor', 
  EinwilligungVideokonferenz int DEFAULT 0 NOT NULL COMMENT 'Einwilligung zur Videokonferenz liegt vor',
  CONSTRAINT PK_ErzieherLernplattform PRIMARY KEY (ErzieherID, LernplattformID),
  CONSTRAINT ErzieherLernplattform_Erzieher_FK FOREIGN KEY (ErzieherID) REFERENCES SchuelerErzAdr(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ErzieherLernplattform_Lernplattform_FK FOREIGN KEY (LernplattformID) REFERENCES Lernplattformen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ErzieherLernplattform_Credential_FK FOREIGN KEY (CredentialID) REFERENCES CredentialsLernplattformen(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Tabelle zur Speicherung der CredentialID und den Einwilligungen zu den Lernplattformen bei den Erziehern';


CREATE TABLE SchuelerAnkreuzfloskeln (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Ankreuzfloskeleintrags', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID der zugehörigen Schülerlernabschnittsdaten', 
  Floskel_ID bigint NOT NULL COMMENT 'ID der Ankreuzfloskel aus dem Katalog', 
  Stufe1 varchar(1) DEFAULT '-' COMMENT 'Gibt an ob diese Stufe angekreuzt ist', 
  Stufe2 varchar(1) DEFAULT '-' COMMENT 'Gibt an ob diese Stufe angekreuzt ist', 
  Stufe3 varchar(1) DEFAULT '-' COMMENT 'Gibt an ob diese Stufe angekreuzt ist', 
  Stufe4 varchar(1) DEFAULT '-' COMMENT 'Gibt an ob diese Stufe angekreuzt ist', 
  Stufe5 varchar(1) DEFAULT '-' COMMENT 'Gibt an ob diese Stufe angekreuzt ist',
  CONSTRAINT PK_SchuelerAnkreuzfloskeln PRIMARY KEY (ID),
  CONSTRAINT SchuelerAnkreuzfloskeln_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerAnkreuzfloskeln_Floskel_FK FOREIGN KEY (Floskel_ID) REFERENCES K_Ankreuzfloskeln(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Ankreuzfloskeln zum Schüler mit Jahr, Abschnitt und Floskel_ID';


CREATE TABLE SchuelerFehlstunden (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Fehlstundeneintrags', 
  Abschnitt_ID bigint NOT NULL COMMENT 'AbschnittsID des zugehörigen Lernabschnitts', 
  Datum date DEFAULT now() NOT NULL COMMENT 'Datum der Fehlzeit', 
  Fach_ID bigint COMMENT 'FachID der Fehlzeit', 
  FehlStd float NOT NULL COMMENT 'Anzahl der Fehlstunden', 
  VonStd int COMMENT 'Beginn Stunde Fehlzeit', 
  BisStd int COMMENT 'Ende Stunde Fehlzeit', 
  Entschuldigt varchar(1) DEFAULT '-' COMMENT 'Entschuldigt Ja Nein', 
  Lehrer_ID bigint COMMENT 'LehrerID der Fehlzeit',
  CONSTRAINT PK_SchuelerFehlstunden PRIMARY KEY (ID),
  CONSTRAINT SchuelerFehlstunden_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFehlstunden_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerFehlstunden_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Tagebezogene Fehlzeiten (wenn diese erfasst werden) zum SchülerLernabschnitt';


CREATE TABLE SchuelerFoerderempfehlungen (
  GU_ID varchar(40) NOT NULL COMMENT 'GU_ID der Förderempfehlung (wird genutzt für Import Export)', 
  Abschnitt_ID bigint COMMENT 'ID der zugehörigen Schülerlernabschnittsdaten', 
  DatumAngelegt date DEFAULT now() NOT NULL COMMENT 'Anlegedatum der Förderempfehlung', 
  Klassen_ID bigint COMMENT 'Klassen-ID der Förderempfehlung', 
  Lehrer_ID bigint COMMENT 'LehrerID der Förderempfehlung', 
  DatumAenderungSchild datetime COMMENT 'Änderungsdatum in Schild-NRW der Förderempfehlung', 
  DatumAenderungSchildWeb datetime COMMENT 'Änderungsdatum in SchildWeb der Förderempfehlung', 
  Inhaltl_Prozessbez_Komp longtext COMMENT 'Inhalt Prozessbezogene Kompetenzen der Förderempfehlung', 
  Methodische_Komp longtext COMMENT 'Inhalte methodische Kompetenzen der Förderempfehlung', 
  Lern_Arbeitsverhalten longtext COMMENT 'Inhalt Lern und Arbeitsverhalten der Förderempfehlung', 
  Massn_Inhaltl_Prozessbez_Komp longtext COMMENT 'Inhalt Maßnahmen Prozessbezogenen Kompetenzen der Förderempfehlung', 
  Massn_Methodische_Komp longtext COMMENT 'Inhalt Maßnahmen methodische Kompetenzen der Förderempfehlung', 
  Massn_Lern_Arbeitsverhalten longtext COMMENT 'Inhalt Maßnahmen Lern und Arbeitsverhalten der Förderempfehlung', 
  Verantwortlichkeit_Eltern longtext COMMENT 'Inhalt Verantwortlichkeit der Eltern der Förderempfehlung', 
  Verantwortlichkeit_Schueler longtext COMMENT 'Inhalt Verantwortlichkeit des Schülers der Förderempfehlung', 
  Zeitrahmen_von_Datum date COMMENT 'Zeitrahmen Datum von der Förderempfehlung', 
  Zeitrahmen_bis_Datum date COMMENT 'Zeitrahmen Datum bis der Förderempfehlung', 
  Ueberpruefung_Datum date COMMENT 'Datum der Überprüfung der Förderempfehlung', 
  Naechstes_Beratungsgespraech date COMMENT 'Datum nächstes Beratungsgespräch der Förderempfehlung', 
  EingabeFertig varchar(1) DEFAULT '-' COMMENT 'Eingabe abgeschlossen Ja Nein  der Förderempfehlung', 
  Faecher varchar(255) COMMENT 'Fächer der Förderempfehlung im Kürzel komma getrennt', 
  Abgeschlossen varchar(1) DEFAULT '-' COMMENT 'Datum Abgeschlossen der Förderempfehlung',
  CONSTRAINT PK_SchuelerFoerderempfehlungen PRIMARY KEY (GU_ID),
  CONSTRAINT SchuelerFoerderempfehlungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerFoerderempfehlungen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerFoerderempfehlungen_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Eingetragene Förderempfehlungen zum Schüler';


CREATE TABLE SchuelerKAoADaten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des KAOA-Eintrags beim Schüler', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID der zugehörigen Schülerlernabschnittsdaten', 
  Jahrgang varchar(2) COMMENT 'Jahrgang des KAOA-Eintrags beim Schüler', 
  KategorieID bigint NOT NULL COMMENT 'ID der Kategorie des KAOA-Eintrags beim Schüler FK', 
  MerkmalID bigint COMMENT 'ID des Merkmal des KAOA-Eintrags beim Schüler FK', 
  ZusatzmerkmalID bigint COMMENT 'ID des Zusatzmerkmal des KAOA-Eintrags beim Schüler FK', 
  AnschlussoptionID bigint COMMENT 'ID der Anschlussoption des KAOA-Eintrags beim Schüler FK', 
  BerufsfeldID bigint COMMENT 'ID des Berufsfeld des KAOA-Eintrags beim Schüler FK', 
  SBO_Ebene4ID bigint COMMENT 'ID der Ebene4 des KAOA-Eintrags beim Schüler FK', 
  Bemerkung varchar(255) COMMENT 'Bemerkung des KAOA-Eintrags beim Schüler',
  CONSTRAINT PK_SchuelerKAoADaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerKAoADaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Kategorie_FK FOREIGN KEY (KategorieID) REFERENCES KAoA_Kategorie_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerKAoADaten_Merkmal_FK FOREIGN KEY (MerkmalID) REFERENCES KAoA_Merkmal_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Zusatzmerkmal_FK FOREIGN KEY (ZusatzmerkmalID) REFERENCES KAoA_Zusatzmerkmal_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Anschlussoption_FK FOREIGN KEY (AnschlussoptionID) REFERENCES KAoA_Anschlussoption_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_Berufsfeld_FK FOREIGN KEY (BerufsfeldID) REFERENCES KAoA_Berufsfeld_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerKAoADaten_SBO_Ebene4_FK FOREIGN KEY (SBO_Ebene4ID) REFERENCES KAoA_SBO_Ebene4_Keys(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Einträge beim Schüler zu den KAOA-Defaut-Werten';


CREATE TABLE SchuelerLD_PSFachBem (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Bemerkungseintrags', 
  Abschnitt_ID bigint NOT NULL COMMENT 'ID des Lernabschnittes', 
  ASV longtext COMMENT 'Text zum Arvbeits und Sozialverhalten', 
  LELS longtext COMMENT 'Text zur Lernentwicklung bei Grundschulen', 
  AUE longtext COMMENT 'Text zum Außerunterrichtlichen Engagement (früher in LELS integeriert, falls, die Schulform keine Grundschule ist)', 
  ESF longtext COMMENT 'Text für die "Empfehlung der Schulform" beim Übergang von Primar- nach SekI', 
  BemerkungFSP longtext COMMENT 'Text für Förderschwerpunktbemerkung', 
  BemerkungVersetzung longtext COMMENT 'Text für Verstungsentscheidung',
  CONSTRAINT PK_SchuelerLD_PSFachBem PRIMARY KEY (ID),
  CONSTRAINT SchuelerLD_PSFachBem_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLD_PSFachBem_UC1 UNIQUE (Abschnitt_ID)
) COMMENT 'Einträge bei den Lernabschnittsdaten ASV, AUE Zeugnisbemerkungen zum Schüler';


CREATE TABLE SchuelerLeistungsdaten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine eindeutige ID für die Leistungsdaten des Schülers', 
  Abschnitt_ID bigint NOT NULL COMMENT 'Die eindeutige ID des zugehörigen Lernabschnittes – verweist auf den Lernabschnitt des Schülers', 
  Fach_ID bigint NOT NULL COMMENT 'Die eindeutige ID des zugehörigen Faches – verweist auf das Fach', 
  Hochrechnung int COMMENT 'Gibt an ob der Datensatz aus einem vorherigen Abschnitt geholt wurde die Minuszahl gibt die Schritte zurück an', 
  Fachlehrer_ID bigint COMMENT 'Die ID des zugehörigen Fach-Lehrers', 
  Kursart varchar(10) COMMENT 'Die Kursart', 
  KursartAllg varchar(10) COMMENT 'Die allgemeine Kursart des Faches (z.B. GK, LK)', 
  Kurs_ID bigint COMMENT 'Die eindeutige ID des zugehörigen Kurses, sofern kein Klassenunterricht vorliegt – verweist auf den Kurs', 
  NotenKrz varchar(2) COMMENT 'Das Notenkürzel der erteilten Note', 
  NotenKrzQuartal varchar(2) COMMENT 'Das Notenkürzel der Quartals-Note', 
  Warnung varchar(1) DEFAULT '-' COMMENT 'gibt an, ob die Leistung gemahnt wurde bzw. gemahnt werden soll – sie Mahndatum', 
  Warndatum date COMMENT 'gibt das Datum an, wann die Leistung gemahnt wurde', 
  AbiFach varchar(1) COMMENT 'gibt an, ob das Fach als Abiturfach belegt wurde (NULL, 1, 2, 3, 4)', 
  Wochenstunden smallint COMMENT 'gibt die Wochenstunden', 
  AbiZeugnis varchar(1) DEFAULT '-' COMMENT 'DEPRECATED: Relikt aus Winschild nicht mehr benötigt', 
  Prognose varchar(1) COMMENT 'DEPRECATED: Relikt aus Winschild nicht mehr benötigt', 
  FehlStd smallint COMMENT 'Fachbezogene Fehlstunden', 
  uFehlStd smallint COMMENT 'Fachbezogene Fehlstunden unentschuldigt', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierungnummer des Leistungsdatensatzes', 
  Lernentw longtext COMMENT 'Text für Fachbezogene Lernentwicklung Bemerkung', 
  Gekoppelt varchar(1) DEFAULT '-' COMMENT 'DEPRECATED: Relikt aus Winschild nicht mehr benötigt', 
  VorherAbgeschl varchar(1) DEFAULT '-' COMMENT 'Gibt an ob das Fach Epochal war oder ist', 
  AbschlussJahrgang varchar(2) COMMENT 'Hier wird beim Holen von abgeschlossenen Fächern eingetragen, wann das Fach zuletzt unterrichtet wurde', 
  HochrechnungStatus varchar(1) COMMENT 'DEPRECATED: Hier wurde früher gespeichert, ob es sich um eine temporäre oder dauerhafte Hochrechnung handelt. Eine Hochrechnung ist nur noch am BK möglich und immer temporär.', 
  SchulNr int COMMENT 'Schulnummer bei externem Unterricht', 
  Zusatzkraft_ID bigint COMMENT 'Die Lehrer-ID der Zusatzkraft', 
  WochenstdZusatzkraft int COMMENT 'Wochenstunden Zusatzkraft', 
  Prf10Fach varchar(1) DEFAULT '-' COMMENT 'Ist Fach für ZP10 / ZK10', 
  AufZeugnis varchar(1) DEFAULT '+' COMMENT 'Fach kommt aufs Zeugnnis Ja Nein', 
  Gewichtung int DEFAULT 1 COMMENT 'Gewichtung allgemeinbidend BK', 
  NoteAbschlussBA varchar(2) COMMENT 'Beim BK wird hier die Note Berufsabschluss eingetragen. Ist vermutl. nicht mehr notwendig, wenn alle Zeugnisse sich aus dem BKAbschluss-Fächern bedienen', 
  Umfang varchar(1) COMMENT 'Facheigenschaft für Lernstandsberichte (V voller Umfang) (R reduzierter Umfang)',
  CONSTRAINT PK_SchuelerLeistungsdaten PRIMARY KEY (ID),
  CONSTRAINT SchuelerLeistungsdaten_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerLeistungsdaten_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_FK FOREIGN KEY (Fachlehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Lehrer_Zusatzkraft_FK FOREIGN KEY (Zusatzkraft_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_Kurs_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerLeistungsdaten_UC1 UNIQUE (Abschnitt_ID, Fach_ID, Fachlehrer_ID, Kursart, Kurs_ID)
) COMMENT 'Leistungsdaten (Fächer) zu Lernabschnitten und Schülern';

CREATE INDEX SchuelerLeistungsdaten_IDX1 ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX2 ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX3 ON SchuelerLeistungsdaten(Fachlehrer_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Abschnitt_ID ON SchuelerLeistungsdaten(Abschnitt_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Fach_ID ON SchuelerLeistungsdaten(Fach_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Kurs_ID ON SchuelerLeistungsdaten(Kurs_ID);
CREATE INDEX SchuelerLeistungsdaten_IDX_Fachlehrer_ID ON SchuelerLeistungsdaten(Fachlehrer_ID);


CREATE TABLE SchuelerZuweisungen (
  Abschnitt_ID bigint NOT NULL COMMENT 'LernabschnittsID  der Zuweisung (E G Kurse GE und PS SK)', 
  Fach_ID bigint NOT NULL COMMENT 'FachID der Zuweisung', 
  Kursart varchar(10) COMMENT 'Kursart der Zuweisung',
  CONSTRAINT PK_SchuelerZuweisungen PRIMARY KEY (Abschnitt_ID, Fach_ID),
  CONSTRAINT SchuelerZuweisungen_Abschnitt_FK FOREIGN KEY (Abschnitt_ID) REFERENCES SchuelerLernabschnittsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerZuweisungen_Fach_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Lernabscnittsbezogene Zuweisungen für Gesamt- und Sekundarschulen';


CREATE TABLE BenutzerEmail (
  Benutzer_ID bigint NOT NULL COMMENT 'Die ID des Benutzers, zu dem der Datensatz gehört ', 
  Email varchar(255) NOT NULL COMMENT 'Die EMail-Adresse des Benutzers, zu dem der Datensatz gehört ', 
  EmailName varchar(255) NOT NULL COMMENT '??? ', 
  SMTPUsername varchar(255) COMMENT '??? ', 
  SMTPPassword varchar(255) COMMENT '??? ', 
  EMailSignature varchar(2047) COMMENT '??? ', 
  HeartbeatDate bigint COMMENT '??? ', 
  ComputerName varchar(255) COMMENT '??? ',
  CONSTRAINT PK_BenutzerEmail PRIMARY KEY (Benutzer_ID),
  CONSTRAINT BenutzerEmail_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Die Informationen zu einem E-Mail-Zugang des Benutzers, damit Emails versendet werden können.';


CREATE TABLE BenutzerKompetenzen (
  Benutzer_ID bigint NOT NULL COMMENT 'Die ID des Benutzers', 
  Kompetenz_ID bigint NOT NULL COMMENT 'Die ID der zugeordneten Kompetenz',
  CONSTRAINT PK_BenutzerKompetenzen PRIMARY KEY (Benutzer_ID, Kompetenz_ID),
  CONSTRAINT BenutzerKompetenzen_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BenutzerKompetenzen_Kompetenzen_FK FOREIGN KEY (Kompetenz_ID) REFERENCES Kompetenzen(KO_ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Die Kompetenzen, welchem dem Benutzer insgesamt zugeordnet wurden - über eien Gruppe oder individuell';


CREATE TABLE BenutzergruppenMitglieder (
  Gruppe_ID bigint NOT NULL COMMENT 'Die ID der Benutzergruppe', 
  Benutzer_ID bigint NOT NULL COMMENT 'Die ID des Benutzers',
  CONSTRAINT PK_BenutzergruppenMitglieder PRIMARY KEY (Gruppe_ID, Benutzer_ID),
  CONSTRAINT BenutzergruppenMitglieder_Benutzergruppen_FK FOREIGN KEY (Gruppe_ID) REFERENCES Benutzergruppen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BenutzergruppenMitglieder_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Die Zuordnung von Benutzern zu Benutzergruppen';


CREATE TABLE DavRessourceCollections (
  ,
  CONSTRAINT PK_DavRessourceCollections PRIMARY KEY (ID)
) COMMENT 'Eine Sammlung von WebDav Ressourcen, vergleichbar mit einem Adressbuch oder einer Sammlung von Kalenderdaten.';


CREATE TABLE DavRessourceCollectionsACL (
  ,
  CONSTRAINT PK_DavRessourceCollectionsACL PRIMARY KEY (ID)
) COMMENT 'Ein Eintrag zur Berechtigung eines Nutzers für eine DavRessourceCollection.';


CREATE TABLE Logins (
  LI_UserID bigint NOT NULL COMMENT 'UserID des Logins', 
  LI_LoginTime datetime COMMENT 'Login Zeit', 
  LI_LogoffTime datetime COMMENT 'Logoff Zeit',
  CONSTRAINT PK_Logins PRIMARY KEY (LI_UserID, LI_LoginTime),
  CONSTRAINT Logins_Benutzer_FK FOREIGN KEY (LI_UserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle zur Speicherung der LogIns mit Benutzernamen und Zeit für die Datenbank-User';


CREATE TABLE Client_Konfiguration_Benutzer (
  Benutzer_ID bigint NOT NULL COMMENT 'Die ID des Datenbankbenutzers, für den der Client-Konfigurationsdatensatz gespeichert ist', 
  AppName varchar(100) NOT NULL COMMENT 'Der Name der Client-Anwendung, für die der Konfigurationsdatensatz gespeichert ist', 
  Schluessel varchar(255) NOT NULL COMMENT 'Der Schlüsselname des Konfigurationsdatensatzes', 
  Wert longtext NOT NULL COMMENT 'Der Wert des Konfigurationsdatensatzes',
  CONSTRAINT PK_Client_Konfiguration_Benutzer PRIMARY KEY (Benutzer_ID, AppName, Schluessel),
  CONSTRAINT ClientKonfigurationBenutzer_Benutzer_FK FOREIGN KEY (Benutzer_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle für das Speichern von Client-Konfigurationen als Key-Value-Paare. Dabei werden über das Feld App unterschiedliche Client-Anwendungen unterstützt und über das Feld Benutzer eine Benutzerspezifische Speicherung.';


CREATE TABLE Schild_Verwaltung (
  BackupDatum datetime COMMENT 'Wird das Dateum des letzten Backupo eingetragen.', 
  AutoBerechnung datetime COMMENT 'Wurden die täglichen automatischen Prozesse schon durchgeführt?', 
  DatumStatkue datetime COMMENT 'DEPRECATED Datum der Statkue wird nicht benutzt.', 
  DatumSchildIntern datetime COMMENT 'DEPRECATED Datum der Schildintern wird nicht benutzt.', 
  Bescheinigung varchar(255) COMMENT 'Pfad zu der ausgewählten Reportvorlage', 
  Stammblatt varchar(255) COMMENT 'Pfad zu der ausgewählten Reportvorlage', 
  DatenGeprueft varchar(1) DEFAULT '-' COMMENT 'Stößt eine Datenprüfung nach großen Importen an', 
  Version varchar(10) COMMENT 'Versionsdatum (wird zur Erkennung für Updates genutzt)', 
  GU_ID varchar(40) NOT NULL COMMENT 'Stellt eine GU_ID für die Datenbank zur Verfügung damit bei Kurs42 erkannt werden kann ob verschiedene DBs verwendet wurden.', 
  DatumLoeschfristHinweisDeaktiviert datetime COMMENT 'Gibt an ob der User den Hiweis zu den Löschfristen deaktiviert hat.', 
  DatumLoeschfristHinweisDeaktiviertUserID bigint COMMENT 'Gibt an welcher User den Hiweis deaktiviert hat.', 
  DatumDatenGeloescht datetime COMMENT 'Gibt an wann der Löschvorgang zuletzt gelaufen ist.',
  CONSTRAINT PK_Schild_Verwaltung PRIMARY KEY (GU_ID),
  CONSTRAINT Schild_Verwaltung_Loeschfrist_deaktiviert_durch_Benutzer_FK FOREIGN KEY (DatumLoeschfristHinweisDeaktiviertUserID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Verwaltung von Versionsnummern, Datum, teilweise veraltet oder nie verwendet';


CREATE TABLE SchuelerEinzelleistungen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Teilleistung', 
  Datum date COMMENT 'Datum der Teilleistung', 
  Lehrer_ID bigint COMMENT 'LehrerID der Teilleistung', 
  Art_ID bigint COMMENT 'Art der Teilleistung', 
  Bemerkung varchar(100) COMMENT 'Bemerkung zur Teilleistung', 
  Leistung_ID bigint NOT NULL COMMENT 'LeistungsdatenID der Teilleistung', 
  NotenKrz varchar(2) COMMENT 'Notenkürzel der Teilleistung',
  CONSTRAINT PK_SchuelerEinzelleistungen PRIMARY KEY (ID),
  CONSTRAINT SchuelerEinzelleistungen_Art_FK FOREIGN KEY (Art_ID) REFERENCES K_Einzelleistungen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerEinzelleistungen_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT SchuelerEinzelleistungen_Leistungsdaten_FK FOREIGN KEY (Leistung_ID) REFERENCES SchuelerLeistungsdaten(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Teilleistungen zu Fach und Schüler';


CREATE TABLE SchuelerReportvorlagen (
  User_ID bigint NOT NULL COMMENT 'UserID des Users der die zugeordneten Reportvorlagen druckt', 
  Reportvorlage varchar(255) COMMENT 'Pfad zur Reportvorlage', 
  Schueler_IDs longtext COMMENT 'SchülerID für die gedruckt werden soll (temporär)',
  CONSTRAINT PK_SchuelerReportvorlagen PRIMARY KEY (User_ID, Reportvorlage),
  CONSTRAINT SchuelerReportvorlagen_Benutzer_FK FOREIGN KEY (User_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Wird im Gruppenprozess "Zugeordnete Zeugnisformulare drucken" verwendet. Die Tabelle wird temporär mit den IDs der Schüler gefüllt, die im Gruppenprozess berücksichtigt werden müssen.';


CREATE TABLE SchuelerWiedervorlage (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Wiedervorlageeitrags beim Schüler', 
  Schueler_ID bigint NOT NULL COMMENT 'SchülerID des Wiedervorlageeintrags', 
  Bemerkung varchar(255) COMMENT 'Bemerkung des Wiedervorlageeintrags', 
  AngelegtAm datetime COMMENT 'Datum Anlage des Wiedervorlageeintrags', 
  WiedervorlageAm datetime COMMENT 'Datum Wiedervorlage am', 
  ErledigtAm datetime COMMENT 'Datum Erledigung  des Wiedervorlageeintrags', 
  User_ID bigint COMMENT 'UserID  des Wiedervorlageeintrags', 
  Sekretariat varchar(1) DEFAULT '+' COMMENT 'Steuert die Sichtbarkeit für den User Sekretariat', 
  Typ varchar(1) COMMENT 'Typ des Wiedervorlageeintrags', 
  NichtLoeschen varchar(1) DEFAULT '-' COMMENT 'Steuert die automatische Löschung der Einträge',
  CONSTRAINT PK_SchuelerWiedervorlage PRIMARY KEY (ID),
  CONSTRAINT SchuelerWiedervorlage_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT SchuelerWiedervorlage_Benutzer_FK FOREIGN KEY (User_ID) REFERENCES Benutzer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Einträge zur Wiedervorlage zum Schüler';


CREATE TABLE LehrerLeitungsfunktion_Keys (
  ID bigint NOT NULL COMMENT 'ID der Leitungsfunktion',
  CONSTRAINT PK_LehrerLeitungsfunktion_Keys PRIMARY KEY (ID)
) COMMENT 'Gültige Schlüsselwerte für Fremdschlüssel zu den definierten Leitungsfunktionen von Lehrern';


CREATE TABLE Schulleitung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Schulleitungsfunktionseintrags', 
  LeitungsfunktionID bigint NOT NULL COMMENT 'ID der Schulleitungsfunktion (Fremdschlüssel aus der Tabelle SchulleitungFunktion)', 
  Funktionstext varchar(255) NOT NULL COMMENT 'Beschreibung der Funktion (Default Text aus SchulleitungFunktion aber änderbar)', 
  LehrerID bigint NOT NULL COMMENT 'ID des Lehrerdatensatzes', 
  Von datetime COMMENT 'Beginndatum', 
  Bis datetime COMMENT 'Endedatum',
  CONSTRAINT PK_Schulleitung PRIMARY KEY (ID),
  CONSTRAINT Schulleitung_Leitungsfunktion_FK FOREIGN KEY (LeitungsfunktionID) REFERENCES LehrerLeitungsfunktion_Keys(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Schulleitung_Lehrer_FK FOREIGN KEY (LehrerID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Tabelle für die Zuweisung von Schulleitungsfunktionen zu Lehrern';


CREATE TABLE Stundenplan (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID des Stundenplans', 
  Schuljahresabschnitts_ID bigint NOT NULL COMMENT 'Die ID des Schuljahresabschnittes des Stundenplans als Fremdschlüssel auf die Tabelle Schuljahresabschnitte', 
  Beginn date DEFAULT '1899-01-01' NOT NULL COMMENT 'Das Datum, ab dem der Stundenplan gültig ist', 
  Ende date COMMENT 'Das Datum, bis wann der Stundenplan gültig ist - null, wenn kein Ende innerhalb des Abschnitts festgelegt wurde (letzter Stundenplan im Abschnitt)', 
  Beschreibung varchar(1000) NOT NULL COMMENT 'Eine Beschreibung / Kommentar zu diesem Stundenplan', 
  WochentypModell int DEFAULT 0 NOT NULL COMMENT 'Gibt das Modell für die Wochen an, d.h. ob es sich um einen Stundenplan für jede Woche handelt (0) oder ob es sich um einen unterschiedliche Stundenpläne in Abhängigkeit des Wochentyps handelt - z.B. A-/B-Wochen (2) handelt. Hier wird dann die Anzahl der unterschiedlichen Wochentypen festgelegt.',
  CONSTRAINT PK_Stundenplan PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Schuljahreabschnitt_FK FOREIGN KEY (Schuljahresabschnitts_ID) REFERENCES Schuljahresabschnitte(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Enthält die Grunddaten für einen Stundenplan, welcher anhand seiner ID eindeutig identifiziert werden kann. Hierzu zählen zum Einen das Schuljahr und der Abschnitt und zum Anderen der Beginn und das Ende der Gültigkeit des Stundenplans in dem Halbjahr';


CREATE TABLE Stundenplan_Aufsichtsbereiche (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID identifiziert einen Aufsichtsbereicheintrag für einen Stundenplan eindeutig - hat keinen Bezug zur ID der Katalog-Tabelle', 
  Stundenplan_ID bigint NOT NULL COMMENT 'Die ID des Stundenplans, dem dieser Aufsichtsbereicheintrag zugeordnet wird', 
  Kuerzel varchar(20) NOT NULL COMMENT 'Die Kurzbezeichnung des Aufsichtsbereichs', 
  Beschreibung varchar(1000) NOT NULL COMMENT 'Gegebenenfalls eine ausführlichere Beschreibung des Aufsichtsbereichs',
  CONSTRAINT PK_Stundenplan_Aufsichtsbereiche PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Aufsichtsbereiche_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Aufsichtsbereiche_UC1 UNIQUE (Stundenplan_ID, Kuerzel)
) COMMENT 'Enthält die Liste von Aufsichtsbereichen, welche im Stundenplan verwendet werden. Diese werden üblicherweise aus der Tabelle Katalog_Aufsichtsbereich übernommen und hier zwischengespeichert. Änderungen im Katalog werden nicht hierhin übernommen.';


CREATE TABLE Stundenplan_Pausenzeit (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine ID, die einen Pausenzeit-Eintrag eindeutig identifiziert - hat keinen Bezug zur ID der Katalog-Tabelle', 
  Stundenplan_ID bigint NOT NULL COMMENT 'Die ID des Stundenplans, dem dies Pausenzeit zugeordnet ist', 
  Tag int NOT NULL COMMENT 'Der Wochentag laut ISO-8601 Standard: (1 - Montag, 2 - Dienstag, ...)', 
  Beginn time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Pausenzeit beginnt', 
  Ende time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Pausenzeit endet', 
  Bezeichnung varchar(40) DEFAULT 'Pause' NOT NULL COMMENT 'Eine kurze Bezeichnung, welche die Art der Pausenzeit genauer beschreibt (z.B. Mittagspause)',
  CONSTRAINT PK_Stundenplan_Pausenzeit PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenzeit_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_UC1 UNIQUE (Stundenplan_ID, Tag, Beginn, Ende)
) COMMENT 'Enthält die Pausenzeiten eines Stundenplan. Diese werden üblicherweise aus der Tabelle Katalog_Pausenzeiten übernommen und hier zwischengespeichert. Änderungen im Katalog werden nicht hierhin übernommen.';


CREATE TABLE Stundenplan_Pausenaufsichten (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für diese Zuordnung des Pausenaufsichts-Eintrages zu einem Stundenplan', 
  Pausenzeit_ID bigint NOT NULL COMMENT 'Die ID des Pausenzeit-Eintrags', 
  Wochentyp int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich um einen Eintrag für jede Woche handelt (0) oder ob es sich um einen unterschiedlichen (!) Eintrag für eine A- bzw. B-Wochen (1 bzw. 2) handelt', 
  Lehrer_ID bigint NOT NULL COMMENT 'Die ID des aufsichtsführenden Lehrers. Im Falle von mehreren Aufsichten werden für eine Pausenzeit-ID einfach mehrere Datensätze erzeugt',
  CONSTRAINT PK_Stundenplan_Pausenaufsichten PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenaufsichten_K_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenaufsichten_Pausenzeit_FK FOREIGN KEY (Pausenzeit_ID) REFERENCES Stundenplan_Pausenzeit(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenaufsichten_UC1 UNIQUE (Pausenzeit_ID, Lehrer_ID)
) COMMENT 'Enthält die Zuordnung von Lehrern zu einem Pausenzeit-Eintrag. Über die Pausenzeit ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundenplan_PausenaufsichtenBereich (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für die Zuordnung des Aufsichtsbereichs zur Pausenaufsicht', 
  Pausenaufsicht_ID bigint NOT NULL COMMENT 'Die ID des Pausenaufsicht-Eintrages im Stundenplan', 
  Aufsichtsbereich_ID bigint NOT NULL COMMENT 'Die ID des zugewiesenen Aufsichtsbereichs. Sollten ggf. mehrere Aufsichtsbereiche zugwiesen werden, so müssen für eine Pausenaufsicht_ID mehrere Datensätze vorliegen',
  CONSTRAINT PK_Stundenplan_PausenaufsichtenBereich PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsichtsbereiche_FK FOREIGN KEY (Aufsichtsbereich_ID) REFERENCES Stundenplan_Aufsichtsbereiche(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_Aufsicht_FK FOREIGN KEY (Pausenaufsicht_ID) REFERENCES Stundenplan_Pausenaufsichten(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_PausenaufsichtenBereich_UC1 UNIQUE (Pausenaufsicht_ID, Aufsichtsbereich_ID)
) COMMENT 'Enthält die Zuordnung der Aufsichtsbereiche zu den Pausenaufsichten bei einem Pausenzeit-Eintrag. Über die Pausenzeit ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundenplan_Raeume (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID identifiziert einen Raumeintrag für einen Stundenplan eindeutig - hat keinen Bezug zur ID der Katalog-Tabelle', 
  Stundenplan_ID bigint NOT NULL COMMENT 'Die ID des Stundenplans, dem dieser Raumeintrag zugeordnet wird', 
  Kuerzel varchar(20) NOT NULL COMMENT 'Das Kürzel des Raums', 
  Beschreibung varchar(1000) NOT NULL COMMENT 'Gegebenenfalls eine ausführlichere Beschreibung des Raumes', 
  Groesse int DEFAULT 40 NOT NULL COMMENT 'Die Größe des Raumes, d.h. wie viele Schüler hier max. Platz haben',
  CONSTRAINT PK_Stundenplan_Raeume PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Raeume_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Raeume_UC1 UNIQUE (Stundenplan_ID, Kuerzel)
) COMMENT 'Enthält die Liste von Räumen, welche im Stundenplan verwendet werden. Dieser wird üblicherweise aus der Tabelle Katalog_Raeume übernommen und hier zwischengespeichert. Änderungen im Katalog werden nicht hierhin übernommen.';


CREATE TABLE Stundenplan_Schienen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die ID identifiziert einen Schieneneintrag für einen Stundenplan eindeutig', 
  Stundenplan_ID bigint NOT NULL COMMENT 'Die ID des Stundenplans, dem dieser Schieneneintrag zugeordnet wird', 
  Jahrgang_ID bigint COMMENT 'ID des Jahrgangs dem die Schiene zugeordnet wird', 
  Nummer int NOT NULL COMMENT 'Die Nummer der Schiene', 
  Bezeichnung varchar(100) NOT NULL COMMENT 'Die Bezeichnung der Schiene',
  CONSTRAINT PK_Stundenplan_Schienen PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Schienen_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Schienen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT Stundenplan_Schienen_UC1 UNIQUE (Stundenplan_ID, Jahrgang_ID, Nummer)
) COMMENT 'Enthält die Liste von Schienen, welche im Stundenplan verwendet werden.';


CREATE TABLE Stundenplan_Zeitraster (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine ID, die einen Zeitraster-Eintrag eindeutig identifiziert - hat keinen Bezug zur ID der Katalog-Tabelle', 
  Stundenplan_ID bigint NOT NULL COMMENT 'Die ID des Stundenplans, dem dieses Zeitraster zugeordnet ist', 
  Tag int NOT NULL COMMENT 'Der Wochentag laut ISO-8601 Standard: (1 - Montag, 2 - Dienstag, ...)', 
  Stunde int NOT NULL COMMENT 'Die Stunde laut Stundenplan (1, 2, ...)', 
  Beginn time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Stunde beginnt', 
  Ende time DEFAULT Now() NOT NULL COMMENT 'Die Uhrzeit, wann die Stunde endet',
  CONSTRAINT PK_Stundenplan_Zeitraster PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Zeitraster_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Zeitraster_UC1 UNIQUE (Stundenplan_ID, Tag, Stunde)
) COMMENT 'Enthält das Zeitraster eines Stundenplan. Dieses wird üblicherweise aus der Tabelle Katalog_Zeitraster übernommen und hier zwischengespeichert. Änderungen im Katalog werden nicht hierhin übernommen.';


CREATE TABLE Stundenplan_Unterricht (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für diese Zuordnung des Untericht-Eintrages zu einem Stundenplan', 
  Zeitraster_ID bigint NOT NULL COMMENT 'Die ID des belegten Zeitraster-Eintrags', 
  Wochentyp int DEFAULT 0 NOT NULL COMMENT 'Gibt an, ob es sich um einen Eintrag für jede Woche handelt (0) oder ob es sich um einen unterschiedlichen (!) Eintrag für eine A- bzw. B-Wochen (1 bzw. 2) handelt', 
  Kurs_ID bigint COMMENT 'Die ID des Kurses, falls der Unterricht nicht im Klassenverband stattfindet', 
  Fach_ID bigint NOT NULL COMMENT 'Die ID des Faches, in dem der Unterricht stattfindet',
  CONSTRAINT PK_Stundenplan_Unterricht PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Unterricht_EigeneSchule_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Kurse_FK FOREIGN KEY (Kurs_ID) REFERENCES Kurse(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Unterricht_Stundenplan_Zeitraster_FK FOREIGN KEY (Zeitraster_ID) REFERENCES Stundenplan_Zeitraster(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Enthält die Zuordnung der Unterrichte (Kurs, Fach) zu einem Zeitraster-Eintrag. Über das Zeitraster ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet. Die Zuordnung von Lehrern und Räumen erfolgt über die Tabellen Stundenplan_UnterrichtLehrer und Stundenplan_UnterrichtRaum';


CREATE TABLE Stundenplan_UnterrichtKlasse (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für die Zuordnung der Klasse zum Unterricht', 
  Unterricht_ID bigint NOT NULL COMMENT 'Die ID des Unterricht-Eintrages im Stundenplan', 
  Klasse_ID bigint NOT NULL COMMENT 'Die ID der zugeordneten Klasse.',
  CONSTRAINT PK_Stundenplan_UnterrichtKlasse PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtKlasse_Klasse_FK FOREIGN KEY (Klasse_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtKlasse_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtKlasse_UC1 UNIQUE (Unterricht_ID, Klasse_ID)
) COMMENT 'Enthält die Zuordnung der Klasse(n) zu den Unterrichten bei einem Zeitraster-Eintrag. Über das Zeitraster ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundenplan_UnterrichtLehrer (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für die Zuordnung des Lehrer zum Unterricht', 
  Unterricht_ID bigint NOT NULL COMMENT 'Die ID des Unterricht-Eintrages im Stundenplan', 
  Lehrer_ID bigint NOT NULL COMMENT 'Die ID der unterrichtenden Lehrers. Im Falle von Team-Teaching werden für eine Unterricht-ID einfach mehrere Datensätze erzeugt',
  CONSTRAINT PK_Stundenplan_UnterrichtLehrer PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtLehrer_K_Lehrer_FK FOREIGN KEY (Lehrer_ID) REFERENCES K_Lehrer(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtLehrer_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtLehrer_UC1 UNIQUE (Unterricht_ID, Lehrer_ID)
) COMMENT 'Enthält die Zuordnung der Lehrer zu den Unterrichten bei einem Zeitraster-Eintrag. Über das Zeitraster ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundenplan_UnterrichtRaum (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für die Zuordnung des Raumes zum Unterricht', 
  Unterricht_ID bigint NOT NULL COMMENT 'Die ID des Unterricht-Eintrages im Stundenplan', 
  Raum_ID bigint NOT NULL COMMENT 'Die ID des zugewiesenen Raumes. Sollten ggf. mehrere Räume zugewiesen werden, so müssen für eine Unterricht-ID mehrere Datensätze vorliegen',
  CONSTRAINT PK_Stundenplan_UnterrichtRaum PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtRaum_Raeume_FK FOREIGN KEY (Raum_ID) REFERENCES Stundenplan_Raeume(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtRaum_UC1 UNIQUE (Unterricht_ID, Raum_ID)
) COMMENT 'Enthält die Zuordnung der Räume zu den Unterrichten bei einem Zeitraster-Eintrag. Über das Zeitraster ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundenplan_UnterrichtSchiene (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für die Zuordnung der Schiene zum Unterricht', 
  Unterricht_ID bigint NOT NULL COMMENT 'Die ID des Unterricht-Eintrages im Stundenplan', 
  Schiene_ID bigint NOT NULL COMMENT 'Die ID der zugewiesenen Schiene. Sollten ggf. mehrere Schienen zugewiesen werden, so müssen für eine Unterricht-ID mehrere Datensätze vorliegen',
  CONSTRAINT PK_Stundenplan_UnterrichtSchiene PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_UnterrichtSchiene_Schienen_FK FOREIGN KEY (Schiene_ID) REFERENCES Stundenplan_Schienen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtSchiene_Unterricht_FK FOREIGN KEY (Unterricht_ID) REFERENCES Stundenplan_Unterricht(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_UnterrichtSchiene_UC1 UNIQUE (Unterricht_ID, Schiene_ID)
) COMMENT 'Enthält die Zuordnung der Schiene(n) zu den Unterrichten bei einem Zeitraster-Eintrag. Über das Zeitraster ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundenplan_Kalenderwochen_Zuordnung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Eine ID, die einen Eintrag für die Kalenderwochen-Zuordnung eindeutig identifiziert.', 
  Stundenplan_ID bigint NOT NULL COMMENT 'Die ID des Stundenplans, dem die Kalenderwochenzuordnung zugeordnet ist', 
  Jahr int NOT NULL COMMENT 'Das Jahr (nicht Schuljahr) zu dem die Kalenderwoche gehört.', 
  KW int NOT NULL COMMENT 'Die Kalenderwoche im Jahr.', 
  Wochentyp int NOT NULL COMMENT 'Gibt den Wochentyp an, der der Kalenderwoche zugeordnet ist (z.B. eine A- bzw. B-Wochen, d.h. 1 bzw. 2)',
  CONSTRAINT PK_Stundenplan_Kalenderwochen_Zuordnung PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Kalenderwochen_Zuordnung_Stundenplan_FK FOREIGN KEY (Stundenplan_ID) REFERENCES Stundenplan(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Kalenderwochen_Zuordnung_UC1 UNIQUE (Stundenplan_ID, Jahr, KW)
) COMMENT 'Enthält die Zuordnung von Kalenderwochen zu den Wochentypen eines Stundenplans.';


CREATE TABLE Stundenplan_Pausenzeit_Klassenzuordnung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'Die eindeutige ID für die Zuordnung einer Klasse zu einer Pausenzeit', 
  Pausenzeit_ID bigint NOT NULL COMMENT 'Die ID des Pausenzeit-Eintrages im Stundenplan', 
  Klassen_ID bigint NOT NULL COMMENT 'Die ID der zugeordneten Klasse.',
  CONSTRAINT PK_Stundenplan_Pausenzeit_Klassenzuordnung PRIMARY KEY (ID),
  CONSTRAINT Stundenplan_Pausenzeit_Klassenzuordnung_Klassen_FK FOREIGN KEY (Klassen_ID) REFERENCES Klassen(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_Klassenzuordnung_Pausenzeit_FK FOREIGN KEY (Pausenzeit_ID) REFERENCES Stundenplan_Pausenzeit(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundenplan_Pausenzeit_Klassenzuordnung_UC1 UNIQUE (Pausenzeit_ID, Klassen_ID)
) COMMENT 'Enthält die Zuordnung der Klassen zu einem Pausenzeiteintrag. Über die Pausenzeit ist diese Zuordnung auch immer eindeutig einem Stundenplan zugeordnet.';


CREATE TABLE Stundentafel (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Stundentafel', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung der Stundentafel', 
  Jahrgang_ID bigint COMMENT 'JahrgangsID der Stundentafel', 
  ASDJahrgang varchar(2) COMMENT 'ASD-Jahrgang der Stundentafel', 
  SGL varchar(3) COMMENT 'SGL der Stundentafel', 
  Fachklasse_ID bigint COMMENT 'FachklassenID der Stundentafel', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit der Stundentafel', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierungnummer  der Stundentafel',
  CONSTRAINT PK_Stundentafel PRIMARY KEY (ID)
) COMMENT 'Katalog der angelegten Stundentafeln zur Zuweisung von Fächern bei Schülern';


CREATE TABLE Stundentafel_Faecher (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Facheintrags für die Stundentafel', 
  Stundentafel_ID bigint NOT NULL COMMENT 'ID der zugehörigen Stundentafel', 
  Fach_ID bigint NOT NULL COMMENT 'FachID das in der Stundentafel ist', 
  KursartAllg varchar(10) COMMENT 'Kursart des Faches in der Stundentafel', 
  WochenStd smallint COMMENT 'Wochenstunde des Faches in der Stundentafel', 
  Lehrer_ID bigint COMMENT 'Lehrer-ID des unterrichtenden Lehrers für das Fach der Stundentafel', 
  EpochenUnterricht varchar(1) DEFAULT '-' COMMENT 'Merkmal Epochenunterricht des Faches in der Stundentafel', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierung des Faches in der Stundentafel', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Sichtbarkeit des Faches in der Stundentafel', 
  Gewichtung int DEFAULT 1 COMMENT '??? entweder BB auch oder weg ??? Gewichtung allgemeinbidend BK  des Faches in der Stundentafel',
  CONSTRAINT PK_Stundentafel_Faecher PRIMARY KEY (ID),
  CONSTRAINT StundentafelFaecher_Faecher_FK FOREIGN KEY (Fach_ID) REFERENCES EigeneSchule_Faecher(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT StundentafelFaecher_Stdtafel_FK FOREIGN KEY (Stundentafel_ID) REFERENCES Stundentafel(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Stundentafel_Faecher_UC1 UNIQUE (Stundentafel_ID, Fach_ID)
) COMMENT 'Fächereinträge zu den Stundentafeln';


CREATE TABLE Floskelgruppen (
  Kuerzel varchar(10) NOT NULL COMMENT 'Kürzel der Floskelgruppe', 
  Hauptgruppe varchar(4) COMMENT 'Hauptgruppe der Floskelgruppe ermöglich es Floskel Unterkategorien zuzuordnen', 
  Bezeichnung varchar(50) NOT NULL COMMENT 'Bezeichnung der Floskelgruppe', 
  Farbe int COMMENT 'Farbe für die Flsokelgruppe',
  CONSTRAINT PK_Floskelgruppen PRIMARY KEY (Kuerzel)
) COMMENT 'Liste der Floskelgruppen, diese Liste kann erweitert werden um Textbausteinen zu verwalten und die Anzeige in den Editoren zu steuern';


CREATE TABLE Floskeln (
  Kuerzel varchar(10) NOT NULL COMMENT 'Kürzel für die Floskel wird beim Import automatisch vergeben', 
  FloskelText longtext NOT NULL COMMENT 'Text der Floskel', 
  FloskelGruppe varchar(10) COMMENT 'Gruppe der Floskel', 
  FloskelFach varchar(20) COMMENT 'Fach bei Fachfloskeln', 
  FloskelNiveau varchar(2) COMMENT 'Niveau bei Fachfloskeln', 
  FloskelJahrgang varchar(2) COMMENT 'Jahrgang bei Fachfloskeln',
  CONSTRAINT PK_Floskeln PRIMARY KEY (Kuerzel),
  CONSTRAINT Floskeln_Floskelgruppe_Floskelgruppen_FK FOREIGN KEY (FloskelGruppe) REFERENCES Floskelgruppen(Kuerzel) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Textbausteine, die in den Editoren angezeigt und ausgewählt werden können';


CREATE TABLE TextExportVorlagen (
  VorlageName varchar(50) NOT NULL COMMENT 'Name der Export-Textvorlage', 
  Daten longtext COMMENT 'Daten die in der Export-Textvorlage enthalten sind',
  CONSTRAINT PK_TextExportVorlagen PRIMARY KEY (VorlageName)
) COMMENT 'gespeicherte Vorlagen für den Datenaustausch > Text-/Excel-Export';


CREATE TABLE Usergroups (
  UG_ID bigint NOT NULL COMMENT 'ID der Benutzergruppe', 
  UG_Bezeichnung varchar(64) COMMENT 'Bezeichnung der Benutzergruppe', 
  UG_Kompetenzen varchar(255) COMMENT 'Kompetenzen der Benutzergrupppe in vorgegebenen Zahlerwerten', 
  UG_Nr int COMMENT 'Nummer der Benutzergruppe ???', 
  SchulnrEigner int COMMENT 'Die Schulnummer zu welcher der Datensatz gehört – wird benötigt, wenn mehrere Schulen in einem Schema der Datenbank gespeichert werden',
  CONSTRAINT PK_Usergroups PRIMARY KEY (UG_ID),
  CONSTRAINT Usergroups_UC1 UNIQUE (UG_Bezeichnung)
) COMMENT 'Usergruppen mit Berechtigungen';


CREATE TABLE Users (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datenbankbenutzers', 
  US_Name varchar(50) NOT NULL COMMENT 'Name des Datenbankbenutzers ', 
  US_LoginName varchar(20) NOT NULL COMMENT 'LoginName des Datenbankbenutzers', 
  US_Password varchar(20) COMMENT 'DEPRECATED: nicht mehr genutzt altes Passwort des Datenbankbenutzers', 
  US_UserGroups varchar(50) COMMENT 'Zugehörigkeit zu Usergruops des Datenbankbenutzers', 
  US_Privileges varchar(255) COMMENT 'Berechtigungen des Datenbankbenutzers', 
  SchulnrEigner int COMMENT 'Die Schulnummer zu welcher der Datensatz gehört – wird benötigt, wenn mehrere Schulen in einem Schema der Datenbank gespeichert werden', 
  Email varchar(100) COMMENT 'E-Mail-Adresse des Datenbankbenutzers für des Versand aus Schild-NRW', 
  EmailName varchar(100) COMMENT 'Name des Datenbankbenutzers für den Mailversand aus Schild-NRW', 
  SMTPUsername varchar(100) COMMENT 'SMTP Username des Datenbankbenutzers', 
  SMTPPassword varchar(100) COMMENT 'SMTP Passwort des Datenbankbenutzers', 
  EmailSignature longtext COMMENT 'E-Mail-Signatur des Datenbankbenutzers', 
  HeartbeatDate int COMMENT 'Datum des Heartbeats bei einigen Datenbank verwende um Sleepmodus zu verhindern', 
  ComputerName varchar(50) COMMENT 'Name des Computers an dem der Benutzer zuletzt angemeldet war', 
  US_PasswordHash varchar(255) COMMENT 'PasswortHash des Users mit BeCrypt generiert',
  CONSTRAINT PK_Users PRIMARY KEY (ID),
  CONSTRAINT Users_UC1 UNIQUE (US_LoginName)
) COMMENT 'Tabelle der Schild-User';


CREATE TABLE Versetzung (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID der Klasse in der Klassen- Versetzuungstabelle', 
  Bezeichnung varchar(150) COMMENT 'Bezeichnender Text für die Klasse', 
  ASDKlasse varchar(6) COMMENT 'ASD-Jahrgang der Klasse', 
  Klasse varchar(15) NOT NULL COMMENT 'Kürzel der Klasse', 
  Jahrgang_ID bigint COMMENT 'ID des ASD-Jahrgangs', 
  FKlasse varchar(15) COMMENT 'Folgeklasse', 
  VKlasse varchar(15) COMMENT 'Vorgängerklasse', 
  OrgFormKrz varchar(1) COMMENT 'Organisationsform der Klasse Kürzel IT.NRW', 
  KlassenlehrerKrz varchar(10) COMMENT 'Kürzel des Klassenlehrers', 
  StvKlassenlehrerKrz varchar(10) COMMENT 'Kürzel des stellvertretenden Klassenlehrers', 
  Restabschnitte smallint COMMENT 'DEPRECATED: Restabschnitte der Klasse', 
  ASDSchulformNr varchar(3) COMMENT 'Schulgliederung in der Klasse', 
  Fachklasse_ID bigint COMMENT 'FID des Fachklasse nur BK SBK', 
  PruefOrdnung varchar(20) COMMENT 'Prüfungsordnung für die Klasse', 
  Sichtbar varchar(1) DEFAULT '+' COMMENT 'Gibt an ob eine Klasse sichtbar ist', 
  Sortierung int DEFAULT 32000 COMMENT 'Sortierungnummer der Klasse', 
  Klassenart varchar(2) COMMENT 'Klassenart', 
  SommerSem varchar(1) DEFAULT '-' COMMENT 'Beginn im Sommersemester nur WBK', 
  NotenGesperrt varchar(1) DEFAULT '-' COMMENT 'Noteneingabe für die Klasse gesperrt', 
  SchulnrEigner int COMMENT 'Die Schulnummer zu welcher der Datensatz gehört – wird benötigt, wenn mehrere Schulen in einem Schema der Datenbank gespeichert werden', 
  AdrMerkmal varchar(1) DEFAULT 'A' COMMENT 'Adressmerkmal des Teilstandorts für die Klasse', 
  WebNotenGesperrt varchar(1) DEFAULT '-' COMMENT 'DEPRECATED: nicht mehr genutzt SchildWeb', 
  KoopKlasse varchar(1) DEFAULT '-' COMMENT 'Gibt an ob die Klasse eine KOOP-Klasse ist', 
  Ankreuzzeugnisse varchar(1) DEFAULT '-' COMMENT 'Gibt an ob in der Klasse Ankreuzeugnisse (GS) oder Kompentenzschreiben (andere) verwendet werden',
  CONSTRAINT PK_Versetzung PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Klassen-/Versetzungstabelle';


CREATE TABLE DavRessources (
  ,
  CONSTRAINT PK_DavRessources PRIMARY KEY (ID)
) COMMENT 'Ein WebDav Ressourcen, vergleichbar mit einem Adressbucheintrag oder Kalenderdaten.';


CREATE TABLE ZuordnungReportvorlagen (
  ID bigint DEFAULT -1 NOT NULL COMMENT 'ID des Datensatzes der einen Zeugnisreport einer Gruppe oder Klasse zuordnet', 
  Jahrgang_ID bigint COMMENT 'ID des Jahrgangs der zum Report zugeordnet wird', 
  Abschluss varchar(50) COMMENT 'Bezeichnung des Abschluss der für den Report zugeordnet wird', 
  AbschlussBB varchar(50) COMMENT 'Bezeichnung des berufsbezogenen Abschluss der für den Report zugeordnet wird', 
  AbschlussArt int COMMENT 'Art des Abschluss der für den Report zugeordnet wird', 
  VersetzungKrz varchar(2) COMMENT 'Kürzel des Versetzungsvermerk das für den Report zugeordnet wird', 
  Fachklasse_ID bigint COMMENT 'ID der Fachklasse die für den Report zugeordnet wird', 
  Reportvorlage varchar(255) COMMENT 'Pfad zur Reportvorlage die für das Zeugnis zugeordnet wird', 
  Beschreibung varchar(255) COMMENT 'Beschreibung für die Reportzuordnung zum Zeugnisdruck', 
  Gruppe varchar(50) COMMENT 'Name der Gruppe die für den Report zugeordnet wird', 
  Zeugnisart varchar(5) COMMENT 'Zeugnisart (Laufbahndaten) die für den Report zugeordnet wird',
  CONSTRAINT PK_ZuordnungReportvorlagen PRIMARY KEY (ID),
  CONSTRAINT ZuordnungReportvorlagen_Fachklasse_FK FOREIGN KEY (Fachklasse_ID) REFERENCES EigeneSchule_Fachklassen(ID) ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT ZuordnungReportvorlagen_Jahrgang_FK FOREIGN KEY (Jahrgang_ID) REFERENCES EigeneSchule_Jahrgaenge(ID) ON UPDATE CASCADE ON DELETE SET NULL
) COMMENT 'Zuordnungen von Reports für den Zeugnisdruck (automatisierter Druck)';


CREATE TABLE DavSyncTokenSchueler (
  ,
  CONSTRAINT PK_DavSyncTokenSchueler PRIMARY KEY (ID)
) COMMENT 'Diese Tabelle beinhaltet die Zeitstempel, wann an den für Card-DAV relevanten Datenbanktabellen für einen Schüler Änderungen vorgenommen wurden. Diese Zeitstempel dienen als Sync-Token für das Protokoll.';


CREATE TABLE DavSyncTokenLehrer (
  ,
  CONSTRAINT PK_DavSyncTokenLehrer PRIMARY KEY (ID)
) COMMENT 'Diese Tabelle beinhaltet die Zeitstempel, wann an den für Card-DAV relevanten Datenbanktabellen für einen Lehrer Änderungen vorgenommen wurden. Diese Zeitstempel dienen als Sync-Token für das Protokoll.';


CREATE TABLE EnmLeistungsdaten (
  ,
  CONSTRAINT PK_EnmLeistungsdaten PRIMARY KEY (ID)
) COMMENT 'Diese Tabelle beinhaltet die Zeitstempel, wann an den für das ENM relevanten Spalten der Datenbanktabelle für Leistungsdaten Änderungen vorgenommen wurden.';


CREATE TABLE EnmLernabschnittsdaten (
  ,
  CONSTRAINT PK_EnmLernabschnittsdaten PRIMARY KEY (ID)
) COMMENT 'Diese Tabelle beinhaltet die Zeitstempel, wann an den für das ENM relevanten Spalten der Datenbanktabelle für Lernabschnittsdaten Änderungen vorgenommen wurden.';


CREATE TABLE EnmTeilleistungen (
  ,
  CONSTRAINT PK_EnmTeilleistungen PRIMARY KEY (ID)
) COMMENT 'Diese Tabelle beinhaltet die Zeitstempel, wann an den für das ENM relevanten Spalten der Datenbanktabelle für Teilleistungen Änderungen vorgenommen wurden.';


CREATE TABLE Schulbewerbung_Importe (
  Schueler_ID bigint NOT NULL COMMENT 'Schüler-ID des Schülers, für welchen die Import-Daten speichert werden', 
  LastSync datetime(3) DEFAULT (CURRENT_TIME()) NOT NULL COMMENT 'Der Zeitstempel der letzten Synchronisation der Daten mit schulbewerbung.de', 
  LastXML longtext NOT NULL COMMENT 'Das XML der letzten Synchronisation der Daten mit schulbewerbung.de',
  CONSTRAINT PK_Schulbewerbung_Importe PRIMARY KEY (Schueler_ID),
  CONSTRAINT Schulbewerbung_Importe_Schueler_FK FOREIGN KEY (Schueler_ID) REFERENCES Schueler(ID) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'Die letzten Daten eines Imports von Schulbewerbung.de';


CREATE TABLE Gost_Klausuren_Vorgaben (
  ,
  CONSTRAINT PK_Gost_Klausuren_Vorgaben PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition von Vorgaben für Klausuren';


CREATE TABLE Gost_Klausuren_Termine (
  ,
  CONSTRAINT PK_Gost_Klausuren_Termine PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition von Terminen für Klausuren';


CREATE TABLE Gost_Klausuren_Termine_Jahrgaenge (
  ,
  CONSTRAINT PK_Gost_Klausuren_Termine_Jahrgaenge PRIMARY KEY (Termin_ID, Abi_Jahrgang)
) COMMENT 'Tabelle für die Definition von zugelassenen Jahrgangsstufen zu Klausurterminen';


CREATE TABLE Gost_Klausuren_Kursklausuren (
  ,
  CONSTRAINT PK_Gost_Klausuren_Kursklausuren PRIMARY KEY (ID)
) COMMENT 'Tabelle für die konkreten Kursklausurentitäten';


CREATE TABLE Gost_Klausuren_Schuelerklausuren (
  ,
  CONSTRAINT PK_Gost_Klausuren_Schuelerklausuren PRIMARY KEY (ID)
) COMMENT 'Tabelle für die konkreten Schuelerklausurenentitäten';


CREATE TABLE Gost_Klausuren_Schuelerklausuren_Termine (
  ,
  CONSTRAINT PK_Gost_Klausuren_Schuelerklausuren_Termine PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Terminzuordnung von Schülerklausuren';


CREATE TABLE Gost_Klausuren_NtaZeiten (
  ,
  CONSTRAINT PK_Gost_Klausuren_NtaZeiten PRIMARY KEY (Schueler_ID, Vorgabe_ID)
) COMMENT 'Tabelle für die Definition von Nachteilsausgleichen';


CREATE TABLE Gost_Klausuren_Raeume (
  ,
  CONSTRAINT PK_Gost_Klausuren_Raeume PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition von Räumen für Klausuren';


CREATE TABLE Gost_Klausuren_Raumstunden (
  ,
  CONSTRAINT PK_Gost_Klausuren_Raumstunden PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition von Klausurraumstunden';


CREATE TABLE Gost_Klausuren_SchuelerklausurenTermine_Raumstunden (
  ,
  CONSTRAINT PK_Gost_Klausuren_SchuelerklausurenTermine_Raumstunden PRIMARY KEY (Schuelerklausurtermin_ID, Raumstunde_ID)
) COMMENT 'Tabelle für die Definition von Schülerklausurtermin-Raumstunden';


CREATE TABLE Gost_Klausuren_Raumstunden_Aufsichten (
  ,
  CONSTRAINT PK_Gost_Klausuren_Raumstunden_Aufsichten PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition von Aufsichten für Klausur-Raumstunden';


CREATE TABLE Gost_Klausuren_Kalenderinformationen (
  ,
  CONSTRAINT PK_Gost_Klausuren_Kalenderinformationen PRIMARY KEY (ID)
) COMMENT 'Tabelle für die Definition von Kalenderinformationen';


CREATE TABLE EigeneSchule_Email (
  ,
  CONSTRAINT PK_EigeneSchule_Email PRIMARY KEY (ID)
) COMMENT 'Die Informationen zu der SMTP-Server-Konfiguration eines Providers für Dienst-Email-Adressen der Schule.';



delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Benutzergruppen
BEFORE INSERT
  ON Benutzergruppen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Benutzergruppen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Benutzergruppen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Benutzergruppen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Benutzergruppen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Benutzergruppen
BEFORE UPDATE
  ON Benutzergruppen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Benutzergruppen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Benutzergruppen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Benutzergruppen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Benutzergruppen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Credentials
BEFORE INSERT
  ON Credentials FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Credentials';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Credentials;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Credentials', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Credentials';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Credentials
BEFORE UPDATE
  ON Credentials FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Credentials';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Credentials;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Credentials', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Credentials';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_BenutzerAllgemein
BEFORE INSERT
  ON BenutzerAllgemein FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='BenutzerAllgemein';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM BenutzerAllgemein;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('BenutzerAllgemein', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='BenutzerAllgemein';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_BenutzerAllgemein
BEFORE UPDATE
  ON BenutzerAllgemein FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='BenutzerAllgemein';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM BenutzerAllgemein;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('BenutzerAllgemein', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='BenutzerAllgemein';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Fachklassen
BEFORE INSERT
  ON EigeneSchule_Fachklassen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Fachklassen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Fachklassen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Fachklassen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Fachklassen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Fachklassen
BEFORE UPDATE
  ON EigeneSchule_Fachklassen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Fachklassen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Fachklassen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Fachklassen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Fachklassen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_KAoADaten
BEFORE INSERT
  ON EigeneSchule_KAoADaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_KAoADaten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_KAoADaten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_KAoADaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_KAoADaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_KAoADaten
BEFORE UPDATE
  ON EigeneSchule_KAoADaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_KAoADaten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_KAoADaten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_KAoADaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_KAoADaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Kursart
BEFORE INSERT
  ON EigeneSchule_Kursart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Kursart';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Kursart;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Kursart', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Kursart';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Kursart
BEFORE UPDATE
  ON EigeneSchule_Kursart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Kursart';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Kursart;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Kursart', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Kursart';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Merkmale
BEFORE INSERT
  ON EigeneSchule_Merkmale FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Merkmale';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Merkmale;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Merkmale', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Merkmale';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Merkmale
BEFORE UPDATE
  ON EigeneSchule_Merkmale FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Merkmale';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Merkmale;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Merkmale', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Merkmale';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Schulformen
BEFORE INSERT
  ON EigeneSchule_Schulformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Schulformen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Schulformen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Schulformen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Schulformen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Schulformen
BEFORE UPDATE
  ON EigeneSchule_Schulformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Schulformen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Schulformen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Schulformen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Schulformen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Zertifikate
BEFORE INSERT
  ON EigeneSchule_Zertifikate FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Zertifikate';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Zertifikate;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Zertifikate', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Zertifikate';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Zertifikate
BEFORE UPDATE
  ON EigeneSchule_Zertifikate FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Zertifikate';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Zertifikate;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Zertifikate', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Zertifikate';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Faecher
BEFORE INSERT
  ON EigeneSchule_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Faecher';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Faecher;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Faecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Faecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Faecher
BEFORE UPDATE
  ON EigeneSchule_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Faecher';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Faecher;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Faecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Faecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Gost_Jahrgang_Fachkombinationen
BEFORE INSERT
  ON Gost_Jahrgang_Fachkombinationen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Gost_Jahrgang_Fachkombinationen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Gost_Jahrgang_Fachkombinationen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Gost_Jahrgang_Fachkombinationen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Gost_Jahrgang_Fachkombinationen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Gost_Jahrgang_Fachkombinationen
BEFORE UPDATE
  ON Gost_Jahrgang_Fachkombinationen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Gost_Jahrgang_Fachkombinationen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Gost_Jahrgang_Fachkombinationen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Gost_Jahrgang_Fachkombinationen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Gost_Jahrgang_Fachkombinationen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Adressart
BEFORE INSERT
  ON K_Adressart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Adressart';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Adressart;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Adressart', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Adressart';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Adressart
BEFORE UPDATE
  ON K_Adressart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Adressart';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Adressart;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Adressart', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Adressart';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzdaten
BEFORE INSERT
  ON K_Ankreuzdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ankreuzdaten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Ankreuzdaten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzdaten
BEFORE UPDATE
  ON K_Ankreuzdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ankreuzdaten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Ankreuzdaten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ankreuzfloskeln
BEFORE INSERT
  ON K_Ankreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ankreuzfloskeln';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Ankreuzfloskeln;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzfloskeln', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzfloskeln';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ankreuzfloskeln
BEFORE UPDATE
  ON K_Ankreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ankreuzfloskeln';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Ankreuzfloskeln;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ankreuzfloskeln', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ankreuzfloskeln';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_BeschaeftigungsArt
BEFORE INSERT
  ON K_BeschaeftigungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_BeschaeftigungsArt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_BeschaeftigungsArt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_BeschaeftigungsArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_BeschaeftigungsArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_BeschaeftigungsArt
BEFORE UPDATE
  ON K_BeschaeftigungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_BeschaeftigungsArt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_BeschaeftigungsArt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_BeschaeftigungsArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_BeschaeftigungsArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Datenschutz
BEFORE INSERT
  ON K_Datenschutz FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Datenschutz';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Datenschutz;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Datenschutz', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Datenschutz';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Datenschutz
BEFORE UPDATE
  ON K_Datenschutz FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Datenschutz';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Datenschutz;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Datenschutz', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Datenschutz';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_EinschulungsArt
BEFORE INSERT
  ON K_EinschulungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_EinschulungsArt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_EinschulungsArt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EinschulungsArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EinschulungsArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_EinschulungsArt
BEFORE UPDATE
  ON K_EinschulungsArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_EinschulungsArt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_EinschulungsArt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EinschulungsArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EinschulungsArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Einzelleistungen
BEFORE INSERT
  ON K_Einzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Einzelleistungen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Einzelleistungen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Einzelleistungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Einzelleistungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Einzelleistungen
BEFORE UPDATE
  ON K_Einzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Einzelleistungen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Einzelleistungen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Einzelleistungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Einzelleistungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_EntlassGrund
BEFORE INSERT
  ON K_EntlassGrund FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_EntlassGrund';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_EntlassGrund;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EntlassGrund', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EntlassGrund';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_EntlassGrund
BEFORE UPDATE
  ON K_EntlassGrund FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_EntlassGrund';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_EntlassGrund;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_EntlassGrund', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_EntlassGrund';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherArt
BEFORE INSERT
  ON K_ErzieherArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_ErzieherArt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_ErzieherArt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherArt
BEFORE UPDATE
  ON K_ErzieherArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_ErzieherArt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_ErzieherArt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_ErzieherFunktion
BEFORE INSERT
  ON K_ErzieherFunktion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_ErzieherFunktion';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_ErzieherFunktion;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherFunktion', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherFunktion';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_ErzieherFunktion
BEFORE UPDATE
  ON K_ErzieherFunktion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_ErzieherFunktion';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_ErzieherFunktion;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_ErzieherFunktion', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_ErzieherFunktion';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_FahrschuelerArt
BEFORE INSERT
  ON K_FahrschuelerArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_FahrschuelerArt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_FahrschuelerArt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_FahrschuelerArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_FahrschuelerArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_FahrschuelerArt
BEFORE UPDATE
  ON K_FahrschuelerArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_FahrschuelerArt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_FahrschuelerArt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_FahrschuelerArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_FahrschuelerArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Foerderschwerpunkt
BEFORE INSERT
  ON K_Foerderschwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Foerderschwerpunkt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Foerderschwerpunkt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Foerderschwerpunkt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Foerderschwerpunkt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Foerderschwerpunkt
BEFORE UPDATE
  ON K_Foerderschwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Foerderschwerpunkt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Foerderschwerpunkt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Foerderschwerpunkt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Foerderschwerpunkt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Haltestelle
BEFORE INSERT
  ON K_Haltestelle FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Haltestelle';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Haltestelle;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Haltestelle', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Haltestelle';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Haltestelle
BEFORE UPDATE
  ON K_Haltestelle FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Haltestelle';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Haltestelle;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Haltestelle', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Haltestelle';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Kindergarten
BEFORE INSERT
  ON K_Kindergarten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Kindergarten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Kindergarten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Kindergarten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Kindergarten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Kindergarten
BEFORE UPDATE
  ON K_Kindergarten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Kindergarten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Kindergarten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Kindergarten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Kindergarten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ort
BEFORE INSERT
  ON K_Ort FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ort';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Ort;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ort', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ort';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ort
BEFORE UPDATE
  ON K_Ort FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ort';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Ort;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ort', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ort';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Ortsteil
BEFORE INSERT
  ON K_Ortsteil FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ortsteil';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Ortsteil;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ortsteil', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ortsteil';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Ortsteil
BEFORE UPDATE
  ON K_Ortsteil FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Ortsteil';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Ortsteil;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Ortsteil', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Ortsteil';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_AllgAdresse
BEFORE INSERT
  ON K_AllgAdresse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_AllgAdresse';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_AllgAdresse;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_AllgAdresse', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_AllgAdresse';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_AllgAdresse
BEFORE UPDATE
  ON K_AllgAdresse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_AllgAdresse';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_AllgAdresse;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_AllgAdresse', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_AllgAdresse';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_AllgAdrAnsprechpartner
BEFORE INSERT
  ON AllgAdrAnsprechpartner FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='AllgAdrAnsprechpartner';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM AllgAdrAnsprechpartner;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('AllgAdrAnsprechpartner', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='AllgAdrAnsprechpartner';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_AllgAdrAnsprechpartner
BEFORE UPDATE
  ON AllgAdrAnsprechpartner FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='AllgAdrAnsprechpartner';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM AllgAdrAnsprechpartner;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('AllgAdrAnsprechpartner', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='AllgAdrAnsprechpartner';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Religion
BEFORE INSERT
  ON K_Religion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Religion';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Religion;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Religion', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Religion';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Religion
BEFORE UPDATE
  ON K_Religion FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Religion';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Religion;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Religion', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Religion';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schule
BEFORE INSERT
  ON K_Schule FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Schule';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Schule;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schule', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schule';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schule
BEFORE UPDATE
  ON K_Schule FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Schule';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Schule;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schule', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schule';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schulfunktionen
BEFORE INSERT
  ON K_Schulfunktionen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Schulfunktionen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Schulfunktionen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schulfunktionen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schulfunktionen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schulfunktionen
BEFORE UPDATE
  ON K_Schulfunktionen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Schulfunktionen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Schulfunktionen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schulfunktionen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schulfunktionen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Schwerpunkt
BEFORE INSERT
  ON K_Schwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Schwerpunkt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Schwerpunkt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schwerpunkt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schwerpunkt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Schwerpunkt
BEFORE UPDATE
  ON K_Schwerpunkt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Schwerpunkt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Schwerpunkt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Schwerpunkt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Schwerpunkt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Sportbefreiung
BEFORE INSERT
  ON K_Sportbefreiung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Sportbefreiung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Sportbefreiung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Sportbefreiung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Sportbefreiung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Sportbefreiung
BEFORE UPDATE
  ON K_Sportbefreiung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Sportbefreiung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Sportbefreiung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Sportbefreiung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Sportbefreiung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_TelefonArt
BEFORE INSERT
  ON K_TelefonArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_TelefonArt';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_TelefonArt;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TelefonArt', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_TelefonArt';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_TelefonArt
BEFORE UPDATE
  ON K_TelefonArt FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_TelefonArt';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_TelefonArt;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_TelefonArt', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_TelefonArt';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Textdateien
BEFORE INSERT
  ON K_Textdateien FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Textdateien';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Textdateien;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Textdateien', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Textdateien';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Textdateien
BEFORE UPDATE
  ON K_Textdateien FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Textdateien';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Textdateien;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Textdateien', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Textdateien';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Vermerkart
BEFORE INSERT
  ON K_Vermerkart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Vermerkart';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Vermerkart;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Vermerkart', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Vermerkart';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Vermerkart
BEFORE UPDATE
  ON K_Vermerkart FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Vermerkart';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Vermerkart;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Vermerkart', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Vermerkart';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Aufsichtsbereich
BEFORE INSERT
  ON Katalog_Aufsichtsbereich FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Aufsichtsbereich';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Katalog_Aufsichtsbereich;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Aufsichtsbereich', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Aufsichtsbereich';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Aufsichtsbereich
BEFORE UPDATE
  ON Katalog_Aufsichtsbereich FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Aufsichtsbereich';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Katalog_Aufsichtsbereich;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Aufsichtsbereich', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Aufsichtsbereich';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Pausenzeiten
BEFORE INSERT
  ON Katalog_Pausenzeiten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Pausenzeiten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Katalog_Pausenzeiten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Pausenzeiten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Pausenzeiten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Pausenzeiten
BEFORE UPDATE
  ON Katalog_Pausenzeiten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Pausenzeiten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Katalog_Pausenzeiten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Pausenzeiten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Pausenzeiten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Raeume
BEFORE INSERT
  ON Katalog_Raeume FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Raeume';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Katalog_Raeume;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Raeume', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Raeume';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Raeume
BEFORE UPDATE
  ON Katalog_Raeume FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Raeume';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Katalog_Raeume;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Raeume', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Raeume';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Katalog_Zeitraster
BEFORE INSERT
  ON Katalog_Zeitraster FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Zeitraster';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Katalog_Zeitraster;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Zeitraster', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Zeitraster';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Katalog_Zeitraster
BEFORE UPDATE
  ON Katalog_Zeitraster FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Katalog_Zeitraster';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Katalog_Zeitraster;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Katalog_Zeitraster', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Katalog_Zeitraster';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Lernplattformen
BEFORE INSERT
  ON Lernplattformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Lernplattformen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Lernplattformen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Lernplattformen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Lernplattformen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Lernplattformen
BEFORE UPDATE
  ON Lernplattformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Lernplattformen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Lernplattformen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Lernplattformen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Lernplattformen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_CredentialsLernplattformen
BEFORE INSERT
  ON CredentialsLernplattformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='CredentialsLernplattformen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM CredentialsLernplattformen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('CredentialsLernplattformen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='CredentialsLernplattformen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_CredentialsLernplattformen
BEFORE UPDATE
  ON CredentialsLernplattformen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='CredentialsLernplattformen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM CredentialsLernplattformen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('CredentialsLernplattformen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='CredentialsLernplattformen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_K_Lehrer
BEFORE INSERT
  ON K_Lehrer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Lehrer';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM K_Lehrer;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Lehrer', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Lehrer';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_K_Lehrer
BEFORE UPDATE
  ON K_Lehrer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='K_Lehrer';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM K_Lehrer;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('K_Lehrer', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='K_Lehrer';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen
BEFORE INSERT
  ON Personengruppen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Personengruppen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Personengruppen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen
BEFORE UPDATE
  ON Personengruppen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Personengruppen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Personengruppen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Personengruppen_Personen
BEFORE INSERT
  ON Personengruppen_Personen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Personengruppen_Personen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Personengruppen_Personen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen_Personen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen_Personen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Personengruppen_Personen
BEFORE UPDATE
  ON Personengruppen_Personen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Personengruppen_Personen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Personengruppen_Personen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Personengruppen_Personen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Personengruppen_Personen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchildFilter
BEFORE INSERT
  ON SchildFilter FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchildFilter';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchildFilter;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchildFilter', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchildFilter';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchildFilter
BEFORE UPDATE
  ON SchildFilter FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchildFilter';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchildFilter;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchildFilter', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchildFilter';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerListe
BEFORE INSERT
  ON SchuelerListe FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerListe';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerListe;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerListe', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerListe';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerListe
BEFORE UPDATE
  ON SchuelerListe FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerListe';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerListe;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerListe', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerListe';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Schuljahresabschnitte
BEFORE INSERT
  ON Schuljahresabschnitte FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schuljahresabschnitte';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Schuljahresabschnitte;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schuljahresabschnitte', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schuljahresabschnitte';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Schuljahresabschnitte
BEFORE UPDATE
  ON Schuljahresabschnitte FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schuljahresabschnitte';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Schuljahresabschnitte;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schuljahresabschnitte', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schuljahresabschnitte';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abteilungen
BEFORE INSERT
  ON EigeneSchule_Abteilungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Abteilungen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Abteilungen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abteilungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abteilungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abteilungen
BEFORE UPDATE
  ON EigeneSchule_Abteilungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Abteilungen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Abteilungen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abteilungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abteilungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Jahrgaenge
BEFORE INSERT
  ON EigeneSchule_Jahrgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Jahrgaenge';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Jahrgaenge;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Jahrgaenge', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Jahrgaenge';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Jahrgaenge
BEFORE UPDATE
  ON EigeneSchule_Jahrgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Jahrgaenge';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Jahrgaenge;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Jahrgaenge', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Jahrgaenge';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerAbschnittsdaten
BEFORE INSERT
  ON LehrerAbschnittsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerAbschnittsdaten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM LehrerAbschnittsdaten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerAbschnittsdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerAbschnittsdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerAbschnittsdaten
BEFORE UPDATE
  ON LehrerAbschnittsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerAbschnittsdaten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM LehrerAbschnittsdaten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerAbschnittsdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerAbschnittsdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Klassen
BEFORE INSERT
  ON Klassen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Klassen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Klassen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Klassen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Klassen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Klassen
BEFORE UPDATE
  ON Klassen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Klassen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Klassen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Klassen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Klassen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Kurse
BEFORE INSERT
  ON Kurse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Kurse';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Kurse;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Kurse', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Kurse';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Kurse
BEFORE UPDATE
  ON Kurse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Kurse';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Kurse;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Kurse', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Kurse';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerAnrechnung
BEFORE INSERT
  ON LehrerAnrechnung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerAnrechnung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM LehrerAnrechnung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerAnrechnung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerAnrechnung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerAnrechnung
BEFORE UPDATE
  ON LehrerAnrechnung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerAnrechnung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM LehrerAnrechnung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerAnrechnung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerAnrechnung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerEntlastung
BEFORE INSERT
  ON LehrerEntlastung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerEntlastung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM LehrerEntlastung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerEntlastung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerEntlastung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerEntlastung
BEFORE UPDATE
  ON LehrerEntlastung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerEntlastung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM LehrerEntlastung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerEntlastung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerEntlastung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerFunktionen
BEFORE INSERT
  ON LehrerFunktionen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerFunktionen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM LehrerFunktionen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerFunktionen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerFunktionen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerFunktionen
BEFORE UPDATE
  ON LehrerFunktionen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerFunktionen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM LehrerFunktionen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerFunktionen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerFunktionen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_LehrerMehrleistung
BEFORE INSERT
  ON LehrerMehrleistung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerMehrleistung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM LehrerMehrleistung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerMehrleistung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerMehrleistung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_LehrerMehrleistung
BEFORE UPDATE
  ON LehrerMehrleistung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='LehrerMehrleistung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM LehrerMehrleistung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('LehrerMehrleistung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='LehrerMehrleistung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Schueler
BEFORE INSERT
  ON Schueler FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schueler';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Schueler;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler
BEFORE UPDATE
  ON Schueler FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schueler';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Schueler;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_EigeneSchule_Abt_Kl
BEFORE INSERT
  ON EigeneSchule_Abt_Kl FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Abt_Kl';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM EigeneSchule_Abt_Kl;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abt_Kl', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abt_Kl';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_EigeneSchule_Abt_Kl
BEFORE UPDATE
  ON EigeneSchule_Abt_Kl FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='EigeneSchule_Abt_Kl';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM EigeneSchule_Abt_Kl;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('EigeneSchule_Abt_Kl', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='EigeneSchule_Abt_Kl';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_INSERT_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER AFTER INSERT ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
    DECLARE schuelerID BIGINT;
    DECLARE wechselNr SMALLINT;
    IF NEW.Kurs_ID IS NOT NULL THEN
        SELECT Schueler.id, SchuelerLernabschnittsdaten.WechselNr INTO schuelerID, wechselNr FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = NEW.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;
        INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID, LernabschnittWechselNr) VALUES (NEW.Kurs_ID, schuelerID, wechselNr);
    END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_UPDATE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER AFTER UPDATE ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
    DECLARE alteSchuelerID, neueSchuelerID BIGINT;
    DECLARE alteWechselNr, neueWechselNr SMALLINT;
    IF NEW.Kurs_ID IS NOT NULL AND OLD.Kurs_ID IS NOT NULL AND OLD.Kurs_ID <> NEW.Kurs_ID THEN
        SELECT Schueler.id, SchuelerLernabschnittsdaten.WechselNr INTO alteSchuelerID, alteWechselNr FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = OLD.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;
        IF OLD.Abschnitt_ID <> NEW.Abschnitt_ID THEN
            SELECT Schueler.id, SchuelerLernabschnittsdaten.WechselNr INTO neueSchuelerID, neueWechselNr FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = NEW.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;
        ELSE
            SET neueSchuelerID := alteSchuelerID;
            SET neueWechselNr := alteWechselNr;
        END IF;
        UPDATE Kurs_Schueler SET Kurs_Schueler.Kurs_ID = NEW.Kurs_ID, Kurs_Schueler.Schueler_ID = neueSchuelerID, Kurs_Schueler.LernabschnittWechselNr = neueWechselNr WHERE Kurs_Schueler.Kurs_ID = OLD.Kurs_ID AND Kurs_Schueler.Schueler_ID = alteSchuelerID AND Kurs_Schueler.LernabschnittWechselNr = alteWechselNr;
    ELSEIF NEW.Kurs_ID IS NULL THEN
        SELECT Schueler.id, SchuelerLernabschnittsdaten.WechselNr INTO alteSchuelerID, alteWechselNr FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = OLD.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;
        DELETE FROM Kurs_Schueler WHERE Kurs_Schueler.Kurs_ID = OLD.Kurs_ID AND Kurs_Schueler.Schueler_ID = alteSchuelerID AND Kurs_Schueler.LernabschnittWechselNr = alteWechselNr;
    ELSEIF OLD.Kurs_ID IS NULL THEN
        SELECT Schueler.id, SchuelerLernabschnittsdaten.WechselNr INTO neueSchuelerID, neueWechselNr FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = NEW.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;
        INSERT INTO Kurs_Schueler(Kurs_ID, Schueler_ID, LernabschnittWechselNr) VALUES (NEW.Kurs_ID, neueSchuelerID, neueWechselNr);
    END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_DELETE_SCHUELERLEISTUNGSDATEN_KURS_SCHUELER AFTER DELETE ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
    DECLARE schuelerID BIGINT;
    DECLARE wechselNr SMALLINT;
    IF OLD.Kurs_ID IS NOT NULL THEN
        SELECT Schueler.id, SchuelerLernabschnittsdaten.WechselNr INTO schuelerID, wechselNr FROM SchuelerLernabschnittsdaten JOIN Schueler ON SchuelerLernabschnittsdaten.ID = OLD.Abschnitt_ID AND SchuelerLernabschnittsdaten.Schueler_ID = Schueler.ID;
        DELETE FROM Kurs_Schueler WHERE Kurs_Schueler.Kurs_ID = OLD.Kurs_ID AND Kurs_Schueler.Schueler_ID = schuelerID AND Kurs_Schueler.LernabschnittWechselNr = wechselNr;
    END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbgaenge
BEFORE INSERT
  ON SchuelerAbgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAbgaenge';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerAbgaenge;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbgaenge', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbgaenge';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbgaenge
BEFORE UPDATE
  ON SchuelerAbgaenge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAbgaenge';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerAbgaenge;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbgaenge', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbgaenge';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbiFaecher
BEFORE INSERT
  ON SchuelerAbiFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAbiFaecher';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerAbiFaecher;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbiFaecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbiFaecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbiFaecher
BEFORE UPDATE
  ON SchuelerAbiFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAbiFaecher';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerAbiFaecher;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbiFaecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbiFaecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAbitur
BEFORE INSERT
  ON SchuelerAbitur FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAbitur';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerAbitur;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbitur', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbitur';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAbitur
BEFORE UPDATE
  ON SchuelerAbitur FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAbitur';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerAbitur;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAbitur', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAbitur';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerBKFaecher
BEFORE INSERT
  ON SchuelerBKFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerBKFaecher';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerBKFaecher;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerBKFaecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerBKFaecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerBKFaecher
BEFORE UPDATE
  ON SchuelerBKFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerBKFaecher';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerBKFaecher;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerBKFaecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerBKFaecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerErzAdr
BEFORE INSERT
  ON SchuelerErzAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerErzAdr';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerErzAdr;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzAdr', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerErzAdr';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerErzAdr
BEFORE UPDATE
  ON SchuelerErzAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerErzAdr';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerErzAdr;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerErzAdr', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerErzAdr';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHR
BEFORE INSERT
  ON SchuelerFHR FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerFHR';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerFHR;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHR', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHR';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHR
BEFORE UPDATE
  ON SchuelerFHR FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerFHR';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerFHR;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHR', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHR';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFHRFaecher
BEFORE INSERT
  ON SchuelerFHRFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerFHRFaecher';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerFHRFaecher;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHRFaecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHRFaecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFHRFaecher
BEFORE UPDATE
  ON SchuelerFHRFaecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerFHRFaecher';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerFHRFaecher;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFHRFaecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFHRFaecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLernabschnittsdaten
BEFORE INSERT
  ON SchuelerLernabschnittsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerLernabschnittsdaten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerLernabschnittsdaten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLernabschnittsdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLernabschnittsdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLernabschnittsdaten
BEFORE UPDATE
  ON SchuelerLernabschnittsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerLernabschnittsdaten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerLernabschnittsdaten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLernabschnittsdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLernabschnittsdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerSprachenfolge
BEFORE INSERT
  ON SchuelerSprachenfolge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerSprachenfolge';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerSprachenfolge;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachenfolge', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerSprachenfolge';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerSprachenfolge
BEFORE UPDATE
  ON SchuelerSprachenfolge FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerSprachenfolge';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerSprachenfolge;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachenfolge', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerSprachenfolge';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerSprachpruefungen
BEFORE INSERT
  ON SchuelerSprachpruefungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerSprachpruefungen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerSprachpruefungen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachpruefungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerSprachpruefungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerSprachpruefungen
BEFORE UPDATE
  ON SchuelerSprachpruefungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerSprachpruefungen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerSprachpruefungen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerSprachpruefungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerSprachpruefungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerTelefone
BEFORE INSERT
  ON SchuelerTelefone FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerTelefone';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerTelefone;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerTelefone', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerTelefone';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerTelefone
BEFORE UPDATE
  ON SchuelerTelefone FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerTelefone';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerTelefone;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerTelefone', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerTelefone';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerVermerke
BEFORE INSERT
  ON SchuelerVermerke FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerVermerke';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerVermerke;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerVermerke', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerVermerke';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerVermerke
BEFORE UPDATE
  ON SchuelerVermerke FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerVermerke';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerVermerke;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerVermerke', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerVermerke';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerZP10
BEFORE INSERT
  ON SchuelerZP10 FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerZP10';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerZP10;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerZP10', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerZP10';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerZP10
BEFORE UPDATE
  ON SchuelerZP10 FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerZP10';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerZP10;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerZP10', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerZP10';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Schueler_AllgAdr
BEFORE INSERT
  ON Schueler_AllgAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schueler_AllgAdr';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Schueler_AllgAdr;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler_AllgAdr', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler_AllgAdr';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Schueler_AllgAdr
BEFORE UPDATE
  ON Schueler_AllgAdr FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schueler_AllgAdr';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Schueler_AllgAdr;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schueler_AllgAdr', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schueler_AllgAdr';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Benutzer
BEFORE INSERT
  ON Benutzer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Benutzer';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Benutzer;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Benutzer', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Benutzer';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Benutzer
BEFORE UPDATE
  ON Benutzer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Benutzer';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Benutzer;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Benutzer', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Benutzer';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerAnkreuzfloskeln
BEFORE INSERT
  ON SchuelerAnkreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAnkreuzfloskeln';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerAnkreuzfloskeln;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAnkreuzfloskeln', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAnkreuzfloskeln';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerAnkreuzfloskeln
BEFORE UPDATE
  ON SchuelerAnkreuzfloskeln FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerAnkreuzfloskeln';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerAnkreuzfloskeln;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerAnkreuzfloskeln', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerAnkreuzfloskeln';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerFehlstunden
BEFORE INSERT
  ON SchuelerFehlstunden FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerFehlstunden';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerFehlstunden;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFehlstunden', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFehlstunden';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerFehlstunden
BEFORE UPDATE
  ON SchuelerFehlstunden FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerFehlstunden';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerFehlstunden;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerFehlstunden', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerFehlstunden';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerKAoADaten
BEFORE INSERT
  ON SchuelerKAoADaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerKAoADaten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerKAoADaten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerKAoADaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerKAoADaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerKAoADaten
BEFORE UPDATE
  ON SchuelerKAoADaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerKAoADaten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerKAoADaten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerKAoADaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerKAoADaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLD_PSFachBem
BEFORE INSERT
  ON SchuelerLD_PSFachBem FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerLD_PSFachBem';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerLD_PSFachBem;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLD_PSFachBem', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLD_PSFachBem';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLD_PSFachBem
BEFORE UPDATE
  ON SchuelerLD_PSFachBem FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerLD_PSFachBem';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerLD_PSFachBem;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLD_PSFachBem', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLD_PSFachBem';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerLeistungsdaten
BEFORE INSERT
  ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerLeistungsdaten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerLeistungsdaten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLeistungsdaten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLeistungsdaten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerLeistungsdaten
BEFORE UPDATE
  ON SchuelerLeistungsdaten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerLeistungsdaten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerLeistungsdaten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerLeistungsdaten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerLeistungsdaten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerEinzelleistungen
BEFORE INSERT
  ON SchuelerEinzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerEinzelleistungen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerEinzelleistungen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerEinzelleistungen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerEinzelleistungen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerEinzelleistungen
BEFORE UPDATE
  ON SchuelerEinzelleistungen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerEinzelleistungen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerEinzelleistungen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerEinzelleistungen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerEinzelleistungen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_SchuelerWiedervorlage
BEFORE INSERT
  ON SchuelerWiedervorlage FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerWiedervorlage';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM SchuelerWiedervorlage;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerWiedervorlage', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerWiedervorlage';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_SchuelerWiedervorlage
BEFORE UPDATE
  ON SchuelerWiedervorlage FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='SchuelerWiedervorlage';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM SchuelerWiedervorlage;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('SchuelerWiedervorlage', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='SchuelerWiedervorlage';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Schulleitung
BEFORE INSERT
  ON Schulleitung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schulleitung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Schulleitung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schulleitung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schulleitung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Schulleitung
BEFORE UPDATE
  ON Schulleitung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Schulleitung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Schulleitung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Schulleitung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Schulleitung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan
BEFORE INSERT
  ON Stundenplan FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan
BEFORE UPDATE
  ON Stundenplan FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Aufsichtsbereiche
BEFORE INSERT
  ON Stundenplan_Aufsichtsbereiche FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Aufsichtsbereiche';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Aufsichtsbereiche;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Aufsichtsbereiche', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Aufsichtsbereiche';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Aufsichtsbereiche
BEFORE UPDATE
  ON Stundenplan_Aufsichtsbereiche FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Aufsichtsbereiche';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Aufsichtsbereiche;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Aufsichtsbereiche', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Aufsichtsbereiche';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenzeit
BEFORE INSERT
  ON Stundenplan_Pausenzeit FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Pausenzeit';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Pausenzeit;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenzeit', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Pausenzeit';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenzeit
BEFORE UPDATE
  ON Stundenplan_Pausenzeit FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Pausenzeit';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Pausenzeit;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenzeit', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Pausenzeit';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenaufsichten
BEFORE INSERT
  ON Stundenplan_Pausenaufsichten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Pausenaufsichten';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Pausenaufsichten;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenaufsichten', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Pausenaufsichten';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenaufsichten
BEFORE UPDATE
  ON Stundenplan_Pausenaufsichten FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Pausenaufsichten';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Pausenaufsichten;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenaufsichten', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Pausenaufsichten';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_PausenaufsichtenBereich
BEFORE INSERT
  ON Stundenplan_PausenaufsichtenBereich FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_PausenaufsichtenBereich';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_PausenaufsichtenBereich;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_PausenaufsichtenBereich', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_PausenaufsichtenBereich';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_PausenaufsichtenBereich
BEFORE UPDATE
  ON Stundenplan_PausenaufsichtenBereich FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_PausenaufsichtenBereich';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_PausenaufsichtenBereich;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_PausenaufsichtenBereich', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_PausenaufsichtenBereich';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Raeume
BEFORE INSERT
  ON Stundenplan_Raeume FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Raeume';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Raeume;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Raeume', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Raeume';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Raeume
BEFORE UPDATE
  ON Stundenplan_Raeume FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Raeume';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Raeume;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Raeume', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Raeume';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Schienen
BEFORE INSERT
  ON Stundenplan_Schienen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Schienen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Schienen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Schienen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Schienen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Schienen
BEFORE UPDATE
  ON Stundenplan_Schienen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Schienen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Schienen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Schienen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Schienen';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Zeitraster
BEFORE INSERT
  ON Stundenplan_Zeitraster FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Zeitraster';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Zeitraster;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Zeitraster', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Zeitraster';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Zeitraster
BEFORE UPDATE
  ON Stundenplan_Zeitraster FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Zeitraster';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Zeitraster;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Zeitraster', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Zeitraster';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Unterricht
BEFORE INSERT
  ON Stundenplan_Unterricht FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Unterricht';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Unterricht;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Unterricht', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Unterricht';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Unterricht
BEFORE UPDATE
  ON Stundenplan_Unterricht FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Unterricht';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Unterricht;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Unterricht', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Unterricht';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtKlasse
BEFORE INSERT
  ON Stundenplan_UnterrichtKlasse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtKlasse';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtKlasse;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtKlasse', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtKlasse';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtKlasse
BEFORE UPDATE
  ON Stundenplan_UnterrichtKlasse FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtKlasse';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtKlasse;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtKlasse', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtKlasse';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtLehrer
BEFORE INSERT
  ON Stundenplan_UnterrichtLehrer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtLehrer';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtLehrer;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtLehrer', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtLehrer';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtLehrer
BEFORE UPDATE
  ON Stundenplan_UnterrichtLehrer FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtLehrer';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtLehrer;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtLehrer', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtLehrer';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtRaum
BEFORE INSERT
  ON Stundenplan_UnterrichtRaum FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtRaum';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtRaum;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtRaum', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtRaum';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtRaum
BEFORE UPDATE
  ON Stundenplan_UnterrichtRaum FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtRaum';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtRaum;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtRaum', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtRaum';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_UnterrichtSchiene
BEFORE INSERT
  ON Stundenplan_UnterrichtSchiene FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtSchiene';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtSchiene;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtSchiene', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtSchiene';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_UnterrichtSchiene
BEFORE UPDATE
  ON Stundenplan_UnterrichtSchiene FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_UnterrichtSchiene';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_UnterrichtSchiene;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_UnterrichtSchiene', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_UnterrichtSchiene';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Kalenderwochen_Zuordnung
BEFORE INSERT
  ON Stundenplan_Kalenderwochen_Zuordnung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Kalenderwochen_Zuordnung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Kalenderwochen_Zuordnung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Kalenderwochen_Zuordnung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Kalenderwochen_Zuordnung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Kalenderwochen_Zuordnung
BEFORE UPDATE
  ON Stundenplan_Kalenderwochen_Zuordnung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Kalenderwochen_Zuordnung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Kalenderwochen_Zuordnung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Kalenderwochen_Zuordnung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Kalenderwochen_Zuordnung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundenplan_Pausenzeit_Klassenzuordnung
BEFORE INSERT
  ON Stundenplan_Pausenzeit_Klassenzuordnung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Pausenzeit_Klassenzuordnung';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundenplan_Pausenzeit_Klassenzuordnung;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenzeit_Klassenzuordnung', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Pausenzeit_Klassenzuordnung';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundenplan_Pausenzeit_Klassenzuordnung
BEFORE UPDATE
  ON Stundenplan_Pausenzeit_Klassenzuordnung FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundenplan_Pausenzeit_Klassenzuordnung';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundenplan_Pausenzeit_Klassenzuordnung;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundenplan_Pausenzeit_Klassenzuordnung', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundenplan_Pausenzeit_Klassenzuordnung';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel
BEFORE INSERT
  ON Stundentafel FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundentafel';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundentafel;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel
BEFORE UPDATE
  ON Stundentafel FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundentafel';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundentafel;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_Stundentafel_Faecher
BEFORE INSERT
  ON Stundentafel_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundentafel_Faecher';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM Stundentafel_Faecher;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel_Faecher', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel_Faecher';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_Stundentafel_Faecher
BEFORE UPDATE
  ON Stundentafel_Faecher FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='Stundentafel_Faecher';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM Stundentafel_Faecher;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('Stundentafel_Faecher', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='Stundentafel_Faecher';
    END IF;
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_INSERT_ZuordnungReportvorlagen
BEFORE INSERT
  ON ZuordnungReportvorlagen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='ZuordnungReportvorlagen';
  IF tmpID IS NULL THEN
    SELECT max(ID) INTO tmpID FROM ZuordnungReportvorlagen;
    IF tmpID IS NULL THEN
      SET tmpID = 0;
    END IF;
    INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('ZuordnungReportvorlagen', tmpID);
  END IF;
  IF NEW.ID < 0 THEN
    SET NEW.ID = tmpID + 1;
  END IF;
  IF NEW.ID > tmpID THEN
    UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='ZuordnungReportvorlagen';
  END IF;
END

$
delimiter ;


delimiter $
CREATE TRIGGER t_AutoIncrement_UPDATE_ZuordnungReportvorlagen
BEFORE UPDATE
  ON ZuordnungReportvorlagen FOR EACH ROW
BEGIN
  DECLARE tmpID bigint;
  IF (OLD.ID <> NEW.ID) THEN
    SELECT MaxID INTO tmpID FROM Schema_AutoInkremente WHERE NameTabelle='ZuordnungReportvorlagen';
    IF tmpID IS NULL THEN
      SELECT max(ID) INTO tmpID FROM ZuordnungReportvorlagen;
      IF tmpID IS NULL THEN
        SET tmpID = 0;
      END IF;
      INSERT INTO Schema_AutoInkremente(NameTabelle, MaxID) VALUES ('ZuordnungReportvorlagen', tmpID);
    END IF;
    IF NEW.ID < 0 THEN
      SET NEW.ID = tmpID + 1;
    END IF;
    IF NEW.ID > tmpID THEN
      UPDATE Schema_AutoInkremente SET MaxID = NEW.ID WHERE NameTabelle='ZuordnungReportvorlagen';
    END IF;
  END IF;
END

$
delimiter ;



INSERT INTO Schema_Status(Revision) VALUES (5);

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
