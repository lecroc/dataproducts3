## Car Comparisions

library(dplyr)
library(plotly)

# Get data

d1<-read.csv("./rawcardata.csv")

d2<-select(d1, fuelType, cylinders, displ, drive, make, model, trany, 
           city08, highway08, youSaveSpend, VClass, year, fuelCost08, drive)

d2$cylinders<-ifelse(is.na(d2$cylinders), 0, d2$cylinders)

d2$displ<-ifelse(is.na(d2$displ), 0, d2$displ)

d2<-d2 %>%
  select(VClass, year, fuelType, make, model, trany, cylinders, 
         displ, drive, city08, highway08, fuelCost08, youSaveSpend)

names(d2)<-c("class", "year", "fuel", "make", "model", "trans", "cyl", "displ",
             "drive", "city", "hwy", "cost", "spendsave")

plot<-plot_ly(d2, x=~d2$hwy, y=~d2$cost, z=~d2$city, type="scatter3d", color=d2$spendsave,
              mode="markers", text= ~paste(d2$year, d2$make, d2$model, "Drive:", d2$drive, "Displacement:",
                                           d2$disp,"Cylinders:", d2$cyl, "Transmission:", d2$trans, sep="<br>"),hoverinfo="text") %>%
  layout(
    title = "Fuel Efficiency Comparisons",
    scene = list(
      xaxis = list(title = "Highway MPG"),
      yaxis = list(title = "Annual Fuel Cost"),
      zaxis = list(title = "City MPG")
    ))%>%
  config(displayModeBar=F)

plot