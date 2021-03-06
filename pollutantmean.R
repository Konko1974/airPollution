source("generalFunction.R")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## This function download the corresponding csv files from my GitHub repository
  ## in a local directory (if not exist, create it) and use it to calculate mean
  
  classes <- c("Date","numeric","numeric","integer")
  total<-c()
  
  for (fileIndex in id)
  {
    percorsi<-creaPercorsiFile(directory,fileIndex)
    
    urlPath<-percorsi[1]
    pcPath<-percorsi[2]
    
    if (file.exists(pcPath)==FALSE)
    {
      download.file(urlPath,pcPath,quiet=TRUE)
    }
    
    dataFile<-file(pcPath,"r")
    
    pollution<-read.csv(
      dataFile
      ,numerals="allow.loss"
      ,colClasses=classes
    )
    
    sul<-pollution[pollutant]
    bad<-is.na(sul)
    good<-sul[!bad]
    total<-c(total,good)
    close(dataFile)
  }
  
  mean<-mean(total)
  print(mean)
}