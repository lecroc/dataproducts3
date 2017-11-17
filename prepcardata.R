## Car Comparisions

library(dplyr)
library(ggplot2)

# Get data

d1<-read.csv("./rawcardata.csv")

d2<-d1 %>%
  select(comb08, youSaveSpend, VClass, year, fuelCost08, make, model)

d2$MakeModel<-paste(d2$make, "_", d2$model)

names(d2)<-c("MPG", "SavingsVAverage", "Class", "ModelYear", "FuelCost", "Make", "Model", "Make_Model")

write.table(d2, "d2.Rda")

d2<-d2 %>%
  filter(Class=="Compact Cars" & ModelYear==1984)%>%
  arrange(desc(SavingsVAverage))

d2<-d2[1:20,]

g<-ggplot(d2, aes(Make_Model, SavingsVAverage)) + geom_col()

g







 
