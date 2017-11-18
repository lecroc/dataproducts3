## Car Comparisions

library(dplyr)
library(ggplot2)

# Get data

d1<-read.csv("./rawcardata.csv")

d2<-d1 %>%
  select(comb08, youSaveSpend, VClass, mfrCode, year, fuelCost08, make, model, cylinders, displ, drive, trany)

d2$MakeModel<-paste(d2$make, "_", d2$model)

d2<-select(d2, VClass, year, MakeModel, mfrCode, cylinders, displ, drive, trany, fuelCost08, youSaveSpend)

names(d2)<-c("Class", "Year", "MakeModel", "Code", "Cylinders", "Displacement", "DriveType", "Transmission", "FuelCost", "SaveSpend")

d2$Color<-ifelse(d2$SaveSpend>0, "green", "red")

d2<-d2%>%
  arrange(Year, MakeModel)%>%
  filter(Year>1996)%>%
  group_by(Class, Year, MakeModel, Cylinders, Displacement, DriveType, Transmission, FuelCost, SaveSpend)

d2<-unique(d2)

write.table(d2, "d2.Rda")

write.table(d2, "C:/Coursera/DevelopingDataProducts/dataproducts3/CarFinder/d2.Rda")

d2<-d2 %>%
  filter(Class=="Large Cars" & Year==2015)%>%
  arrange(desc(SaveSpend))

d2<-d2[1:20,]

# Create barplot with base graphics

par(mar=c(6.1,15.1,4.1,2.1))

barplot(height=d2$SaveSpend, names.arg = d2$MakeModel, 
        xlab="Spend / Save Vs. Average", las=2, cex.axis = 1, 
        cex.names = .8, horiz = T, col = d2$Color, 
        xlim = c(min(d2$SaveSpend), max(d2$SaveSpend)))

title(main="What You Save or Spend Vs. Average")







 
