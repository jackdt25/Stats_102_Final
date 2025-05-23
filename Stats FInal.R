#1-a
icu <- read.csv("icu.csv")
sys_bp <- table(icu$sys)
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
library(mosaic)
obs_diff <- diff(median(age~shuffle(cpr),data=icu))
obs_diff
null_dist <-do(1000)*diff(median(age~shuffle(cpr),data=icu))
head(null_dist)
prop(~Yes >= obs_diff, data=null_dist) + prop(~Yes <= -obs_diffm data=null_dist)

#3-a
library(ggplot2)
library(tidyverse)
library(mosaic)
songs <- read.csv("fight-songs.csv")
head(songs)
dim(songs)
count(songs)
yes_mean <- mean(songs$bpm[songs$victory_win_won=="Yes"])
yes_mean
yes_sd <- sd(songs$bpm[songs$victory_win_won=="Yes"])
yes_sd
no_mean <-mean(songs$bpm[songs$victory_win_won=="No"]) 
no_mean
no_sd <- sd(songs$bpm[songs$victory_win_won=="No"])
no_sd
ggplot(songs,aes(x=bpm)) +geom_histogram()
t_stat <- t.test(bpm~victory_win_won, data=songs)
t_stat

#3-b
library(dyplr)
songs2<-filter(songs,school != "Notre Dame") 
ggplot(songs2, aes(x=conference, y=sec_duration))+geom_point()
anova(lm(sec_duration~conference, data=songs2))
songs2_null <-do(10000)*lm(sec_duration~shuffle(conference),data=songs2)
head(songs2_null)
p_val <- prop(~(F >= 1.2635),data=songs2_null)
p_val


#3-c
ggplot(songs, aes(x=year, y=sec_duration)) + geom_point()



