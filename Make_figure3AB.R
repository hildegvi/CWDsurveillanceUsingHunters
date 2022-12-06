
library(ggplot2)

##Read data file ----
ddF<-read.csv(file="sumdat_harvest_tested_locyear.csv",row.names=1)

##Alternative for reading data file ----
#ddF<-read.table(file="sumdat_harvest_tested_locyear.txt",sep="\t",dec=".",header=T)

##Specify order of group levels ----
ddF$group<-factor(dd2$group,levels=c("Hardangervidda","Nordfjella zone 2","Forollhogna","Knutshø","Reinheimen-Breheimen", "Rondane",
                                       "Setesdal Ryfylke","Setesdal Austhei","Snøhetta","Other"))

##Define the color palette ----
cbbPalette <- c("#000000","#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
values=c("#CC6666", "#9999CC", "#66CC99")


##Fig 3A ----
ggplot(data = ddF,aes(x = year, y = ptested, group = group)) +
  geom_point(aes(colour=group),size=2) +
  geom_point(data=subset(dd2,(dd2$group %in% c("Hardangervidda","Nordfjella zone 2"))),aes(colour=group),size=2) +
  geom_line(data=subset(dd2,!(dd2$group %in% c("Other"))),aes(colour=GroupL),size=1)+
  geom_line(data=subset(dd2,(dd2$group %in% c("Hardangervidda","Nordfjella zone 2"))),aes(colour=group),size=2)+
  labs(x="Year",y=("Proportion tested")) +
  theme_linedraw( )+
  theme(panel.grid.major=element_blank())+
  theme(panel.grid.minor=element_blank()) +
  theme(legend.justification = c(0.9, 0))+
  theme(legend.position      = c(0.9, 0.001))+
  theme(legend.text          = element_text(size = 8))+
  theme(legend.title = element_blank())+
  scale_colour_manual(values = c("Hardangervidda" = cbbPalette[6], "Nordfjella zone 2" = cbbPalette[7],
                                 "Forollhogna"= cbbPalette[2],
                                 "Knutshø"= cbbPalette[3],
                                 "Reinheimen-Breheimen"= cbbPalette[4],
                                 "Rondane"= cbbPalette[5],
                                 "Setesdal Ryfylke"= cbbPalette[8],
                                 "Setesdal Austhei"= "#9999CC",#"#CC6666",
                                 "Snøhetta"= "#999999",
                                 "Other"="#000000"))+
  scale_size_manual(values=c("Hardangervidda" = 2, "Nordfjella zone 2" = 2,
                             "Forollhogna"= 1,
                             "Knutshø"= 1,
                             "Reinheimen-Breheimen"= 1,
                             "Rondane"= 1,
                             "Setesdal Ryfylke"= 1,
                             "Setesdal Austhei"= 1,
                             "Snøhetta"= 1,
                             "Other"=1),guide=guide_legend(override.aes=))+
  guides(color = guide_legend(override.aes = list(size = c(2,2, 1,1,1,1,1,1,1,1.6),linetype = c(1,1, 1,1,1,1,1,1,1,0))))


##Save figure as png file ----
ggsave("Fig3A_pTested21.png",device="png",scale=1,height=14.3,width=14,units="cm",dpi=600)

##Save figure as tiff file ----
##ggsave("Fig3A_pTested21.tif",device="tiff",scale=1,height=14.3,width=14,units="cm",dpi=600,compression="lzw+p")

##Remove rows with NA for pRLN ----
ddF1<-ddF[!is.na(ddF$pRLN),]

##Fig 3B ----
ggplot(data = ddF1,aes(x = year, y = pRLN, group = group)) +
  geom_point(aes(colour=group),size=1.6) +
  geom_point(data=subset(ddF1,(ddF1$group %in% c("Hardangervidda","Nordfjella zone 2"))),aes(colour=group),size=2) +
  
  geom_line(data=subset(ddF1,!(ddF1$group %in% c("Other"))),aes(colour=group),size=1)+
  geom_line(data=subset(ddF1,(ddF1$group %in% c("Hardangervidda","Nordfjella zone 2"))),aes(colour=group),size=2)+
  
  
  scale_colour_manual(values = c("Hardangervidda" = cbbPalette[6], "Nordfjella zone 2" = cbbPalette[7],
                                 "Forollhogna"= cbbPalette[2],
                                 "Knutshø"= cbbPalette[3],
                                 "Reinheimen-Breheimen"= cbbPalette[4],
                                 "Rondane"= cbbPalette[5],
                                 "Setesdal Ryfylke"= cbbPalette[8],
                                 "Setesdal Austhei"= "#9999CC",#"#CC6666",
                                 "Snøhetta"= "#999999",
                                 "Other"="#000000"))+
  scale_size_manual(values=c("Hardangervidda" = 2, "Nordfjella zone 2" = 2,
                             "Forollhogna"= 1,
                             "Knutshø"= 1,
                             "Reinheimen-Breheimen"= 1,
                             "Rondane"= 1,
                             "Setesdal Ryfylke"= 1,
                             "Setesdal Austhei"= 1,
                             "Snøhetta"= 1,
                             "Other"=1),guide=guide_legend(override.aes=))+
  guides(color = guide_legend(override.aes = list(size = c(2,2, 1,1,1,1,1,1,1,1.6),linetype = c(1,1, 1,1,1,1,1,1,1,0))))+
  labs(x="Year",y=("Proportion of samples including RLN")) +
  theme_linedraw( )+
  theme(panel.grid.major=element_blank())+
  theme(panel.grid.minor=element_blank()) +
  theme(legend.justification = c(0.9, 0))+
  theme(legend.position      = c(0.9, 0.001))+
  theme(legend.text          = element_text(size = 8))+
  theme(legend.title = element_blank()) 

##Save figure as png file ----
ggsave("Fig3B_pRLN21.png",device="png",scale=1,height=14.3,width=14,units="cm",dpi=600)

##Save figure as tif file ----
##ggsave("Fig3B_pRLN21.tif",device="tiff",scale=1,height=14.3,width=14,units="cm",dpi=600,compression="lzw+p")


