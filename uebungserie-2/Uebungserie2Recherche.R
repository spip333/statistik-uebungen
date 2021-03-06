#############################################################################
### Deskriptive Statistik - �bungserie 2
###
### Nicolas Stern
### 02.11.2018
###
### Kommentar:
#############################################################################


# �bung1 : Bestimmen Sie die H�u???gkeitsverteilung der Wartezeiten aus faithful.
faithful
head(faithful)
faithful$waiting
freq <- table(faithful$waiting)
freq

# Ubung 2 : Welches Intervall der Eruptionsdauer enth�lt die meisten Eruptionen?
y <- data.frame(freq)
head(y)
max(y$Freq)
y[,y$Freq == max[y$Freq]]
y
max(y$Freq)
y[y$Freq == max(y$Freq), c("Var1")]

str(faithful)

x <- faithful[faithful$waiting == 78, c("waiting")]
x
length(x)

attributes(faithful)

head(swiss)
swiss[swiss$Catholic > 50, c("Fertility", "Catholic")]

barplot (faithful$waiting)
pie(faithful$waiting)

# �bung 3 : Bestimmen Sie die H�u???gkeitsverteilung der Eruptionszeiten aus faithful mit der Funktion hist.
# Histogramm demo
x <- c(1,2,2,2,3,4,5,1,5,1,5,6,6,3,2,4)        
y <- table(x)
hist(x)
y.relfreq <-  round(y/sum(y), 3)
y.relfreq
sum(y)
hist(x)
b <- c(0,1,2,3,4,5,6)
hist(x, breaks = b, freq=TRUE, include.lowest = TRUE, main = "Histogramm demo")

hist(faithful$eruptions)

### Aufgabe: Relative H�u???gkeitsverteilung stetiger Daten
# Problem: Bestimmen Sie die relative H�u???gkeitsverteilung der Wartezeiten aus faithful.
# Demo: relative h�ufigkeit: 
x <- c(1,2,2,2,3,4,5,1,5,1,5,6,6,3,2,4)        
y <- table(x)
y.relfreq <-  round(y/sum(y), 3)
y.relfreq
head(faithful$waiting)
waiting <- table(faithful$waiting)
sum(waiting)
waiting.relfreq <-  round(waiting/sum(waiting), 2)

# Aufgabe: Kumulierte H�u???gkeitsverteilung
# Problem: Bestimmen Sie die kumulierte H�u???gkeitsverteilung der Wartezeiten aus faithful.

# recherche
waiting <- faithful$waiting
length(waiting)
cbind(waiting)
max(waiting)
max(faithful$waiting)
min(faithful$waiting)
40:100
x <- c(1,1,1,2,2,3,3,3,4,4,4,4,4,5,5,6,6)
breaks <- seq(0, 10, by = 1)
s.cut <- cut(x, breaks, right=TRUE) 
table(s.cut)

# L�sung
waiting <- faithful$waiting
breaks <- seq(40,100, by=1)
waiting.cut <- cut(waiting, breaks, right=TRUE) 
waiting.freq <- table(waiting.cut)
waiting.cumfreq = cumsum(waiting.freq)
waiting.cumfreq 

### Aufgabe: Kumulierte H�u???gkeitsverteilungskurve
# Problem: Bestimmen Sie die kumulierte H�u???gkeitsverteilungskurve der Wartezeiten aus faithful.
breaks <- seq(43,96, by=1)
plot(breaks, waiting.cumfreq, type="l", main="Wartezeiten des Old Faithful Eruptions", xlab="Wartezeit (Minuten)",ylab="Kumulative H�ufigkeit") 

# Aufgabe: Kumulierte relative H�u???gkeitsverteilung
# Problem: Bestimmen Sie die kumulierte relative H�u???gkeitsverteilung der Wartezeiten aus faithful
# recherche

# L�sung
waiting <- faithful$waiting
breaks <- seq(40,100, by=1)
waiting.cut <- cut(waiting, breaks, right=TRUE) 
waiting.freq <- table(waiting.cut)
waiting.cumfreq = cumsum(waiting.freq / sum(waiting.freq))
waiting.cumfreq 


# L�sung
waiting <- faithful$waiting
breaks <- seq(40,100, by=1)
waiting.cut <- cut(waiting, breaks, right=TRUE) 
waiting.freq <- table(waiting.cut)
waiting.cumfreq = cumsum(waiting.freq / sum(waiting.freq))
waiting.cumfreq 

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
# Daten laden
Daten_Wachstum
head(Daten_Wachstum)
max(Daten_Wachstum$Alter)
min(Daten_Wachstum$Alter)
breaks <- seq(15, 53, by=3)
breaks
hist(Daten_Wachstum$Alter, breaks, include.lowest = TRUE, xaxis)
?hist
