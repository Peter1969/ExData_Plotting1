plot1<-function(){
  mydf<-read.table(paste(getwd(),"/","household_power_consumption.txt",sep=""),
                   header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE,
                   quote="",comment.char="",
                   colClasses=c("character","character","numeric","numeric",                       
                                "numeric","numeric","numeric","numeric","numeric"))
  mydf[, 1] <- as.Date(mydf[, 1],format="%d/%m/%Y")
  
  png(filename ="plot1.png",width = 480, height = 480, bg = "transparent" )
  
  hist( mydf[mydf$Date>=as.Date('2007-02-01') & mydf$Date<=as.Date('2007-02-02') ,3],
        main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)")
  
  dev.off()
  
}