
#### This is a course project of "4.Exploratory Data Analysis" course on coursera
#### coded by skydome20


#change language from Chinese to English in Winodws OS
    Sys.setlocale("LC_TIME", "English")

#please change dirctory path depend on your data location
    setwd('~/data/s4') 

#download dataset and extract text from .zip 
    filename <- "household_power_consumption.txt"
    if (!file.exists(filename))  {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile = "./Electric power consumption.zip" )
        unzip("Electric power consumption.zip")
    }
    
    
# read subset between "2007-02-01" and "2007-02-02" from whole text file
    data <- subset(read.table(filename, sep=';', header=TRUE, stringsAsFactors=FALSE), 
                   Date=="1/2/2007" | Date=="2/2/2007")
    
#Plot_1
    par(mfrow=c(1,1))
    GAP <- as.numeric(data$Global_active_power)
    hist(x=GAP, col="red", xlab="Global_Active_Power(kilowatts)", ylab="Frequency", main="Global_Active_Power")
    
    dev.copy(png, "plot1.png", width=480, height=480)
    dev.off()

    
    