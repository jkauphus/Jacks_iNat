# Begining of script to push to project test
library(rinat)
library(leaflet)
library(dplyr)
library(sp)
library(plotly)
library(ggplot2)


# Load up Observations

my_obs<-get_inat_obs_user(username = "jackkay", maxresults = 10000)

#Color iconic taxon name

pal <- colorFactor(
  palette = c("white","purple", "yellow", "pink", "red", "lightblue", "sandybrown", "green", "black", "brown"),
  domain = my_obs$iconic_taxon_name
)

palette = c("white","purple", "yellow", "pink", "red", "lightblue", "sandybrown", "green", "black", "brown")

# Grab all observation information and set it up to display photos

my_obs$label <- paste("<p>", my_obs$common_name, "<p>",
                      "<p>", my_obs$scientific_name, "<p>",
                      "<img src='", my_obs$image_url,"' width = '300px' height= '250px'>")

# Create taxon groups

Reptile <-subset(my_obs, iconic_taxon_name == "Reptilia")
Invertebrate <-subset(my_obs, iconic_taxon_name == "Animalia")
Fish <- subset(my_obs, iconic_taxon_name == "Actinopterygii")
Amphibian <-subset(my_obs, iconic_taxon_name == "Amphibia")
Bird <- subset(my_obs, iconic_taxon_name == "Aves")
Fungi <- subset(my_obs, iconic_taxon_name == "Fungi")
Insects <- subset(my_obs, iconic_taxon_name == "Insecta")
Mammal <- subset(my_obs, iconic_taxon_name == "Mammalia")
Plant <- subset(my_obs, iconic_taxon_name == "Plantae")

Invertebrate<- rbind(Invertebrate, Insects)


