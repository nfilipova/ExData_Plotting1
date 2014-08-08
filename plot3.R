# Read and subset the data
df<-read.table("household_power_consumption.txt",colClasses="character",sep=";",header=TRUE)
df$date<-as.Date(df$Date,format="%d/%m/%Y")
mydata<-subset(df,date==as.Date("2007-02-01") | date==as.Date("2007-02-02"))

# Modify the data
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)
mydata$Date <- strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S")

# Create the graph and png file
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

plot(mydata$Date,mydata$Sub_metering_1,type="l",col="black",xlab=" ",ylab="Energy sub metering")
lines(mydata$Date,mydata$Sub_metering_2,col="red")
lines(mydata$Date,mydata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()