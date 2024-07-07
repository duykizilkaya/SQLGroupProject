-- TEST Skalarwertfunktionen

--Test 1: sf_Anzahl_Gerichte_im_Lager (Parameter GerichtID)
	SELECT dbo.sf_Anzahl_Gerichte_im_Lager(1) 
			-- 1 = Lasagne (Zutaten auf Lager), 
			-- 3 = Pizza Salami (nicht genügend Zutaten (Mehl) auf Lager)

-- Test 2: sf_Berechnung_Entfernung (Parameter KundenID)
	SELECT dbo.sf_Berechnung_Entfernung(11) 
			-- 11 = 1,9 km vom Restaurant entfernt
			-- 15 = 0,64 km vom Restaurant entfernt

-- Test 3: sf_Ist_Stammkunde (Paramer Bestellnummer)
	SELECT dbo.sf_Ist_Stammkunde('1234567894')
			-- '1234567891' = Kein Stammkunde, kein Rabatt auf Rechnung
			-- '1234567892' = Stammkunde, also 5% Rabatt auf Rechnung
			-- '1234567894' = Keine Kunden ID, weil Tischbestellung

-- Test 4: sf__NaechsteBestellnummer() (kein Parameter)
	SELECT dbo.sf_NaechsteBestellnummer()

-- Test 5: sf_RechnungTotalRabatt() (Parameter Bestellnummer)
	SELECT dbo.sf_RechnungTotalRabatt('B000000002')
			-- '1234567891' = Kein Stammkunde, kein Rabatt auf Rechnung
			-- '1234567892' = Stammkunde, also 5% Rabatt auf Rechnung
			-- 'B000000002' = NULL weil nichts bestellt

-- Test 6:	sf_Status_Bestellung (Parameter: BestellungID)
--			-> gibt 1 aus wenn Bestellung in bearbeitung, sonst 0 (abgeschlossen, abgebrochen oder existiert nicht)
	SELECT dbo.sf_Status_Bestellung(1)
			-- 1 = Ausgabe 0 weil existiert nicht
			-- 7 = Ausgabe 0 weil abgeschlossen
			-- 23 = Ausgabe 0 weil abgebrochen
			-- 26 = Ausgabe 1 in Bearbeitung

--- Test 7: sf_Zeitstempel() (kein Parameter)
	SELECT dbo.sf_Zeitstempel()

