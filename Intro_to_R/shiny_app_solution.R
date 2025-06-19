library(shiny)

# Define UI
ui <- fluidPage(
  
  # Application title
  titlePanel("Shiny App with Slider and Plot"),
  
  # Sidebar layout with input and output
  sidebarLayout(
    sidebarPanel(
      # Slider input: Select a range of values
      sliderInput("range", 
                  "Select Range:", 
                  min = 1, 
                  max = 100, 
                  value = c(10, 50))
    ),
    
    # Show the plot
    mainPanel(
      plotOutput("linePlot")
    )
  )
)

# Define Server logic
server <- function(input, output) {
  
  output$linePlot <- renderPlot({
    # Generate x values based on the selected range
    x <- seq(input$range[1], input$range[2], by = 1)
    y <- sin(x)  # Example: Using the sine function for plotting
    
    # Create the plot
    plot(x, y, type = "l", col = "blue", lwd = 2,
         xlab = "X values", ylab = "Y values (sin(x))",
         main = "Line Plot of sin(x)")
  })
}

# Run the application
shinyApp(ui = ui, server = server)