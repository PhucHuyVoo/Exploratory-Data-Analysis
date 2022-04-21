# Download and unzip the file:
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

#Question 5
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

png('plot5.png')
ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
        geom_line(col = "steelblue3") +
        geom_point(col = "steelblue3") +
        ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        xlab("Year") +
        ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))
dev.off()