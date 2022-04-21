# Download and unzip the file:
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

#Reading .rds file and assign to NEI, SCC
NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

#Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.
baltimore <- subset(NEI, NEI$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png('plot2.png')
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", 
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), 
     xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"),
     col = "steelblue3")
dev.off()