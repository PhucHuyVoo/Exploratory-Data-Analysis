# Download and unzip the file:
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

#Question 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
#a plot answer this question. library(ggplot2)
baltimore <- subset(NEI, NEI$fips == "24510")
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

png('plot3.png')
ggplot(baltimoreType, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
        ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
        xlab("Year") +
        scale_colour_discrete(name = "Type of sources") +
        theme(legend.title = element_text(face = "bold"))
dev.off()