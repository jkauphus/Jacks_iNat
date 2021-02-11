library(shiny)
library(shinydashboard)
library(rinat)
library(leaflet)
library(dplyr)
library(sp)
library(plotly)
library(ggplot2)
library(DT)



shinyServer <- function(input, output) {
  
# Load in the tables
  source("inat.R")
  source("ui.R")
  source("markers.R")
  
  
  output$map <- renderLeaflet({
    leaflet()%>% 
      addProviderTiles(providers$Esri.WorldImagery) %>%
      addProviderTiles(providers$OpenStreetMap, group = "StreetView") %>%

      addMarkers(data = Amphibian, group = "Amphibians", icon = frogIcon,
                 clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                 popup = paste(sep = " ",
                                    "<strong>SCI_NAME:</strong> ",Amphibian$scientific_name, '<br/>',
                                    "<strong>COM_NAME:</strong> ", Amphibian$common_name, '<br/>',
                                    "<strong>DATE & TIME:</strong> ", Amphibian$datetime, '<br/>',
                                    "<img src='", Amphibian$image_url,"' width = '300px' height= '250px'>")) %>%      
      addMarkers(data = Bird, group = "Birds", icon = birdIcon,
                 clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                 popup = paste(sep = " ",
                                    "<strong>SCI_NAME:</strong> ",Bird$scientific_name, '<br/>',
                                    "<strong>COM_NAME:</strong> ", Bird$common_name, '<br/>',
                                    "<strong>DATE & TIME:</strong> ", Bird$datetime, '<br/>',
                                    "<img src='", Bird$image_url,"' width = '300px' height= '250px'>")) %>%
      addMarkers(data = Fish, group = "Fishes", icon = fishIcon,
                              clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                              popup = paste(sep = " ",
                                                 "<strong>SCI_NAME:</strong> ",Fish$scientific_name, '<br/>',
                                                 "<strong>COM_NAME:</strong> ", Fish$common_name, '<br/>',
                                                 "<strong>DATE & TIME:</strong> ", Fish$datetime, '<br/>',
                                                 "<img src='", Fish$image_url,"' width = '300px' height= '250px'>")) %>% 
      addMarkers(data = Fungi, group = "Fungi", icon = fungiIcon,
                              clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                              popup = paste(sep = " ",
                                                "<strong>SCI_NAME:</strong> ",Fungi$scientific_name, '<br/>',
                                                "<strong>COM_NAME:</strong> ", Fungi$common_name, '<br/>',
                                                "<strong>DATE & TIME:</strong> ", Fungi$datetime, '<br/>',
                                                "<img src='", Fungi$image_url,"' width = '300px' height= '250px'>")) %>% 
      addMarkers(data = Invertebrate, group = "Invertebrates", icon = invertIcon,
                              clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                              popup = paste(sep = " ",
                                                 "<strong>SCI_NAME:</strong> ",Invertebrate$scientific_name, '<br/>',
                                                 "<strong>COM_NAME:</strong> ", Invertebrate$common_name, '<br/>',
                                                 "<strong>DATE & TIME:</strong> ", Invertebrate$datetime, '<br/>',
                                                 "<img src='", Invertebrate$image_url,"' width = '300px' height= '250px'>")) %>%
      addMarkers(data = Mammal, group = "Mammals", icon = mammalIcon,
                              clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                              popup = paste(sep = " ",
                                                 "<strong>SCI_NAME:</strong> ",Mammal$scientific_name, '<br/>',
                                                 "<strong>COM_NAME:</strong> ", Mammal$common_name, '<br/>',
                                                 "<strong>DATE & TIME:</strong> ", Mammal$datetime, '<br/>',
                                                 "<img src='", Mammal$image_url,"' width = '300px' height= '250px'>")) %>% 
      addMarkers(data = Plant, group = "Plants", icon = plantIcon,
                              clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                              popup = paste(sep = " ",
                                                 "<strong>SCI_NAME:</strong> ", Plant$scientific_name, '<br/>',
                                                 "<strong>COM_NAME:</strong> ", Plant$common_name, '<br/>',
                                                 "<strong>DATE & TIME:</strong> ", Plant$datetime, '<br/>',
                                                 "<img src='", Plant$image_url,"' width = '300px' height= '250px'>")) %>%
      addMarkers(data = Reptile, group = "Reptiles", icon = repIcon,
                 clusterOptions = markerClusterOptions(maxClusterRadius = 25),
                 popup = paste(sep = " ",
                                    "<strong>SCI_NAME:</strong> ",Reptile$scientific_name, '<br/>',
                                    "<strong>COM_NAME:</strong> ", Reptile$common_name, '<br/>',
                                    "<strong>DATE & TIME:</strong> ", Reptile$datetime, '<br/>',
                                    "<img src='", Reptile$image_url,"' width = '300px' height= '250px'>")) %>% 
    addLayersControl(overlayGroups = c("StreetView", "Amphibians", "Birds", "Fishes", "Fungi", "Invertebrates", "Mammals", "Plants", "Reptiles"),
                     options = layersControlOptions(collapsed = F))
  

  })  
}

