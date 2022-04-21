# Download and unzip the file:
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

#Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

png('plot4.png')
ggplot(totalCoal, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
        xlab("Year") +
        ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
        scale_colour_discrete(name = "Type of sources") +
        theme(legend.title = element_text(face = "bold"))
dev.off()