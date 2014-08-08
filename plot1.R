# Read and subset the data
df<-read.table("household_power_consumption.txt",colClasses="character",sep=";",header=TRUE)
df$date<-as.Date(df$Date,format="%d/%m/%Y")
mydata<-subset(df,date==as.Date("2007-02-01") | date==as.Date("2007-02-02"))

# Modify the data
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)

# Create the graph
hist(mydata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",cex.lab=0.80)

# Copy the graph to png file
dev.copy(png, file="plot1.png")
dev.off()