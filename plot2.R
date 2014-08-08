# Read and subset the data
df<-read.table("household_power_consumption.txt",colClasses="character",sep=";",header=TRUE)
df$date<-as.Date(df$Date,format="%d/%m/%Y")
mydata<-subset(df,date==as.Date("2007-02-01") | date==as.Date("2007-02-02"))

# Modify the data
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata$Date <- strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S")

# Create the graph
plot(mydata$Date, mydata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" ")   

# Copy the graph to png file
dev.copy(png, file="plot2.png")
dev.off()