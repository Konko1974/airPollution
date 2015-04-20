source("generalFunction.R")
corr <- function(directory, threshold = 0)
{
  classes <- c("Date","numeric","numeric","integer")
  total<-c()

  fileIndex<-1
  
  while (fileIndex<=332)
  {
    sulfate<-c()
    nitrate<-c()
    contaCompleti<-0
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
    i<-1    
    
    while(i<=nrow(fileData))
    {
      riga<-fileData[i,]
      
      if((is.na(riga[2])|is.na(riga[3])) == FALSE)
      {
        contaCompleti<-contaCompleti+1
        sulfate<-c(sulfate,as.numeric(riga[2]))
        nitrate<-c(nitrate,as.numeric(riga[3]))
      }
      
      i<-i+1
    }
    
    if(contaCompleti>threshold)
    {
      correlation<-cor(sulfate,nitrate)
      total<-c(total,correlation)
    }
    
    close(dataFile)

    fileIndex<-fileIndex+1
  }
  
  return(total)
}