plot2<-function(){
  mydf<-read.table(paste(getwd(),"/","household_power_consumption.txt",sep=""),
                   header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE,
                   quote="",comment.char="",
                   colClasses=c("character","character","numeric","numeric",                       
                                "numeric","numeric","numeric","numeric","numeric"))
  mydf$mytime <- strptime(paste(mydf[,1],mydf[,2],sep=" "),"%d/%m/%Y %H:%M:%S")
  mydf[, 1] <- as.Date(mydf[, 1],format="%d/%m/%Y")
  
  
  png(filename ="plot2.png",width = 480, height = 480, bg = "transparent" )
  
  plot(mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,10],
       mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,3],
       xlab= "", ylab = "Global Active Power (kilowatts)",type="l")
  
  dev.off()  
}