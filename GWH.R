setwd("~/Box Sync/Poop_cards/Analysis/WGS/heterozyg")

#in R for every ml file
a<-scan("SAT04.ml")
a[2]/sum(a)

#record output in excel file
#load excel file to make graphs

library(ggplot2)
library(tidyr)
library(dplyr)
library(ggrepel)

x2<-data

x2 %>%
  ggplot(aes(x = depth, y = GWH)) +
  geom_point(color = "blue") +
  geom_text_repel(aes(label = Heterozygosity)) +
  ggtitle("Heterozygosity as a function of sequencing coverage") +
  xlab("Coverage Depth (X)") +
  ylab("Genome Wide Heterozygosity (GWH)") +
  theme_classic() 

x2 %>%
  ggplot(aes(x = breadth, y = GWH)) +
  geom_point(color = "green") +
  geom_text_repel(aes(label = Heterozygosity)) +
  ggtitle("Heterozygosity as a function of sequencing coverage") +
  xlab("Coverage Breadth (%)") +
  ylab("Genome Wide Heterozygosity (GWH)") +
  theme_classic() 


x2 %>%
  ggplot(aes(x = breadth, y = depth)) +
  geom_point(color = "black") +
  geom_text_repel(aes(label = Heterozygosity)) +
  ggtitle("Sequencing Coverage") +
  xlab("Coverage Breadth (%)") +
  ylab("Coverage Depth (X)") +
  theme_classic() 


data<-read.csv("heteroz.csv")
head(data)
str(data) #make sure data is being read correctly
attach(data)
plot(depth, GWH)
