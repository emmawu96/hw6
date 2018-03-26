library(ggmap)
library(tidyverse)

bude <- geocode("bude, england")
#map <- get_map("bude, england", zoom= 15)
#beaches
sb <- geocode("Summerleaze Beach, Bude, UK")
cb <- geocode("Crooklets Beach, Bude, UK")
#vacation spots
golf <- geocode("Bude and North Cornwall Golf Club, Bude, UK")
ai <- geocode("Adventure International, Bude, UK")
cricket <- geocode("Bude North Cornwall Cricket Club, bude, uk")
#pub
pub <- geocode("Bar 35, Bude, UK")

#SECOND PART OF THE ASSIGNMENT BY FRANCESCO IGNAZIO RE
#ADDING HOTELS

hotel1 <- geocode("Hartland Terrace, Bude EX23 8JY, UK")
hotel2 <- geocode("15 Burn View, Bude EX23 8BZ, UK")
hotel3 <- geocode("13 The Strand, Bude EX23 8QU, UK")
hotel4 <- geocode("Vicarage Rd, Bude EX23 8SD, UK")

hotels_a <- rbind(hotel1,hotel2,hotel3,hotel4)



hotels <- c("An Mor", "Sea Jade Guest House", "The Global Hotel", "The Brendon Arms")

datas <- cbind(hotels_a, hotels)




#road map
map <- get_map(bude+c(-0.005,0.005),zoom=15)    ##modify the map location to adjust the view

ggmap(map) +
  geom_point(
    aes(x = lon, y = lat),
    data = bude+c(-0.0005,0.0005), color = "brown", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = sb, color = "blue", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = cb, color = "blue", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = golf, color = "coral", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = ai, color = "coral", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = cricket, color = "red", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = pub, color = "red", size = 3
  ) +
  geom_point(
    aes(x=lon,y=lat,color = hotels ), data = datas, size = 3)





   




#watercolor map
map1 <- get_map("bude,uk",zoom=14,maptype = "watercolor")

ggmap(map1) +
  geom_point(
    aes(x = lon, y = lat),
    data = bude+c(-0.0005,0.0005), color = "brown", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = sb, color = "blue", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = cb, color = "blue", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = golf, color = "coral1", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = ai, color = "coral1", size = 3
  )+ geom_point(
    aes(x=lon,y=lat,color = hotels ), data = datas, size = 3)



#route on map
from <- "Bude North Cornwall Cricket Club, bude, uk"
to <- "Bar 35, Bude, UK"
route_df <- route(from, to, structure = "route")
ggmap(map) +  
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )

