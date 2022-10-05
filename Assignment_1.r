# An Analytical Detective

### setwd("D:/JITHU/AnalyticsEdge") # Saleem Laptop Path

setwd("D:/AnalyticsEdge") # Personal Laptop Path

getwd()

# Loading data

mvtWeek1 = read.csv("Data/mvtWeek1.csv")

str(mvtWeek1)

summary(mvtWeek1)

# 1. How many rows of data (observations) & columns (Variables) are in this dataset?

nrow(mvtWeek1) 
ncol(mvtWeek1)


# 2. Using the “max” function, what is the maximum value of the variable “ID”?

max(mvtWeek1$ID)

# 3. What is the minimum value of the variable “Beat”?

min(mvtWeek1$Beat)

# 4. How many observations have value TRUE in the Arrest variable (this is the number of crimes for which an arrest was made)?

nrow(subset(mvtWeek1, Arrest == TRUE))

summary(mvtWeek1$Arrest)

# 5. How many observations have a LocationDescription value of ALLEY?

nrow(subset(mvtWeek1, LocationDescription == "ALLEY"))

# 6. In what format are the entries in the variable Date?

mvtWeek1$Date[1]


### Date Convertion
DateConvert = as.Date(strptime(mvtWeek1$Date, "%m/%d/%y %H:%M"))

summary(DateConvert)

# Extracting months and weeks in data

mvtWeek1$months = months(DateConvert)

mvtWeek1$weekdays = weekdays(DateConvert)

mvtWeek1$Date = DateConvert

head(mvtWeek1, 5)

# 7. In which month did the fewest motor vehicle thefts occur?
# similar to value counts
table(mvtWeek1$months)

# 7. In which weekday did the largest motor vehicle thefts occur?
table(mvtWeek1$weekdays)

# 8. Which month has the largest number of motor vehicle thefts for which an arrest was made?

table(mvtWeek1$Arrest, mvtWeek1$months)

### Visulazing crime trends

# 9. In general, does it look like crime increases or decreases from 2002 - 2012?

hist(mvtWeek1$Date, breaks = 100)

#

boxplot(mvtWeek1$Date ~ mvtWeek1$Arrest)

table(mvtWeek1$Year, mvtWeek1$Arrest)

2152/(2152 + 18517)

sort(table(mvtWeek1$LocationDescription))

### Top 5 Locations Observations

Top5 = subset(mvtWeek1, LocationDescription=="STREET" | LocationDescription=="PARKING LOT/GARAGE(NON.RESID.)" | LocationDescription=="ALLEY" | LocationDescription=="GAS STATION" | LocationDescription=="DRIVEWAY - RESIDENTIAL")

TopLocations = c("STREET", "PARKING LOT/GARAGE(NON.RESID.)",  "ALLEY", "GAS STATION", "DRIVEWAY - RESIDENTIAL")

Top5 = subset(mvtWeek1, LocationDescription %in% TopLocations)

Top5


##################################  Stock Dynamics ####################################



IBM = read.csv("Data/IBMStock.csv")
GE = read.csv("Data/GEStock.csv")
ProcterGamble = read.csv("Data/ProcterGambleStock.csv")
CocaCola = read.csv("Data/CocaColaStock.csv")
Boeing = read.csv("Data/BoeingStock.csv")

# Convert dates

IBM$Date = as.Date(IBM$Date, "%m/%d/%y")

GE$Date = as.Date(GE$Date, "%m/%d/%y")

CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")

ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")

Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

# 1. Our five datasets all have the same number of observations. How many observations are there in each data set?

nrow(IBM)
nrow(GE)
nrow(CocaCola)
nrow(ProcterGamble)
nrow(Boeing)

12 * 480


# 2. What is the earliest year in our datasets?

summary(IBM)
summary(GE)
summary(CocaCola)
summary(ProcterGamble)
summary(Boeing)



sd(ProcterGamble$StockPrice)

### Visualizing Stock Dynamics

plot(CocaCola$Date, CocaCola$StockPrice, xlab = "Date", ylab = "StockPrice", main = "Stock Price of Cocacola", type = 'l', col = 'red')


lines(ProcterGamble$Date, ProcterGamble$StockPrice, col = 'blue')

abline(v=as.Date(c("2000-03-01")), lwd=2)


####### 1995 - 2005

plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type = "l", col = "red", ylim = c(0,210), lty = 1)

lines(IBM$Date[301:432], IBM$StockPrice[301:432], col = 'blue', lty = 2)

lines(GE$Date[301:432], GE$StockPrice[301:432], col = 'black', lty = 3)

lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col = 'green', lty = 4)

lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col = 'purple', lty = 5)


abline(v=as.Date(c('1997-09-01')), lwd=2)

abline(v=as.Date(c("1997-11-01")), lwd=2)

