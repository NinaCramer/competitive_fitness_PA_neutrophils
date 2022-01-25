setwd("D:/Doktorarbeit/Abbildungen/Histogramme")
library(kableExtra)
library(knitr)
library(readxl)
library(xlsx)
library(ggplot2)
library(vegan)
library(tibble)
library(dplyr)
library(reshape2)
library(Hmisc)
library(corrplot)
library(PerformanceAnalytics)
library(polycor)
library(stringr)
library(tidyr)
library(rstatix)
library(nortest)
library(car)
library(data.table)
library(gridExtra)
library(grid)
library(lemon)

Course_A <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=1)

Course_B <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=2)

Course_C <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=3)

Course_D <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=4)

Course_E <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=5)

Course_F <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=6)

Course_G <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=7)

Course_H <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=8)

Course_K <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=9)

Course_L <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=10)

Course_M <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=11)

Course_N <- read.xlsx("Statistik_rel.Werte_alle.xlsx",sheetIndex=12)

all_courses <-rbind(Course_A,Course_B,Course_C,Course_D,Course_E,Course_F,Course_G,Course_H,Course_K,Course_L,Course_M,Course_N)

mild_courses <-rbind(Course_F,Course_G,Course_H,Course_K,Course_L,Course_N)

severe_courses <-rbind(Course_A,Course_B,Course_E,Course_F,Course_G,Course_M)


Linie_A<-ggplot()+ylim(0,7.5) + geom_line(data=Course_A,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("A")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_B<-ggplot()+ylim(0,7.5) + geom_line(data=Course_B,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("B")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_C<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_C,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("C")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_D<-ggplot()+ylim(0,7.5) + geom_line(data=Course_D,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("D")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_E<-ggplot()+ylim(0,7.5) + geom_line(data=Course_E,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("E")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_F<-ggplot()+ylim(0,7.5) + geom_line(data=Course_F,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("F")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_G<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_G,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("G")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_H<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_H,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("H")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_K<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_K,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("K")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_L<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_L,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("L")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_M<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_M,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("M")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_N<-ggplot()+ylim(0,7.5)+ geom_line(data=Course_N,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("N")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 8))+
  scale_x_log10(limits=c(0.1,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

  
#tiff("Linie_alle_einzeln.tiff", height = 2700, width = 1800,res=300)
  grid_arrange_shared_legend(Linie_A,Linie_B,Linie_C,Linie_D,Linie_E,Linie_F,Linie_G,Linie_H,Linie_K,Linie_L,Linie_M,Linie_N,
                             position = c("bottom", "right", "top", "left"),
                             plot = TRUE,
                             ncol = 3,
                             nrow = 4)
  dev.off()
  
tiff("Linie_alle_einzeln_log_mitTitel_engl.tiff", height = 2700, width = 1800,res=300)
  grid_arrange_shared_legend(Linie_A,Linie_B,Linie_C,Linie_D,Linie_E,Linie_F,Linie_G,Linie_H,Linie_K,Linie_L,Linie_M,Linie_N,
    position = c("bottom", "right", "top", "left"),
  plot = TRUE,
  ncol = 3,
  nrow = 4,
  top=textGrob("all courses",gp=gpar(fontsize=18)))
  dev.off()
  
  
  #tiff("Linie_alle_einzeln_order_mildschwer.tiff", height = 2700, width = 1800,res=300)
  grid_arrange_shared_legend(Linie_A,Linie_B,Linie_E,Linie_F,Linie_G,Linie_M,Linie_C,Linie_D,Linie_H,Linie_K,Linie_L,Linie_N,
                             position = c("bottom"),
                             plot = TRUE,
                             ncol = 3,
                             nrow = 4)
                             dev.off()
  
tiff("Linie_alle_einzeln_log_order_mildschwer_mitTitel_engl.tiff", height = 2700, width = 1800,res=300)
grid_arrange_shared_legend(Linie_A,Linie_B,Linie_E,Linie_F,Linie_G,Linie_M,Linie_C,Linie_D,Linie_H,Linie_K,Linie_L,Linie_N,
                           position = c("bottom"),
                           plot = TRUE,
                           ncol = 3,
                           nrow = 4,
                           top=textGrob("all courses",gp=gpar(fontsize=18)))
  dev.off()
  
#tiff("Linie_schwer_einzeln.tiff", height = 2700, width = 1800,res=300)
grid_arrange_shared_legend(Linie_A,Linie_B,Linie_E,Linie_F,Linie_G,Linie_M,
position = c("bottom"),
plot = TRUE,
ncol = 2,
nrow = 3)
dev.off()

#tiff("Linie_schwer_einzeln_mitTitel.tiff", height = 2700, width = 1800,res=300)
grid_arrange_shared_legend(Linie_A,Linie_B,Linie_E,Linie_F,Linie_G,Linie_M,
                           position = c("bottom"),
                           plot = TRUE,
                           ncol = 2,
                           nrow = 3,
                           top=textGrob("schwere Verläufe",gp=gpar(fontsize=18)))
dev.off()
  
#tiff("Linie_mild_einzeln_mitTitel.tiff", height = 2700, width = 1800,res=300)
grid_arrange_shared_legend(Linie_C,Linie_D,Linie_H,Linie_K,Linie_L,Linie_N,
position = c("bottom"),
plot = TRUE,
ncol = 2,
nrow = 3,
top=textGrob("milde Verläufe",gp=gpar(fontsize=18)))
dev.off()
#tiff("Linie_mild_einzeln.tiff", height = 2700, width = 1800,res=300)
grid_arrange_shared_legend(Linie_C,Linie_D,Linie_H,Linie_K,Linie_L,Linie_N,
                           position = c("bottom"),
                           plot = TRUE,
                           ncol = 2,
                           nrow = 3)
                           dev.off()


Course_alle<-rbind(Course_A,Course_B, Course_C,Course_D,Course_E,Course_F,Course_G,Course_H,Course_K,Course_L,Course_M,Course_N)

Course_mild<-rbind(Course_C,Course_D,Course_H,Course_K,Course_L,Course_N)

Course_schwer<-rbind(Course_A,Course_B,Course_E,Course_F,Course_G,Course_M)

tiff("Linie_alle_Verläufe_log_engl.tiff", height = 2700, width = 2500,res=300)
Linie_alle<-ggplot()+ylim(0,3.2)+ geom_line(data=Course_alle,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("all courses")+ 
  theme_bw()+
  scale_x_log10(limits=c(0.01,10))+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_alle
dev.off()


#tiff("Linie_mild_Verläufekomb_log.tiff", height = 2700, width = 2500,res=300)
Linie_mild<-ggplot()+ylim(0,3.2) + geom_line(data=Course_mild,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("mild courses")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_mild
dev.off()

#tiff("Linie_schwer_Verläufekomb_log.tiff", height = 2700, width = 2500,res=300)
Linie_schwer<-ggplot()+ylim(0,3.2) + geom_line(data=Course_schwer,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("severe courses")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_schwer
dev.off()

tiff("Linie_alle+mild+schwer_komb_log_engl.tiff",height=2700, width=5000,res=300)
grid_arrange_shared_legend(Linie_alle,Linie_mild,Linie_schwer,
                           nrow = 1,ncol = 3,
                           plot=TRUE,
                           position = c("bottom"))
dev.off()

früh_A<-filter(Course_A,Infektionsphase=="frA??h",.preserve=FALSE)
früh_B<-filter(Course_B,Infektionsphase=="frA??h",.preserve=FALSE)
früh_C<-filter(Course_C,Infektionsphase=="frA??h",.preserve=FALSE)
früh_D<-filter(Course_D,Infektionsphase=="frA??h",.preserve=FALSE)
früh_E<-filter(Course_E,Infektionsphase=="frA??h",.preserve=FALSE)
früh_F<-filter(Course_F,Infektionsphase=="frA??h",.preserve=FALSE)
früh_G<-filter(Course_G,Infektionsphase=="frA??h",.preserve=FALSE)
früh_H<-filter(Course_H,Infektionsphase=="frA??h",.preserve=FALSE)
früh_K<-filter(Course_K,Infektionsphase=="frA??h",.preserve=FALSE)
früh_L<-filter(Course_L,Infektionsphase=="frA??h",.preserve=FALSE)
früh_M<-filter(Course_M,Infektionsphase=="frA??h",.preserve=FALSE)
früh_N<-filter(Course_N,Infektionsphase=="frA??h",.preserve=FALSE)

mittel_A<-filter(Course_A,Infektionsphase=="mittel",.preserve=FALSE)
mittel_B<-filter(Course_B,Infektionsphase=="mittel",.preserve=FALSE)
mittel_C<-filter(Course_C,Infektionsphase=="mittel",.preserve=FALSE)
mittel_D<-filter(Course_D,Infektionsphase=="mittel",.preserve=FALSE)
mittel_E<-filter(Course_E,Infektionsphase=="mittel",.preserve=FALSE)
mittel_F<-filter(Course_F,Infektionsphase=="mittel",.preserve=FALSE)
mittel_G<-filter(Course_G,Infektionsphase=="mittel",.preserve=FALSE)
mittel_H<-filter(Course_H,Infektionsphase=="mittel",.preserve=FALSE)
mittel_K<-filter(Course_K,Infektionsphase=="mittel",.preserve=FALSE)
mittel_L<-filter(Course_L,Infektionsphase=="mittel",.preserve=FALSE)
mittel_M<-filter(Course_M,Infektionsphase=="mittel",.preserve=FALSE)
mittel_N<-filter(Course_N,Infektionsphase=="mittel",.preserve=FALSE)

spät_A<-filter(Course_A,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_B<-filter(Course_B,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_C<-filter(Course_C,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_D<-filter(Course_D,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_E<-filter(Course_E,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_F<-filter(Course_F,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_G<-filter(Course_G,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_H<-filter(Course_H,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_K<-filter(Course_K,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_L<-filter(Course_L,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_M<-filter(Course_M,Infektionsphase=="spA¤t",.preserve=FALSE)
spät_N<-filter(Course_N,Infektionsphase=="spA¤t",.preserve=FALSE)

früh_alle<-filter(Course_alle,Infektionsphase=="frA??h",.preserve=FALSE)
mittel_alle<-filter(Course_alle,Infektionsphase=="mittel",.preserve=FALSE)
spät_alle<-filter(Course_alle,Infektionsphase=="spA¤t",.preserve=FALSE)

Linie_früh_alle<-ggplot()+ylim(0,4.3) + geom_line(data=früh_alle,aes(x=Wert,colour=Zeitwert),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("early isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

Linie_mittel_alle<-ggplot()+ylim(0,4.3) + geom_line(data=mittel_alle,aes(x=Wert,colour=Zeitwert, size=0.7),stat="density")+ xlab("relative change")+ylab("density")+ggtitle("middle isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_spät_alle<-ggplot()+ylim(0,4.3) + geom_line(data=spät_alle,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("late isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

tiff("Linie_alle_log_früh_mittel_spät_engl.tiff",height=3000, width=5000,res=300)
grid_arrange_shared_legend(Linie_früh_alle,Linie_mittel_alle,Linie_spät_alle,
                           nrow = 1,ncol = 3,
                           plot=TRUE,
                           position = c("bottom"),
                           top=textGrob("all courses",gp=gpar(fontsize=20)))
dev.off()

früh_mild<-filter(Course_mild,Infektionsphase=="frA??h",.preserve=FALSE)
mittel_mild<-filter(Course_mild,Infektionsphase=="mittel",.preserve=FALSE)
spät_mild<-filter(Course_mild,Infektionsphase=="spA¤t",.preserve=FALSE)

Linie_früh_mild<-ggplot()+ylim(0,4.3) + geom_line(data=früh_mild,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("early isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10)) +labs(fill = "timepoint")+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

Linie_mittel_mild<-ggplot()+ylim(0,4.3) + geom_line(data=mittel_mild,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("middle isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10))+labs(fill = "timepoint")+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
Linie_spät_mild<-ggplot()+ylim(0,4.3) + geom_line(data=spät_mild,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("late isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

tiff("Linie_mild_log_früh_mittel_spät_engl.tiff",height=3000, width=5000,res=300)
grid_arrange_shared_legend(Linie_früh_mild,Linie_mittel_mild,Linie_spät_mild,
                           nrow = 1,ncol = 3,
                           plot=TRUE,
                           position = c("bottom"),
                           top=textGrob("mild courses",gp=gpar(fontsize=20)))
dev.off()

früh_schwer<-filter(Course_schwer,Infektionsphase=="frA??h",.preserve=FALSE)
mittel_schwer<-filter(Course_schwer,Infektionsphase=="mittel",.preserve=FALSE)
spät_schwer<-filter(Course_schwer,Infektionsphase=="spA¤t",.preserve=FALSE)

Linie_früh_schwer<-ggplot()+ylim(0,4.3)+ geom_line(data=früh_schwer,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("early isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+ 
  scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

Linie_mittel_schwer<-ggplot()+ylim(0,4.3)+ geom_line(data=mittel_schwer,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("middle isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))

Linie_spät_schwer<-ggplot()+ylim(0,4.3) + geom_line(data=spät_schwer,aes(x=Wert,colour=Zeitwert),stat="density", size=0.7)+ xlab("relative change")+ylab("density")+ggtitle("late isolates")+ 
  theme_bw()+
  theme(legend.text=element_text(size = 12))+
  theme(axis.title = element_text(size=14))+
  theme(plot.title = element_text(size=18))+
  theme(legend.title = element_blank())+
  scale_x_log10(limits=c(0.01,10))+
  scale_colour_manual(breaks = c("30s_intra", "30m_intra", "60m_intra","30s_extra","30m_extra","60m_extra"),
                      labels=c("30 s intracellular", "30 min intracellular", "60 min intracellular","30 s extracellular","30 min extracellular","60 min extracellular"),
                      values = c("darkgoldenrod1","orange2","brown4","slategray1","steelblue2","dodgerblue4"))
  
tiff("Linie_schwer_log_früh_mittel_spät_engl.tiff",height=3000, width=5500,res=300)
grid_arrange_shared_legend(Linie_früh_schwer,Linie_mittel_schwer,Linie_spät_schwer,
                           nrow = 1,ncol = 3,
                           plot=TRUE,
                           position = c("bottom"),
                           top=textGrob("severe courses",gp=gpar(fontsize=20)))
dev.off()

legend.title = element_blank()