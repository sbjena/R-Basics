#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(faraway)
library(reshape2)

data("worldcup")

choice_team = levels(worldcup$Team)
class(choice_team)
length(choice_team)
print(choice_team)


# Define UI for application on worldcup data
ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId  = 'Team1', 
                        label    = 'Please select Team1 :', 
                        choices  = choice_team,
                        selected = 'Brazil'),
            selectInput(inputId  = 'Team2', 
                        label    = 'Please select Team2 :', 
                        choices  = choice_team,
                        selected = 'Spain')
            
            
        ),
        mainPanel(
            plotOutput(outputId = 'plot1'),
            
            tableOutput(outputId='table1')
            
        )
    )
)



# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$plot1 = renderPlot({
        
        worldcup %>% 
            filter(Team %in% c(input$Team1,input$Team2)) %>% 
            ggplot(aes(x=Time, y=Passes, color=Position)) +
            geom_point() +
            facet_grid(Team~Position)
        
    })
    
    output$table1 = renderTable({
        
        worldcup %>% 
            filter(Team %in% c(input$Team1,input$Team2)) %>% 
            group_by(Team, Position) %>% 
            summarise(Avg.Shots = mean(Shots)) %>% 
            dcast(Position ~ Team, value.var = "Avg.Shots")
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
