library(shiny)
library(leaflet)

navbarPage("Jack's iNaturalist Observations", id = "main",
           tabPanel("Map", leafletOutput("map", height = 1000))
           )