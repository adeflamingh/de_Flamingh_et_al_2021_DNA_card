#code for running repeated measures anova in R for fecal card concentration time trials

setwd("enter appropriate path")
data<-read.csv(file.choose())
head(data)
str(data) #make sure data is being read correctly
attach(data) #gives variables header names e.g. Elephant/time/concentration
subject <- factor(Elephant) #change to factor 
time <- factor(time) #change to factor
results <- aov(concentration ~ time + Error(subject/time)) #add random factor of subject to control for dependency
summary(results)

par(mfrow=c(2,1))

#make line graph to see response
reslt <- tapply(concentration, time, mean)
plot(reslt, type = 'o', xlab = "Replicate", ylab = "DNA concentration (ng/ul)", axes = FALSE)
axis(1, at = seq(0,4, by =1), las=1)
axis(2, at = seq (0, 7, by = 0.5))

boxplot(concentration~time, data = data)

#code for mapping mitogenome coverage for fecal card time trials
setwd("~/Box Sync/Poop_cards/Analysis")
data<-read.csv(file.choose())
head(data)
str(data) #make sure data is being read correctly
attach(data) #gives variables header names e.g. Elephant/time/mitogenome_cov

View(data)
plot(time, mitogenome_cov, axes = FALSE)
axis(1, at = seq(0,5, by =1), las=1)
axis(2, at = seq (0, 1000, by = 100))

boxplot(mitogenome_cov~time, axes = FALSE)
axis(1, at = seq(0,4, by =1), las=1)
axis(2, at = seq (0, 250, by = 50))


boxplot(endog_conent~time, axes = FALSE)
axis(1, at = seq(0,5, by =1), las=1)
axis(2, at = seq (0, 100, by = 1))


require(stats) #package needed to explore difference between means using t-test with bonferroni correction
pairwise.t.test(concentration, time, p.adjust.method = "bonferroni")
