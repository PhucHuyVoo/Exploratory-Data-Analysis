# Download and unzip the file:
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

#Reading .rds file and assign to NEI, SCC
NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

#ASSIGNMENT QUESTIONS
#Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission from
#all sources for each of the years 1999, 2002, 2005, and 2008.
totalNEI <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
plot(totalNEI$year, totalNEI$Emissions, type = "o", col = "steelblue3", 
     main = expression("Total US "~ PM[2.5]~ "Emissions by Year"),
     ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")
dev.off()