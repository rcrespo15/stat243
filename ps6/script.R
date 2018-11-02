library(readr)
library(parallel)
library(foreach)

df <- data.frame()
t <- system.time({
results <- foreach(i = 0:240)%dopar%{
  directory <- ("/global/scratch/paciorek/wikistats_full/dated_for_R/")
  if (i < 10){
    filename <- paste("part-0000",as.character(i),sep="")
  } else if (i < 100){
    filename <- paste("part-000",as.character(i),sep="")
  } else{
    filename <- paste("part-00",as.character(i),sep="")
  }
  file_name <- paste(directory,filename,sep="")
  data = read_delim(file_name, delim = " ")
  data$barack <- data[4] == "Barack_Obama"
  z <- subset(data, barack == TRUE)
  df <- rbind(df,z)
}
})
save(t,file="time.RData")
save(df,file="data.RData")
