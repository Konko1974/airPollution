directory<-vector("character",1)
directory<-c("specdata")

pollutant<-"sulfate"
id<-1:10

pcRoot<-c("C:\\")
pcConnectionSep<-"\\"

urlRoot<-c("https://raw.githubusercontent.com/Konko1974/airPollution/master/")
urlConnectionSep<-"/"

classes <- c("Date","numeric","numeric","integer")
total<-c()

for (fileIndex in seq_along(id))
{
  pcPath<-paste(pcRoot,directory,pcConnectionSep,sep="")
  if (file.exists(pcPath) == FALSE)
  {
    dir.create(pcPath)
  }
  
  urlPath<-paste(urlRoot,directory,urlConnectionSep,sep="")
  
  if (fileIndex<10)
  {
    pcPath<-paste(pcPath,"00",sep="")
    urlPath<-paste(urlPath,"00",sep="")
  }
  else
  {
    if (fileIndex<100)
    {
      pcPath<-paste(pcPath,"0",sep="")
      urlPath<-paste(urlPath,"0",sep="")
    }
  }
  
  pcPath<-paste(pcPath,as.character(fileIndex),sep="")
  pcPath<-paste(pcPath,".csv",sep="")
  
  urlPath<-paste(urlPath,as.character(fileIndex),sep="")
  urlPath<-paste(urlPath,".csv",sep="")
  
  download.file(urlPath,pcPath)
  dataFile<-file(pcPath,"r")
  
  pollution<-read.csv(
    dataFile
    ,numerals="allow.loss"
    ,colClasses=classes
  )

  ##sul<-pollution[pollutant]
  ##bad<-is.na(sul)
  ##good<-sul[!bad]
  ##total<-c(total,good)
  
  close(dataFile)
}

mean<-mean(total)
print(mean)

