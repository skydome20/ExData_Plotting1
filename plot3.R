
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

#Plot_3
    par(mfrow=c(1,1))
    
    chr_time <- paste(data$Date,data$Time, sep=" ")
    time <- strptime(chr_time, "%d/%m/%Y %H:%M:%S")
    
    ESM_1 <-  as.numeric(data$Sub_metering_1)
    ESM_2 <-  as.numeric(data$Sub_metering_2)
    ESM_3 <-  as.numeric(data$Sub_metering_3)
    
    
    plot(x=time, y=ESM_1, ylab="Energy_sub_metering", type="l")
    lines(time, ESM_2, col="red")
    lines(time, ESM_3, col="blue")
    
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=c(1,1,1), col=c("black","red","blue"),cex=0.65)
    
    
    dev.copy(png, "plot3.png", width=480, height=480)
    dev.off()
