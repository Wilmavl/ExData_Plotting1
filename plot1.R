#assumption:data is already downloaded and unzipped into working directory
# read data for the first 2 days of February
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data[data =="?"] <- NA
#create histogram 
png("plot1.png", height = 480, width = 480, bg = "transparent")
hist(data$Global_active_power, col = "red",main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
print("finished")