#assumption:data is already downloaded and unzipped into working directory
# read data for the first 2 days of February 2007
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data[data =="?"] <- NA
data2<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data3<-cbind(data2,data)
#create plot
png("plot3.png", height = 480, width = 480, bg = "transparent")
plot(data2, data3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data2, data3$Sub_metering_2, type="l", xlab="", col="red") 
lines(data2, data3$Sub_metering_3, type="l", xlab="", col="blue") 
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
print("finished")