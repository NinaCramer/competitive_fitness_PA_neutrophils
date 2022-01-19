
library(stringr)

Input <- read.table("sequence.txt")
Primer <- read.table("Primer.txt", header=T)
names(Primer) <- c("PCR_Product","links","rechts")
input <- as.character(Input$V1)



report <- data.frame(Product=1:length(Primer$PCR_Product),
                     count_left=0,count_right=0)


#a <- sum(str_count(input, "ATGGACCTGTAGTCGGTGTTCG"))
#b <- which(Primer$Sequence == "TGAACTCGTTGACCTGGCCGC")
#b
#Primer[b,1]
#report[1,1] <- Primer$PCR_Product[b]





### Add Loci to SNP
for(i in Primer$links){
  a <- sum(str_count(input, i))
  b <- which(Primer$links == i)
  report$Product[b] <- as.character(Primer$PCR_Product[b])
  report$count_left[b] <- a
  rm(a)
  rm(b)
}

### Add Loci to SNP
for(i in Primer$rechts){
  a <- sum(str_count(input, i))
  b <- which(Primer$rechts == i)
  report$Product[b] <- as.character(Primer$PCR_Product[b])
  report$count_right[b] <- a
  rm(a)
  rm(b)
}





report$summe <- with(report, count_left+count_right)
write.csv(report,"report_Reads_per_Fragment.csv",row.names = FALSE)
