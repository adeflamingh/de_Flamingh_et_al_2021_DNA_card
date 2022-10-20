##original code based off of Yao, Lu, et al. "Population genetics of wild Macaca fascicularis with low‐coverage shotgun sequencing of museum specimens." American journal of physical anthropology 173.1 (2020): 21-33.
##see https://github.com/kelsey-witt/macaque-lowcvg-pipeline
setwd("enter/appropriate/path")
populations <- c("Fecal_card", "Kenya", "Kruger", "Mozambique")
library(ggplot2)
library(zoom)

cov = as.matrix(read.table("pca_27_all.cov"))
cov = data.frame(cov)
pop = read.table("Sample_info2.txt") #tab-separated file, each row is an individual, can be as simple as 1 column for individual ID, 1 column for population
View(pop)

eig = eigen(cov)
vals = eig$values
View(vals)
Per_vals = vals*1/75 #This gives you the percentage each PC contributes to total variation - you can use this for your x/y axis
pc1_2_3 <- data.frame(eig$vectors[,1:3]) #Pulls first 3 PCs
#View(pop[,3])
pc1_2_3$pop = pop[,3]
pc1_2_3$ind = pop[,2]
pc1_2_3$tusk = pop[,4]
pc1_2_3$het = pop[,5]
pc1_2_3$depth = pop[,6]


pc1_2_3$pop <-factor(pc1_2_3$pop, levels = populations)
View(pc1_2_3)
View(Per_vals)


#plotting the first and second PC
p12<-ggplot(pc1_2_3, aes(x=X1,y=X2,color=pop, shape=pop))+
  geom_point(size=4)+ #change this size for point size
  xlab("PC1 (2.8%)") + ylab("PC2 (1.78%)")+
  geom_text(aes(label=depth),hjust=1, vjust=2, size=3)+
  scale_colour_manual(name="Group/Country (n=27)", values=c("black", rep("green",1), rep("brown4",1), rep("blue",1), rep("darkgoldenrod",1))) +
  scale_shape_manual(name="Group/Country (n=27)", values=c(15,0,2,3,4))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),legend.key=element_blank(),panel.grid.minor=element_blank(),panel.grid.major=element_blank(),panel.background=element_rect(fill="white"),panel.border=element_blank(),axis.line = element_line(colour = 'black', size = 0.5),axis.ticks=element_line(colour = 'black', size = 0.5),axis.title=element_text(size=14, color="black"),axis.text=element_text(size=12, color="black"))
p12 #draw the plot 

#zoom in on area with interest
p12+coord_cartesian(ylim=c(-0.1,0.2), xlim = c(-0.43, 0.05))

p23<-ggplot(pc1_2_3, aes(x=X2,y=X3,color=pop, shape=pop))+
  geom_point(size=4)+ #change this size for point size
  xlab("PC2 (1.78%)") + ylab("PC3 (1.67%)")+
  #geom_text(aes(label=ind),hjust=1, vjust=2, size=3)+
  scale_colour_manual(name="Group/Country (n=27)", values=c("black", rep("green",1), rep("brown4",1), rep("blue",1), rep("darkgoldenrod",1))) +
  scale_shape_manual(name="Group/Country (n=27)", values=c(15,0,2,3,4))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),legend.key=element_blank(),panel.grid.minor=element_blank(),panel.grid.major=element_blank(),panel.background=element_rect(fill="white"),panel.border=element_blank(),axis.line = element_line(colour = 'black', size = 0.5),axis.ticks=element_line(colour = 'black', size = 0.5),axis.title=element_text(size=14, color="black"),axis.text=element_text(size=12, color="black"))
p23 #draw the plot 

p13<-ggplot(pc1_2_3, aes(x=X1,y=X3,color=pop, shape=pop))+
  geom_point(size=4)+ #change this size for point size
  xlab("PC1 (2.80%)") + ylab("PC3 (1.67%)")+
  #geom_text(aes(label=ind),hjust=1, vjust=2, size=3)+
  scale_colour_manual(name="Group/Country (n=27)", values=c("black", rep("green",1), rep("brown4",1), rep("blue",1), rep("darkgoldenrod",1))) +
  scale_shape_manual(name="Group/Country (n=27)", values=c(15,0,2,3,4))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),legend.key=element_blank(),panel.grid.minor=element_blank(),panel.grid.major=element_blank(),panel.background=element_rect(fill="white"),panel.border=element_blank(),axis.line = element_line(colour = 'black', size = 0.5),axis.ticks=element_line(colour = 'black', size = 0.5),axis.title=element_text(size=14, color="black"),axis.text=element_text(size=12, color="black"))
p13 #draw the plot 


