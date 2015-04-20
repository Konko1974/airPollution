source("generalFunction.R")
complete <- function(directory, id = 1:332) {
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
      download.file(urlPath, pcPath, quiet=TRUE)
    }
    
    dataFile<-file(pcPath, "r")
    
    pollution<-read.csv(
      dataFile
      ,numerals="allow.loss"
      ,colClasses=classes
    )

    fileData<-as.matrix(pollution)
    contaCompleti<-0
    i<-1    
    
    while(i<=nrow(fileData))
    {
      riga<-fileData[i,]
      
      if(is.na(riga[2])|is.na(riga[3])) {}
      else {contaCompleti<-contaCompleti+1}
      
      i<-i+1
    }
    
    total<-c(total,contaCompleti)
    
    close(dataFile)
  }
  
  result<-data.frame(id=id,nobs=total)
  print(result)
}