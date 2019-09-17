## app.R ##
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    dashboardSidebar(
                     sidebarMenu(
                         menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
                         menuItem("Widgets", tabName = "widgets", icon = icon("th"))
                     )
                     ),
    dashboardBody(
        # Boxes need to be put in a row (or column)
        fluidRow(
            box(title ='Dashboard',
                plotOutput("plot1", 
                           height = 500),
                background =  'green',
                solidHeader = TRUE,
                ui='yellow'
                ),
            
            box(
                title = "Controls",
                sliderInput("slider",
                            "Number of observations:",
                            1,
                            100,
                            50
                            ),
                background = 'blue'
            )
        )
    ),
    ## Body content
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        
                        box(
                            title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50)
                        )
                    )
            ),
            
            # Second tab content
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)