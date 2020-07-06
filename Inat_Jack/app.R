library(shiny)
library(shinydashboard)
library(rinat)
library(leaflet)
library(dplyr)
library(sp)
library(plotly)
library(ggplot2)
library(DT)


my_obs<-get_inat_obs_user(username = "jackkay", maxresults = 1000)

str(my_obs)
#Color iconic taxon name
pal <- colorFactor(
    palette = c("grey","purple", "yellow", "blue", "sandybrown", "green", "black", "red"),
    domain = my_obs$iconic_taxon_name
)

my_obs$label <- paste("<p>", my_obs$common_name, "<p>",
                      "<p>", my_obs$scientific_name, "<p>",
                      "<img src='", my_obs$image_url,"' width = '300px' height= '250px'>")

#Creating Leaflet Map

ui <- dashboardPage(
    skin = "green",
    dashboardHeader(title = "My iNaturalist Observations"),
    dashboardSidebar(),
dashboardBody(
    fluidRow(box(width = 15, leafletOutput(outputId = "mymap"))),
    fluidRow(box(width = 12, dataTableOutput(outputId = "summary_table")))
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
