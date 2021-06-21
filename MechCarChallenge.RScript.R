library(dplyr)
mpg_data <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data)) #create linear model

spring_data <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- spring_data %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),StdDev_PSI=sd(PSI)) #create summary table with multiple columns
total_summary
lot_summary <- spring_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),StdDev_PSI=sd(PSI)) #create summary table with multiple columns
lot_summary

ttest_all <- t.test(spring_data$PSI, mu=1500)
ttest_all

ttest_lotone <- t.test(x=spring_data$PSI[spring_data$Manufacturing_Lot=="Lot1"], mu=1500)
ttest_lotone

ttest_lottwo <- t.test(x=spring_data$PSI[spring_data$Manufacturing_Lot=="Lot2"], mu=1500)
ttest_lottwo

ttest_lotthree <- t.test(x=spring_data$PSI[spring_data$Manufacturing_Lot=="Lot3"], mu=1500)
ttest_lotthree

