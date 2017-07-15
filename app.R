### Project OPEC_non-OPEC Disruption Analysis

library(shiny)
library(DT)
library(ggplot2)
library(shinythemes)

my_shiny_project = read.csv("opec_wti.csv", header = T, sep = ",")


server <-function (input, output, session) 
{
  
  output$tableDT <- DT::renderDataTable(my_shiny_project[1:1000,], 
                                        options = list(paging=F), 
                                        rownames=F, 
                                        filter = "top")
  weighted.my_shiny_project = reactive (
    cbind(my_shiny_project, weighted_WTI_Real_Price._GDP_Deflated = my_shiny_project$WTI_Real_Price._GDP_Deflated*input$w1)
  )
  
  #### Adding  
  output$plot <- renderPlot({
    ggplot(weighted.my_shiny_project(), aes(Spare_Capacity, weighted_WTI_Real_Price._GDP_Deflated)) + geom_point()
  })
  
  my_shiny_project_new <- reactive({
    
    user_brush <- input$user_brush
    mysel <- brushedPoints(weighted.my_shiny_project(), user_brush)
    return(mysel)
    
  })
  
  output$table <- DT::renderDataTable(DT::datatable(my_shiny_project_new()))
}  

ui <- fluidPage(
  sliderInput(inputId = "w1",
              label = "the weight",
              value = 2, min = 0, max =1.9),
  plotOutput("plot", brush = "user_brush"),
  dataTableOutput("table")
)

shinyApp(ui = ui, server = server)
