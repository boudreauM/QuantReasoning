dat <- read.csv("C:/Users/kmb057/Documents/FundamentalsQuantReasoning/QuantReasoning/NAS-Data-Download.csv")

#plot zebra musself sightings coarse resolution
plot(newmap)
plot(newmap, xlim = c(-120, -10), ylim = c(35, 71), asp = 1)
plot(newmap, xlim = c(-120, -10), ylim = c(20, 50), asp = 1)
points(dat$Longitude, dat$Latitude, col = "red", cex = .6)


#map of the 50 states
US <- map_data("state") 

states <- ggplot(data = US) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)

map1 <- states + geom_point(aes(x=Longitude,y=Latitude,size=Status),data=dat,color="red",alpha=1)+scale_size(name = waiver(), breaks = waiver(), labels = waiver(),
                                                                                                            limits = NULL, range = c(1, 6), trans = "identity",
                                                                                                            guide = "legend")+labs(size="Status")


view(dat)

#retain in dataset only rows with Status=collected or established
dat<-dat[(dat$Status==3 | dat$Status==1),]
