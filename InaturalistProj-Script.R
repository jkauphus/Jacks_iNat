#Begining of script to push to project test
library(rinat)
library(leaflet)
library(dplyr)
library(sp)
library(plotly)

my_obs<-get_inat_obs_user(username = "jackkay", maxresults = 1000)

str(my_obs)
#Color iconic taxon name
pal <- colorFactor(
  palette = c("purple", "blue", "yellow", "red", "sandybrown", "green", "black"),
  domain = my_obs$iconic_taxon_name
)


leaflet(my_obs)%>% 
  addTiles() %>%
  addCircleMarkers(~longitude,~latitude, weight = 5,
             popup = ~as.character(common_name), color = ~pal(iconic_taxon_name))
  