-- TEST Tabellenwertfunktion

-- Test 1: tf_Lager_menge (Parameter: BestellungID)
	SELECT * FROM dbo.tf_Lager_menge(7) 

-- Test 2: tf_Zutaten_benoetigte (Parameter: BestellungID)
	SELECT * FROM dbo.tf_Zutaten_benoetigte(7)

-- Test 3: tf_Abzug_Lagermenge_benoetigte_Zutaten_pro_Bestellung (Parameter: BestellungID)
	SELECT * FROM dbo.tf_Abzug_Lagermenge_benoetigte_Zutaten_pro_Bestellung(7)

-- Test 4: tf_Rechnung_erstellen (Parameter: Bestellnummer)
	--ohne Stammkundenrabatt
	SELECT * FROM dbo.tf_Rechnung_erstellen('1234567891') 

	-- mit Stammkundenrabatt 5%
	SELECT * FROM dbo.tf_Rechnung_erstellen('1234567892') 
