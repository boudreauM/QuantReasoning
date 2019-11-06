dat <- read.csv("C:/Users/kmb057/Documents/FundamentalsQuantReasoning/QuantReasoning/NAS-Data-Download.csv")

library(ggplot2)
library(maps)
library(gganimate)

#remove 0,0 coordinate row
dat <- dat[-5810,]

#map of the 50 states
US <- map_data("state") 

states <- ggplot(data = US) + 
  geom_polygon(aes(x = long, y = lat, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)

#show change through time from earliest to latest
dat$Year <- sort(dat$Year,decreasing=F)

map1 <- states + geom_point(aes(x=Longitude,y=Latitude,color=Status),data=dat,alpha=0.2)+transition_states(dat$Year)

#population in 2019
latest <- dat[dat$Year=="2019",]
map2 <- states + geom_point(aes(x=Longitude,y=Latitude,color=Status),data=latest,alpha=0.2)





#retain in dataset only rows with Status=collected or established
#error replacement has one fewer row than data
dat$Status<-dat[-(dat$Status=="eradicated" | dat$Status=="extirpated" | dat$Status=="failed" | dat$Status=="unknown"),]



