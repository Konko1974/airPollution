creaPercorsiFile<-function (directory, id)
{
  pcRoot<-c("C:\\")
  pcConnectionSep<-"\\"
  
  urlRoot<-c("https://raw.githubusercontent.com/Konko1974/airPollution/master/")
  urlConnectionSep<-"/"

  fileIndex<-id
  
  pcPath<-paste(pcRoot,directory,pcConnectionSep,sep="")
  if (file.exists(pcPath)==FALSE)
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

  r<-c(urlPath,pcPath)
}

ris<-creaPercorsiFile("specdata",1)
print(ris)