library(readxl)
library(stringr)
library(plyr)
library(tidyr)
library(openxlsx)

input <- read_excel("Vorbereitung_1_zusammenfassung.xls")
reads <- read.csv("report_Reads_per_Fragment.csv")
results <- read.table("Results_bereinigt.txt",header=TRUE)

merge <- merge(input,reads,by="Product",all=TRUE)

merge_total <- merge(merge,results,by="Position",all=TRUE)


merge_total <- merge_total %>% drop_na(WT_Base)
merge_total <- merge_total[order(merge_total$Product),]







for (i in merge_total$Position){
        a <- which(merge_total$Position==i)
        if (merge_total$WT_Base[a] == "A"){
                merge_total$WT_Reads[a] <- merge_total$A[a]
        } else if (merge_total$WT_Base[a] == "C"){
                merge_total$WT_Reads[a] <- merge_total$C[a]
        } else if (merge_total$WT_Base[a] == "G"){
                merge_total$WT_Reads[a] <- merge_total$G[a]
        } else if (merge_total$WT_Base[a] == "T"){
                merge_total$WT_Reads[a] <- merge_total$T[a]
        } else
                merge_total$WT_Reads[a] <- "NA"
} 

for (i in merge_total$Position){
        a <- which(merge_total$Position==i)
        if (merge_total$SNP_Base[a] == "A"){
                merge_total$SNP_Reads[a] <- merge_total$A[a]
        } else if (merge_total$SNP_Base[a] == "C"){
                merge_total$SNP_Reads[a] <- merge_total$C[a]
        } else if (merge_total$SNP_Base[a] == "G"){
                merge_total$SNP_Reads[a] <- merge_total$G[a]
        } else if (merge_total$SNP_Base[a] == "T"){
                merge_total$SNP_Reads[a] <- merge_total$T[a]
        } else
                merge_total$SNP_Reads[a] <- "NA"
} 

for (i in merge_total$Position){
        a <- which(merge_total$Position==i)
        merge_total$`%Stamm`[a] <- merge_total$SNP_Reads[a]/(merge_total$WT_Reads[a]+merge_total$SNP_Reads[a])*100
        rm(a)
}

write.xlsx(merge_total, file="Report_final.xlsx")
