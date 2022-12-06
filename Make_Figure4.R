###########################################
## Read data files ----
###########################################

#Read pdat
pdat<-read.csv(file="pdat.csv",row.names=1)

#Read popndat
popndat<-read.csv(file="popndat.csv",row.names=1)

##Alternative for reading data files ----
#pdat<-read.table(file="pdat.txt",header=T,dec=".",sep="\t")
#popndat<-read.table(file="popndat.txt",sep="\t",dec=".",header=T)

#Defining the order of the Areas
orderArea<-c("Våmur - Roan","Setesdal Ryfylke","Setesdal Austhei","Skaulen Etnefjell",
             "Brattefjell - Vindeggen","Blefjell",
             "Norefjell - Reinsjøfjell","Fjellheimen",
             "Nordfjella zone 2","Lærdal - Årdal","Vest-Jotunheimen",
             "Sunnfjord","Førdefjella","Svartebotnen",
             "Reinheimen-Breheimen","Snøhetta","Rondane",
             "Sølnkletten","Tolga Østfjell","Forollhogna",
             "Knutshø")

pdat$Area1<-factor(pdat$Area,levels=orderArea)

popndat$Area1<-factor(popndat$Area,levels=orderArea)

library(ggplot2)

##Library for plotting figure in a grid ----
library(gridExtra)

##Defining the color palette ----
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

################################################################################
##Figure 4 - Part1 ----
################################################################################

pv<-ggplot(data=pdat,aes(x=Area1,y=PFree,group=pstar1))+geom_point(aes(colour=pstar1))+
  geom_errorbar(aes(ymin=perc025, ymax=perc975,colour=pstar1), width=.2)+
  scale_colour_manual(values = c("4 animals" = cbbPalette[7], "0.3%" = cbbPalette[3],"0.5%"=cbbPalette[1], "1%"=cbbPalette[2]))

pv+xlab("Wild reindeer management area")+
  ylab("Probability of freedom from CWD 2021") +labs(color="p*") +
  theme(legend.position=c(0.105,0.33),
        legend.key = element_rect(colour = "transparent", fill = "transparent"),
        #legend.background = element_rect(fill = "transparent",colour = "darkgrey")) +
        legend.background = element_rect(fill = "lightgrey",colour = "lightgrey")) +
  coord_flip()

#ggsave("probfreeCWD_wildReindeer_v1.png",device="png",scale=1,height=20,width=16,units="cm",dpi=600)

#When used in grid V2
plot1vB<-pv+xlab("Wild reindeer management area")+
  ylab("Probability of freedom from CWD 2021") +labs(color="p*") +
  theme(#legend.position=c(0.1,0.25),
    legend.position=c(0.15,0.4),
    legend.key = element_rect(colour = "transparent", fill = "transparent"),
    legend.background = element_rect(fill = "lightgrey",colour = "lightgrey"))+
  coord_flip()


###############################################################################
##Figure 4 - Part 2 -----
###############################################################################

p12v2A<-ggplot(data=popndat,aes(x=Area1,y=Variable,fill=Vgroup))+
  geom_bar(position="dodge", stat="identity",width=0.5)+ylab("Number of animals")+
  scale_fill_manual("",values = c("pop_size" = cbbPalette[2], "sum_tested" = cbbPalette[6],sum_RLN="#999999"))+
  scale_y_continuous(breaks = c(100,200,300,400,500, 1000, 1500,2000,2500,3000)
                     , labels = c(100, "","","",500, 1000,"" ,2000,"",3000),
                     limits = c(0,3500))+
  
  
  theme(axis.line=element_blank(),
        axis.text.y=element_blank(),
        axis.title.y=element_blank(),
        panel.grid.minor.x= element_blank(),
        legend.title=element_blank(),
        legend.position=c(0.75,0.42))

p12v2A+coord_flip()

#ggsave("probfreeCWD_popSize_pRLNTest.png",device="png",scale=1,height=20,width=12,units="cm",dpi=600)

plot2v2A<-p12v2A+coord_flip()



##############################################################################
## Figure 4 - Part1 and 2 combined in grid ----
##############################################################################


grid.arrange(plot1vB, plot2v2A, nrow=1, ncol=2,widths=c(3,1.6))


##Save Figure 4 as png file file ----
png("Fig4_probfreeCWD_wildReindeer_900res.png",width = (16+5.5+2), height = 20, units = "cm", pointsize = 12,
    #res=360,
    res=900,
    bg = "white", family = "", restoreConsole = TRUE)

grid.arrange(plot1vB, plot2v2A, nrow=1, ncol=2,widths=c(3,1.6))

dev.off()


##Save Figure 4 as tiff file ----
tiff("Fig4_probfreeCWD_wildReindeer_900res.tif",width = (16+5.5+2), height = 20, units = "cm", pointsize = 12,
     res=900,compression="lzw+p",
     bg = "white", family = "", restoreConsole = TRUE)

grid.arrange(plot1vB, plot2v2A, nrow=1, ncol=2,widths=c(3,1.6))

dev.off()

