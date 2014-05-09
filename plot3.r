plot3<-function(){
  mydf<-read.table(paste(getwd(),"/","household_power_consumption.txt",sep=""),
                   header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE,
                   quote="",comment.char="",
                   colClasses=c("character","character","numeric","numeric",                       
                                "numeric","numeric","numeric","numeric","numeric"))
  mydf$mytime <- strptime(paste(mydf[,1],mydf[,2],sep=" "),"%d/%m/%Y %H:%M:%S")
  mydf[, 1] <- as.Date(mydf[, 1],format="%d/%m/%Y")
  
  
  png(filename ="plot3.png",width = 480, height = 480, bg = "transparent" )
  
  plot(mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,10],
       mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,7],
       xlab= "", ylab = "Energy sub metering",type="l")
  lines(mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,10],
       mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,8],
       xlab= "", type="l",col="red")
  lines(mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,10],
       mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,9],
       xlab= "", type="l",col="blue")
  legend("topright",c(colnames(mydf)[7:9]),lty=1,col=c("black","red", "blue"))
  dev.off()  
}