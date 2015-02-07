#assumption:data is already downloaded and unzipped into working directory
# read data for the first 2 days of February 2007
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data[data =="?"] <- NA
data2<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data3<-cbind(data2,data)
#create plot
png("plot2.png", height = 480, width = 480, bg = "transparent")
plot(data2, data3$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
print("finished")