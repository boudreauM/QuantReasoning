dat <- read.csv("C:/Users/kmb057/Documents/FundamentalsQuantReasoning/QuantReasoning/NAS-Data-Download.csv")

#remove 0,0 coordinate row
dat <- dat[-5810,]

library(ggplot2)
library(maps)
library(gganimate)
library(dplyr)

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

#animation of only those established or collected after 2000
established_collected_post_2000 <- filter(dat[dat$Year>=2000,]) %>%
  filter(Status=="established"|Status=="collected")

established_collected_post_2000$Year <- sort(established_post_2000$Year,decreasing=F)

map3 <- states + geom_point(aes(x=Longitude,y=Latitude,color=Status),data=established_collected_post_2000,alpha=0.2)+transition_states(established_collected_post_2000$Year)+shadow_mark()




#Plot number of zebra mussels sightings per year 
Summarize_sightings_by_year_month <- dat %>% count(Year, Month,State)
plot(Summarize_sightings_by_year_month$Year,Summarize_sightings_by_year_month$n)



ggplot(Summarize_sightings_by_year_month, aes(fill=Summarize_sightings_by_year_month$State, y=Summarize_sightings_by_year_month$n, x=Summarize_sightings_by_year_month$Year)) + 
  geom_bar(position="dodge", stat="identity")



