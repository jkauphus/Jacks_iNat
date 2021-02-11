library(shiny)
library(shinydashboard)
library(rinat)
library(leaflet)
library(dplyr)
library(sp)
library(plotly)
library(ggplot2)
library(DT)


source("../inat.R")

#Creating Leaflet Map

ui <- dashboardPage(
    skin = "green",
    dashboardHeader(title = "My iNaturalist Observations"),
    dashboardSidebar(fluidRow(box(width = 10, plotOutput(outputId = "plot")))),
dashboardBody(
    fluidRow(box(width = 15, leafletOutput(outputId = "mymap"))),
    fluidRow(box(width = 8, dataTableOutput(outputId = "summary_table")))
))


# Define server logic required to draw a histogram
server <- function(input, output) {
    data_input <- reactive({my_obs
})
    output$mymap <- renderLeaflet(
        leaflet(my_obs)%>% 
            addTiles() %>%
            addCircleMarkers(~longitude,~latitude, weight = 5,
                             popup = c(as.character(my_obs$label)),
                             color = ~pal(iconic_taxon_name))
    )
    
    output$summary_table <- renderDataTable(data_input())
}


# Run the application 
shinyApp(ui = ui, server = server)
