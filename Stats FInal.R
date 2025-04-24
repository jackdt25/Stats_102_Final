#1-a
icu <- read.csv("icu.csv")
sys_bp <- table(icu$sys,)
head(sys_bp)
boot.sample <- data.frame(sim=1:10000, stat=NA)
for(i in 1:10000){
  boot.sample$stat[i]<-sd(sample(sys_bp,size=200,replace=TRUE))
}
head(boot.sample)
rankdiff<-sort(boot.sample$stat)
head(rankdiff)
lower95<-rankdiff[25]
lower95
upper95<-rankdiff[975]
upper95

#1-b
Yesmean <- mean(icu$cpr=="Yes")
Yesmean
YesSd <- sd(icu$cpr=="Yes")
YesSd
Nomean <- mean(icu$cpr=="No")
Nomean
NoSd <-sd(icu$cpr=="No")
NoSd
boot.samples<-data.frame(sim=1:1000,Yesmean=NA,Nomean=NA,diff=NA)

for(i in 1:1000){
  boot.samples$Yesmean[i]<-mean(sample(icu$cpr=="Yes",size=200,replace=TRUE))
  boot.samples$Yesmean[i]<-mean(sample(icu$cpr=="No",size=200,replace=TRUE))
}

boot.samples$diff<-boot.samples$Yesmean-boot.samples$Nomean

rankmean<-sort(boot.samples$diff)

head(rankmean)

p_value <- mean(abs(boot.samples$diff))
p_value

#2-a