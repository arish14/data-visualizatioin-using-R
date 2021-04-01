print(getwd())
setwd("G:\\data_clean\\Assignment")

#Reading the dataset
data_set <- read.csv("weatherHistory.csv")
dim(data_set)

#Data cleaning
#1. Changing the names for better understanding 
janitor::clean_names(data_set)

#Changing the column name
colnames(data_set)[colnames(data_set)=="Temperature..C."] <- "Temperature"
#Changing the datatype from Float to int
class(data_set$Temperature) <-"integer"
class(data_set$Apparent.Temperature..C.)<- "integer"
colnames(data_set)[colnames(data_set)=="Absolute.Temperature..C."] <- "Absolut_Temperature"

#data visualizing 
hist(data_set$Temperature)
barplot(data_set$Humidity,xlab = "Humidity",col = "cyan",horiz = TRUE)
boxplot(data_set$Temperature)

#Data visualization using ggplot2
data_set$Temperature <-as.factor(data_set$Temperature)
data_set$Apparent.Temperature..C.<-as.factor(data_set$Apparent.Temperature..C.)
data_set$Humidity<-as.factor(data_set$Humidity)

ggplot(data_set,aes(x=Temperature,y=Humidity))+geom_point()

#Bar plots
ggplot(data_set,aes(x=Temperature,fill=Humidity))+geom_bar(position = "fill")+labs(x="Temp",y="Humidity",fill="Transmission")

#Faceting
ggplot(data_set,aes(x=Temperature,fill=Temperature))+geom_bar()+facet_grid(.~Humidity)+theme_bw()+labs(title = "Temperature count by humidity",x="Temperature",y="Humidity",fill="Transmission")

