#############################################################################
### Deskriptive Statistik - �bungserie 2
###
### Nicolas Stern
### 02.11.2018
###
### Kommentar:
#############################################################################

### �bung1 : Bestimmen Sie die H�u???gkeitsverteilung der Wartezeiten aus faithful.
freq <- table(faithful$waiting)
print("H�ufigkeitsverteilung der Wartezeiten von Faithful = ")
print(freq)

### Ubung 2 : Welches Intervall der Eruptionsdauer enth�lt die meisten Eruptionen?
# Schritt 1 : Konvertieren die H�ufigkeitstabelle in einer DataFrame um auf den einzelnen Werten zugreifen zu k�nnen
freq.df <- data.frame(freq)
# Schritt 2 : Lese die Spaltennamen aus
colnames(freq.df)
# Schritt 3 : Bestimme den Maximal des Auftretens der Einzelwerten
max.anz <- max(freq.df$Freq)
# Schritt 4: Aus der Dataframe der H�ufigkeiten, w�hle die Werte in der Spalte "Var1" aus, die den Wert aus Schritt 2 haben:
intervall.mit.meistens.eruptionen <- freq.df[freq.df$Freq == max.anz, c("Var1")]
# Schritt 5: Der Wert, der gesucht wird, ist die Anzahl der Auftritte aus Schritt 4
print("Intervall mit der meistens Eruptionen :")
intervall.mit.meistens.eruptionen


### �bung 3 : Bestimmen Sie die H�u???gkeitsverteilung der Eruptionszeiten aus faithful mit der Funktion hist.
###
min <- min(faithful$eruptions)
max <- max(faithful$eruptions)
breaks <- seq(min, max, by=0.1)
hist(faithful$eruptions, breaks = breaks, plot = FALSE)$counts


### Aufgabe: Histogramm
# Problem: Zeichnen Sie das Histogramm der Wartezeiten aus faith
hist(faithful$waiting, xlab = "Wartezeit in Minuten", ylab="H�ufigkeit", main="Wie h�ufig wartet man wie Lange auf einer Eruption des Old Faithful?")

### Aufgabe: Relative H�u???gkeitsverteilung stetiger Daten
# Problem: Bestimmen Sie die relative H�u???gkeitsverteilung der Wartezeiten aus faithful.
waiting.time.table <- table(faithful$waiting)
sum.events <- sum(waiting.time.table)
waiting.time.relfreq <-  round(waiting.time.table/sum.events, 2)
print("relative H�u???gkeitsverteilung der Wartezeiten aus faithful:")
waiting.time.relfreq

# Aufgabe: Kumulierte H�u???gkeitsverteilung
# Problem: Bestimmen Sie die kumulierte H�u???gkeitsverteilung der Wartezeiten aus faithful.
# Schritt 1 : nehme die Werte der Wartezeiten in einem Vektor (Konvenienz)
waiting <- faithful$waiting
# Schritt 2 : bestimme die Faktoren mit der Funktion cut. 
# schritt 2.1 : bestimme die Intervallen
min(waiting)
max(waiting)
breaks <- seq(43,97, by=1)
# schritt 2.2 : Konversion zu einem Faktor
waiting.cut <- cut(waiting, breaks, right=FALSE) 
# Schritt 3 : Bestimme die kumulierte H�ufigkeitsverteilung mit cumsum
waiting.freq <- table(waiting.cut)
waiting.cumfreq <- cumsum(waiting.freq)
print("Kumulierte H�u???gkeitsverteilung der Wartezeiten aus faithful:")
waiting.cumfreq

### Aufgabe: Kumulierte H�u???gkeitsverteilungskurve
# Problem: Bestimmen Sie die kumulierte H�u???gkeitsverteilungskurve der Wartezeiten aus faithful.
breaks <- seq(43,96, by=1)
plot(breaks, waiting.cumfreq, type="l", main="Wartezeiten des Old Faithful Eruptions", xlab="Wartezeit (Minuten)",ylab="Kumulative H�ufigkeit") 

# Aufgabe: Kumulierte relative H�u???gkeitsverteilung
# Problem: Bestimmen Sie die kumulierte relative H�u???gkeitsverteilung der Wartezeiten aus faithful
waiting.cumrelfreq = cumsum(waiting.freq / sum(waiting.freq))
print("Kumulierte relative H�u???gkeitsverteilung der Wartezeiten aus faithful:")
waiting.cumrelfreq 

# Aufgabe: Kumulierte relative H�u???gkeitskurve
# Problem: Bestimmen Sie die kumulierte relative H�u???gkeitsverteilungskurve der Wartezeiten aus faithful.
plot(breaks, waiting.cumrelfreq, type="l", main="kumulierte relative H�u???gkeit der Wartezeiten des Old Faithful", xlab="Wartezeit (Minuten)",ylab="Kumulierte relative H�ufigkeit") 

# Aufgabe: Histogramm
# Problem: Die Datei "Daten_Wachstum.RData" enth�lt die Ergebnisse
# einer Umfrage unter 100 Jungunternehmern. 
# Erstellen Sie ein Histogramm, das die Altersverteilung in der Stichprobe darstellt. 
# Die Klassenbreiten sollen 3 Jahre betragen, 
# das erste Intervall soll bei 15 Jahren beginnen 
# und die rechte Intervallgrenze soll nicht zum Intervall geh�ren
max.alter <- max(Daten_Wachstum$Alter)
breaks <- seq(15, max.alter, by=3)
hist(Daten_Wachstum$Alter, breaks, 
     include.lowest = TRUE, 
     main="Histogramm der Altersverteilung aus Daten_Wachstum", 
     xlab = "Alter (im Jahren)",
     ylab = "Anzahl Personen")

