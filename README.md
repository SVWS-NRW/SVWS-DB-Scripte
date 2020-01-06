# Schild-NRW-DB-Scripte

Datenbank Schema für verschiedene DBMS sowie alle Hilfstabellen.

Diese Datenbanscripte können verwendet werden, eine neue Schild-NRW-Datenbank anzulegen.

Die Unterordner stellen die verschiednen Revisionen der Scripte dar.
Der Ordner "current" stellt den augenblicklichen Entwicklungsstand für Schild3.0 dar.

Die Revision 3 ist der letzte kompatible Stand für Schild-NRW-2.0 !
Für aktuelle Schild-NRW-2.0-Installationen also bitte die Revision 3 verwenden.


Revision -1
Dummy Revision, welche anzeigt dass keine Revision definiert ist -
z.B., um zu kennzeichnen, dass ein Datensatz noch nicht veraltet ist.

Revision 0
Erste Version der SVWS-Datenbank. Das Schema wurde von der letzten
Schild-NRW Version 2.x übernommen.

Revision 1
Hinzufügen der Tabelle SchildKursSchueler (Erstellen der Tabelle) für
den schnellen Zugriff auf die Schüler-Zuordnung zu Kursen.

Revision 2
Erstellen der Trigger zur automatischen Aktualisierung der Tabelle
SchildKursSchueler bei Änderung der Leistungsdaten eines Schülers.
Außerdem wird die Tabelle mit den Daten aus den Leistungsdaten eines
Schülers initial befüllt.

Revision 3
Befüllen der Foreign-Keys auf die Tabelle K_Ort in den Tabellen
K_AllgAdresse, K_Lehrer, Schueler, SchuelerErzAdr.

Revision 4
Hinzufügen der Kurs42-Tabellen für die Arbeit mit Kurs42-4.0.

Revision 5
NUES-Tabellen wurden entfernt (veraltet).

Revision 6 
LuPO-Tabellen für die interne Verwaltung hinzugefügt.

Revision 7
Tabellen für Stundenpläne mit Unterrichts- und Pausenzeiten.
