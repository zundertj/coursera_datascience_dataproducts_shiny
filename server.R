library(shiny)

# prediction function: ordinary least squares
CO2uptake <-function(type, treatment, conc){
  data("CO2")
  fit <- lm(uptake ~ Type + Treatment + conc, data=CO2)
  predict(fit, newdata=data.frame(Type=type, Treatment=treatment,conc=conc))
}
  
# Shiny server
shinyServer(
  function(input, output) {
    output$inputType <- renderPrint({input$type})
    output$inputTreatment <- renderPrint({input$treatment})
    output$inputConc <- renderPrint({input$conc})
    output$prediction <- renderPrint({CO2uptake(input$type, input$treatment, input$conc)})
  }
)