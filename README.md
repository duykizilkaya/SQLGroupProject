# SQL Group Project
* German Below
  
## _Purpose of the Project_:

This project aims to design and implement a comprehensive database system for a restaurant. The system includes various 
components such as tables, views, stored procedures, functions, and triggers to manage and maintain the restaurant's data efficiently. 

## _Group Members_:

● Duygu Kizilkaya Dogaroglu
● Stella Birlo
● Stanislaw Paterak
● Julius Stefan Drucker
● Benjamin Oberhof

## _Project Schema and Diagrams_ 

Our restaurant, located at the heart of Berlin, Germany (Longitude: 52.530644, Latitude: 13.383068), operates from 09:00 to 22:00. 
The restaurant includes tables, staff (waiters and cooks), and customers. Below is a detailed explanation of our business logic:

_Business Operations_

* Customer Orders: Customers can order either at a table within the restaurant (Tables 1-4) or for take-out (Table 5).

* Order Details:Each order has attributes like OrderID, OrderNumber, Date, CustomerID, TableID, StaffID, and Status.
An order can consist of multiple order items.

* Order Items: Each order item can include multiple dishes or beverages (identified by DishID).
These items can be ordered in single or multiple quantities (managed by a procedure).

* Inventory and Ingredients: Each dish is made up of ingredients, which must be available in sufficient quantity in the inventory
(Ingredient Stock) to be ordered (checked by a procedure). When a dish is ordered, the order status is set to "being processed" (Status = 0),
and the required ingredients are deducted from the inventory (handled by a procedure). If a dish or beverage is re-ordered, the quantity
in the order item is increased, and the ingredients are further reduced from the inventory.

* Payment and Order Completion: When a customer is ready to pay, the staff changes the order status to "completed" (Status = 1).
* A bill is generated automatically (triggered by a trigger). If the customer is as regular customer, a 5% discount is applied to the total bill.

* Order Cancellation: If an order is canceled, the ingredients are returned to the inventory (managed by a trigger).

* Low Inventory Alerts: If an ingredient falls below the minimum required stock level, a warning is issued (triggered by a trigger),
which serves as a shopping list for restocking.

* Tables: Tables in the restaurant are identified by a TableID. Tables 1-4 are for dine-in orders. Table 5 is used for take-out orders.

* Stock Levels:
Ingredients must be available in sufficient quantity to fulfill orders (monitored by a procedure).
When an ingredient falls below the minimum stock level, a warning is issued (triggered by a trigger).
The owner generates a shopping list each day before opening based on these warnings (trigger).

* Customer Information: Customers must provide either an email address or a phone number.
For take-out orders, the CustomerID is used for identification.

* Inventory Deduction: The quantity of ingredients in the inventory is reduced when the order status is set to completed (Status = 1)
(managed by a trigger).

* Order Item Updates: When the same dishes are ordered again at the table, the quantity in the order item is increased (handled by a procedure).

_Summary of Key Business Processes and SQL Functions_:

* Procedures:

Add a New Order: Handles adding a new order with OrderID, etc.

Add Order Items: Adds order items to an existing order, including the deduction of ingredients from the inventory.

Automatic Backup Creation: Automates the backup process for the database.

* Triggers:

Generate Bill: Automatically generates the bill when the order status is set to "completed" (Status = 1).

Inventory Return on Cancellation: Returns the ingredients to the inventory when an order is canceled (Status = 2).
Low Stock Alert: Issues a warning when an ingredient falls below the minimum stock level, prompting a restock to the maximum level. 
Also triggers a message when new ingredients are added.

* Login and User Roles:

Three additional user roles have been added: Owner: Full access (owner). Waiter: Write and read access (writer/reader).
Cook: Read-only access (reader). 

* Cursor Operations:

Used for adjusting and replenishing the inventory stock levels for ingredients.

_This comprehensive business logic ensures the restaurant operates smoothly, with efficient management of orders, 
inventory, and customer interactions, facilitated by robust SQL procedures and triggers._

![diagram_SQL_Project](https://github.com/duykizilkaya/sql_project/assets/169436713/619598f1-4776-46ac-a73f-35f9c133db08)



# SQL-Gruppe-Projekt 

## _Zweck des Projekts_:

Dieses Projekt, Teil unseres SQL-Bootcamps, zielt darauf ab, ein umfassendes Datenbanksystem für ein Restaurant zu entwerfen und zu implementieren.
Das System umfasst verschiedene Komponenten wie Tabellen, Ansichten, gespeicherte Prozeduren, Funktionen und Trigger, um die Daten des 
Restaurants effizient zu verwalten. 

## Gruppenmitglieder:

● Duygu Kizilkaya Dogaroglu
● Stella Birlo
● Stanislaw Paterak
● Julius Stefan Drucker
● Benjamin Oberhof

## _Projektschema und Diagramme_:

Unser Restaurant, im Herzen von Berlin, Deutschland, gelegen (Längengrad: 52.530644, Breitengrad: 13.383068), 
ist von 09:00 bis 22:00 Uhr geöffnet. Das Restaurant umfasst Tische, Personal (Kellner und Köche) und Kunden. 
Hier folgt eine detaillierte Beschreibung unserer Geschäftslogik:

_Geschäftsoperationen_:

* Kundenbestellungen: Kunden können entweder an einem Tisch im Restaurant bestellen (Tische 1-4) oder zum Mitnehmen (Tisch 5).

* Bestelldetails: Jede Bestellung hat Attribute wie BestellID, Bestellnummer, Datum, KundenID, TischID, MitarbeiterID und Status.
Eine Bestellung kann aus mehreren Bestellpositionen bestehen.

* Bestellpositionen: Jede Bestellposition kann mehrere Gerichte oder Getränke umfassen (identifiziert durch GerichtID).
Diese Positionen können in einfacher oder mehrfacher Menge bestellt werden (verwaltet durch eine Prozedur).

* Lagerbestand und Zutaten: Jedes Gericht besteht aus Zutaten, die in ausreichender Menge im Lager (Zutatenlager)
vorhanden sein müssen, um bestellt werden zu können (überprüft durch eine Prozedur). Wird ein Gericht bestellt, wird der
Bestellstatus auf "in Bearbeitung" (Status = 0) gesetzt, und die benötigten Zutaten werden aus dem Lager abgezogen
(verwaltet durch eine Prozedur). Wenn ein Gericht oder Getränk nachbestellt wird, erhöht sich die Anzahl in der Bestellposition,
und die Zutaten werden weiter aus dem Lagerbestand reduziert.

* Bezahlung und Abschluss der Bestellung: Wenn ein Kunde bereit ist zu bezahlen, ändert das Personal den Bestellstatus
auf "abgeschlossen" (Status = 1). Eine Rechnung wird automatisch generiert (ausgelöst durch einen Trigger).
Wenn der Kunde ein Stammkunde ist, wird ein Rabatt von 5% auf die Gesamtrechnung gewährt.

* Stornierung der Bestellung: Wenn eine Bestellung storniert wird, werden die Zutaten wieder in den Lagerbestand zurückgebucht 
(verwaltet durch einen Trigger). 

* Meldungen bei niedrigem Lagerbestand:Wenn eine Zutat unter das erforderliche Mindestbestand fällt, wird eine Warnung ausgegeben
(ausgelöst durch einen Trigger), die als Einkaufsliste für die Nachbestellung dient.

* Tische: Tische im Restaurant werden durch eine TischID identifiziert. Tische 1-4 sind für Bestellungen im Restaurant vorgesehen.
Tisch 5 wird für Bestellungen zum Mitnehmen verwendet.

* Lagerbestandsverwaltung: Zutaten müssen in ausreichender Menge vorhanden sein, um Bestellungen erfüllen zu können
(überwacht durch eine Prozedur). Wenn eine Zutat unter den Mindestbestand fällt, wird eine Warnung ausgegeben (ausgelöst durch einen Trigger).
Der Inhaber erstellt täglich vor der Eröffnung eine Einkaufsliste basierend auf diesen Warnungen (ausgelöst durch einen Trigger).

* Kundeninformation: Kunden müssen entweder eine E-Mail-Adresse oder eine Telefonnummer angeben. Für Bestellungen zum Mitnehmen wird die
KundenID zur Identifizierung verwendet.

* Abzug aus dem Lagerbestand: Die Menge der Zutaten im Lagerbestand wird reduziert, wenn der Bestellstatus auf "abgeschlossen"
gesetzt wird (Status = 1) (verwaltet durch einen Trigger).

* Aktualisierungen der Bestellpositionen: Wenn die gleichen Gerichte erneut am Tisch bestellt werden, wird die Anzahl in der
Bestellposition erhöht (verwaltet durch eine Prozedur).

_Zusammenfassung der wichtigsten Geschäftsprozesse und SQL-Funktionen_:

* Prozeduren:

Neue Bestellung hinzufügen: Verwaltet das Hinzufügen einer neuen Bestellung mit BestellID usw.

Bestellpositionen hinzufügen: Fügt einer bestehenden Bestellung Bestellpositionen hinzu, einschließlich des Abzugs der Zutaten aus dem Lagerbestand.

Automatische Backup-Erstellung: Automatisiert den Backup-Prozess für die Datenbank.

* Trigger:

Rechnung generieren: Generiert automatisch die Rechnung, wenn der Bestellstatus auf "abgeschlossen" (Status = 1) gesetzt wird.

Rückbuchung bei Stornierung: Bucht die Zutaten zurück in den Lagerbestand, wenn eine Bestellung
storniert wird (Status = 2).

Meldung bei niedrigem Lagerbestand: Gibt eine Warnung aus, wenn eine Zutat unter den Mindestbestand fällt,
und fordert zur Nachfüllung auf die Maximalmenge auf.Triggert auch eine Meldung beim Hinzufügen neuer Zutaten.

* Login und Benutzerrollen:

Drei zusätzliche Benutzerrollen wurden hinzugefügt: Eigentümer: Voller Zugriff (owner). 
Kellner: Schreib- und Leseberechtigung (writer/reader).Koch: Nur Lesezugriff (reader).

* Cursor-Operationen:

Wird verwendet, um die Lagerbestände der Zutaten zu korrigieren und aufzufüllen. 

_Unsere umfassende Geschäftslogik gewährleistet, dass das Restaurant reibungslos funktioniert,  mit effizienter 
Verwaltung von Bestellungen, Lagerbestand und Kundeninteraktionen, unterstützt durch robuste SQL-Prozeduren und Trigger._

![image](https://github.com/duykizilkaya/sql_project/assets/169436713/255f234c-cee6-4907-8572-8fae3ef110b3)



