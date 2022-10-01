# Setting Working Directory as  current Working Directory

setwd("D:/JITHU/AnalyticsEdge")

getwd()


# Read USDA Data

USDA = read.csv("Data/USDA_Nutrition_Data.csv")

str(USDA)

summary(USDA)

# COlumn names of data frame

names(USDA)

# Getting max sodium Item Name
USDA$Description[which.max(USDA$Sodium)]

# high Sodium

high_sodium = subset(USDA, USDA$Sodium > 10000)

nrow(high_sodium)

high_sodium$Description

# Text Match - Finding CAVIAR

USDA$Description[match("CAVIAR", USDA$Description)]

USDA$Sodium[match("CAVIAR", USDA$Description)]

# SUmmary of one column

summary(USDA$Sodium)

# Standard Deviation of column

sd(USDA$Sodium)

sd(USDA$Sodium, na.rm = TRUE)


## Creating Plots

plot(USDA$Protein, USDA$TotalFat, xlab = "Protein", ylab = "Fat", main = "Plot of Protein Vs Fat")

# xlim = 0 - 200, breaks = 100

hist(USDA$VitaminC, xlab = "Vitamin C (mg)", main = "Vitamin C - Histogram", xlim = c(0,200), breaks = 100)

boxplot(USDA$Sugar)


# Adding variables 

USDA$Sodium[1] > mean(USDA$Sodium, na.rm = TRUE)

USDA$HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm = TRUE))
USDA$HighProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm = TRUE))
USDA$HighFats = as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm = TRUE))
USDA$HighCarbs = as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm = TRUE))


str(USDA)

# Tables

table(USDA$HighSodium, USDA$HighFats)

## tapply(arg1, arg2, arg3) -> Group arg1 by arg2 and apply arg 3

## Compute avg amt of iron, sorted by high and low protein

tapply(USDA$Iron, USDA$HighProtein, mean, na.rm = TRUE)

 



