library(dplyr) # load the dplyr package
library(ggplot2)
mechacar <- read.csv('MechaCar_mpg.csv')

model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance, data=mechacar)
summary(model)

y_vl <- model$coefficients['vehicle_length']*mechacar$vehicle_length + model$coefficients['(Intercept)']
plt <- ggplot(mechacar,aes(x=vehicle_length,y=mpg))

plt + geom_point() + geom_line(aes(y=y_vl), color="red") 

y_gc <- model$coefficients['ground_clearance']*mechacar$ground_clearance + model$coefficients['(Intercept)']
plt <- ggplot(mechacar,aes(x=ground_clearance,y=mpg))

plt + geom_point() + geom_line(aes(y=y_gc), color="blue") 

suspcoil <- read.csv('Suspension_Coil.csv')

total_summary <- suspcoil %>% summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')

lot_summary <- suspcoil %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')

plot(density(suspcoil$PSI)) # check to see if it's normal distribution

t.test(suspcoil$PSI,mu=mean(suspcoil$PSI)) #compare sample versus population means

t.test(suspcoil$PSI, subset = suspcoil[suspcoil$Manufacturing_Lot=='Lot1',],mu=mean(suspcoil$PSI))
t.test(suspcoil$PSI, subset = suspcoil[suspcoil$Manufacturing_Lot=='Lot2',],mu=mean(suspcoil$PSI))
t.test(suspcoil$PSI, subset = suspcoil[suspcoil$Manufacturing_Lot=='Lot3',],mu=mean(suspcoil$PSI))


