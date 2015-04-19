directory<-vector("character",1)
directory<-c("specdata")

directory<-c(directory,"\\","0","0","1.csv")

root<-c("C:\\Users\\Public\\Documents\\gitHub\\airPollution\\")

pollutant<-"sulfate"
id<-1:3

for (fileIndex in seq_along(id))
{
  path<-paste(root,directory,"\\",sep="")
  
  zeri<-vector("character",3-length(fileIndex))
  for (i in seq_along(zeri))
  {
    path<-paste(path,"0",sep="")
  }
  path<-paste(path,as.character(fileIndex),sep="")
  path<-paste(path,".csv",sep="")

  ##print(path)
}

path

classes <- c("Date","numeric","numeric","integer")

dataFile<-file(directory
               ,"r")

pollution<-read.csv(
  dataFile
  ,numerals="allow.loss"
  ,colClasses=classes
  )

sul<-pollution[pollutant]
bad<-is.na(sul)
good<-sul[!bad]
mean(good)
