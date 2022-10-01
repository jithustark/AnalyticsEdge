# Numeric Calculations

8*6

2^16

# Inbuilt Functions
sqrt(2)

abs(-78)

# Getting help of inbuilt functions
?sqrt

# Creating a variable
as = sqrt(45)

# Printing it
as

# To get list of created variables
ls()


# Vectors & Data Frames

# Vectors are similar to arrays but stores single datatype at a time.
c(2,34,5,6,7,8,9,10)

c

# Creating Vectors and assigning variable to it
Country = c("Brazil", "China", "India", "Swiss", "USA")

LifeExpentency = c(74,76,65,83,79)


# Calling data from vector
Country[1]


LifeExpentency[3]


# Creating a list of vector from 0 to 100 with difference of 2
seq(0,100,2)


# Creating a new data frame
CountryData = data.frame(Country,LifeExpentency)

CountryData

# Adding a new column $ - Used to add new column
CountryData$Population = c(122931, 1213123, 123434, 3545676, 56654)


# Creating new vectors and new DF
Country = c("Russia")

LifeExpentency = c(90)

Population = c(123456)

NewCountryDataFrame = data.frame(Country, LifeExpentency, Population)

# Appending 2 data frames  - rbind() Function 
AllCountryData = rbind(CountryData, NewCountryDataFrame)

AllCountryData



#############################################################################################

# Get current working Directory

getwd()

# Set Working Directory

setwd("D:/JITHU/AnalyticsEdge")

# Load data files

WHO = read.csv("Data/WHO_data.csv")

# To get Structure of the data

str(WHO)

# Summary of data

summary(WHO)

# Creating a subset data

WHO_Europe = subset(WHO, Region == "Europe")

summary(WHO_Europe)

# save to csv

write.csv(WHO_Europe, "Data/WHO_Europe.csv")

# remove variables

# rm(WHO)


############################## Data Analysis ################


# Column in data frame

WHO$Under15

# Mean & SD of the column 

mean(WHO$Under15)

sd(WHO$Under15)

summary(WHO$Under15)

# Get the min data record

which.min(WHO$Under15)

# Get the min & Max data Country Name

WHO$Country[which.min(WHO$Under15)]

WHO$Country[which.max(WHO$Under15)]

# Build a scatter plot

plot(WHO$GNI, WHO$FertilityRate)


# Creating subset with 2 conditions

Outliers = subset(WHO, GNI > 10000 & FertilityRate > 2.5)

# Print No.of rows
nrow(Outliers)

# Print Selected columns
Outliers[c("Country", "GNI", "FertilityRate")]




## Least percentage of population

WHO$Country[which.min(WHO$Over60)]

# Max Literacy rate country

WHO$Country[which.max(WHO$LiteracyRate)]



############################################### Additional Plots ####################################

# Histogram on CellularSubscribers

hist(WHO$CellularSubscribers)

# Box plot with Life expentacy Vs Region

boxplot(WHO$LifeExpectancy ~ WHO$Region)

boxplot(WHO$LifeExpectancy ~ WHO$Region, xlab = "Region", ylab="LifeExpectency", main="Life Expentency of Countries by Region")

# Table - Similar to value counts in python

table(WHO$Region)

# tapply() - Get the country wise over60 - Mean

tapply(WHO$Over60, WHO$Region, mean)

tapply(WHO$LiteracyRate, WHO$Region, min)

# Remove Null Values
tapply(WHO$LiteracyRate, WHO$Region, min, na.rm=TRUE)
